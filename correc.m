function y = correc(x, S, Ht)
 for n=1:7
  if Ht(n,:) == S
    break
  end
 end
 res = [0 0 0 0 0 0 0];
 res(n) = 1;
 y = xor(res, x);
end