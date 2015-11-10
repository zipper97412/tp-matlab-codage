function y = canal(x, f)
 for n=1:7
  y(n) = xor((rand() <= f),x(n));
 end
end