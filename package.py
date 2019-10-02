name = "opensubdiv"

version = "3.3.3"

authors = [
    "Pixar"
]

description = \
    """
    OpenSubdiv is a set of open source libraries that implement high performance subdivision surface (subdiv)
    evaluation on massively parallel CPU and GPU architectures.
    """

requires = [
    "gcc-6+",
    "cmake-3+",
    "python-2.7+<3",
    "glew-2+",
    "glfw-3+",
    "ptex-2.1.28+",
    "tbb-2017.U6+",
]

variants = [
    ["platform-linux"]
]

build_system = "cmake"

with scope("config") as config:
    config.build_thread_count = "logical_cores"

uuid = "opensubdiv-{version}".format(version=str(version))

def commands():
    env.PATH.prepend("{root}/bin")
    env.LD_LIBRARY_PATH.prepend("{root}/lib")

    # Helper environment variables.
    env.OPENSUBDIV_BINARY_PATH.set("{root}/bin")
    env.OPENSUBDIV_INCLUDE_PATH.set("{root}/include")
    env.OPENSUBDIV_LIBRARY_PATH.set("{root}/lib")
