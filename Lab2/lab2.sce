// Exercise for LAB 2 - DSP
// All of this is answer for the numbered exercise
// continuity is implied, unless stated otherwise
// meaning that the variable list of the current command is affected by previous command

// set the size of the plot (so that they are bigger when exported)
gcf.figure_size = [1200, 900]
gcf.anti_aliasing = "16x"
// variable to config if plotting
display_plot = %T
output_plot_to_file = %T

 //____               _    _                 _  _
/// ___|   ___   ___ | |_ (_)  ___   _ __   | || |
//\___ \  / _ \ / __|| __|| | / _ \ | '_ \  | || |_
 //___) ||  __/| (__ | |_ | || (_) || | | | |__   _|
//|____/  \___| \___| \__||_| \___/ |_| |_|    |_|

///////////////////////////////////////////////////////////////////////

 //_____         _  _      _
//| ____|__  __ | || |    / |
//|  _|  \ \/ / | || |_   | |
//| |___  >  <  |__   _|_ | |
//|_____|/_/\_\    |_| (_)|_|


function ret = x_exp(n)
    ret = 3 * (0.5)^n;
endfunction

function ret = x_sin(n)
    ret = 3 * cos(3 * %pi * n + 5);
endfunction


 //_____         _  _      ____
//| ____|__  __ | || |    |___ \
//|  _|  \ \/ / | || |_     __) |
//| |___  >  <  |__   _|_  / __/
//|_____|/_/\_\    |_| (_)|_____|

// define the signal to be worked with
n = 0:9
x = [ 0, 0, 0.5, 0, 1, 0.5, 0, 1, 0.5, 0 ]

function ret = calculate_energy(x)
    l = length(x)
    e = 0
    for i = 1:l
        e = e + abs(x(i))^2
    end
    ret = e
endfunction

function ret = calculate_power(x)
    l = length(x)
    ret = calculate_energy(x) / l;
endfunction

calculate_energy(x)
calculate_power(x)

 //_____         _  _      _____
//| ____|__  __ | || |    |___ /
//|  _|  \ \/ / | || |_     |_ \
//| |___  >  <  |__   _|_  ___) |
//|_____|/_/\_\    |_| (_)|____/


// select the range of n for both signal
n = -5:10

function ret = x_a(n)
    ret = 0.5.^n .* cos(2 * %pi .* n + %pi)
endfunction

function ret = x_b(n)
    ret = 5 .* cos(2 * %pi .* n + %pi) + 3
endfunction

if (display_plot) then
    clf // clear figure

    // plot for x_a(n)
    subplot(2, 1, 1)
    plot2d3(n, x_a(n))
    xlabel("x_a(n)")

    // plot for x_b(n)
    subplot(2, 1, 2)
    plot2d3(n, x_b(n))
    xlabel("x_b(n)")

    if (output_plot_to_file)
        xs2png(gcf(),'image/4_3.png')
    end
end



 //_____         _  _     _  _
//| ____|__  __ | || |   | || |
//|  _|  \ \/ / | || |_  | || |_
//| |___  >  <  |__   _|_|__   _|
//|_____|/_/\_\    |_| (_)  |_|

// define signal
//*_zero store the position for the element corresponding to value of signal at n = 0
x_1 = [ 0, 1, 2, 3 ]
x_1_zero = 1
x_2 = [ 0, 1, 2, 3 ]
x_2_zero = 2

function ret = add(a, b)
    ret = a + b
endfunction

function ret = multiply(a, b)
    ret = a * b
endfunction

// the function we get two signal and their zero position
// also the operation that need to be done
// it will output a list with (1) = result signal; (2) = zero position of the output signal
function ret = binary_op_signal(s1, s1_zero, s2, s2_zero, op)
    elem_count_before_0_s1 = s1_zero - 1
    elem_count_before_0_s2 = s2_zero - 1
    elem_count_after_0_s1 = length(s1) - s1_zero
    elem_count_after_0_s2 = length(s2) - s2_zero

    start_from = -max([elem_count_before_0_s1, elem_count_before_0_s2])
    end_at = max([elem_count_after_0_s1, elem_count_after_0_s2])
    result = []

    for i = start_from:end_at
        if s1_zero + i < 1 || s1_zero + i > length(s1) then
            current_s1_elem = 0
        else
            current_s1_elem = s1(s1_zero + i)
        end

        if s2_zero + i < 1 || s2_zero + i > length(s2) then
            current_s2_elem = 0
        else
            current_s2_elem = s2(s2_zero + i)
        end

        result = [result, op(current_s1_elem, current_s2_elem)]
    end

    ret = list(result, -start_from + 1)
endfunction

