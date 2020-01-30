
%Plot 2d Space and specify drawing requirements
arithm = input("dose arithmo kuklon");
figure
k=1;
movegui('east')
scal=1;

plot([0 0 0.001],[0.0008 0 0],'w.')
daspect([1 1 1])
hold on


%Drawing circles
for j = 1:arithm
    ob=ginput(2);
    ob=ob.';
    Po(:,j)=ob(:,1);
    ra(j)=norm(ob(:,1)-ob(:,2));
    r=rectangle('Position',[Po(1,j)-ra(j) Po(2,j)-ra(j) 2*ra(j) 2*ra(j)],'Curvature',[1 1]);
    r.FaceColor='r';
end

%Start and Goal

Ps=ginput(1);

Ps=Ps.';
plot(Ps(1), Ps(2), 'o');
Pg=ginput(1);
Pg=Pg.';
plot(Pg(1), Pg(2), '*');
%Initialization
i=1;
P=Ps;
lm=0;
h=0;
c=Pg;
velp = 0;
vel=Pg-P(:,i);
tic
sol=1;
minim = 0;
distance = 1;
force = 14; 
makros = 1500;
obstacwidth = 0.01;


while norm(c-P(:,i)) >= 0.5*10^-5
    
        
    if toc>20
        sol=0;
        break
    end
    if i > makros
        %plot(P(1,:),P(2,:))
        %pause(0.0000000000125);
        disp("den vrika");
        i=1;
        P=Ps;
        lm=0;
        c=Pg;
        h=0;
        minim = 0;
        k = k + 1;
        distance = distance + 0.3;
        force = force + 0.2;
        makros = makros + 20;
        obstacwidth = obstacwidth + 0.003;
    end
    %Goal field
    vg=Pg-P(:,i);
    dg=norm(vg);
    if dg<0.05*10^-5
        velg=300*vg;
    else
        velg=15*(vg/dg);
    end
    
    vel=velg;
    %Circle fields
    
    for j = 1:arithm
        vob=Po(:,j)-P(:,i);
        anadeltob = vob/norm(vob);
        dob=norm(vob)-(ra(j)+obstacwidth*10^-4);
        dmin = 0.5*10^-4;
        
        if dob < dmin
        
        
            velob= 0.0004*(1/dmin - 1/dob )*anadeltob;
            vel=vel+velob;
        end
        
    end
    
    %local minima
     
    
    
    if lm==1
        if dlmin > distance*dmin
            lm = 0;
        end
        vmin=P(:,i)-Pminima;
        dlmin=norm(vmin);
        
        vel=vel+force*(vmin/dlmin);
    end
    %disp(norm(vel))
    if  norm(vel)< 0.1 
        disp('local minima')
        lm=1;
        minim = minim + 1;
        thnew=randangle;
        Pminima=[P(1,i)+cosd(thnew)*0.025*10^-5;P(2,i)+sind(thnew)*0.025*10^-5];
        vmin=P(:,i)-Pminima;
        dlmin=norm(vmin);
        vel=vel+force*(vmin/dlmin);
   
    end    
    %Moving
     th=atan2d(vel(2),vel(1));   
     i=i+1;
    
     if norm(vel)<=10 
        P(:,i)=[P(1,i-1)+cosd(th)*norm(vel)*0.05*10^-5;P(2,i-1)+sind(th)*norm(vel)*0.05*10^-5]; 
     else
        P(:,i)=[P(1,i-1)+cosd(th)*0.5*10^-5;P(2,i-1)+sind(th)*0.5*10^-5]; 
     end 
    %plot(P(1,:),P(2,:))
    %pause(0.0000000000125);
    %velp = vel;
    
   
end
disp(toc)
%plor=plot(P(1,:),P(2,:),'r');
mhkos=length(P);
P = velt(P,Po,ra);
while mhkos ~= length(P)
    mhkos = length(P);
    P = velt(P,Po,ra);
end
plor=plot(P(1,:),P(2,:),'k');
if sol
    disp('Solution found')
    disp(i)
    disp(k)
    disp(minim)
    disp(length(P))
    disp(toc)
    
else
    disp('Solution not found')
    disp(k)
end  
clear
 





    
    