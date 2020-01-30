function[Pvelt]=velt2(P, Pob,ra,upsos,ipsos,arithm)
Pvelt = P(:,1);
ppre = Pvelt;
pnow = Pvelt;
temni = 0;
j = 1;
for i = 2: length(P)
    coefficients = polyfit([pnow(1), P(1,i)], [pnow(2), P(2,i)], 1);
    a = -coefficients (1);
    c = -coefficients (2);
    
    el = min(pnow(1),P(1,i));
    meg = max(pnow(1),P(1,i));
    ely = min(pnow(2),P(2,i));
    megy = max(pnow(2),P(2,i));
    for h = 1:arithm
        if upsos(h) > ipsos - 0.00001
            x01 = Pob(1,h);
            y01 = Pob(2,h);
            x = (x01 - a*y01 - a*c)/(a^2 + 1);
            y = (a*(-x01 + a*y01) -c)/(a^2 + 1);
            if el < x && x < meg && ely < y && y < megy
                dob = abs(a*x01 + y01 + c)/norm([a,1]);
                if dob < (ra(h)+ 0.1*10^-4)
                
                    temni = 1;
                end
            end
        end    
    end
    if temni == 1
        
        j = j + 1;
        Pvelt(:,j) = ppre;
        temni = 0;
        pnow = ppre;
    end
    if i == length(P)
        j = j + 1;
        Pvelt(:,j) = P(:,i);
    end
    ppre = P(:,i);
    
    
    
    
end





end