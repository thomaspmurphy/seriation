# Seriation

Seriation is a library for generating various mathematical sequences in Elixir.

## Supported Sequences

### Arithmetic Sequence
An arithmetic sequence is a sequence of numbers such that the difference between consecutive terms is constant.  

**Formula**:  
$a_n = a + (n-1) \cdot d$

### Geometric Sequence
A geometric sequence is a sequence of numbers where each term after the first is found by multiplying the previous term by a fixed, non-zero number called the common ratio.  

$a_n = a \cdot r^{(n-1)}$

### Fibonacci Sequence
The Fibonacci sequence is a series of numbers in which each number is the sum of the two preceding ones, usually starting with 0 and 1.  

$F_n = F_{n-1} + F_{n-2}$
with initial values:  
$F_0 = 0, \quad F_1 = 1$

### Prime Numbers
A prime number is a natural number greater than 1 that cannot be formed by multiplying two smaller natural numbers.

### Triangular Numbers
Triangular numbers are the counts of objects that can form an equilateral triangle.  

$T_n = \frac{n(n+1)}{2}$

### Square Numbers
Square numbers are the numbers obtained by squaring a natural number.  

$S_n = n^2$

### Pentagonal Numbers
Pentagonal numbers are figurate numbers that extend the concept of triangular and square numbers to the pentagon.  
 
$P_n = \frac{n(3n-1)}{2}$

### Hexagonal Numbers
Hexagonal numbers are figurate numbers that represent hexagons.  
  
$H_n = n(2n-1)$

### Catalan Numbers
Catalan numbers are a sequence of natural numbers that have many applications in combinatorial mathematics.  

$C_n = \frac{(2n)!}{(n+1)!n!}$

### Lucas Numbers
Lucas numbers are an integer sequence similar to the Fibonacci sequence, except that it starts with 2 and 1.  

$L_n = L_{n-1} + L_{n-2}$ 
with initial values:  
$L_0 = 2, \quad L_1 = 1$

### Harmonic Series
The harmonic series is the divergent infinite series of the reciprocals of the natural numbers.  
 
$H_n = \sum_{k=1}^n \frac{1}{k}$

### Thue-Morse Series
The Thue-Morse sequence is a binary sequence that is constructed by starting with 0 and successively appending the bitwise negation (flip of 0 to 1 and 1 to 0) of the sequence obtained so far. This sequence is known for its property of avoiding cubes (three consecutive identical subsequences).

$a_n = \text{sum of binary digits of n} \mod 2

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `seriation` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:seriation, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/seriation>.

