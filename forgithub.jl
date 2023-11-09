# Antenna Lab-4 Plotting
using Plots # to arrange plotting
c=300000000; #speed of light
f=200000000; # operating frequency
η=120*π; # intrinsic impedence for free space
λ=c/f; # wave length (phase velocity is light speed)
k=(2*π)/λ; # wave number (for our example β phase constant)
a=0.9*λ; # radius for our loop antenna
θ=LinRange(-π,π,1001); # angle values
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
plot(θ,absE, title="Radiation Pattern of a=0.9λ Circular Loop A." , proj = :polar, label=["|E| in V/m"])
#savefig("D:\\other\\JuliaWorks\\Figures\\Lab4\\Fig4")