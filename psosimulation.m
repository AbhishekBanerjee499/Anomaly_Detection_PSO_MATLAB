clc
clear
% reading data from text file
fid = fopen('sms_data.txt');
fspec = '%i %i';
sizedata = [2 Inf];
data = fscanf(fid,fspec,sizedata);
sms = data(2,:); % extracting SMS sent for 120 days
% defining objective function of RMSE between observed and simulated SMS
% number in 120 days
objfunc = @(x) sqrt((1/120)*sum((simfunc(x(1),x(2),x(3)) - sms).^2));
% specifying bounds for variables
lb = [0,0,0];
ub = [120,max(sms),max(sms)];
nvars = 3;
% addtional options adjustment for better optimization
options = optimoptions('particleswarm','Display','off','FunctionTolerance',1e-12,'MinNeighborsFraction',0.9);
n= [];lambda1 = [];lambda2 = [];RMSE=[];

% Simulating optimizer for 20 times
for i=1:20
[x,fval,exitflag,output] = particleswarm(objfunc,nvars,lb,ub,options);
n = [n,round(x(1),0)];lambda1 = [lambda1,x(2)];lambda2 = [lambda2,x(3)];RMSE=[RMSE,fval];
% Printing results of each run
fprintf('n= %i, lambda1 = %.4f, lambda2 = %.4f, RMSE=%.4f\n',round(x(1),0),x(1),x(2),fval)
end
% Finding the best solution and printing
idx = find(RMSE == min(RMSE));
fprintf('\t\t\t\t****Best Solution****\n n= %i, lambda1 = %.4f, lambda2 = %.4f, RMSE=%.4f\n',n(idx),lambda1(idx),lambda2(idx),RMSE(idx))


function simul = simfunc(n,lambda1,lambda2)
bef_brkup = poissrnd(lambda1,1,round(n,0));
aft_brkup = poissrnd(lambda2,1,120-round(n,0)); 
simul = [bef_brkup,aft_brkup];
end