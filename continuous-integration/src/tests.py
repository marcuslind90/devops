from unittest import TestCase
from .main import Foo


class FooTestCase(TestCase):
    """TestCase for the Foo class."""

    def test_foo(self):
        """Test that Foo.foo() rasies an TypeError."""
        foo = Foo(value=1)
        with self.assertRaises(TypeError):
            foo.foo()
