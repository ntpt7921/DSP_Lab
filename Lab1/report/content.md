# Convention

Written in this report is the answer for the numbered exercise.

Continuity is implied between different command, unless stated otherwise.

That means that the variable list of the current command is affected by previous commands.

# Exercise 3.1

For matrix

$$
A =
\begin{bmatrix}
11 & 2 & 3 & 4 & 5 \\
2  & 3 & 4 & 5 & 30 \\
1 & 20 & 15 & 19 & 99
\end{bmatrix}
$$

- Defining A
  ```{.scilab}
  A = [11, 2 , 3 , 4 , 5;
       2 , 3 , 4 , 5 , 30;
       1 , 20, 15, 19, 99]
  ```

- To find the size of A
  ```{.scilab}
  sizeOfA = size(A)
  disp(sizeOfA)
  ```

- To get the first row of A
  ```{.scilab}
  A[1, :]
  ```

- Create B to be the last two row of A
  ```{.scilab}
  B = A[$-1:$, :]
  ```

- Sum of elements on each row of A
  ```{.scilab}
  sum(A, 2)
  ```

- Sum of elements on each column of A
  ```{.scilab}
  sum(A, 1)
  ```

# Exercise 3.2

For matrix

$$
A =
\begin{bmatrix}
2 & 7 & 9 & 7 \\
3 & 1 & 5 & 6 \\
8 & 1 & 2 & 5
\end{bmatrix}
$$

- Defining A
  ```{.scilab}
  A = [2, 7, 9, 7;
       3, 1, 5, 6;
       8, 1, 2, 5]
  ```

- `A'`{.scilab}

  This return the transpose matrix of A


- `A(:, [1, 4])`{.scilab}

  This return the extract part in A, which is column 1 and 4


- `A([2, 3], [3, 1])`{.scilab}

  This return the extracted part, which is column 3 and 1 of A (in that order), with only the element on row 2 and 3


- `A(:)`{.scilab}

  This return the elements of A arranged in a single column


- `A(1:3, :)`{.scilab}

  This return row 1 to row 3 of A, with every element in each row


- `[A; A(1:2, :)]`{.scilab}

  This return a new matrix, composed of matrix A, concatenated below with row 1 and row 2 of A again


- `A($, :)`{.scilab}

  This return the last row of A

- `A(1:2:$, :)`{.scilab}

  This return every odd-numbered row of A (row 1, 3, ...)


- `sum(A)`{.scilab}

  This return sum of elements within A


- `sum(A', 1)`{.scilab}

  This return the sum within every column of the transpose of A

# Exercise 3.3

Given vector

$$
x =
\begin{bmatrix}
3 & 1 & 5 & 7 & 9 & 2 & 6
\end{bmatrix}
$$


- `x(3)`{.scilab}

  This return the 3rd element within x


- `x(1:7)`{.scilab}

  This return the first up to the seventh element within x


- `x(6:-2:1)`{.scilab}

  This return the every even-numbered element from number 6 downward


- `x([1, 6, 2, 1, 1])`{.scilab}

  This return the the 1st, the 6rd, the 2rd, the 1st again, the 1st again as a array


- `sum(x)`{.scilab}

  This return the sum of all elements inside x


# Exercise 3.4

We define the function $y_1 = sin(x) \cdot cos(2x)$ and $y_2 = sin(x^2)$

```{.scilab}
function ret = y1(x)
    ret = sin(x) .* cos(2*x)
endfunction

function ret = y2(x)
    ret = sin(x^2)
endfunction
```

We easily see that the period of $y_1$ must be $2 \pi$ or less. And that $y_2$ do not have a period.

We choose the plotting range from $-2 \pi$ to $2 \pi$ (see figure \ref{3_4}).

```{.scilab}
plot_range = linspace(-2 * %pi, 2 * %pi, 10000)

subplot(2, 1, 1)
plot(plot_range, y1(plot_range), "-r")
legend(['y1'])

subplot(2, 1, 2)
plot(plot_range, y2(plot_range), "-b")
legend(['y2'])
```

![Plot of $y_1$ and $y_2$ in the plot range\label{3_4}](../image/3_4.png)


# Exercise 3.5

The system of equations is represented as

$$
\begin{bmatrix}
2 & 4 & 5 & -2 \\
1 & 2 & 1 &  2 \\
0 & 2 & 4 &  2 \\
3 & -1 & 0 & 10
\end{bmatrix}
\cdot
\begin{bmatrix}
x_1 \\
x_2 \\
x_3 \\
x_4
\end{bmatrix}
=
\begin{bmatrix}
0 \\
1 \\
2 \\
10
\end{bmatrix}
$$

or

```{=latex}
\begin{align*}
A \cdot x &= B \\
x &= A^{-1} \cdot B
\end{align*}
```


