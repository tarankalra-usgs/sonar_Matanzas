clear all ; close all ; 
% Get the bedload at some intervals of MI dataset

clear all ; close all ; clc ; 

xx=load('C:\Users\tkalra\Desktop\sonardata_tsk\python_analysis_taran/Matanzas_wavelength.mat')
rip_MI=xx.wavelength_MI;

ncfn='C:\Users\tkalra\Desktop\sonardata_tsk\MI_early_matlab\11107hffan_xy-cal.nc';

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

%migrate
% Global indexing of timestacks
 nt11=400; nt12=680; % Extract the stacked file for further calculation of ripple migration 
 nt21=1150; nt22=1700 ; 
 nt31=2300; nt32=2600 ; 
 nt41=3000; nt42=3400 ;
 nt51=3300 ; nt52=3700; 

 % get the time stack data  
load('C:\Users\tkalra\Desktop\sonardata_tsk\MI_early_matlab\timestacks_5\stack_MI_subset_1.mat'); 

bedload(1:3700)=0.0; 

% local ripple migration rate read from the python code
%load('C:\Users\tkalra\Desktop\sonardata_tsk\MI_early_matlab\matfiles_MI_ripplemigrate/migrate11_1.mat') ;
load('C:\Users\tkalra\Desktop\sonardata_tsk\taran_exp2\migrate11_1.mat');

% convert local time index to global time index 


t_fix=nt11; 

for t=nt11:nt12
    %make local time index start from 1 
    nt_local=t-nt11+1
    rip_mig_rate(t)=0.0; 
    % 
%    nt_local 
   if( (nt_local+1) < length(jj_pick))
       
      nt_global=t_fix+tt_pick(nt_local) ; 

      num(nt_global)=xx(jj_pick(nt_local+1))-xx(jj_pick(nt_local)) ;
      den(nt_global)=tt_pick(nt_local+1)-tt_pick(nt_local)   ;
    
      %%nt_global
   else 
      break 
   end 
   xx_num=sum(num)  ;
   yy_num=sum(den)*0.5 ; % 0.5 to account for half hourly data production and now converted to hourly
   rip_mig_rate(nt_global)=xx_num/yy_num; 
 end 
% 
% figure(1)
% pcolorjw(dnn, xx, Sv_subset)
% colormap('gray')
% hold on 
% plot(dnn(tt_pick),xx(jj_pick),'r--')
% % 
% xlim([dn(nt11) dn(nt12)]); 
% datetick('x',2,'keepticks','keeplimits');
% xlabel('Time (year/month/day)')

for t=nt11:nt_global
% %     
%      % Being read from the python code
%      
% rip_MI  - this is in meters
% rip_mig_rate - this is in m and divide by 1800 to get it in seconds
% 
    

 if(rip_MI(t)>0.45)
    bedload_11_1(t)=0.0;
    rip_mig_rate_11_1(t)=0.0;
 else
    bedload_11_1(t) = (1-0.4)*0.5*0.16*rip_MI(t)*rip_mig_rate(t)/3600 ; %*totalMigrate[i]
    rip_mig_rate_11_1(t)=rip_mig_rate(t) ; 
 end
end 
 save('bedload_11_1.mat','rip_mig_rate_11_1', 'bedload_11_1'); 
 
 