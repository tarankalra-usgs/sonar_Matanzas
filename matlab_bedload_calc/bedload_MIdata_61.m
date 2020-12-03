
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
 nt61=1800; nt62=2300;

 % get the time stack data  
load('C:\Users\tkalra\Desktop\sonardata_tsk\MI_early_matlab\timestacks_5\stack_MI_subset_6.mat'); 

bedload(1:3700)=0.0; 

% local ripple migration rate read from the python code
%load('C:\Users\tkalra\Desktop\sonardata_tsk\MI_early_matlab\matfiles_MI_ripplemigrate/migrate11_1.mat') ;
load('C:\Users\tkalra\Desktop\sonardata_tsk\taran_exp2\migrate61.mat');

% convert local time index to global time index 
jj_pick=jj_save ;
tt_pick=tt_save ; 
% 
% for i=1:length(jj_pick)-1
%     if(jj_pick(i+1)-jj_pick(i)<0)
%         jj_pick(i)=0.5*(jj_pick(i-1)+jj_pick(i+1)); 
%     end 
% end 
% convert local time index to global time index 
jj_pick=jj_pick(14:end);
tt_pick=tt_pick(14:end); 
nt_init=nt61;
nt_final=nt62 ; 
count=0  ; 
for t=nt_init:nt_final
    %make local time index start from 1 
    nt_local=t-nt_init+1
    %rip_mig_rate(t)=0.0; 
    % 
%    nt_local 
   if( (nt_local+1) < length(jj_pick))
      count=count+1;   
      %nt_global=nt_init+count ; 
      nt_global=nt_init+tt_pick(nt_local) ; 

    
      num(nt_global)=xx(jj_pick(nt_local+1))-xx(jj_pick(nt_local)) ; 
%       if(num(nt_global)<0)
%           num(nt_global)=0;
%       end 
 
         den(nt_global)=tt_pick(nt_local+1)-tt_pick(nt_local)   ;
    
     % rip_mig_rate(nt_global)=num(nt_global)  ;
      %%nt_global
   else 
      break 
   end 
   
   xx_num=sum(num)  ;
   yy_num=sum(den)*0.5 ; % 0.5 to account for half hourly data production and now converted to hourly
   rip_mig_rate(nt_global)=xx_num/yy_num; 
end 

ifig=1; 
if(ifig==1)
figure(1)
pcolorjw(dnn, xx, Sv_subset)
colormap('gray')
hold on 
plot(dnn(tt_pick),xx(jj_pick),'r--')
end

for t=nt_init:nt_global
% %     
%      % Being read from the python code
%      
% rip_MI  - this is in meters
% rip_mig_rate - this is in m and divide by 1800 to get it in seconds
% 

 if(rip_MI(t)>0.45)
    bedload_61(t)=0.0;
    rip_mig_rate_61(t)=0.0;
 else
     rip_MI_wvln(t)=rip_MI(t); 
    bedload_61(t) = (1-0.4)*0.5*0.16*rip_MI(t)*rip_mig_rate(t)/3600 ; %*totalMigrate[i]
    rip_mig_rate_61(t)=rip_mig_rate(t) ;  
 end
 end 
figure(2)
plot(bedload_61)
  save('bedload_61.mat','rip_mig_rate_61', 'bedload_61'); 