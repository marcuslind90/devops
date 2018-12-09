class Foo(object):
    """Wow."""

    def __init__(self, value: int, *args, **kwargs):
        self.val = value

    def foo(self):
        """Invalid method that is catched by linting.

        Returns:
            int -- Should return the result of calculation

        """
        prim: int = 1
        seco: str = "a"
        return prim + seco


if __name__ == "__main__":
    foo = Foo(value=1)
    foo.foo()
    print("Executed...")
