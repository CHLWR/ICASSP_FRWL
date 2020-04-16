function input = twomoon_gen(num1, num2, sigma_noise, horizonal, vertical)
% 双月型数据
if nargin == 1
    num2 = num1;
end;
if nargin <= 2
    sigma_noise = 0.1; % 噪声
end;
if nargin <= 3
    level = 0.35;
    upright = 0.15;
else
    level = 0.25+horizonal; % 水平偏移
    upright = 0.15+vertical; % 竖直偏移
end;
alpha=0.8;
t=pi:-pi/(num1-1):0; % 上半圆
input(1:num1, 1) = alpha*cos(t)'+randn(num1,1)*sigma_noise - level; % x坐标
input(1:num1, 2) = alpha*sin(t)'+randn(num1,1)*sigma_noise - upright; % y坐标

t=pi:pi/(num2-1):2*pi; % 下半圆
input(num1+1:num1+num2, 1) = alpha*cos(t)'+randn(num2,1)*sigma_noise + level;
input(num1+1:num1+num2, 2) = alpha*sin(t)'+randn(num2,1)*sigma_noise + upright;

 

