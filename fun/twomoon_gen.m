function input = twomoon_gen(num1, num2, sigma_noise, horizonal, vertical)
% ˫��������
if nargin == 1
    num2 = num1;
end;
if nargin <= 2
    sigma_noise = 0.1; % ����
end;
if nargin <= 3
    level = 0.35;
    upright = 0.15;
else
    level = 0.25+horizonal; % ˮƽƫ��
    upright = 0.15+vertical; % ��ֱƫ��
end;
alpha=0.8;
t=pi:-pi/(num1-1):0; % �ϰ�Բ
input(1:num1, 1) = alpha*cos(t)'+randn(num1,1)*sigma_noise - level; % x����
input(1:num1, 2) = alpha*sin(t)'+randn(num1,1)*sigma_noise - upright; % y����

t=pi:pi/(num2-1):2*pi; % �°�Բ
input(num1+1:num1+num2, 1) = alpha*cos(t)'+randn(num2,1)*sigma_noise + level;
input(num1+1:num1+num2, 2) = alpha*sin(t)'+randn(num2,1)*sigma_noise + upright;

 

