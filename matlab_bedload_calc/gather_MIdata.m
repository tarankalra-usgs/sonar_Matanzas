% gather data for MI 
clear all ; close all ; clc ; 

ncfn='C:\Users\tkalra\Desktop\sonardata_tsk\MI_early_matlab\11107hffan_xy-cal.nc';

formatIn = 'dd-mmm-yyyy HH:MM:SS';

dn=ncread(ncfn,'time');
% Start with first time step
DateString_ini=dn(1); 
%DateString_ini = '31-Jan-2018 00:00:00';
%DateString_end = '16-Feb-2018 00:00:00';

dnget=datenum(DateString_ini);

% % get the time stack data 
load('C:\Users\tkalra\Desktop\sonardata_tsk\MI_early_matlab\timestacks_5\stack_MI_subset_1.mat'); 
dnn1=dnn; 
xx1=xx; 
  
load('C:\Users\tkalra\Desktop\sonardata_tsk\MI_early_matlab\timestacks_5\stack_MI_subset_2.mat'); 
dnn2=dnn;
xx2=xx  ;
 
load('C:\Users\tkalra\Desktop\sonardata_tsk\MI_early_matlab\timestacks_5\stack_MI_subset_3.mat'); 
dnn3=dnn;
xx3=xx; 

load('C:\Users\tkalra\Desktop\sonardata_tsk\MI_early_matlab\timestacks_5\stack_MI_subset_4.mat'); 
dnn4=dnn;
xx4=xx; 
load('C:\Users\tkalra\Desktop\sonardata_tsk\MI_early_matlab\timestacks_5\stack_MI_subset_5.mat'); 
dnn5=dnn ;
xx5=xx ;

load('C:\Users\tkalra\Desktop\sonardata_tsk\MI_early_matlab\timestacks_5\stack_MI_subset_6.mat'); 
dnn6=dnn ;
xx6=xx ;

% LOAD THE WHOLE THING 
load('C:\Users\tkalra\Desktop\sonardata_tsk\MI_early_matlab\bedload_MI/all_times_transect.mat',....
                                'xx','Sv_avg','dn');
%  
% % local ripple migration rate read from the python code
% Output of pythn code
load('C:\Users\tkalra\Desktop\sonardata_tsk\taran_exp2\migrate11_1.mat');
%dnn11_1=dnn; 
jj_pick11_1=jj_pick  ;
tt_pick11_1=tt_pick  ; 
% 

load('C:\Users\tkalra\Desktop\sonardata_tsk\taran_exp2\migrate11_2.mat');
% %dnn11_2=dnn; 
 jj_pick11_2=jj_save  ; 
 tt_pick11_2=tt_save  ; 

load('C:\Users\tkalra\Desktop\sonardata_tsk\taran_exp2\migrate21_1.mat');
%dnn21_1=dnn; 
jj_pick21_1=jj_save  ; 
tt_pick21_1=tt_save  ; 
% 
load('C:\Users\tkalra\Desktop\sonardata_tsk\taran_exp2\migrate22_2.mat');
% %dnn22_2=dnn; 
 jj_pick22_2=jj_save  ; 
 tt_pick22_2=tt_save  ; 
% 
load('C:\Users\tkalra\Desktop\sonardata_tsk\taran_exp2\migrate31.mat');
% %dnn31=dnn; 
jj_pick31=jj_pick  ; 
tt_pick31=tt_pick ; 
% 
 load('C:\Users\tkalra\Desktop\sonardata_tsk\taran_exp2\migrate41_1.mat');
% %dnn41=dnn; 
 jj_pick41_1=jj_save  ;
 tt_pick41_1=tt_save  ; 
% 
load('C:\Users\tkalra\Desktop\sonardata_tsk\taran_exp2\migrate51.mat');
% %dnn51=dnn; 
 jj_pick51=jj_pick  ; 
 tt_pick51=tt_pick  ;
%
load('C:\Users\tkalra\Desktop\sonardata_tsk\taran_exp2\migrate61.mat');
% %dnn51=dnn; 
 jj_pick61=jj_save ; 
 tt_pick61=tt_save  ;
% 
% jj_pick_all=[jj_pick11_1; jj_pick11_2; jj_pick21_1 ; jj_pick22_2; ......
%              jj_pick31  ; jj_pick41  ; jj_pick51] ; 

%dnn_all=[dnn11_1 ; dnn11_2 ; dnn21_1 ; dnn22_2 ; dnn31 ; dnn41; dnn51] ; 

ifig=0;
if(ifig==1)
figure(1)
pcolorjw(dn, xx, Sv_avg)
colormap('gray')
hold on 
plot(dnn1(tt_pick11_1),xx1(jj_pick11_1),'r.-')
hold on
plot(dnn1(tt_pick11_2),xx1(jj_pick11_2),'g.-')
hold on
plot(dnn2(tt_pick21_1),xx2(jj_pick21_1),'b.-')
hold on 
plot(dnn2(tt_pick22_2),xx2(jj_pick22_2),'r--')
hold on 
plot(dnn3(tt_pick31),xx3(jj_pick31),'g--')
hold on 
 plot(dnn4(tt_pick41_1),xx4(jj_pick41_1),'b--')
 hold on 
 plot(dnn5(tt_pick51),xx5(jj_pick51),'c--')
 hold on
 plot(dnn6(tt_pick61),xx6(jj_pick61),'k.-')
