"""
A module providing a Calculator class for basic and scientific arithmetic operations.
"""

import math
import numpy as np


class Calculator:
    """
    A simple calculator class for basic and scientific arithmetic operations.

    Supported operations:
    - Basic: add, subtract, multiply, divide
    - Scientific: power, square root, trigonometric functions (sin, cos, tan), logarithms
    """

    def add(self, a: float, b: float) -> float:
        """Return the sum of a and b."""
        return a + b

    def subtract(self, a: float, b: float) -> float:
        """Return the difference of a and b."""
        return a - b

    def multiply(self, a: float, b: float) -> float:
        """Return the product of a and b."""
        return a * b

    def divide(self, a: float, b: float) -> float:
        """Return the quotient of a and b. Raises ValueError if b is zero."""
        if b == 0:
            raise ZeroDivisionError("Cannot divide by zero.")
        return a / b

    def power(self, a: float, b: float) -> float:
        """Return a raised to the power of b."""
        return math.pow(a, b)

    def sqrt(self, a: float) -> float:
        """Return the square root of a. Raises ValueError if a is negative."""
        if a < 0:
            raise ValueError("Cannot take square root of negative number.")
        return math.sqrt(a)

    def sin(self, a: float) -> float:
        """Return the sine of a (in radians)."""
        return math.sin(a)

    def cos(self, a: float) -> float:
        """Return the cosine of a (in radians)."""
        return math.cos(a)

    def tan(self, a: float) -> float:
        """Return the tangent of a (in radians)."""
        return math.tan(a)

    def log(self, a: float, base: float = math.e) -> float:
        """Return the logarithm of a with given base. Raises ValueError if a <= 0."""
        if a <= 0:
            raise ValueError("Logarithm undefined for non-positive values.")
        return math.log(a, base)

    import numpy as np

    def evaluate_expressions(self, expressions: list[str]) -> list[float]:
        """Evaluate a list of mathematical expressions using NumPy for optimized computations."""
        results = []

        def safe_eval(expr: str):
            try:
                return eval(expr, {"__builtins__": None}, {**math.__dict__, **np.__dict__})
            except Exception as ex:
                return f"Error: {ex}"

        results = [safe_eval(expression) for expression in expressions]
        return results


def main() -> None:
    calc = Calculator()
    print("Addition: 2 + 3 =", calc.add(2, 3))
    print("Subtraction: 5 - 2 =", calc.subtract(5, 2))
    print("Multiplication: 4 * 3 =", calc.multiply(4, 3))
    print("Division: 10 / 2 =", calc.divide(10, 2))
    print("Power: 2 ^ 3 =", calc.power(2, 3))
    print("Square root: sqrt(16) =", calc.sqrt(16))
    print("Sine: sin(pi/2) =", calc.sin(math.pi / 2))
    print("Cosine: cos(0) =", calc.cos(0))
    print("Tangent: tan(pi/4) =", calc.tan(math.pi / 4))
    print("Natural log: log(e) =", calc.log(math.e))
    print("Log base 10: log10(100) =", calc.log(100, 10))


if __name__ == "__main__":
    main()
