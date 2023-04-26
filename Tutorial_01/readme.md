# Tutorial 1 Notes 


The goal of this tutorial are:

1. to have a mental model of the data structure for table-like data
2. to be able to do data manipulation with `data.table` package
3. to review three basic probability distributions:
    - Binomial
    - Poisson
    - Normal

## Definition of Binomial Distribution

The binomial distribution is the discrete probability distribution of the number of successes in a sequence of n independent experiments, each asking a yes–no question, and each with its own Boolean-valued outcome: success/yes/true/one (with probability p) or failure/no/false/zero (with probability q = 1 − p). A single success/failure experiment is also called a Bernoulli trial or Bernoulli experiment and a sequence of outcomes is called a Bernoulli process. If p is the probability of success in an individual experiment, then the probability mass function (pmf) of the number of successes x in n Bernoulli trials is given by the binomial distribution formula.

The binomial distribution is the basis for the popular binomial test of statistical significance. It is also a basis for the popular binomial option pricing model used in finance.

$$
\begin{aligned}
P(X = x) &= \binom{n}{x} p^x (1-p)^{n-x} \\
&= \frac{n!}{x!(n-x)!} p^x (1-p)^{n-x}
\end{aligned}
$$

The expected value of a binomial random variable is $E(X) = np$ and the variance is $Var(X) = np(1-p)$.

## Definition of Poisson Distribution

The Poisson distribution is a discrete probability distribution that expresses the probability of a given number of events occurring in a fixed interval of time and/or space if these events occur with a known constant rate and independently of the time since the last event. The Poisson distribution can also be used for the number of events in other specified intervals such as distance, area or volume.

The Poisson distribution is named after the French mathematician Siméon Denis Poisson. It can also be regarded as a limit of the binomial distribution for large N.

$$
\begin{aligned}
P(X = x) &= \frac{\lambda^x e^{-\lambda}}{x!} \\
&= \frac{\lambda^x}{x!} e^{-\lambda}
\end{aligned}
$$

where $\lambda$ is the average number of events per interval.

The expected value of a Poisson random variable is $E(X) = \lambda$ and the variance is $Var(X) = \lambda$.

## Definition of Normal Distribution

In probability theory, a normal (or Gaussian or Gauss or Laplace–Gauss) distribution is a type of continuous probability distribution for a real-valued random variable. The general form of its probability density function is:

$$
f(x) = \frac{1}{\sigma \sqrt{2 \pi}} e^{-\frac{1}{2} \left( \frac{x - \mu}{\sigma} \right)^2}
$$

where $\mu$ is the mean and $\sigma$ is the standard deviation. The parameter $\sigma$ is called the scale parameter or the standard deviation of the distribution. The normal distribution is important in statistics and is often used in the natural and social sciences to represent real-valued random variables whose distributions are not known. For example, it approximates a wide variety of events, such as the distribution of samples influenced by a large number of tiny, random disturbances, such as thermal noise, or the forces exerted by many molecules on one's body.

The normal distribution is also a good model for the distribution of sample means for a large number of samples, especially if the true population from which the samples are taken is normally distributed. This is because the distribution of the mean of a large number of samples is approximately normally distributed, regardless of the distribution of the population from which the samples are taken. This is known as the central limit theorem.


## Connection between Binomial and Poisson Distribution

Both binomial and Poisson distributions are discrete probability distributions. The binomial distribution is used to model the number of successes in a sequence of independent trials, while the Poisson distribution is used to model the number of events occurring in a fixed interval of time or space.

There is a close connection between the binomial and Poisson distributions. The Poisson distribution can be derived from the binomial distribution by taking the limit of the number of trials as the number of trials approaches infinity, while keeping the probability of success constant.

Here is the connection of all distributions.

![distributions](../images/distribution_chart.gif)