ylim([1 2.0])         
pbaspect([4 1 1])
nt11=20 ; nt22=3787; 
xlim([dn(nt11) dn(nt22)]);
colormap('gray')
datetick('x',2,'keepticks','keeplimits');
xlabel('Time (year/month/day)')% convert local time index to global time index 
end

load('bedload_11_1.mat','rip_mig_rate_11_1', 'bedload_11_1'); 
load('bedload_11_2.mat','rip_mig_rate_11_2', 'bedload_11_2'); 
load('bedload_21_1.mat','rip_mig_rate_21_1', 'bedload_21_1'); 
load('bedload_22_2.mat','rip_mig_rate_22_2', 'bedload_22_2');

load('bedload_31.mat','rip_mig_rate_31', 'bedload_31');
load('bedload_41_1.mat','rip_mig_rate_41_1', 'bedload_41_1');
load('bedload_51.mat','rip_mig_rate_51', 'bedload_51');
load('bedload_61.mat','rip_mig_rate_61', 'bedload_61');


 nt11=400; nt22=680; % Extract the stacked file for further calculation of ripple migration 
 nt11=1150; nt22=1700 ; 
 nt11=2300; nt22=2600 ; 
 nt11=3000; nt22=3400 ;
 nt11=3300 ; nt22=3700; 
 nt11=1800 ; nt22=2300; 
% bedload_net=[bedload_11_1; bedload_11_2; bedload_21_1; bedload_22_2; ....
%              bedload_31; bedload_41; bedload_51]; 

bedload_net11(1:length(dn))=0.0; 
bedload_net12=bedload_net11; 
bedload_net21=bedload_net12;
bedload_net22=bedload_net12;
bedload_net3=bedload_net12 ; 
bedload_net41_1=bedload_net12; 
bedload_net4=bedload_net12; 
bedload_net5=bedload_net12 ; 
bedload_net6=bedload_net12 ;

for i=1:length(dn)
    if(i<length(bedload_11_1))
         bedload_net11(i)=bedload_11_1(i);
    end
end
% NT_NEXT
nt_next=length(bedload_11_1)+1; 
for i=1:length(dn)
    if( i>nt_next && i<length(bedload_11_2))
         bedload_net12(i)=bedload_11_2(i);
    end
end
% NT_NEXT
nt_next=length(bedload_11_2)+1; 
 
for i=1:length(dn)
  if(i>nt_next &&  i<length(bedload_21_1))
         bedload_net21(i)=bedload_21_1(i);
    end
end  

% NT_NEXT 
nt_next=length(bedload_21_1)+1; 

for i=1:length(dn)
    if(i>nt_next && i< length(bedload_22_2))
         bedload_net22(i)=bedload_22_2(i);
    end
end
% 
%NT_NEXT 
nt_next=length(bedload_22_2)+1; 

for i=1:length(dn)
    if(i> nt_next && i<length(bedload_61))
         bedload_net6(i)=bedload_61(i);
    end
end
%NT_NEXT
nt_next=length(bedload_61)+1; 

for i=1:length(dn)
    if(i>nt_next && i < length(bedload_31))
         bedload_net3(i)=bedload_31(i);
    end
end

%NT_NEXT 
nt_next=length(bedload_31)+1; 

for i=1:length(dn)
    if(i> nt_next && i< length(bedload_41_1))
         bedload_net41_1(i)=bedload_41_1(i);
    end
end
%NT_NEXT 
nt_next=length(bedload_41_1)+1; 

for i=1:length(dn)
    if(i> nt_next && i<length(bedload_51))
         bedload_net5(i)=bedload_51(i);
    end
end
bedload_sonar=[bedload_net11+ bedload_net12+bedload_net6+ bedload_net21+ bedload_net22+.......
             bedload_net3 + bedload_net41_1 + bedload_net5]; 
% figure(1)
% pcolorjw(dnn, xx, Sv_subset)
% colormap('gray')
% hold on 
% plot(dnn(tt_pick),xx(jj_pick11_1),'r--')
% % 
for t=1:2:length(bedload_sonar)-1
    t_new=floor((t+1)/2);
    %dn_sonar(t_new)=floor((dn(t+1)/2));  
  
    bedload_sonar_new(t_new)=bedload_sonar(t)+bedload_sonar(t+1); 
end 

