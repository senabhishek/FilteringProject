%% SC4040 - Filtering & Identification

% Load testset
load '/Users/Abhi/Documents/Learning/Courses/Delft/2013-2014/p2/SC4040-Filtering&Identification/Project/datasets(1).mat';
% Load opt trainset
load '/Users/Abhi/Documents/Learning/Courses/Delft/2013-2014/p2/SC4040-Filtering&Identification/Project/dataset1_opt.mat';

test_dataset = data1;
y_test = test_dataset(2:5,:);
u_test = test_dataset(6:7,:);

%% One-Step Ahead Error Estimation

U_6_test = [u_test;y_test];
E_6_test = dltisim(A_6_K, B_6_K, C_6, D_6_K, U_6_test');
yest_6_test = y_test - E_6_test';

U_18_test = [u_test;y_test];
E_18_test = dltisim(A_18_K, B_18_K, C_18, D_18_K, U_18_test');
yest_18_test = y_test - E_18_test';

%% Autocorr
autocorr_6_output_1 = autocorr(E_6_test(:,1), maxlag);
autocorr_6_output_2 = autocorr(E_6_test(:,2), maxlag);
autocorr_6_output_3 = autocorr(E_6_test(:,3), maxlag);
autocorr_6_output_4 = autocorr(E_6_test(:,4), maxlag);
autocorr_18_output_1 = autocorr(E_18_test(:,1), maxlag);
autocorr_18_output_2 = autocorr(E_18_test(:,2), maxlag);
autocorr_18_output_3 = autocorr(E_18_test(:,3), maxlag);
autocorr_18_output_4 = autocorr(E_18_test(:,4), maxlag);

%% Crosscorr
xcorr_6_output_1_1 = xcorr(E_6_test(:,1), u_test(1,:), maxlag);
xcorr_6_output_1_2 = xcorr(E_6_test(:,1), u_test(2,:), maxlag);
xcorr_6_output_2_1 = xcorr(E_6_test(:,2), u_test(1,:), maxlag);
xcorr_6_output_2_2 = xcorr(E_6_test(:,2), u_test(2,:), maxlag);
xcorr_6_output_3_1 = xcorr(E_6_test(:,3), u_test(1,:), maxlag);
xcorr_6_output_3_2 = xcorr(E_6_test(:,3), u_test(2,:), maxlag);
xcorr_6_output_4_1 = xcorr(E_6_test(:,4), u_test(1,:), maxlag);
xcorr_6_output_4_2 = xcorr(E_6_test(:,4), u_test(2,:), maxlag);

xcorr_18_output_1_1 = xcorr(E_18_test(:,1), u_test(1,:), maxlag);
xcorr_18_output_1_2 = xcorr(E_18_test(:,1), u_test(2,:), maxlag);
xcorr_18_output_2_1 = xcorr(E_18_test(:,2), u_test(1,:), maxlag);
xcorr_18_output_2_2 = xcorr(E_18_test(:,2), u_test(2,:), maxlag);
xcorr_18_output_3_1 = xcorr(E_18_test(:,3), u_test(1,:), maxlag);
xcorr_18_output_3_2 = xcorr(E_18_test(:,3), u_test(2,:), maxlag);
xcorr_18_output_4_1 = xcorr(E_18_test(:,4), u_test(1,:), maxlag);
xcorr_18_output_4_2 = xcorr(E_18_test(:,4), u_test(2,:), maxlag);

%% Plot
% close all;
% figure(1);
% plot(xcorr_18_output_3_1);
% hold on;
% axis tight;
% plot(xcorr_18_output_3_2, 'r');
% 
% figure(2);
% plot(xcorr_6_output_1_1);
% hold on;
% axis tight;
% plot(xcorr_6_output_1_2, 'r');
% 
% figure(3);
% plot(autocorr_6_output_1);
% hold on;
% axis tight;
%% VAF
v_6_test = vaf(y_test, yest_6_test);
v_18_test = vaf(y_test, yest_18_test);