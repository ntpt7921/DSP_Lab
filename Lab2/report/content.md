# Convention

Written in this report is the answer for the numbered exercise.

Continuity is implied between different command, unless stated otherwise.

That means that the variable list of the current command is affected by previous commands.

# Section 3

## Exercise 3.1 {#ex3_1}

### Subpart a

The signal $x(n) = 2 \cdot \cos(2 \pi n)$ is not periodic

### Subpart b

The signal $x(n) = 20 \cdot \cos(\pi n) = 20 \cdot \cos(2 \pi f n)$ is periodic.

The fundamental period $N_0$ is calculated such that

$$
N_0 = |min(n)|\ \text{such that}\ f \cdot n \in \mathbb{Z}
$$

with $f = \frac{1}{2}$ we have

$$
N_0 = 2
$$

## Exercise 3.2

Given the signal

$$
x(n) = \{1, 2, 4, 5^{\ast}, 2\}
$$

We represent it as a sum of impulse signal

$$
x(n) = \delta(x + 3) + 2\delta(x + 2) + 4\delta(x + 1) + 5\delta(x) + 2\delta(x - 1)
$$

## Exercise 3.3

Given the signal

$$
x(n) = \{ 1, -2, 3^{\ast}, 6 \}
$$

### Subpart a

$$
x(-n) = \{ 6, 3^{\ast}, -2, 1 \}
$$

### Subpart b

$$
x(-n + 1) = \{ 6, 3, -2^{\ast}, 1 \}
$$

### Subpart c

$$
2 . x(-n + 1) = \{ 12, 6, -4^{\ast}, 2 \}
$$

### Subpart d

$$
x(-n) + x(-n + 1) = \{ 6, 9, 1^{\ast}, -1, 1 \}
$$

## Exercise 3.4

Given the signal

$$
x(n) = \{ 1, 3^{\ast}, -2 \}
$$

The odd component is

$$
x_o(n) = \frac{1}{2}\left(x(n) - x(-n)\right) = \left\{ \frac{3}{2}, 0^{\ast}, -\frac{3}{2} \right\}
$$

## Exercise 3.5

Given the signal

$$
x(n) = \{ 1, 1, 0^{\ast}, -1, -1 \}
$$

### Subpart a

$$
x(2n) = \{ 1, 0^{\ast}, -1 \}
$$

### Subpart b

Since the time-discrete signal is only defined at $n \in \mathbb{Z}$, and $\frac{n}{2} \notin \mathbb{Z}$.
We conclude that the signal $x(n/2)$ is undefined.

### Subpart c

$$
x(2n - 1) = \{ 1, 0, -1^{\ast} \}
$$

### Subpart d

$$
x(n) \cdot x(n) = \{ 1, 1, 0^{\ast}, 1, 1 \}
$$

## Exercise 3.6

### Subpart a

Given the signal

$$
x(n) = -1\delta(n) + 2\delta(n-1) - 2\delta(n-2)
$$

The signal energy is

$$
\varepsilon = \sum_{n = 0}^{2} \left| x(n) \right| = |(-1)^2| + |2^2| + |(-2)^2| = 9
$$

### Subpart b

Given the signal

$$
x(n) = \{ 1, 0^{\ast}, -1 \}
$$

The signal energy is

$$
\varepsilon = \sum_{n = -1}^{1} \left| x(n) \right| = |(-1)^2| + |0^2| + |1^2| = 2
$$

## Exercise 3.7

Given the signal

$$
x(n) = 2 \cdot (-1)^n ,  n \geq 0
$$

The signal is periodic $x(n) = \{ 2^{\ast}, -2, 2, -2, \dotsc \}$ with the period of $N_0 = 2$
so the signal energy is

$$
\varepsilon = \infty
$$

And we can have the power of the whole signal by just calculating the power of one period, we have

$$
\overline{P_{av}} = \frac{1}{2} \sum_{n=0}^{1}\left| x(n) \right| = 4
$$

# Section 4

## Exercise 4.1

We define required functions

