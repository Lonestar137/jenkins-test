

def world():
    print("world from jenkins")

def inc(x: int):
    return x + 1

def test_world():
    assert inc(1) == 2



if __name__ == "__main__":
    print("hello")
    world()
    print("added new commit")
