// Exercise for LAB 1 - DSP
// All of this is answer for the numbered exercise
// continuity is implied, unless stated otherwise
// meaning that the variable list of the current command is affected by previous command

// set the size of the plot (so that they are bigger when exported)
gcf.figure_size = [1200, 900]
gcf.anti_aliasing = "16x"

// _____         _____    _
//| ____|__  __ |___ /   / |
//|  _|  \ \/ /   |_ \   | |
//| |___  >  <   ___) |_ | |
//|_____|/_/\_\ |____/(_)|_|
disp("EX 3.1")
disp("_________________________________________")
//___________________________________________
A = [11, 2, 3, 4, 5;
     2, 3, 4, 5, 30,
     1, 20, 15, 19, 99]

sizeOfA = size(A)
disp("Size of A is: ")
disp(sizeOfA)
//___________________________________________
disp("First row of A: ")
disp(A(1,:))
//___________________________________________
disp("Last 2 rows of A: ")
disp(A($-1:$, :))
//___________________________________________
disp("Sum of elements on each row of A: ")
disp(sum(A, 2))
//___________________________________________
disp("Sum of elements on each column of A: ")
disp(sum(A, 1))


// _____         _____    ____
//| ____|__  __ |___ /   |___ \
//|  _|  \ \/ /   |_ \     __) |
//| |___  >  <   ___) |_  / __/
//|_____|/_/\_\ |____/(_)|_____|
disp("EX 3.2")
disp("_________________________________________")
//___________________________________________
A = [2, 7, 9, 7;
     3, 1, 5, 6;
     8, 1, 2, 5]

