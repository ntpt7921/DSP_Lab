# Convention

Written in this report is the answer for the quiz question.

# Requirement

Find the Z-transform and ROC (range of convergence) for the following signal

## Question a

Given signal

$$
x(n) = 2 \cdot (0.4)^n \cdot u(n)
$$

We apply the Z-transform rule of $a^n u(n) \to \frac{1}{1 - az^{-1}}$, coupled with the linearity
property, giving us

$$
X(z) = 2 \cdot \frac{1}{1 - 0.4z^{-1}}
$$

The ROC is $|z| > |0.4|$.

## Question b

Given signal

$$
x(n) = 5\delta(n - 1) + u(n - 2)
$$

We apply the Z-transform rule of $\delta(n) \to 1$ and the time-shift property for $5\delta(n-1)$,
giving $5z^{-1}$. The ROC for this term is $ROC_1 = \{z\ \text{such that}\ z \neq 0\}$.

Applying the Z-transform rule of $u(n) \to \frac{1}{1 - z^{-1}}$ and the time shift property for
$u(n-2)$ gives $z^{-2} \frac{1}{1 - z^{-1}}$. The ROC for this term is
$ROC_2 = \{z\ \text{such that}\ |z| > |1|\} \backslash \{0\}$.

Combining both term

$$
X(z) = 5z^{-1} + z^{-2} \frac{1}{1 - z^{-1}}
$$

ROC of both term is $\{z\ \text{such that}\ |z| > |1|\} \backslash \{0\}$.

## Question c

Given signal

$$
x(n) = n \sin\left(\frac{4n}{3}\right) u(n) + (0.3)^n u(n - 2)
$$

We apply the Z-transform rule of $\cos(4/3 n) u(n)$ on $\sin\left(\frac{4n}{3}\right) u(n)$,
we have $\frac{1 - \cos(\omega_0) z^{-1}}{1 - 2\cos(\omega_0) z^{-1} + x^{-2}}$ ($\omega_0 = \frac{4}{3}$).
With ROC condition of $|z| > |1|$.

Continuing to apply the differentiation property on previous result, we have
$-z \cdot \frac{d \left(\frac{1 - \cos(\omega_0) z^{-1}}{1 - 2\cos(\omega_0) z^{-1} + x^{-2}}\right)}{dz}$.

We apply the Z-transform rule of $a^n u(n) \to \frac{1}{1 - az^{-1}}$, coupled with the linearity
property on $(0.3)^n u(n-2) = (0.3)^2 (0.3)^{n-2} u(n-2)$, giving $(0.3)^2 z^{-2} \frac{1}{1 - 0.3z^{-1}}$.
The ROC of this term is $ROC_2 = \{z\ \text{such that}\ |z| > |0.3| \} \backslash \{0\}$.
