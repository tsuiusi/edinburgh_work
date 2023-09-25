# INF1A Week 2 notes

## Deduction and inference
Rules are written symbolically using sequents.
Sequents: formal expression that represents an inference step (a => b)

The Barbara rule:
a |= b	b |= c
---------------
a |= c

a|=b  means everything in a is in b
So if everything in a is in b and everything in b is in c then everything in a is in c.
In any sound rule, if all statement above the line (the *premises*) are true, for any predicates a, b, and c and any universe, then the statement below the line (the *conclusion*) must be true as well.
This can be used to validate arguments

## Negated predicates
The negation of a predicate corresponds to the complement of the set.

e.g negating c in the Barbara rule
Then everything in b won't be in c
So everything in a will not be in c

## Contraposition and double negation
The contraposition rule states that a conditional statement "if A then B" is logically equivalent to "if not A then not B".

Double negation: - \* - = +