// x_1 + x_2
binary_op_signal(x_1, x_1_zero, x_2, x_2_zero, add)
// x_1 * x_2
binary_op_signal(x_1, x_1_zero, x_2, x_2_zero, multiply)

 //_____         _  _      ____
//| ____|__  __ | || |    | ___|
//|  _|  \ \/ / | || |_   |___ \
//| |___  >  <  |__   _|_  ___) |
//|_____|/_/\_\    |_| (_)|____/


function ret = ImpulseSignal(n)
    if (n == 0)
        ret = 1
    else
        ret = 0
    end
endfunction

function ret = StepSignal(n)
    if (n >= 0) then
        ret = 1
    else
        ret = 0
    end
endfunction

// fold the input signal s, provided we have the zero position
// it will output a list with (1) = folded signal; (2) = zero position of the folded signal
function ret = FoldSignal(s, s_zero)
    result = []
    for i = length(s):-1:1
        result = [result, s(i)]
    end

    ret = list(result, length(s) - s_zero + 1)
endfunction


 //_____         _  _      __
//| ____|__  __ | || |    / /_
//|  _|  \ \/ / | || |_  | '_ \
//| |___  >  <  |__   _|_| (_) |
//|_____|/_/\_\    |_| (_)\___/

x_a = []
x_b = []
for i = -4:4
    x_a = [x_a, StepSignal(i) - 3*ImpulseSignal(i-i)]
    x_b = [x_b, 3*StepSignal(i-3) + ImpulseSignal(i-2) + StepSignal(-i)]
end

// plot x_a and x_b
if (display_plot) then
    clf // clear figure

    // plot for x_a(n)
    subplot(2, 1, 1)
    plot2d3(-4:4, x_a)
    xlabel("x_a(n)")

    // plot for x_b(n)
    subplot(2, 1, 2)
    plot2d3(-4:4, x_b)
    xlabel("x_b(n)")

    if (output_plot_to_file)
        xs2png(gcf(),'image/4_6.png')
    end
end


 //_____         _  _     _____
//| ____|__  __ | || |   |___  |
//|  _|  \ \/ / | || |_     / /
//| |___  >  <  |__   _|_  / /
//|_____|/_/\_\    |_| (_)/_/

function ret = x1plusx2(x1, x1_0, x2, x2_0)
    ret = binary_op_signal(x1, x1_0, x2, x2_0, add)
endfunction

function ret = x1timesx2(x1, x1_0, x2, x2_0)
    ret = binary_op_signal(x1, x1_0, x2, x2_0, multiply)
endfunction


 //_____         _  _      ___
//| ____|__  __ | || |    ( _ )
//|  _|  \ \/ / | || |_   / _ \
//| |___  >  <  |__   _|_| (_) |
//|_____|/_/\_\    |_| (_)\___/

function ret = substract(a, b)
    ret = a - b
endfunction

function ret = even_signal_part(s, s_zero)
    [fold_s, fold_s_zero] = FoldSignal(s, s_zero)(:)

    [temp_s, temp_s_0] =  binary_op_signal(s, s_zero, fold_s, fold_s_zero, add)(:)

    ret = list((1/2) * temp_s, temp_s_0)
endfunction

function ret = odd_signal_part(s, s_zero)
    [fold_s, fold_s_zero] = FoldSignal(s, s_zero)(:)

    [temp_s, temp_s_0] =  binary_op_signal(s, s_zero, fold_s, fold_s_zero, substract)(:)

    ret = list((1/2) * temp_s, temp_s_0)
endfunction


 //_____         _  _     ___
//| ____|__  __ | || |   / _ \
//|  _|  \ \/ / | || |_ | (_) |
//| |___  >  <  |__   _|_\__, |
//|_____|/_/\_\    |_| (_) /_/

function ret = x(n)
    ret = StepSignal(n-1) + ImpulseSignal(n-1)
endfunction

x_a = []
x_b = []
x_c = []

for i = -3:3
    x_a = [x_a, x(-i)]
    x_b = [x_b, x(i - 2)]
    x_c = [x_c, x(i) + x(-i)]
end

// plot x_a and x_b and x_c
if (display_plot) then
    clf // clear figure

    // plot for x_a(n)
    subplot(3, 1, 1)
    plot2d3(-3:3, x_a)
    xlabel("x_a(n)")

    // plot for x_b(n)
    subplot(3, 1, 2)
    plot2d3(-3:3, x_b)
    xlabel("x_b(n)")

    // plot for x_c(n)
    subplot(3, 1, 3)
    plot2d3(-3:3, x_c)
    xlabel("x_c(n)")

    if (output_plot_to_file)
        xs2png(gcf(),'image/4_9.png')
    end
end