We define A and B

```{.scilab}
A = [2, 4 , 5, -2;
     1, 2 , 1,  2;
     0, 2 , 4,  2;
     3, -1, 0, 10]

B = [0;
     1;
     2;
     10]

x = inv(A) * B
```

# Exercise 3.6

Given an analog signal

$$
x_a(t) = 3 \cdot cos(100 \pi t)
$$

Defining a corresponding function

```{.scilab}
function ret = xa(t)
    ret = 3 * cos(100 * %pi * t)
endfunction
```

## Subquestion a

Smallest sampling frequency is larger than two time the maximum frequency component of the signal.

Signal $x_a(t)$ have frequency of 50Hz, so the smallest sampling frequency is 100Hz

## Subquestion b

If the sampling freq is 200Hz

The sampled signal will be
$$
x_{a\left(sampled\right)}\left(n\right) = 3 \cdot cos\left(\frac{1}{2} \pi n\right)
$$

Plotting from time $t_0 = 0$ to time $t_1 = \frac{3}{25} s$ (see figure \ref{3_6_b}).

```{.scilab}
clf('reset') // remove any previous plot

subplot(2, 1, 1)
plot(linspace(0, 3/25, 1000), xa, "-r")
legend(['xa'])

subplot(2, 1, 2)
plot(linspace(0, 3/25, floor(3/25 * 200) + 1), xa, "-bo")
legend(['sampled_xa'])
```

![Plot of $x_a$ and $x_{a(sampled)}$ from $t_0$ to $t_1$ \label{3_6_b}](../image/3_6_b.png)

## Subquestion c

If the sampling freq is 75Hz.

The sampled signal will be
$$
x_{a\left(sampled\right)}\left(n\right) = 3 \cdot cos\left(\frac{4}{3} \pi n\right)
$$

Plotting from time $t_0 = 0$ to time $t_1 = \frac{3}{25} s$ (see figure \ref{3_6_c}).

```{.scilab}
clf('reset')

subplot(2, 1, 1)
plot(linspace(0, 3/25, 1000), xa, "-r")

subplot(2, 1, 2)
plot(linspace(0, 3/25, floor(3/25 * 75) + 1), xa, "-bo")
```

![Plot of $x_a$ and $x_{a(sampled)}$ from $t_0$ to $t_1$ \label{3_6_c}](../image/3_6_c.png)

## Subquestion d

If the sampling freq is 75Hz.

The sampled signal will be
$$
x_{a\left(sampled\right)}\left(n\right) = 3 \cdot cos\left(\frac{4}{3} \pi n\right)
$$

The sampled alias signal that have the same value at every point of n is

```{=latex}
\begin{align*}
x_{a\left(alias\right)}\left(n\right)
&= x_{a\left(sampled\right)}\left(n\right) \\
&= 3 \cdot cos\left(\left(2 - \frac{4}{3}\right) \pi n\right) \\
&= 3 \cdot cos\left(\frac{2}{3} \pi n\right)
\end{align*}
```

We can calculate the equivalent original signal

```{=latex}
\begin{align*}
x_{a\left(alias\right)}\left(t\right)
&= 3 \cdot cos\left(\frac{2}{3} \cdot 75 \pi n\right) \\
&= 3 \cdot cos\left(50 \pi n\right)
\end{align*}
```

The alias signal have the freq of 25Hz


# Exercise 3.7

Defining the signal

```{.scilab}
function ret = xa(t)
    ret = 3 * cos(200 * %pi * t) + 5 * sin(6000 * %pi * t)  + 10 * cos(12000 * %pi * t)
endfunction
```

## Subquestion a

The maximum freq component within $x_a$ is 6kHz, so the Nyquist freq is 12kHz.

## Subquestion b

If the sampling freq is 5kHz.

The sampled signal will be
$$
x_{a\left(sampled\right)}\left(n\right) = \\
3 \cdot cos\left(\frac{1}{25}  \pi  t\right) + 5 \cdot sin\left(\frac{6}{5}  \pi  t\right)  + 10 \cdot cos\left(\frac{12}{5}  \pi  t\right)
$$

Plotting from time $t_0 = 0$ to time $t_1 = \frac{3}{100} s$ (see figure \ref{3_7}).

```{.scilab}
clf('reset')

subplot(2, 1, 1)
plot(linspace(0, 3/100, 10000), xa, "-r")
legend(['xa'])

subplot(2, 1, 2)
plot(linspace(0, 3/100 ,floor(3/100 * 5000) + 1), xa, "-bo")
legend(['sampled_xa'])
```

![Plot of $x_a$ and $x_{a(sampled)}$ from $t_0$ to $t_1$ \label{3_7}](../image/3_7.png)
