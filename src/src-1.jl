using CoordinateTransformations
using Plots # to arrange plotting

c=300000000; #speed of light
f=200000000; # operating frequency
η=120*π; # intrinsic impedence for free space
λ=c/f; # wave length (phase velocity is light speed)
k=(2*π)/λ; # wave number (for our example β phase constant)
a=0.5*λ; # radius for our loop antenna
θ=LinRange(-π,π,1001); # angle values in rad
ϕ=LinRange(0,2*π,1001); # angle values in rad
I=1; # current flows on loop antenna
r=10; # distance in meters
Bessel=zeros(1001); # creating Bessel vector
J₁(teta,M)=sum(((-1)^m * ((k*a*sin(teta))/2)^(1+2m))/((factorial(big(m)))*(factorial(big(m+1)))) for m in 0:M);
for i in 1:1001
       Bessel[i]=J₁(θ[i],100);
end
E=zeros(1001); # creating E vector
E=(a*k*η*I.*Bessel)./(2*r); # Electric Field equation, B represents bessel function.
absE=zeros(1001);
for i in 1:1001
    absE[i]=abs(E[i]);
end

#=
patternShape = (length(ϕ),length(θ))
pattern  = ones(patternShape)

x = [pattern[i,j]*sin(θ)*cos(φ) for (i,φ) in enumerate(ϕ), (j,θ) in enumerate(θ)];
y = [pattern[i,j]*sin(θ)*sin(φ) for (i,φ) in enumerate(ϕ), (j,θ) in enumerate(θ)];
z = [pattern[i,j]*cos(θ) for (i,φ) in enumerate(ϕ), (j,θ) in enumerate(θ)];
=#


cart_from_s = CartesianFromSpherical();
x=zeros(1001);
y=zeros(1001);
z=zeros(1001);

for i in 1:1001
    rθϕ = Spherical(absE[i], θ[i], ϕ[i]);
    x[i],y[i],z[i]=cart_from_s(rθϕ);
end

#surface(x,y,z);
#println(absE[275]);
#println(y[275]);

plot(y,z)