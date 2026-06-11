# MARIE Sum of Squares

A low-level assembly language program written for the MARIE architecture that reads a two-digit decimal input, computes the sum of squares of all even numbers up to the input value, and outputs the result in hexadecimal.

## Overview

This project demonstrates fundamental computer architecture and assembly programming concepts including:

* ASCII input processing
* Decimal number construction
* Loop-based arithmetic
* Repeated-addition multiplication
* Conditional branching
* Memory management
* Decimal-to-hexadecimal conversion

The program accepts a two-digit input and calculates:

`2² + 4² + 6² + ... + n²`

where `n` is the largest even number less than or equal to the user input.

The final result is displayed in hexadecimal format.

---

## Example Runs

### Example 1

**Input**

```text
06
```

**Calculation**

```text
2² + 4² + 6²
= 4 + 16 + 36
= 56
```

**Output**

```text
38
```

56 decimal = 38 hexadecimal

---

### Example 2

**Input**

```text
08
```

**Calculation**

```text
2² + 4² + 6² + 8²
= 4 + 16 + 36 + 64
= 120
```

**Output**

```text
78
```

120 decimal = 78 hexadecimal

---

### Example 3

**Input**

```text
10
```

**Calculation**

```text
2² + 4² + 6² + 8² + 10²
= 4 + 16 + 36 + 64 + 100
= 220
```

**Output**

```text
DC
```

220 decimal = DC hexadecimal

---

## Program Flow

1. Read two ASCII digits from keyboard input.
2. Convert ASCII characters to decimal values.
3. Construct the full decimal number.
4. Iterate through all even numbers from 2 to the input value.
5. Compute each square using repeated addition.
6. Accumulate the running sum.
7. Convert the final decimal result to hexadecimal.
8. Output the hexadecimal value.

---

## Concepts Demonstrated

* Assembly Language Programming
* Computer Organization
* Arithmetic Operations Without Hardware Multiplication
* Loop Construction
* Conditional Branching
* ASCII Encoding
* Number Base Conversion
* Memory-Based Computation

## Technologies

* MARIE Assembly Language
* MARIE Simulator

## Author

Kalyani Valath
