using Plots
using LinearAlgebra

c = 300_000_000   # Speed of light
f = 200_000_000   # Operating frequency
η = 120 * π       # Intrinsic impedance for free space
λ = c / f         # Wavelength (phase velocity is the speed of light)
k = (2 * π) / λ   # Wave number (for our example β phase constant)
a = 0.61 * λ       # Radius for our loop antenna
θ = LinRange(0, 2 * π, 1001)  # Angle values in rad
ϕ = LinRange(0, 2 * π, 1001)  # Angle values in rad
I = 1             # Current flows on the loop antenna
r = 10            # Distance in meters
Bessel = zeros(1001)  # Creating Bessel vector

# Function to calculate the Bessel function
function J₁(teta, M)
    return sum(((-1)^m * ((k * a * sin(teta)) / 2)^(1 + 2m)) / ((factorial(big(m))) * (factorial(big(m + 1)))) for m in 0:M)
end

# Calculate Bessel values
for i in 1:1001
    Bessel[i] = J₁(θ[i], 100)
end

# Create E vector
E = (a * k * η * I .* Bessel) / (2 * r)

# Calculate absolute values of E
absE = abs.(E)

# Create meshgrid using nested comprehensions
θ_grid = [θi for θi in θ, ϕj in ϕ]
ϕ_grid = [ϕj for θi in θ, ϕj in ϕ]

# Convert polar coordinates to Cartesian coordinates
x = absE .* sin.(θ_grid) .* cos.(ϕ_grid)
y = absE .* sin.(θ_grid) .* sin.(ϕ_grid)
z = absE .* cos.(θ_grid)

# Plot the 3D electric field pattern
#=plot(
    x,
    y,
    z,
#=
    colorbar_title="z",
    colorscale=[[0:2, "gold"],[2:5, "mediumturquoise"],[5:8, "magenta"]],
    intensity = 0:25,
    intensitymode="cell",
=#  
    xlabel = "X",
    ylabel = "Y",
    zlabel = "Z",
    title = "3D Electric Field Pattern for Loop Antenna",
    legend = false,
    markersize = 1,
)
=#
Plots.surface(x,y,z)
savefig("D:\\other\\JuliaWorks\\Figures\\Lab4\\deneme-1")


