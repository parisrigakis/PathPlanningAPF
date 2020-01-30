function[u]=U(dg,dob,dt)
 if dg<0.05*10^-4
    ug=0.5*300*dg^2;
 else
    ug=0.05*300*dg - 0.5*300*(0.05)^2;
 end
 if dob<1*10^-4
     uob=0.5*0.01*(1/(1)-1/dob)^2*dg^2;
 else
     uob=0;
 end

 u=ug+uob;
end 