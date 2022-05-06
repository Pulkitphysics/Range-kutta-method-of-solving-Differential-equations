clc 
clear 
clf
function yd = f(x,y)
    yd = x+y
endfunction
h= 0.2
x = [0:h:1]
y= zeros(1,size(x,2))
y(1)= 0
disp("x",x)
tic()
for n = 2:size(x,2)
    err=0
    k1 = h*f(x(n-1),y(n-1))
    k2 = h*f(x(n-1)+h/2, y(n-1)+k1/2)
    k3 = h*f(x(n-1) + h/2,y(n-1) + k2/2)
    k4 = h*f(x(n-1)+h,y(n-1)+k3)
    k = (k1+2*k2+2*k3+k4)/6
    y(n) = y(n-1) + k
    err = (y(n)-(%e^x(n) -1 -x(n)))^2
end
time = toc()
disp("rk4 y points",y,"error rk4",err, "time taken rk4", time)
plot2d(x,y,2)
tic()
for n = 2:size(x,2)
    err = 0
    k1 = h*f(x(n-1),y(n-1))
    k2 = h*f(x(n-1)+h/2, y(n-1)+k1/2)
    k4 = h*f(x(n-1)+h,y(n-1)+k3)
    k = (k1+4*k2+k4)/6
    y(n) = y(n-1) + k
    err = (y(n)-(%e^x(n) -1 -x(n)))^2
end
time = toc()
disp("rk3 y points",y,"error rk3",err,"time taken rk3", time)
plot2d(x,y,3)
x= [0:0.01:1]
yt = %e^x -1 -x
plot2d(x,yt,4)
legend(["y approx rk4","y approx rk3", "y true"])
xlabel("x")
ylabel("y")
