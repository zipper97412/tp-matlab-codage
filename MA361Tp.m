G = [1 0 0 0 1 1 0 ; 0 1 0 0 1 0 1 ; 0 0 1 0 0 1 1 ; 0 0 0 1 1 1 1];
Ht = [1 1 0 ; 1 0 1 ; 0 1 1 ; 1 1 1 ; 1 0 0 ; 0 1 0 ; 0 0 1];
iB = 0;
ib = 0;
pB = [];
pb = [];
n = 5000;
pas = 0.01;
%s = [0 0 1 1];
%c = mod(s*G,2);
%s = round(rand(1,4))

for f=0:pas:1
    iB = 0;
    ib = 0;
    for p=1:n
        s = round(rand(1,4));
        c = mod(s*G,2);

        r = canal(c, f);
        S = mod(r*Ht,2);
        rc = correc(r, S, Ht);
        m = rc(1:4);

        x = mean(xor(s,m));
        if x ~= 0
            iB = iB + 1;
            ib = ib + round(x*4);
        end
    end
    pB = [pB (iB/n)];
    pb = [pb (ib/(4*n))];
    %disp(['pB : ' num2str(iB/n)]);
    %disp(['pb : ' num2str(ib/(4*n))]);
end

plot([0:pas:1],pB,[0:pas:1],pb)
%plot([0:pas:1],pb)
