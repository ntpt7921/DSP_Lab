# Convention

Written in this report is the answer for the quiz question.

Continuity is implied between different command, unless stated otherwise.

That means that the variable list of the current command is affected by previous commands.

# Requirement

## Question 1

Calculate the convolution of the two signal, we can use the function `conv`.

We first define all of our signal

```{.scilab .numberLines}
x_a = [ -6, 9, 9, -5, 6, 10, -10 ]
h_a = [ 0, -9, -9, -3, 4, -7, -5 ]

function ret = step_signal(n)
    if n >= 0 then
        ret = 1
    else
        ret = 0
    end
endfunction

range_b = -10:10

x_b = []
h_b = []
for i = effective_range
    x_b = [ x_b, -3 * (step_signal(i + 1) - step_signal(i - 3)) ]
    h_b = [ h_b, 4 * (step_signal(i + 4) - step_signal(i - 2)) ]
end
```
For the signal in subpart a (`h_a`), we padded the `h_a` signal to have the same size as `x_a`.
Both of these signal is symmetric and have the zero-point at the middle of the array.

For the signal in subpart b (`x_b` and `h_b`), a big enough range can be deduced from the
signal's definition ($x(n)$ should have non-zero value from -1 to 2, $h(n)$ should have
non-zero value from -4 to 1). Choosing a range of $[ -10, 10 ]$ is appropriate (and symmetric
too).

What left to be done is to choose a big enough range to display the result of the convolution.

Since all signal of the convolution have the same size and zero-point in the middle, the result
will also have the zero-point in the middle.

### Subpart a

We choose the display range such that its have the value of 0 at the zero-point of the result
signal.

```{.scilab .numberLines}
y_a = conv(x_a, h_a)
length_y_a = length(x_a) + length(h_a) - 1
range_a = int(-length_y_a/2) : int(length_y_a/2)

clf // clear figure
plot2d3(range_a, y_a)
xlabel("Convolution of x_a and h_a")
```

![Plot of the result from $x(n) \star h(n)$ for question 1a](../image/1_a.png)

### Subpart b

We choose the display range such that its have the value of 0 at the zero-point of the result
signal.

```{.scilab .numberLines}
y_b = conv(x_b, h_b)
length_y_b = 2 * length(effective_range) - 1
range_b = int(-length_y_b/2) : int(length_y_b/2)

clf // clear figure
plot2d3(range_b, y_b)
xlabel("Convolution of x_b and h_b")
end
```

![Plot of the result from $x(n) \star h(n)$ for question 1b](../image/1_b.png)

## Question 2

Given the system with output $y(n)$ and input $x(n)$ defined as

$$
y(n) = T[x(n)] = \sum_{k=-\infty}^{n+3} 5 x(k)
$$

### Subpart a

Given two other signal $x_1(n)$ and $x_2(n)$, we want to test that

$$
T[a x_1(n) + b x_2(n)] = a T[x_1(n)] + b T[x_2(n)]
$$

The right side is equivalent to

\begin{align*}
T[a x_1(n) + b x_2(n)] &= \sum_{k=-\infty}^{n+3} [5 (a x_1(n) + b x_2(n))] \\
&= a \sum_{k=-\infty}^{n+3} [5 (x_1(n))] + b \sum_{k=-\infty}^{n+3} [5 (x_2(n))] \\
&= a T[x_1(n)] + b T[x_2(n)]
\end{align*}

So the system is linear.

### Subpart b

We want to test that the time-shifted output of the system $y(n - k)$ is equal to the output
when the input is time-shifted by the same amount $T[x(n - k)]$.

We have output time-shifted defined as

\begin{align*}
y(n - k) &= delay\left(\sum_{k=-\infty}^{n+3} 5 x(k), k\right) \\
&= \sum_{i=-\infty}^{n+3} 5 x(i - k) \\
&= \sum_{i=-\infty}^{n+3-k} 5 x(i)
\end{align*}

We have output with input time-shifted defined as

\begin{align*}
T[x(n - k)] &= \sum_{i=-\infty}^{n+3-k} 5 x(i)
\end{align*}

So the system is time-invariant.