Now, we will show the connection between binomial and Poisson distribution based on [this lecture notes](https://mathcenter.oxford.emory.edu/site/math117/connectingPoissonAndBinomial/).

For binomial distribution, we have the following probability mass function:

$$
P(X = x) = \binom{n}{x} p^x (1-p)^{n-x}
$$

Now let's set up the parameters for the binomial distribution with $n$ and $\lambda$, such as 

$$
p = \frac{\lambda}{n}
$$

Then the binomial distribution can be rewritten as:

$$
P(X = x) = \binom{n}{x} \left( \frac{\lambda}{n} \right)^x \left( 1 - \frac{\lambda}{n} \right)^{n-x}
$$

Let's expand the above function and take the limit of $n$ as $n \to \infty$:

$$
\begin{aligned}
P(X = x) &= \lim_{n \to \infty} \binom{n}{x} \left( \frac{\lambda}{n} \right)^x \left( 1 - \frac{\lambda}{n} \right)^{n-x} \\
&= \lim_{n \to \infty} \frac{n!}{x! (n-x)!} \left( \frac{\lambda}{n} \right)^x \left( 1 - \frac{\lambda}{n} \right)^{n-x} \\
& = \lim_{n \to \infty} \frac{n(n-1)(n-x+1)}{x!} \frac{\lambda^x}{n^x} \left( 1 - \frac{\lambda}{n} \right)^{n-x} \\
& = \lim_{n \to \infty} \frac{n(n-1)(n-x+1)}{n^x} \frac{\lambda^x}{x!} \left( 1 - \frac{\lambda}{n} \right)^{n-x} \\
& = \lim_{n \to \infty} \frac{n(n-1)(n-x+1)}{n^x} \frac{\lambda^x}{x!} \left( 1 - \frac{\lambda}{n} \right)^{n} \left( 1 - \frac{\lambda}{n} \right)^{-x} \\
& = \frac{e^{-\lambda} \lambda^x }{x!} 
\end{aligned}
$$

The above derivation uses the following facts:

$$
\begin{aligned}
\lim_{n \to \infty} \frac{n(n-1)(n-x+1)}{n^x} &= 1 \\
\lim_{n \to \infty} \left( 1 + \frac{x}{n} \right)^{n} &= e^x \\
\lim_{n \to \infty} \left(1 - \frac{\lambda}{n} \right)^{-x} &= 1
\end{aligned}
$$

Therefore, we can conclude that the Poisson distribution is the limit of the binomial distribution for large $n$. But what is the intuition behind this connection?

Let's take a look at the following example:

> Now, suppose you are a restaurant owner and you want to know how many customers will come to your restaurant from 10am to 11am. How could you model this problem? 

To answer this question, we need to collect some data first. As those data could give us some evidence to answer this question. But how could we collect the data? And what kind of data should we collect?

Before we answer these questions, let's think about our problem again. For our problem, we have the following dimensions (or angles or features):

- time: 10am to 11am
- space: the restaurant
- people: customers
- event: coming to the restaurant

Now, as you can see we have four dimensions. The interaction between these dimensions could make our problem more complicated. The complexity of our problem is related to the number of dimensions. So, if we want to make our problem simpler, we need to reduce the number of dimensions.

To progress our thinking, we always start from a definition of an event. For our problem, we can define the event as "a customer comes to the restaurant". This means we are fixing the time and space dimensions. Now, we only have two dimensions: people and event. This is a much simpler problem.

After defining the event, we will model the problem based on the event. When we model the problem, we ask questions in a probabilistic way. For example, we can ask the following questions:

- What is the probability that a customer comes to the restaurant from 10am to 11am?
- What is the probability that 10 customers come to the restaurant from 10am to 11am?

How could we answer these questions? We can answer these questions by collecting data. For example, we can collect the data of the number of customers who come to the restaurant from 10am to 11am. Then we can use the data to answer the above questions.

For the first question, we can use the binomial distribution to model the problem. For the second question, we can use the Poisson distribution to model the problem. 

But before using any distribution, let's think about how we could solve it in the naive way by assuming we can collect all the data without any limitation
in terms of time and space. 

To answer question: what is the probability that a customer comes to the restaurant from 10am to 11am? We can do this:

- day 1 at 10am to 11am, we observe whether $x >= 1$ customers come to the restaurant. If yes, we record 1, otherwise we record 0.
- day 2 at 10am to 11am, we observe whether $x >= 1$ customers come to the restaurant. If yes, we record 1, otherwise we record 0.
- after 100 days, we calculate the average of the 100 records. This is the probability that a customer comes to the restaurant from 10am to 11am.

See it is very simple. But this is very time consuming. We need to observe the restaurant for 100 days. And we need to record the data for 100 days. This is not practical. How could we solve this problem in a more practical way?

Instead of observing the restaurant for 100 days, we can observe the restaurant for 1 day. This means we have to observe 100 restaurants. And we need to record the data for 100 restaurants. This is more practical. But doing this assumes that all 100 restaurants are the same (such as location, size, food type, etc.). If we observe 100 restaurants, we can assume that the 100 restaurants are the same. Then we can use the average of the 100 records to answer the question. This is the probability that a customer comes to the restaurant from 10am to 11am.

There is another method to solve this problem by doing a survey. We can ask people to answer the following question: how likely is it that you will come to the restaurant from 10am to 11am? We can ask 100 people to answer this question. Then we can use the average of the 100 answers to answer the question. This is the probability that a customer comes to the restaurant from 10am to 11am.

At this stage, you should realize that dimension matters. When we model the problem, we generally hold some dimensions fixed at the beginning and then slowly release the constraints. This is the process of reducing the number of dimensions.

Now, let's go back to our problem. We will try to answer the second question: what is the probability that 10 customers come to the restaurant from 10am to 11am? We can do this:

- day 1 at 10am to 11am, we observe whether $x >= 10$ customers come to the restaurant. If yes, we record 1, otherwise we record 0.
- day 2 at 10am to 11am, we observe whether $x >= 10$ customers come to the restaurant. If yes, we record 1, otherwise we record 0.

After 100 days, we calculate the average of the 100 records. This is the probability that 10 customers come to the restaurant from 10am to 11am.

Or we can also do this:

- day 1 at 10am to 11am, we observe the number of customers who come to the restaurant. We record the number of customers.
- day 2 at 10am to 11am, we observe the number of customers who come to the restaurant. We record the number of customers.

Or we can observe 100 restaurants for 1 day and then calculate the average of the 100 records. This is the probability that 10 customers come to the restaurant from 10am to 11am. Notice that for this question, doing a survey is not practical. Because we care about the number of customers, not the probability of one customer coming to the restaurant. 


Before we proceed, let's review the four dimensions of our problem:

- time: 10am to 11am
- space: the restaurant
- people: customers
- event: coming to the restaurant

When we try to solve the problem, we

- either hold space fixed and then do reordering 100 days
- either hold time fixed and then do reordering 100 restaurants

Now, we will fix the event and time dimensions, which means we assume each event (coming to the restaurant) is independent within a fixed time interval (10am to 11am). Then we will do reordering 100 days. Then we are interested in the probability that number of customers coming to the restaurant. This is a Poisson distribution problem. Why? Think about how could you solve this problem in the naive way.


Just ask: what's the probability for you to come to the restaurant at 10:16:00:0003 am? If we divide the time interval into million seconds, how many events do we have? (How about $n \to \infty$?)



## Case Study with Our Survey Data

Q1: have you learned regression before?

| q1  | N  | percent |
|:---:|:--:|:-------:|
| no  | 7  |  29.17  |
| yes | 17 |  70.83  |

Please read the code for this part


## Linear regression with simulation

We want to simulate the following relationship

$$
weight = 16 + 0.32 \times height + \epsilon
$$

where $\epsilon \sim N(0, 2)$

To make our simulation more realistic, we will simulate height based on gender. 

$$
\begin{aligned}
height & \sim N(167, 2.3) \quad \text{for female} \\
height & \sim N(173, 3.2) \quad \text{for male}
\end{aligned}
$$

At the same time, we will also simulate another model 

$$
\begin{aligned}

weight_{female} & = 16 + 0.32 \times height + \epsilon \\
weight_{male} & = 16 - 0.17  \times height + \epsilon
\end{aligned}
$$



