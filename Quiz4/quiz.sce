// set the size of the plot (so that they are bigger when exported)
gcf.figure_size = [1200, 900]
gcf.anti_aliasing = "16x"
// variable to config if plotting
display_plot = %F
output_plot_to_file = %F




function ret = step_signal(n)
    if n >= 0 then
        ret = 1
    else
        ret = 0
    end
endfunction


if (display_plot) then
    clf // clear figure

    plot2d3(range_b, y_b)
    xlabel("Convolution of x_b and h_b")

    if (output_plot_to_file)
        xs2png(gcf(),'image/1_b.png')
    end
end

