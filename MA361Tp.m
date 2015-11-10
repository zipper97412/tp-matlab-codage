G = [1 0 0 0 1 1 0 ; 0 1 0 0 1 0 1 ; 0 0 1 0 0 1 1 ; 0 0 0 1 1 1 1];
Ht = [1 1 0 ; 1 0 1 ; 0 1 1 ; 1 1 1 ; 1 0 0 ; 0 1 0 ; 0 0 1]; %transposé de H
iB = 0; %compteur d'erreur bloc
ib = 0; %compteur d'erreur bit
pB = [];
pb = [];
n = 50000;
pas = 0.01;
f = [0:pas:1];

for i=[1:1/pas+1] %on fait une boucle sur f
    iB = 0;
    ib = 0;
    for p=1:n %on fait l'experience sur 4bits a chaque fois
        %création de mot de 4 bits
        s = round(rand(1,4));
        %encodage du mots par hamming
        c = mod(s*G,2);

        %passage par le canal
        r = canal(c, f(i));
        
        %correction de la sortie canal
        S = mod(r*Ht,2);
        rc = correc(r, S, Ht);
        m = rc(1:4);

        %comptage des bits/blocs faux
        x = mean(xor(s,m));
        if x ~= 0
            iB = iB + 1;
            ib = ib + round(x*4);
        end
    end
    %ajout des pb/pB dans un tableau pour l'affichage de la courbe
    pB = [pB (iB/n)];
    pb = [pb (ib/(4*n))];
end

%affichage pour les differents f
figure
plot([0:pas:1],pB,[0:pas:1],pb)
title('pB(f) et pb(f)');
xlabel('f');
ylabel('pB, pb');
legend('pB', 'pb');
