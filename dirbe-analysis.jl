import PyPlot
import GZip
import Printf: @printf
using Interpolations
using DelimitedFiles

const k, h, c = 1.38e-23, 6.626e-34, 3e8
λ(ν) = c / ν
b(ν, T) = 2h * ν^3 / (c^2 * (exp(h * ν / (k * T)) - 1))
PyPlot.clf()
let ν = 0.5e13:1e13:1e15
    PyPlot.plot(ν, b.(ν, 3800));
end
PyPlot.xlabel("Frequency [Hz]");
PyPlot.ylabel(raw"Spectral radiance [W/sr/m$^2$/Hz]");
PyPlot.savefig("blackbody.png", bbox_inches="tight");

function C(ν0, Δν, T, δν)
    fullnu = 1e13:δν:1e15
    partialnu = (ν0 - Δν/2):δν:(ν0 + Δν/2)
    sum(b.(fullnu, T)) / sum(b.(partialnu, T))
end

ν0 = c / 2.2e-6
Δν = 2.28e13
T = 3800
for δν in [1e13, 1e12, 1e11, 1e10, 1e9, 1e8]
    @printf("δν = %.0e Hz, T = %.1f K, C = %.2f\n", δν, T, C(ν0, Δν, T, δν))
end

# In Julia esistono anche argomenti opzionali; in questo caso
# usiamo "skipstart", che dice quante righe all'inizio del file
# devono essere ignorate
dirbe_bands = readdlm("DIRBE_SYSTEM_SPECTRAL_RESPONSE_TABLE.ASC",
                      skipstart=15)
dirbe_λ = dirbe_bands[:, 1] * 1e-6
dirbe_band = dirbe_bands[:, 3]
PyPlot.clf()
PyPlot.plot(dirbe_λ, dirbe_band);
PyPlot.xlabel("Wavelength [m]");
PyPlot.savefig("dirbe_band_too_wide.png", bbox_inches="tight");

mask = dirbe_band .> 0
# Maschera di booleani: vera solo se la banda è div
PyPlot.clf()
PyPlot.plot(dirbe_λ[mask] * 1e6, dirbe_band[mask]);
# Se davanti a una stringa si scrive "raw", i caratteri \ dentro la stringa
# vengono interpretati
PyPlot.xlabel(raw"Wavelength [$\mu$m]");
PyPlot.savefig("dirbe_band_ok.png", bbox_inches="tight");

@printf("Band center: %.2f μm\n", 1e6 * sum(dirbe_λ .* dirbe_band) / sum(dirbe_band))

spectrum = GZip.open("ukm0iii.dat.gz") do io
    readdlm(io, skipstart=3)
end

m0_λ_pts = spectrum[:, 1] * 1e-10
m0_flux_pts = spectrum[:, 2]

PyPlot.clf()
PyPlot.plot(spectrum[:, 1], spectrum[:, 2])
# Write \Angstrom to get Å
PyPlot.xlabel("Wavelength [Å]");
PyPlot.ylabel("Flux density [Jy]");
PyPlot.savefig("stellar-spectrum.png", bbox_inches="tight")

PyPlot.clf()
PyPlot.plot(m0_λ_pts * 1e6, m0_flux_pts, label="M0 flux");
PyPlot.plot(dirbe_λ * 1e6, dirbe_band, label="DIRBE band");
PyPlot.xlim(0, 3);
PyPlot.xlabel("Wavelength [μm]");
PyPlot.ylabel("Flux density [Jy]");
PyPlot.legend();
PyPlot.savefig("stellar-spectrum-and-band.png", bbox_inches="tight")

PyPlot.clf()
PyPlot.scatter(m0_λ_pts * 1e6, m0_flux_pts, label="M0 flux", s=0.2);
PyPlot.scatter(dirbe_λ * 1e6, dirbe_band, label="DIRBE band");
PyPlot.xlim(2.0, 2.2);
PyPlot.xlabel("Wavelength [μm]");
PyPlot.ylabel("Flux density [Jy]");
PyPlot.legend();
PyPlot.savefig("interpolation-wrong.png", bbox_inches="tight")

# dirbe_band_interp sarà una funzione con argomento λ
dirbe_band_interp = LinearInterpolation(dirbe_λ, dirbe_band,
                                        extrapolation_bc=Flat());
# La funzione "scatter" è come "plot", ma usa punti
# anziché una linea continua.
# Il comando s=num imposta le dimensioni dei punti
# al valore "num"
PyPlot.clf()
PyPlot.scatter(m0_λ_pts * 1e6, m0_flux_pts, label="M0 flux", s=2);
PyPlot.scatter(dirbe_λ * 1e6, dirbe_band, label="DIRBE band");
PyPlot.scatter(m0_λ_pts * 1e6, dirbe_band_interp.(m0_λ_pts),
label="DIRBE band (interpolated)", s=2);
PyPlot.xlim(2.02, 2.07);
PyPlot.xlabel("Wavelength [μm]");
PyPlot.ylabel("Flux density [Jy]");
PyPlot.legend();
PyPlot.savefig("interpolation-right.png", bbox_inches="tight")

 C(flux, band) = sum(flux) / sum(flux .* band)
@printf("Bolometric correction: %.2f\n", C(m0_flux_pts, dirbe_band_interp.(m0_λ_pts)))

tophat_band = zeros(length(m0_λ_pts))
let (λ1, λ2) = (λ(ν0 + Δν/2), λ(ν0 - Δν/2))
    # In Julia è possibile scrivere "a < x < b"
    # anziché "(a < x) && (x < b)"
    tophat_band[λ1 .< m0_λ_pts .< λ2] .= 1
end
PyPlot.clf()
PyPlot.plot(m0_λ_pts, tophat_band);
PyPlot.savefig("tophat-band.png", bbox_inches="tight")

@printf("C = %.2f\n", C(m0_flux_pts, tophat_band))

bλ(λ, T) = 2h * c^2 / (λ^5 * (exp(h * c / (λ * k * T)) - 1))
@printf(
    "C = %.2f\n",
    C(bλ.(m0_λ_pts, T), dirbe_band_interp.(m0_λ_pts)),
)
