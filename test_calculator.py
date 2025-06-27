import unittest
import math
from calculator import Calculator


class TestCalculator(unittest.TestCase):
    def setUp(self):
        self.calc = Calculator()

    def test_add(self) -> None:
        """Test the add method for correct result type and value."""
        self.assertIsInstance((result := self.calc.add(2, 3)), (int, float))
        self.assertEqual(result, 5)
        self.assertAlmostEqual(self.calc.add(-1.5, 2.5), 1.0)

    def test_subtract(self) -> None:
        """Test the subtract method for correct result type and value."""
        self.assertIsInstance((result := self.calc.subtract(5, 2)), (int, float))
        self.assertEqual(result, 3)
        self.assertAlmostEqual(self.calc.subtract(2.5, 1.5), 1.0)

    def test_multiply(self) -> None:
        """Test the multiply method for correct result type and value."""
        self.assertIsInstance((result := self.calc.multiply(4, 3)), (int, float))
        self.assertEqual(result, 12)
        self.assertAlmostEqual(self.calc.multiply(-2, 2.5), -5.0)

    def test_divide(self) -> None:
        """Test the divide method for correct result type, value, and error handling."""
        self.assertIsInstance((result := self.calc.divide(10, 2)), float)
        self.assertEqual(result, 5)
        with self.assertRaises(ZeroDivisionError):
            self.calc.divide(1, 0)

    def test_power(self) -> None:
        """Test the power method for correct result type and value."""
        self.assertIsInstance((result := self.calc.power(2, 3)), float)
        self.assertEqual(result, 8)
        self.assertAlmostEqual(self.calc.power(9, 0.5), 3.0)

    def test_sqrt(self) -> None:
        """Test the sqrt method for correct result type, value, and error handling."""
        self.assertIsInstance((result := self.calc.sqrt(16)), float)
        self.assertEqual(result, 4)
        with self.assertRaises(ValueError):
            self.calc.sqrt(-1)

    def test_sin(self) -> None:
        """Test the sin method for correct result type and value."""
        self.assertIsInstance((result := self.calc.sin(math.pi / 2)), float)
        self.assertAlmostEqual(result, 1.0)

    def test_cos(self) -> None:
        """Test the cos method for correct result type and value."""
        self.assertIsInstance((result := self.calc.cos(0)), float)
        self.assertAlmostEqual(result, 1.0)

    def test_tan(self) -> None:
        """Test the tan method for correct result type and value."""
        self.assertIsInstance((result := self.calc.tan(math.pi / 4)), float)
        self.assertAlmostEqual(result, 1.0)

    def test_log(self) -> None:
        """Test the log method for correct result type, value, and error handling."""
        self.assertIsInstance((result := self.calc.log(math.e)), float)
        self.assertAlmostEqual(result, 1.0)
        with self.assertRaises(ValueError):
            self.calc.log(0)
        with self.assertRaises(ValueError):
            self.calc.log(-1)
        self.assertAlmostEqual(result, 1.0)
