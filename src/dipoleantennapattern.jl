using Plots
using LinearAlgebra
c = 300_000_000   # Speed of light
f = 200_000_000   # Operating frequency
η = 120 * π       # Intrinsic impedance for free space
λ = c / f         # Wavelength (phase velocity is the speed of light)
k = (2 * π) / λ   # Wave number (for our example β phase constant)
θ = LinRange(0, 2 * π, 1001)  # Angle values in rad
ϕ = LinRange(0, 2 * π, 1001)  # Angle values in rad
I = 1             # Current flows on the hertz antenna
l=1.5*λ           # Length of Hertz Dipole 
r=10              # Distance in meters
# Create E vector
E = (l * k * η * I .* (cos.( (k*l/2) .* cos.(θ)) .- cos(k*l/2) ) ) ./ ( sin.(θ) .* 2 * π * r)
# Calculate absolute values of E
absE = abs.(E)

# Create meshgrid using nested comprehensions
θ_grid = [θi for θi in θ, ϕj in ϕ]
ϕ_grid = [ϕj for θi in θ, ϕj in ϕ]

# Convert polar coordinates to Cartesian coordinates
x = absE .* sin.(θ_grid) .* cos.(ϕ_grid)
y = absE .* sin.(θ_grid) .* sin.(ϕ_grid)
z = absE .* cos.(θ_grid)

Plots.surface(x,y,z)
savefig("D:\\other\\JuliaWorks\\Figures\\Lab4\\deneme-2") #Note that top of pattern is in angle theta=0°