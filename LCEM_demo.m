
clc
close all
clear;clc;
%% load dataset
datasets='SA';

if strcmp(datasets,'IP')
        load('D:\HSI-datasets\Indian_pines.mat');
        load('D:\HSI-datasets\Indian_pines_gt.mat');
        dataset = indian_pines;        labels = indian_pines_gt;
        no_classes=16; color='india';
elseif strcmp(datasets,'SA')
         load('D:\HSI-datasets\Salinas.mat');
         load('D:\HSI-datasets\Salinas_gt.mat');
        dataset = salinas;        
        labels = salinas_gt;
        no_classes=16; color='india';
elseif strcmp(datasets,'PU')    
        load('D:\HSI-datasets\PaviaU.mat');
        load('D:\HSI-datasets\PaviaU_gt.mat');
        dataset = paviaU;        labels = paviaU_gt;
        no_classes=9; color='uni';
end

%% Normalization and dimensionality reduction
Mi=min(min(min(dataset)));
Ma=max(max(max(dataset)));
for i=1:size(dataset,1)
    for j=1:size(dataset,2)
         dataset(i,j,:)=(dataset(i,j,:)-Mi)/(Ma-Mi);
    end
end

% MNF
[RD_hsi]  = fun_MyMNF(dataset, 20); 
sz = size(RD_hsi);  
%% Parameters 
% This is the default setting.
% We have conducted experiments on three data sets, including 
% Indian Pines, Pavia University, and Salinas datasets.
% If running on other data sets, you can adjust the
% parameters 'T_lamdba' and 'K_p' to achieve better performance.

T_lamdba = 30;
K_p = 0.55;

ratio = image_std(dataset);
if mod(floor(T_lamdba * ratio),2)==0
    wnd_sz = ceil(T_lamdba * ratio);
else 
    wnd_sz = floor(T_lamdba * ratio);
end
K = ceil(wnd_sz * wnd_sz * K_p);%The number of neighboring pixels

% The number or proportion of training samples per class. 
% e.g:train_number=10, train_number=0.01 (1% samples per class)
train_number = 0.001; 

%% LCEM
[lcemfea_all] =  fun_LCEM(RD_hsi,wnd_sz,K);
%%
for flag = 1:10
        [train_SL,test_SL,test_number]= GenerateSample(labels,train_number,no_classes);
        train_id = train_SL(1,:);
        train_label = train_SL(2,:);
        test_id = test_SL(1,:);
        test_label = test_SL(2,:);
        
        train_cov = lcemfea_all(:,:,train_id);
        test_cov = lcemfea_all;
        KMatrix_Train = logmkernel(train_cov, train_cov);
        KMatrix_Test = logmkernel(train_cov, test_cov);
        Ktrain = [(1:size(KMatrix_Train,1))',KMatrix_Train];
        
        model = svmtrain(train_label', Ktrain, ' -t 4');  
        Ktest = [(1:size(KMatrix_Test,2))', KMatrix_Test'];  
        tmp = ones(1,size(KMatrix_Test,2));
        [predict_label, accuracy, P1] = svmpredict(tmp',Ktest,model); 
        
        [OA(flag),Kappa(flag),AA(flag),CA(:,flag)] = calcError(test_label'-1,predict_label(test_id)-1,[1:no_classes]);   
        classification_map = reshape(predict_label,sz(1),sz(2));
        classification_map=label2color(classification_map,color);
        figure,imshow(classification_map)
end
results=[mean(OA); mean(AA) ; mean(Kappa) ]



