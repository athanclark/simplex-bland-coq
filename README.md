# Simplex: Bland's Finite Pivoting Method

This repository aims to formalize [Robert Bland's Finite Pivoting Method](http://www.ohio.edu/people/melkonia/math4620/bland.pdf)
for use in simplical optimization algorithms; as is used in the
[Cassowary Incremental Constraint Solver](https://constraints.cs.washington.edu/solvers/cassowary-tochi.pdf).

We aim to both implement (with termination proof implicit) the algorithm, and
_prove_ it's correct optimization. This is to support the design and implementation
of the Cassowary constraint solver - which additionally adds _weights_ with constraints,
which further convolutes the intended meaning and obvious design of the algorithm.
This project aims to clarify the behaviour of this simplical optimization.
