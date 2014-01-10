%% SC4040 - Filtering & Identification
close all;
% dataset = data1;
s = 200;
maxlag = 1000;
n = [6 18];

y = dataset(2:5,:);
u = dataset(6:7,:);
[sn,rnew] = dordpo(u, y, s);
% semilogy(sn, 'o');
% %%
% [A_6,C_6,K_6] = dmodpo(rnew, n(1));
% [B_6,D_6] = dac2bd(A_6,C_6,u',y');

[A_18,C_18,K_18] = dmodpo(rnew, n(2));
[B_18,D_18] = dac2bd(A_18,C_18,u',y');
x0_18 = dinit(A_18, B_18, C_18, D_18, u, y);
[A_18_p, B_18_p, C_18_p, D_18_p]=doptlti(u', y', A_18, B_18, C_18, D_18, x0_18, K_18, 'on');

%% One-Step Ahead Error

% U_6 = [u;y];
% A_6_K = (A_6 - K_6*C_6);
% B_6_K = [(B_6 - K_6*D_6) K_6];
% D_6_K = [D_6 -eye(4)];
% E_6 = dltisim(A_6_K, B_6_K, C_6, D_6_K, U_6');

U_18 = [u;y];
A_18_K = (A_18_p - K_18*C_18_p);
B_18_K = [(B_18_p - K_18*D_18) K_18];
D_18_K = [D_18 zeros(4,4)];
E_18 = dltisim(A_18_K, B_18_K, C_18, D_18_K, U_18');

%%
% autocorr_6_output_1 = autocorr(E_6(:,1));
% autocorr_6_output_2 = autocorr(E_6(:,2));
% autocorr_6_output_3 = autocorr(E_6(:,3));
% autocorr_6_output_4 = autocorr(E_6(:,4));

autocorr_18_output_1 = autocorr(E_18(:,1));
autocorr_18_output_2 = autocorr(E_18(:,2));
autocorr_18_output_3 = autocorr(E_18(:,3));
autocorr_18_output_4 = autocorr(E_18(:,4));

%%
% xcorr_6_output_1_1 = xcorr(E_6(:,1), u(1,:), maxlag);
% xcorr_6_output_1_2 = xcorr(E_6(:,1), u(2,:), maxlag);
% xcorr_6_output_2_1 = xcorr(E_6(:,2), u(1,:), maxlag);
% xcorr_6_output_2_2 = xcorr(E_6(:,2), u(2,:), maxlag);
% xcorr_6_output_3_1 = xcorr(E_6(:,3), u(1,:), maxlag);
% xcorr_6_output_3_2 = xcorr(E_6(:,3), u(2,:), maxlag);
% xcorr_6_output_4_1 = xcorr(E_6(:,4), u(1,:), maxlag);
% xcorr_6_output_4_2 = xcorr(E_6(:,4), u(2,:), maxlag);

xcorr_18_output_1_1 = xcorr(E_18(:,1), u(1,:), maxlag);
xcorr_18_output_1_2 = xcorr(E_18(:,1), u(2,:), maxlag);
xcorr_18_output_2_1 = xcorr(E_18(:,2), u(1,:), maxlag);
xcorr_18_output_2_2 = xcorr(E_18(:,2), u(2,:), maxlag);
xcorr_18_output_3_1 = xcorr(E_18(:,3), u(1,:), maxlag);
xcorr_18_output_3_2 = xcorr(E_18(:,3), u(2,:), maxlag);
xcorr_18_output_4_1 = xcorr(E_18(:,4), u(1,:), maxlag);
xcorr_18_output_4_2 = xcorr(E_18(:,4), u(2,:), maxlag);

%%
close all;
figure(1);
plot(xcorr_18_output_1_1);
hold on;
plot(xcorr_18_output_1_2, 'r');

figure(2);
plot(xcorr_6_output_1_1);
hold on;
plot(xcorr_6_output_1_2, 'r');