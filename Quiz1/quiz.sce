// set the size of the plot (so that they are bigger when exported)
gcf.figure_size = [1200, 900]
gcf.anti_aliasing = "16x"
// variable to config if plotting
display_plot = %T
output_plot_to_file = %T


n_0 = 9 + 1
range = [0 : 20]


function ret = pulse_signal(n)
	ret = []
	for i = 1:length(n)
		if n(i) == n_0 then
			ret = [ret, 1]
		else
			ret = [ret, 0]
		end
	end
endfunction

function ret = step_signal(n)
	ret = []
	for i = 1:length(n)
		if n(i) >= n_0 then
			ret = [ret, 1]
		else
			ret = [ret, 0]
		end
	end
endfunction

function ret = slope_signal(n)
	ret = []
	for i = 1:length(n)
		if n(i) >= n_0 then
			ret = [ret, n(i) - n_0]
		else
			ret = [ret, 0]
		end
	end
endfunction

function ret = exp_signal(n)
	ret = (n_0 ./ 5) .^ n
endfunction

// plot the pulse
if (display_plot) then
    clf // clear figure

    plot2d3(range, pulse_signal(range))
    xlabel("pulse_signal(n - n_0)")

    if (output_plot_to_file)
        xs2png(gcf(),'image/pulse.png')
    end
end

// plot the step
if (display_plot) then
    clf // clear figure

    plot2d3(range, step_signal(range))
    xlabel("step_signal(n - n_0)")

    if (output_plot_to_file)
        xs2png(gcf(),'image/step.png')
    end
end

// plot the slope
if (display_plot) then
    clf // clear figure

    plot2d3(range, slope_signal(range))
    xlabel("slope_signal(n - n_0)")

    if (output_plot_to_file)
        xs2png(gcf(),'image/slope.png')
    end
end

// plot the exponetial signal
if (display_plot) then
    clf // clear figure

    plot2d3(range, exp_signal(range))
    xlabel("exp_signal(n)")

    if (output_plot_to_file)
        xs2png(gcf(),'image/exp.png')
    end
end
