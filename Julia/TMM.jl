function r_ip(N0, N1, phi0, phi1)
    rp = ( N1*cosd(phi0) - N0*cosd(phi1) ) / ( N1*cosd(phi0) + N0*cosd(phi1) );
    tp = 2*N0*cosd(phi0) / (N1*cosd(phi0) + N0*cosd(phi1));
    y = 1/tp.*[ 1 rp; rp 1 ];
end

function r_layer(N, d, phi, lambda)
    a = (2*pi*d*N/lambda)*cosd(phi);
    y = [exp(im*a) 0 ; 0 exp(-im*a)];
end

function calc_TR(n, d, φ0, λ)
    d = vcat([0], d)
    n = vcat([1], n)
    
    φ = Float64[]
    push!(φ, φ0)

    for k=2:length(n)
        push!(φ, asind(n[k-1]*sind(φ[k-1])/n[k]))
    end

    @time LxIp = [r_layer.(n[l], d[l], φ[l], λ).*r_ip.(n[l], n[l+1], φ[l], φ[l+1]) for l in 2:(length(n)-1)]
    @time S = r_ip(n[1], n[2], φ[1], φ[2])*foldl(*, LxIp)

    Tp, Rp = abs2(1 / S[1,1]), abs2(S[2,1] / S[1,1])
end

n = Complex{Float64}[];
d = Float64[];

for m = 1:3
    push!(d, 50.0, 250.0)
    push!(n, 5, 1)
end

push!(d, 90.0, 20.0, 90.0)
push!(n, 5,5,5)

for m = 1:4
    push!(d, 250.0, 50.0)
    push!(n, 1, 5)
end

push!(d, 250.0)
push!(n, 1)


#global S = r_ip(n[1], n[2], phi[1], phi[2])
#for l = 2:(length(n)-1)
#    L = r_layer(n[l], d[l], phi[l], lambda)
#    Ip = r_ip(n[l], n[l+1], phi[l], phi[l+1])
#    global S = S*L*Ip
#end

Λ = 500:0.5:2000
@time TR = [calc_TR(n, d, 2, λ) for λ in Λ]

T = first.(TR)
R = last.(TR)

#gr()
#plot
#plot(Λ, T)
#print("Waiting")
#read(stdin, Char)
