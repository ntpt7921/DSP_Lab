# Convention

Written in this report is the answer for the quiz question.

Continuity is implied between different command, unless stated otherwise.

That means that the variable list of the current command is affected by previous commands.

# Requirement

## Pulse signal $\delta(n - n_0)$

We define the function for the pulse signal

```{.scilab .numberLines}
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
```

The function can then be plotted 

![The plot of the required pulse signal over the range $[0, 20]$](../image/pulse.png)

## Step signal $u(n - n_0)$

We define the function for the pulse signal

```{.scilab .numberLines}
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
```

The function can then be plotted 

![The plot of the required step signal over the range $[0, 20]$](../image/step.png)

## Slope signal $r(n - n_0)$

We define the function for the pulse signal

```{.scilab .numberLines}
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
```

The function can then be plotted 

![The plot of the required slope signal over the range $[0, 20]$](../image/slope.png)

## Exponential signal $x(n)$

We define the function for the pulse signal

```{.scilab .numberLines}
function ret = exp_signal(n)
	ret = (n_0 ./ 5) .^ n
endfunction
```

The function can then be plotted 

![The plot of the required exponential signal over the range $[0, 20]$](../image/exp.png)




