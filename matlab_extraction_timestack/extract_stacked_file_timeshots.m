clear all ; close all ; clc ; 

nt11=406;  nt12=456; % ONE 
nt21=576;  nt22=676-5; % TWO 
nt31=1160; nt32=1300;
nt41=1500; nt42=1615;
nt51=2412+38; nt52=2487-2; % FIVE 
nt61=3298; nt62=3339;
nt71=3342; nt72=3386; 
nt81=3521; nt82=3536; %LAST 

 nt11=400; nt22=680; % Extract the stacked file for further calculation of ripple migration 
 nt11=1150; nt22=1700 ; 
 nt11=2300; nt22=2600 ; 
 nt11=3000; nt22=3400 ;
 nt11=3300 ; nt22=3700; 
 
 %Image stacking of one transect in time 
ncfn='11107hffan_xy-cal.nc';

format long
formatIn = 'dd-mmm-yyyy HH:MM:SS';

dn=ncread(ncfn,'time');

%load('transect_sonar.mat','y_transect','Sv_transect')
%load('transect_sonar1.mat','y_transect','Sv_transect')
 load('transect_sonar_alongx_alltime.mat','x_transect','Sv_transect')

Sv_avg=0.0.*Sv_transect ; 
%Moving average

Sv_avg(:,1:end)=movmean(Sv_transect(:,1:end),5); 
nt1=1 ; nt2=length(dn); 
% 
%%

 Sv_subset=Sv_avg(:,nt11:nt22);
 xx=(5+x_transect)';
 dnn=dn(nt11:nt22); 

figure(1)
set(gca,'fontweight','bold')
  pcolorjw(dnn,xx, Sv_subset)
 xlim([dn(nt11) dn(nt22)]);
 colormap('gray')
 datetick('x',2,'keepticks','keeplimits');
 xlabel('Time (year/month/day)')
% %colorbar
xlabel('Date')
ylabel('Cross-shore distance (m)')


%save('timestacks/stack_MI_subset_5','dnn','xx','Sv_subset')

