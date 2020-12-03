clear all ; close all ; clc ; 

xx=load('../python_analysis_taran/Matanzas_wavelength.mat')
rip_MI=xx.wavelength_MI;

ncfn='11107hffan_xy-cal.nc';

formatIn = 'dd-mmm-yyyy HH:MM:SS';

dn=ncread(ncfn,'time');
% Start with first time step
DateString_ini=dn(1); 
%DateString_ini = '31-Jan-2018 00:00:00';
%DateString_end = '16-Feb-2018 00:00:00';

dnget=datenum(DateString_ini);
%
% find the index correspodning to the initiation of tie mprobe 
tt=find(dn>=dnget);

% Just to get x and y use first time stamp of data
 %for t=tt(1):tt(1)
 %    dn_loc=dn(t) ;
 %    imout=getprocsonar1img(ncfn,dn_loc);
 %end 
nt1=1 ; nt2=length(dn); 

% PERIODS THAT I COMPUTED FOR CALCULATING WAVELENGTH 
% 
figure(1)
plot(dn, rip_MI)
xlim([dn(nt1) dn(nt2)]);
datetick('x',2,'keepticks','keeplimits');
xlabel('Time (year/month/day)')
xlabel('Date')

set(gcf,'PaperUnits','inches','PaperPosition',[0 0 11 8]) 
print('-dpng','-r200','images/MI_ripple.png')


nt11=406;  nt12=456; % ONE 
nt21=576;  nt22=676-5; % TWO 
nt31=1160; nt32=1300;
nt41=1500; nt42=1615;
nt51=2412+38; nt52=2487-2; % FIVE 
nt61=3298; nt62=3339;
nt71=3342; nt72=3386; 
nt81=3521; nt82=3536; %LAST 

figure(2)
plot(dn(nt11:nt12),rip_MI(nt11:nt12));
hold on
plot(dn(nt21:nt22),rip_MI(nt21:nt22));
hold on
plot(dn(nt31:nt32),rip_MI(nt31:nt32));
hold on
plot(dn(nt41:nt42),rip_MI(nt41:nt42));
hold on
plot(dn(nt51:nt52),rip_MI(nt51:nt52));
hold on
plot(dn(nt61:nt62),rip_MI(nt61:nt62));
hold on
plot(dn(nt71:nt72),rip_MI(nt71:nt72)) ; 
hold on
plot(dn(nt81:nt82),rip_MI(nt81:nt82)) ; 
xlim([dn(nt1) dn(nt2)]);
datetick('x',2,'keepticks','keeplimits');
xlabel('Time (year/month/day)')
xlabel('Date')

set(gcf,'PaperUnits','inches','PaperPosition',[0 0 11 8]) 
print('-dpng','-r200','images/MI_transects_ripple.png')
% 
% figure(2)
% plot(dn, rip_MI)
% xlim([dn(nt1) dn(nt2)]);
% datetick('x',2,'keepticks','keeplimits');
% xlabel('Time (year/month/day)')
% xlabel('Date')
% 
% 
% nt62_1=3339;
% figure(4)
% plot((nt61:nt62_1),rip_MI(nt61:nt62_1));
% 
% nt62_2=3386;
% figure(4)
% plot((3342:nt62_2),rip_MI(3342:nt62_2));
% % 
% nt81_1=3521;
% nt82_1=3536;
%  figure(4)
%  plot((nt81_1:nt82_1),rip_MI(nt81_1:nt82_1));
% 
 rip_MI(rip_MI>0.35)=NaN;

figure(3)
plot(dn, rip_MI)
xlim([dn(nt1) dn(nt2)]);
datetick('x',2,'keepticks','keeplimits');
xlabel('Time (year/month/day)')
xlabel('Date')
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 11 8]) 
print('-dpng','-r200','images/MI_ripple_NaN_35.png')

figure(4)
plot(dn(nt11:nt12),rip_MI(nt11:nt12),'o');
hold on
plot(dn(nt21:nt22),rip_MI(nt21:nt22),'o');
hold on
plot(dn(nt31:nt32),rip_MI(nt31:nt32),'o');
hold on
plot(dn(nt41:nt42),rip_MI(nt41:nt42),'o');
hold on
plot(dn(nt51:nt52),rip_MI(nt51:nt52),'o');
hold on
plot(dn(nt61:nt62),rip_MI(nt61:nt62),'o');
hold on
plot(dn(nt71:nt72),rip_MI(nt71:nt72),'o') ;  
hold on
plot(dn(nt81:nt82),rip_MI(nt81:nt82),'o') ; 
hold on
plot(dn, rip_MI)