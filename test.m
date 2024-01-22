clc
clear all

for beishi_xingming=1:27
%% 被试信息
clearvars -except beishi_xingming erpz1  erpz2 erpz3 erpzong1 erpzong2 erpzong3 erpbuchongz xwzong
shuxing={...
    'chenyi'; 'dongkailun'; 'huangshuaifei';'jifengrui';'lihui';'lixin';'lizhicai';'wang';'wanglijie'; 'wangwen';'wangwenli';...
   'wangzhuang';'wangzi';'weijinze';'yanzhe';'yeyangyang';'zhangwenxuan';'zhangyujian';'zhangzhehao';'zhuhu';
'chengqian'; 'gaoruisi';'guizhuolan';'huanghuimin';'luoruixin'; ...
   'ouyang';  'wangwenjie'};
ren=shuxing{beishi_xingming,1};
switch beishi_xingming
    case {27 26}
         xw=[];
for i=1:4 
        clearvars -except i beishi_xingming erpz1  erpz2 erpz3 erpzong1 erpzong2 erpzong3 erpbuchongz xwzong xw ren
 xwsj=load(['D:\电刺激数据\ccbu\buchong\',num2str(ren),'4_',num2str(i),'.mat']);
    xw1=struct2cell(xwsj);
    xw2=xw1{1, 1};
    xw3=[xw2{:, 3}];
    xw5=[xw2{2:61, 2}];
 for j=2:length(xw3)
       panduan=xw3{1,j};
       switch panduan
           case 'space'
               xw4(j-1)=2;
           case 'RightArrow'
               xw4(j-1)=1;
           case 'LeftArrow'
               xw4(j-1)=3;
       end
 end
    xw4(2,:)=xw5;
    xw=[xw xw4];
end
    case {1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20}
xw=[];
for i=1:4
    clearvars -except i beishi_xingming erpz1  erpz2 erpz3 erpzong1 erpzong2 erpzong3 erpbuchongz xwzong xw ren
    xwsj=load(['D:\电刺激数据\ccbu\buchong\S1-S16\',num2str(ren),'4_',num2str(i),'.mat']);
    xw1=struct2cell(xwsj);
    xw2=xw1{1, 1};
    xw3=[xw2{:, 3}];
    xw5=[xw2{2:61, 2}];
    for j=2:61
       panduan=xw3{1,j};
       switch panduan
           case '2'
               xw4(j-1)=2;
           case '1'
               xw4(j-1)=1;
           case '3'
               xw4(j-1)=3;
       end
    end
    xw4(2,:)=xw5;
    xw=[xw xw4];
end
     case {21 22 23 24 25 }
         xw=[];
for i=1:4    
        clearvars -except i beishi_xingming erpz1  erpz2 erpz3 erpzong1 erpzong2 erpzong3 erpbuchongz xwzong xw ren
 xwsj=load(['D:\电刺激数据\ccbu\buchong\',num2str(ren),'4_',num2str(i),'.mat']);
    xw1=struct2cell(xwsj);
    xw2=xw1{1, 1};
    xw3=[xw2{:, 3}];
    xw5=[xw2{2:61, 2}];
 for j=2:length(xw3)
       panduan=xw3{1,j};
       switch panduan
           case 'space'
               xw4(j-1)=2;
           case 'LeftArrow'
               xw4(j-1)=1;
           case 'RightArrow'
               xw4(j-1)=3;
       end
 end
    xw4(2,:)=xw5;
    xw=[xw xw4];
end
end
xwzong(beishi_xingming,:,:)=xw;
end
a=[];
for i=1:27
 a1= squeeze( xwzong(i,:,:));
 a=[a a1];
end

for i=1:27
    tp=0;
  result_data_te= squeeze( xwzong(i,2,:));  
 label_te= squeeze( xwzong(i,1,:)); 
for y = 1:240
if result_data_te(y,1)==label_te(y,1)
tp = tp+1;
end
tpzong(i,:)=tp./240;
end
end
tpmean=mean(tpzong);
tpstd=std(tpzong);

    figure;   
    for i=1:27
    hold on
   set(gcf,'unit','centimeters','Position',[5 5 8.3 7]);
    color_1=[105,105,105]./255;
    color_2=[0,0,0]./255;
    
    bar(i,tpzong(i,:)*100,'FaceColor', color_1,'EdgeColor', color_3,'LineWidth',1);
    label{1,i}=['S',num2str(i)];
    end
hold on    
plot([0.3,27.8],[98.2870,98.2870], 'color',color_2,'linestyle','--','Linewidth',0.5);
set(gca,'XTick',1:27);
%设置柱状图每个柱子的横坐标
set(gca,'XTickLabel',label);
%设置小标签字体
set(gca,'FontSize',8,'Fontname','Times New Roman');
set(gca,'XTickLabelRotation',90)
%设置纵坐标的数值范围
set(gca,'YLim',[80 100]);
set(gca,'XLim',[0.3 27.8]);
%修改大标签
box on
ylabel('%correct','FontSize',10,'Fontname','Times New Roman') 
xlabel('Subject','FontSize',10,'Fontname','Times New Roman') 



   