```{.scilab }
function ret = x_exp(n)
    ret = 3 * (0.5)^n;
endfunction

function ret = x_sin(n)
    ret = 3 * cos(3 * %pi * n + 5);
endfunction
```

## Exercise 4.2

```{.scilab }
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
```

## Exercise 4.3

Given signals

$$
x_a(n) = (0.5)^n \cdot \cos(2 \pi n + \pi) \\
$$

$$
x_b(n) = 5 \cdot \cos(2 \pi n + \pi) + 3
$$

Only $x_b(n)$ is periodic. $|x_a(n)|$ is continually decreasing so it can not be periodic.

With method to calculate fundamental period $N_0$ stated in [Exercise 3.1](#ex3_1), we have

$$
N_{0b} = 1
$$

To represent both signal in Scilab

```{.scilab }
function ret = x_a(n)
    ret = 0.5.^n .* cos(2 * %pi .* n + %pi)
endfunction

function ret = x_b(n)
    ret = 5 .* cos(2 * %pi .* n + %pi) + 3
endfunction
```

And then we plot the both signal from $n = -5 \to 10$

```{.scilab }
// select the range of n for both signal
n = -5:10
clf // clear figure

// plot for x_a(n)
subplot(2, 1, 1)
plot2d3(n, x_a(n))
xlabel("x_a(n)")

// plot for x_b(n)
subplot(2, 1, 2)
plot2d3(n, x_b(n))
xlabel("x_b(n)")
```

![Plot of $x_a(n)$ and $x_b(n)$ from Exercise 4.3](../image/4_3.png)

## Exercise 4.4{#ex4_4}

Given signals

$$
x_1(n) = \{ 0^{\ast}, 1, 2, 3 \}
$$

$$
x_2(n) = \{ 0, 1^{\ast}, 2, 3 \}
$$

We can calculate

$$
x_1(n) + x_2(n) = \{ 0, 1^{\ast}, 3, 5, 3 \}
$$

$$
x_1(n) \cdot x_2(n) = \{ 0, 0^{\ast}, 2, 6, 0 \}
$$

And with Scilab

```{.scilab }
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
```

## Exercise 4.5

We write function to calculate impulse signal value, step signal value, and folding a provided signal.

```{.scilab }
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
```

## Exercise 4.6

Given signal

$$
x_a(n) = u(n) - 3\delta(n-1) \qquad -3 \leq n \leq 3
$$

$$
x_b(n) = 3u(n-3) + \delta(n-2) + u(-n) \qquad -3 \leq n \leq 3
$$

We will do subpart a and b at the same time.

```{.scilab }
x_a = []
x_b = []
for i = -4:4
    x_a = [x_a, StepSignal(i) - 3*ImpulseSignal(i-i)]
    x_b = [x_b, 3*StepSignal(i-3) + ImpulseSignal(i-2) + StepSignal(-i)]
end

// plot signal x_a(n) and x_b(n)
clf // clear figure

// plot for x_a(n)
subplot(2, 1, 1)
plot2d3(-4:4, x_a)
xlabel("x_a(n)")

// plot for x_b(n)
subplot(2, 1, 2)
plot2d3(-4:4, x_b)
xlabel("x_b(n)")
```

![Plot of $x_a(n)$ and $x_b(n)$ from Exercise 4.6](../image/4_6.png)

## Exercise 4.7

We already define most of the required functionality in [Exercise 4.4](#ex4_4)


```{.scilab }
function ret = x1plusx2(x1, x1_0, x2, x2_0)
    ret = binary_op_signal(x1, x1_0, x2, x2_0, add)
endfunction

function ret = x1timesx2(x1, x1_0, x2, x2_0)
    ret = binary_op_signal(x1, x1_0, x2, x2_0, multiply)
endfunction
```

## Exercise 4.8

We define a new binary operation between element - subtraction.

Then after that all the work can be done by already written function.

```{.scilab }
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
```

## Exercise 4.9

We define a function for the new signal and calculate values for the signal

```{.scilab}
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
```

Then the signal can be plotted

```{.scilab}
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
```
![Plot of $x_a(n)$ and $x_b(n)$ from Exercise 4.9](../image/4_9.png)
