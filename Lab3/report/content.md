
# Section 4

## Exercise 4.1

Given a linear system $T$ with the following pair of input and output signal,
which we will assume to have its root at the first value.

```{=latex}
\begin{align*}
x_1(n) = [ -1, 2, 1 ] &\xrightarrow{\hspace{1cm}T\hspace{1cm}} y_1(n) = [ 1, 2, -1, 0, 1 ] \\
x_2(n) = [ 1, -1, -1 ] &\xrightarrow{\hspace{1cm}T\hspace{1cm}} y_2(n) = [-1, 1, 0, 2 ] \\
x_3(n) = [ 0, 1, 1 ] &\xrightarrow{\hspace{1cm}T\hspace{1cm}} y_3(n) = [ 1, 2, 1 ] \\
\end{align*}
```

Creating new signals $x_a(n)$ and $x_b(n)$

```{=latex}
\begin{align*}
x_a(n)     &= x_1(n) + x_2(n)    = [ 0, 1, 0 ] \\
x_b(n)     &= x_a(n - 1)  		 = [ 0, 0, 1 ] \\
x_3(n)     &= x_a(n) + x_b(n)    \\
\end{align*}
```

It can be inferred

```{=latex}
\begin{align*}
y_a(n) &= T[x_a(n)] \\
	   &= T[x_1(n)] + T[x_2(n)] \\
	   &= y_1(n) + y_2(n) \\
	   &= [ 0, 3, -1, 2, 1 ] \\
\implies y_a(n - 1) &= [ 0, 0, 3, -1, 2, 1 ]
\end{align*}
```

The response of the system to the $x_3(n)$ signal should then be

```{=latex}
\begin{align*}
T[x_3(n)] &= T[x_a(n) + x_b(n)] \\
          &= T[x_a(n)] + T[x_b(n)] \\
		  &= y_1(n) + y_2(n) + T[x_b(n)]\\
          &= y_3(n)
\end{align*}
```

Meaning that we now have

```{=latex}
\begin{align*}
T[x_b(n)] = T[x_a(n-1)] &= y_3(n) - y_1(n) - y_2(n) \\
					    &= [ 1, -1, 1, 0, -3 ]  \\
					    &= y_a(n, 1) \\
\end{align*}
```

Comparing the $y_a(n-1)$ signal and the $y_a(n, 1)$ signal, we see that they are different.
Meaning that the system $T$ is not time-invariant.

## Exercise 4.2

Don't know how to do it.

## Exercise 4.3



## Exercise 4.4

## Exercise 4.5

## Exercise 4.6

## Exercise 4.7

## Exercise 4.8

## Exercise 4.9

## Exercise 4.10

## Exercise 4.11

## Exercise 4.11

## Exercise 4.12


