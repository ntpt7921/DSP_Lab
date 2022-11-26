// set the size of the plot (so that they are bigger when exported)
gcf.figure_size = [1200, 900]
gcf.anti_aliasing = "16x"
// variable to config if plotting
display_plot = %T
output_plot_to_file = %T



x_a = [ -6, 9, 9, -5, 6, 10, -10 ]
h_a = [ 0, -9, -9, -3, 4, -7, -5 ]

function ret = step_signal(n)
    if n >= 0 then
        ret = 1
    else
        ret = 0
    end
endfunction

x_b = []
h_b = []
for i = -10:10
    x_b = [ x_b, -3 * (step_signal(i + 1) - step_signal(i - 3)) ]
    h_b = [ h_b, 4 * (step_signal(i + 4) - step_signal(i - 2)) ]
end

y_a = conv(x_a, h_a)
length_y_a = length(x_a) + length(h_a) - 1
range_a = int(-length_y_a/2) : int(length_y_a/2)

y_b = conv(x_b, h_b)
length_y_b = 2 * length(effective_range) - 1
range_b = int(-length_y_b/2) : int(length_y_b/2)

if (display_plot) then
    clf // clear figure

    plot2d3(range_a, y_a)
    xlabel("Convolution of x_a and h_a")

    if (output_plot_to_file)
        xs2png(gcf(),'image/1_a.png')
    end
end

if (display_plot) then
    clf // clear figure

    plot2d3(range_b, y_b)
    xlabel("Convolution of x_b and h_b")

    if (output_plot_to_file)
        xs2png(gcf(),'image/1_b.png')
    end
end

