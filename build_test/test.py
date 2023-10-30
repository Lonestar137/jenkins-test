import os
import subprocess
from build_tools.context.venv import Venv
from build_tools.context.context_dir import Dir
from build_tools.cmd.git import GitRepo, PythonGitRepo


# def stage(f, name: str):
#     def wrapper():
#         pass

#     return wrapper


# @stage("Build Stage")
def build():
    requirements = ["pytest", "build-tools"]
    with Dir("test"):
        with Venv("venv", py_modules=requirements):
            GitRepo("https://github.com/Lonestar137/JustNeovim.git").clone()
            sample = PythonGitRepo(
                "https://github.com/pypa/sampleproject").clone()
            sample.wheels("wheelhouse")
            with Dir("sampleproject"):
                subprocess.run("pytest")
                print("Curdir: ", os.getcwd())


if __name__ == "__main__":
    build()
