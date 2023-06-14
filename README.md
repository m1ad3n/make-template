<h2 align="center">Custom Makefile Build System for C and C++</h2>

## Table of Contents

- [Description](#description)
- [Installation](#installation)
- [Dependencies](#dependencies)
- [Usage](#usage)
- [Commands](#commands)
- [Contributing](#contributing)
- [License](#license)

## Description

This project provides a custom Makefile build system for C and C++ projects. It offers developers a flexible and efficient solution for compiling and managing their source code. The build system supports various commands that facilitate different stages of the development process, including building the project, generating a release version, and cleaning the build folders.

## Installation

To use this project, follow the steps below:

1. Clone the repository:

```shell
git clone https://github.com/m1ad3n/make-template.git
```

2. Change to the project's directory:

```shell
cd make-template
```

1. Clone only the Makefile

```shell
curl https://raw.githubusercontent.com/m1ad3n/make-template/master/Makefile > Makefile
```

## Dependencies

Before using this project, make sure you have the following dependencies installed:

- `gcc`: The GNU Compiler Collection, required for compiling the C and C++ source code.
- `make`: A build automation tool used to compile and manage the project using the Makefile.
- `findutils`: A collection of utilities used to search for files and directories. It is often pre-installed on Unix-like systems.

Make sure you have these dependencies installed on your system before proceeding with the usage of this project.


## Usage

To build and run the project, make sure you have the necessary dependencies installed. Then, follow the steps below:


1. Open a terminal and navigate to the project's directory.

2. Execute the `make` command to build the project:

```shell
make
```

3. Execute the generated executable:

```shell
./target/debug/project
```

To build the release version of the project, execute the following command:

```shell
make release
```

4. Execute the generated release executable:

```shell
./target/release/project0.1
```

Make sure to replace `project` with the actual name of the directory, and to replace `0.1` with actual version of the project, default version is 0.1

## Commands

The following commands are available for the Makefile build system:

- `make`: Builds the project.
- `make release`: Builds the release version of the project.
- `make clean`: Cleans the build folder, removing all generated object files and executables.
- `make clean-rel`: Cleans the release folder, removing all generated release files.

Feel free to modify the Makefile to suit your specific project needs.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request on the project's GitHub repository.

## License

This project is licensed under the [MIT License](LICENSE). You are free to modify and distribute this project as per the license terms.