% x=[0,1,2,3];
% y=[1,exp(1),exp(2),exp(3)];
% clampspline(x,y,1,exp(3))
% 
% temp1=[1,1,0.44468,0.27360];
% temp2=[2.71828,2.71016,1.26548,0.69513];
% temp3=[7.38906,7.32652,3.35087,2.01909];
% poly1=[0];
% poly2=[0];
% poly3=[0];
% for i=1:4
%     poly1=polyadd(poly1,temp1(i)*polypower([1,0],i-1));
%     poly2=polyadd(poly2,temp2(i)*polypower([1,-1],i-1));
%     poly3=polyadd(poly3,temp3(i)*polypower([1,-2],i-1));
% end
% 
% poly1
% poly2
% poly3

disp("4a:")
x=[0,0.5]
y=[2,5.43656];
clampspline(x,y,2,5.43656)

disp("4b:")
x=[-0.25,0.25]
y=arrayfun(@f3b_,x);
y1=arrayfun(@f3b,x);
clampspline(x,y1,y(1),y(2))