disp("A''")
disp(A')
disp("This command show the transposed of A")
//___________________________________________
disp("A(:, [1, 4])")
disp(A(:, [1, 4]))
disp("This command show extracted part, which is column 1 and 4 of A")
//___________________________________________
disp("A([2, 3], [3, 1])")
disp(A([2, 3], [3, 1]))
disp("This command show extracted part, which is column 3 and 1 of A (in that order), with only the element on row 2 and 3.")
//___________________________________________
disp("A(:)")
disp(A(:))
disp("This command show the elements of A in arranged in a single column")
//___________________________________________
disp("A(1:3, :)")
disp(A(1:3, :))
disp("This command show row 1 to row 3 of A, with every element in each row")
//___________________________________________
disp("A(1:3, :)")
disp(A(1:3, :))
disp("This command show row 1 to row 3 of A, with every element in each row")
//___________________________________________
disp("[A; A(1:2, :)]")
disp([A; A(1:2, :)])
disp("This command show matrix A, concatenated below with row 1 and row 2 of A again")
//___________________________________________
disp("A($, :)")
disp(A($, :))
disp("This command show the last row of A")
//___________________________________________
disp("A(1:2:$, :)")
disp(A(1:2:$, :))
disp("This command show every odd-numbered row of A (row 1, 3, ...)")
//___________________________________________
disp("sum(A)")
disp(sum(A))
disp("This command show the sum of every elements in A")
//___________________________________________
disp("sum(A'', 1)")
disp(sum(A', 1))
disp("This command show the sum within every column of the transpose of A")


// _____         _____    _____
//| ____|__  __ |___ /   |___ /
//|  _|  \ \/ /   |_ \     |_ \
//| |___  >  <   ___) |_  ___) |
//|_____|/_/\_\ |____/(_)|____/
disp("EX 3.3")
disp("_________________________________________")
//___________________________________________
x = [3, 1, 5, 7, 9, 2, 6]

disp("x(3)")
disp(x(3))
disp("The command show the third element in the x array")
//___________________________________________
disp("x(1:7)")
disp(x(1:7))
disp("The command show the 1st to 7rd element in the x array")
//___________________________________________
disp("x(6:-2:1)")
disp(x(6:-2:1))
disp("The command show the 6rd to the 1st element in the x array, in decreasing order (6, 4, 2)")
//___________________________________________
disp("x([1, 6, 2, 1, 1])")
disp(x([1, 6, 2, 1, 1]))
disp("The command show the 1st, the 6rd, the 2rd, the 1st again, the 1st again as a array")
//___________________________________________
disp("sum(x)")
disp(sum(x))
disp("The command show the sum of all elements inside x")


// _____         _____   _  _
//| ____|__  __ |___ /  | || |
//|  _|  \ \/ /   |_ \  | || |_
//| |___  >  <   ___) |_|__   _|
//|_____|/_/\_\ |____/(_)  |_|
disp("EX 3.4")
disp("_________________________________________")
//___________________________________________
function ret = y1(x)
    ret = sin(x) .* cos(2*x)
endfunction
function ret = y2(x)
    ret = sin(x.^2)
endfunction

disp("Easily see that the period of y1 must be 2pi or less")
disp("y2 do not have a period")
disp("Take the plotting range from -2*pi to 2*pi")
plot_range = -2*%pi:0.01:2*%pi
subplot(2, 1, 1)
plot(plot_range, y1(plot_range), "-r")
legend(['y1'])
subplot(2, 1, 2)
plot(plot_range, y2(plot_range), "-b")
legend(['y2'])
xs2png(0, 'image/3_4.png')

// _____         _____    ____
//| ____|__  __ |___ /   | ___|
//|  _|  \ \/ /   |_ \   |___ \
//| |___  >  <   ___) |_  ___) |
//|_____|/_/\_\ |____/(_)|____/
disp("EX 3.5")
disp("_________________________________________")
//___________________________________________
disp("The linear system of eq is represented as Ax = B")
A = [2, 4, 5, -2;
     1, 2, 1,  2;
     0, 2, 4,  2;
     3, -1, 0, 10]
B = [0;
     1;
     2;
     10]
disp(A, B)
disp("The solution of this system is x = inv(A) * B")
disp(inv(A) * B)


// _____         _____    __
//| ____|__  __ |___ /   / /_
//|  _|  \ \/ /   |_ \  | '_ \
//| |___  >  <   ___) |_| (_) |
//|_____|/_/\_\ |____/(_)\___/
disp("EX 3.6")
disp("_________________________________________")
//___________________________________________
function ret = xa(t)
    ret = 3 * cos(100 * %pi * t)
endfunction

//___________________________________________
disp("a.")
disp("Smallest sampling frequency is larger than two time the maximum frequency component of the signal")
disp("Signal xa(t) have freq of 50Hz")
disp("So the smallest sampling freq is 100Hz")
//___________________________________________
disp("b.")
disp("If the sampling freq is 200Hz")
disp("The sampled signal sampled_xa(n) = 3 * cos(1/2*%pi*n)")
function ret = sampled_xa(n)
    ret = 3 * cos(1/2 * %pi * n)
endfunction

disp("Plot from time t0 = 0 to time t1 = 3/25s")

clf('reset')
subplot(2, 1, 1)
plot(linspace(0, 3/25, 1000), xa, "-r")
legend(['xa'])
subplot(2, 1, 2)
plot(linspace(0, 3/25, floor(3/25 * 200) + 1), xa, "-bo")
legend(['sampled_xa'])
xs2png(0, "image/3_6_b.png")
//___________________________________________
disp("c.")
disp("If the sampling freq is 75Hz")
disp("The sampled signal sampled_xa(n) = 3 * cos(4/3*%pi*n)")
function ret = sampled_xa(n)
    ret = 3 * cos(4/3 * %pi * n)
endfunction

disp("Plot from time t0 = 0 to time t1 = 3/25s")

clf('reset')
subplot(2, 1, 1)
plot(linspace(0, 3/25, 1000), xa, "-r")
subplot(2, 1, 2)
plot(linspace(0, 3/25, floor(3/25 * 75) + 1), xa, "-bo")
xs2png(0, "image/3_6_c.png")
//___________________________________________
disp("d.")
disp("If the sampling freq is 75Hz")
disp("The sampled signal sampled_xa(n) = 3 * cos(4/3*%pi*n)")
disp("The sampled signal that have the same value at every point of n is:")
disp("sampled_alias_xa(n) = 3 * cos((2 - 2/3)*%pi*n) = 3 * cos(-2/3*%pi*n + 2*%pi*n) = 3 * cos(2/3*%pi*n)")
disp("We can calculate the equivalent original signal alias_xa = 3 * cos((2/3 * 75)*%pi*n)")
disp("The alias signal have the freq of 25Hz")


 //_____         _____   _____
//| ____|__  __ |___ /  |___  |
//|  _|  \ \/ /   |_ \     / /
//| |___  >  <   ___) |_  / /
//|_____|/_/\_\ |____/(_)/_/
disp("EX 3.7")
disp("_________________________________________")
//___________________________________________
function ret = xa(t)
    ret = 3 * cos(200 * %pi * t) + 5 * sin(6000 * %pi * t)  + 10 * cos(12000 * %pi * t)
endfunction

//___________________________________________
disp("a.")
disp("The maximum freq component within xa is 6kHz")
disp("So the Nyquist freq is 12kHz")
//___________________________________________
disp("b.")
disp("If the sampling freq is 5kHz")
disp("sampled_xa(n) = 3 * cos(1/25 * %pi * t) + 5 * sin(6/5 * %pi * t)  + 10 * cos(12/5 * %pi * t)")
function ret = sampled_xa(n)
    sampled_xa(n) = 3 * cos(1/25 * %pi * t) + 5 * sin(6/5 * %pi * t)  + 10 * cos(12/5 * %pi * t)
endfunction

disp("Plot from time t0 = 0 to time t1 = 3/100s")

clf('reset')
subplot(2, 1, 1)
plot(linspace(0, 3/100, 10000), xa, "-r")
legend(['xa'])
subplot(2, 1, 2)
plot(linspace(0, 3/100 ,floor(3/100 * 5000) + 1), xa, "-bo")
legend(['sampled_xa'])
xs2png(0, "image/3_7.png")
