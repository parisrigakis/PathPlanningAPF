H = [1 2];
T = [5 6]
a = 10
rroute=[[2;3;4] [2;3;4] [a;a;a]];
 [m,n]=size(rroute); 
Order(1:m+2,1)=0:1:m+1;


Command(1:m+2,1:3)=zeros;
Command(1:m+2,1)=zeros;
Command(1:m+2,2)=3*ones;
Command(1:m+2,3)=16*ones;
%takeoff
Command(1,2)=0;
Command(1,3)=0;
Command(2,3)=22;
Command(m+2,3)=21;

Command(2:size(m+2)-3,3)=16;

% 
Delay(1:m+2,1:4)=zeros;

Coordinates(1:m+2,1)=[H(1) rroute(:,1)' T(1)];
Coordinates(1:m+2,2)=[H(2) rroute(:,2)' T(2)];
Coordinates(1:m+2,3)=a*ones(m+2,1);

something(1:m+2,1)=ones;

 % Write File
 fid=fopen('locations.waypoints','w');
 fprintf(fid,'%s \n',"QGC WPL 110");
 for i=1:m+2
     fprintf(fid,'%d %d %d %d %f %f %f %f %.8f %.8f %.8f %d\n',Order(i),Command(i,1),Command(i,2),Command(i,3),Delay(i,1),Delay(i,2),Delay(i,3),Delay(i,4),Coordinates(i,1),Coordinates(i,2),Coordinates(i,3),something(i));
 end
 fclose(fid);