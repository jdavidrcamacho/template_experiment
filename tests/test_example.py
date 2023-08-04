from src.example import hello_world


def test_hello_world() -> None:
    assert hello_world() == "Hello World"