cumbedld_sonar=cumtrapz(bedload_sonar_new);
save('sonar_bedload_MI.mat','bedload_sonar_new','cumbedld_sonar')
% 
dn_sonar=dn ; 
save('Sv_MI_sonar.mat', 'dn_sonar','xx','Sv_avg',....
    'xx1','dnn1','tt_pick11_1','jj_pick11_1',.....
    'tt_pick11_2','jj_pick11_2',........
    'xx2','dnn2','jj_pick21_1','tt_pick21_1', .....
    'tt_pick22_2','jj_pick22_2',......
    'xx3','dnn3','tt_pick31',  'jj_pick31', .....
    'xx4','dnn4', 'tt_pick41_1','jj_pick41_1',.....
    'xx5','dnn5','tt_pick51', 'jj_pick51', ...
    'xx6','dnn6','tt_pick61','jj_pick61'); 
 
 
%figure(2)
%plot(dn, bedload_sonar)
%hold on
figure(1)
subplot(3,1,1)
pcolorjw(dn, xx, Sv_avg)
colormap('gray')
hold on 
plot(dnn1(tt_pick11_1),xx1(jj_pick11_1),'r.-')
hold on
plot(dnn1(tt_pick11_2),xx1(jj_pick11_2),'g.-')
hold on
plot(dnn2(tt_pick21_1),xx2(jj_pick21_1),'b.-')
hold on 
plot(dnn2(tt_pick22_2),xx2(jj_pick22_2),'r--')
hold on 
plot(dnn3(tt_pick31),xx3(jj_pick31),'g--')
hold on 
 plot(dnn4(tt_pick41_1),xx4(jj_pick41_1),'b--')
 hold on 
 plot(dnn5(tt_pick51),xx5(jj_pick51),'c--')
 hold on
 plot(dnn6(tt_pick61),xx6(jj_pick61),'k.-')
ylim([1 2.0])         
%pbaspect([4 1 1])
nt11=20 ; nt22=3787; 
xlim([dn(nt11) dn(nt22)]);
colormap('gray')
datetick('x',2,'keepticks','keeplimits');
xlabel('Time (year/month/day)')% convert local time index to global time index 


subplot(3,1,2)
plot(dn(nt11:nt22), bedload_net11(nt11:nt22),'r.-')
hold on
plot(dn(nt11:nt22), bedload_net12(nt11:nt22), 'g.-')
hold on
plot(dn(nt11:nt22), bedload_net21(nt11:nt22), 'b.-')
hold on
plot(dn(nt11:nt22), bedload_net22(nt11:nt22), 'r')
hold on
plot(dn(nt11:nt22), bedload_net3(nt11:nt22), 'g')
hold on
plot(dn(nt11:nt22) , bedload_net41_1(nt11:nt22),'b')
hold on 
plot(dn(nt11:nt22), bedload_net5(nt11:nt22), 'c')
hold on
plot(dn(nt11:nt22) , bedload_net6(nt11:nt22), 'k')
nt11=20 ; nt22=3787; 
xlim([dn(nt11) dn(nt22)]);
datetick('x',2,'keepticks','keeplimits');
xlabel('Time (year/month/day)')% convert local 
ylabel('q_{b} (m^{2}/s)')

load('C:\Users\tkalra\Desktop\Observationaldata\Matanzes_Inlet\Matanzes_Inlet\matfiles\pspec_MInlet.mat','dn_wh');
dn=dn_wh;
nt11=20; nt22=1893; 
subplot(3,1,3)
plot(dn(nt11:nt22), bedload_sonar_new(nt11:nt22))
xlim([dn(nt11) dn(nt22)]);
datetick('x',2,'keepticks','keeplimits');
xlabel('Time (year/month/day)')% convert local time index to global time index 


set(gcf,'PaperUnits','inches','PaperPosition',[0 0 11 8])
print('-dpng','-r400','bedload_sonar.png')
% 
% 
% xfac=10^6;
% figure(2)
% plot(dn(nt11:nt22), bedload_net11(nt11:nt22)*xfac,'r.-')
% hold on
% plot(dn(nt11:nt22), bedload_net12(nt11:nt22)*xfac, 'g.-')
% hold on
% plot(dn(nt11:nt22), bedload_net21(nt11:nt22)*xfac, 'b.-')
% hold on
% plot(dn(nt11:nt22), bedload_net22(nt11:nt22)*xfac, 'r')
% hold on
% plot(dn(nt11:nt22), bedload_net3(nt11:nt22)*xfac, 'g')
% hold on
% plot(dn(nt11:nt22) , bedload_net41_1(nt11:nt22)*xfac,'b')
% hold on 
% plot(dn(nt11:nt22), bedload_net5(nt11:nt22)*xfac, 'c')
% hold on
% plot(dn(nt11:nt22) , bedload_net6(nt11:nt22)*xfac, 'k')
% nt11=20 ; nt22=3787; 
% xlim([dn(nt11) dn(nt22)]);
% ylabel('q_{b}x10^{6} (m^{2}/s)')
% datetick('x',2,'keepticks','keeplimits');
% xlabel('Time (year/month/day)')% convert local 