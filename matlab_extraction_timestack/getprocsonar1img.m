function imout=getprocsonar1img(ncfn,dnget)
%function imout=getprocsonar1img(ncfn,dnget)
%
%ncfn = processed sonar xy file
%dnget = matlab datenum just before sonar data you want (e.g, if want data
%           from 1/25/2018 15:55; you can use dnget = datenum('25-Jan-2018 15:50')
%

%ii=find(dn>=dnget);
dn=ncread(ncfn,'time');
ii=find(dn>=dnget);

x=ncread(ncfn,'x');
y=ncread(ncfn,'y');
ncid=netcdf.open(ncfn);
varid=netcdf.inqVarID(ncid,'Sv');
Sv=netcdf.getVar(ncid,varid,[0 0 0 ii(1)-1],[1001 1001 1 1]);

Sv(Sv>1e34)=NaN;
netcdf.close(ncid);

imout.x=x; 
imout.y=y; 
imout.Sv=Sv; 

ifig=0; 
if(ifig==1);
figure(1); 
scrsz=get(0,'screensize');

set(gcf,'position',[scrsz(3)*0.2 scrsz(4)*0.05 scrsz(4)*0.9 scrsz(4)*0.8])
pcolor(x,y,Sv)
shading flat
colormap('gray')
set(gca,'xlim',[-5 5]);
set(gca,'ylim',[-5 5]);
xlabel('Distance East, [m]')
ylabel('Distance North, [m]')

fnstr=regexp(ncfn,'_','split');
title(sprintf('Sonar: Sound Pressure Level (dB - uncalibrated): %s : %s',fnstr{1},datestr(dn(ii(1)))),'fontsize',12)
hold on
end 
% 
% x11=-1.5 ; 
% x12=-2.5 ; 
% y11=1.5 ; 
% y12=1.5 ;
% 
% rectangle('Position', [x11, x12, y11, y12] ,.....
%   'EdgeColor','r','LineWidth',2 )

imout.dn=dn;
imout.x=x;
imout.y=y;
imout.Sv=Sv;
