# import Pkg
# Pkg.add("Pluto")
# 
# import Pluto
# Pluto.run()

using Pkg

for name in ["GZip", "Interpolations", "Plots"]
    Pkg.add(name)
end

import GZip
import Printf: @printf
using Interpolations
using DelimitedFiles
using Plots

const k, h, c = 1.38e-23, 6.626e-34, 3e8
λ(ν) = c / ν
b(ν, T) = 2h * ν^3 / (c^2 * (exp(h * ν / (k * T)) - 1))
let ν = 0.5e13:1e13:1e15
    plot(ν, b.(ν, 3800),
         label = "",
         xlabel = "Frequency [Hz]",
         ylabel = "Spectral radiance [W/sr/m²/Hz]")
end

############################################################
# First plot

savefig("images/blackbody.svg")

function C(ν0, Δν, T, δν)
    fullnu = 1e13:δν:1e15
    partialnu = (ν0 - Δν/2):δν:(ν0 + Δν/2)
    sum(b.(fullnu, T)) / sum(b.(partialnu, T))
end

ν0 = c / 2.2e-6
Δν = 2.28e13
T = 3800
for δν in [1e13, 1e12, 1e11, 1e10, 1e9, 1e8]
    @printf("δν = %.0e Hz, T = %.1f K, C = %.2f\n",
            δν, T, C(ν0, Δν, T, δν))
end

############################################################

# $ cat ukm0iii.dat.gz | gunzip | head

# In Julia esistono anche argomenti opzionali; in questo caso
# usiamo "skipstart", che dice quante righe all'inizio del
# file devono essere ignorate
dirbe_bands = readdlm(
    "DIRBE_SYSTEM_SPECTRAL_RESPONSE_TABLE.ASC",
    skipstart=15,
)
dirbe_λ = dirbe_bands[:, 1] * 1e-6
dirbe_band = dirbe_bands[:, 3]

plot(dirbe_λ, dirbe_band, label = "", xlabel = "Wavelength [m]")

############################################################
# Second plot
savefig("images/dirbe_band_too_wide.svg")

# Maschera di booleani: vera solo se la banda è maggiore di 0
mask = dirbe_band .> 0
dirbe_λ
dirbe_λ[mask]
plot(dirbe_λ[mask] * 1e6, dirbe_band[mask],
     label = "", xlabel = "Wavelength [µm]")

############################################################
# Third plot

savefig("images/dirbe_band_ok.svg");

############################################################

# head -n 20 DIRBE_SYSTEM_SPECTRAL_RESPONSE_TABLE.ASC

############################################################

@printf("Band center: %.2f μm\n",
        1e6 * sum(dirbe_λ .* dirbe_band) / sum(dirbe_band))

############################################################

spectrum = GZip.open("ukm0iii.dat.gz") do io
    readdlm(io, skipstart=3)
end

m0_λ_pts = spectrum[:, 1] * 1e-10
m0_flux_pts = spectrum[:, 2]

# Write \Angstrom to get Å
plot(spectrum[:, 1], spectrum[:, 2],
     label = "",
     xlabel = "Wavelength [Å]",
     ylabel = "Flux density [Jy]")
savefig("images/stellar-spectrum.svg")

############################################################

plot(m0_λ_pts * 1e6, m0_flux_pts,
     xlim = (0, 3),
     label="M0 flux",
     xlabel = "Wavelength [µm]",
     ylabel = "Flux density [Jy]");
plot!(dirbe_λ * 1e6, dirbe_band,
      label="DIRBE band");
savefig("images/stellar-spectrum-and-band.svg")

############################################################

scatter(m0_λ_pts * 1e6, m0_flux_pts,
        xlim = (2.0, 2.2),
        label="M0 flux",
        xlabel="Wavelength [µm]",
        ylabel = "Flux density [Jy]",
        markersize=1)
scatter!(dirbe_λ * 1e6, dirbe_band,
         label="DIRBE band");
savefig("images/interpolation-wrong.svg")

############################################################

# dirbe_band_interp sarà una funzione con argomento λ
dirbe_band_interp = LinearInterpolation(
    dirbe_λ,
    dirbe_band,
    extrapolation_bc=Flat(),
);

scatter(m0_λ_pts * 1e6, m0_flux_pts,
        label="M0 flux",
        xlim = (2.02, 2.07),
        xlabel = "Wavelength [µm]",
        ylabel = "Flux density [Jy]",
        markersize = 2,
)
scatter!(dirbe_λ * 1e6, dirbe_band,
         label="DIRBE band", markersize=8);
scatter!(m0_λ_pts * 1e6, dirbe_band_interp.(m0_λ_pts),
         label="DIRBE band (interpolated)",
         markersize=2)
savefig("images/interpolation-right.svg")

############################################################

C(flux, band) = sum(flux) / sum(flux .* band)
@printf("Bolometric correction: %.2f\n", C(m0_flux_pts, dirbe_band_interp.(m0_λ_pts)))

############################################################

tophat_band = zeros(length(m0_λ_pts))
let (λ1, λ2) = (λ(ν0 + Δν/2), λ(ν0 - Δν/2))
    # In Julia è possibile scrivere "a < x < b"
    # anziché "(a < x) && (x < b)"
    tophat_band[λ1 .< m0_λ_pts .< λ2] .= 1
end

plot(m0_λ_pts * 1e6, tophat_band,
     label = "Top-hat band",
     xlabel = "Wavelength [µm]",
     legend = :topleft)
plot!(dirbe_λ[mask] * 1e6, dirbe_band[mask],
      label = "True DIRBE band")
savefig("images/tophat-band.svg")

############################################################

@printf("C = %.2f\n", C(m0_flux_pts, tophat_band))

bλ(λ, T) = 2h * c^2 / (λ^5 * (exp(h * c / (λ * k * T)) - 1))
@printf(
    "C = %.2f\n",
    C(bλ.(m0_λ_pts, T), dirbe_band_interp.(m0_λ_pts)),
)
