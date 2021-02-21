# Python
Check all the installed python distributions on your machine. Make sure you understand the path to each installation and that you are aware of them. 

If you encounter mismatch of 32-bit python vs. 64-bit python, use this, to validate the version of currently used python:
`python -c 'import platform; print(platform.architecture()[0])'`

# Python path problems
[Python path problems?][1]

# Set up virtualenvwrapper on Ubuntu in BASH

Make sure you set the following in `~/.bash_profile`:
* path to python
* path to the folder where you want to have your venvs, set the path to the WORKON_HOME variable
* path to the `virtualenvwrapper.sh`

```
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.8
export WORKON_HOME=$HOME/venvs
source $HOME/.local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$HOME/venvs
```

# Environment variables

When using environment variables, you can load them within the script activating the virtual environment. 

On Linux, just add the following to the `activate` bash script: `export $(grep -v '^#' .env | xargs)`

# When your code doesn't run and you think it should

Very often it is a problem related to PATH or PYTHONPATH. 

Make sure python installation you want to use is in the PATH. Check the PATH environment variable. 

Make sure you are using the virtual environment you want and not some else. Check which venv is activated. 
If you installed [virtualenvwrapper][2] you can check it with the command `whereis python`.

If you are using bash terminal you can check it up with `which python`

If your module is not found and you are sure it is installed:
* check which virtual environment you are using
* check which python installation on your machine you are using
* figure out from where the modules that the work are being imported
```
import my_module
print(my_module.__file__)
```

# Generating unique identifiers
Check out the [uuid][8] package.

# Installing packages
When you use `pip install -r requirements.txt` you can be installing latest version of listed package or its specific version or a minimal version etc. 

 Tilde equals `~=` means it will select the latest version of the package, `package ~= 0.6.10` greater than or equal to 0.6.10, but still in the 0.6.* version, so it won't download 0.7.0 for example. 
 
 It ensures you will get security fixes but keep backward-compatibility, *if the package maintainer respects the semantic versioning* (which states that breaking changes should occur only in major versions).

In case the package maintainer does not respect the [semantic versioning][11] of the package, always install a specific package version `packege == 0.6.10` to avoid breaking changes in your code. 

# Building a package in python
To locally build/update the wheel and source files use `python setup.py sdist bdist_wheel`. When doing an update, adjust the version in `setup.py`.

`pip install -e .` to install the current working directory as a package in editable mode

To install a package from a specific remote branch of your git repository use:
`pip install git+https://git.nanox.cz/analytics/nanoutils.git@initial_functions_into_package`

[Python packages][3]

# Classes
[Typing in class][4]

# Testing
Test what is not changing not what changes. (e.g. test data type, format etc.)

[Python testing][7]

**Exploratory testing** (manual testing) - run your code, check the features and experiment using them; 
no plan, just exploring the application; list the features, the different inputs it can accept and expected results;
check those every time you make a change to your code

**Automated testing** - prepare a test plan (features to test, order of testing, expected response); 
prepare a script to execute the test plan

**Integration testing** - test step -> test assertion for multiple components; 
do the components of the application operate with each other?

**Unit test** - checks that a single component operates in the right way; 
helps you to isolate what is broken in your application and fit it faster

You should put tests into a separate tests folder. 
Each function can have a related test function. Reflect it in the naming: `function vs test_function`

For example the `sum()` function can have a relevant test case:
```
def test_sum():
    assert sum([1, 2, 3]) == 6, "Should be 6"

if __name__ == "__main__":
    test_sum()
    print("Everything passed")
```

## Test Runner
Test runner executes your test code, checks assertions, gives you test results in your console.

Test runners in Python:
* unittest (Python standard library)
* nose2
* pytest (recommended)

## unittest
- tests in classes as methods
- series of special assertion methods in `unittest.TestCase` class instead of the built-in `assert` statement

```
import unittest


class TestSum(unittest.TestCase):

    def test_sum(self):
        self.assertEqual(sum([1, 2, 3]), 6, "Should be 6")

    def test_sum_tuple(self):
        self.assertEqual(sum((1, 2, 2)), 6, "Should be 6")

if __name__ == '__main__':
    unittest.main()
```

## nose2
- compatible with any tests written using the unittest framework and can be used as a drop-in replacement for the `unittest` test runner
- discovers all test scripts names `test*.py` and test cases inheriting from `unittest.TestCase`

## pytest (recommended)
- supports execution of `unittest` test classes; however pytest test cases bring more advantages
- pytest test cases are a series of functions in a Python file starting with the name `test_`
- supports the built-in `assert` statement instead of using special `self.assert*()` methods
- supports for filtering for test cases
- ability to rerun from the last failing test
- an ecosystem of hundreds of plugins to extend the functionality

```
def test_sum():
    assert sum([1, 2, 3]) == 6, "Should be 6"

def test_sum_tuple():
    assert sum((1, 2, 2)) == 6, "Should be 6"
```

- no TestCase, no classes and no command-line entry point
- testing whether the expression raises a specific exception:
```
with pytest.raises(ValidationError):
    invalid_data_type = load_test_file(type="invalid_data_type")
    assert validate(instance=invalid_data_type, schema=schema)
```
- [pytest documentation][6]

## How to structure a test?
1. What do you want to test?
2. Unit test or an integration test?

Create a test:
1. Create your inputs
2. Execute the code being tested, capturing the output
3. Compare the output with an expected result

Assertion = validate the output against a known response
- repeatable (same result every time)
- assert results that relate to your input data

Side effects 
- a piece of code affecting not only the return function but also changing the environment 
  (e.g. class attributes, value in database etc.)
  
- if a single unit of code has lots of side effects, it should be refactored
> good code is one, for which it is easy to write repeatable and simple unit tests and thus which produces a reliable application

- to run a test, you can either run the test file directly in the console or run all the tests from terminal using `python -m pytest --verbose`
- in PyCharm, you can right click on a function, select `Go To -> Test` and be redirected to the related tests for the function if they exist or to create them

## Handling expected failures
You deliberately provide incorrect input and expect a specific exception to occur. 
The test will only pass if the function raises the specified exception.

```
import pytest


def test_zero_division():
    with pytest.raises(ZeroDivisionError):
        1 / 0
```

Store larger test input data in a folder called `fixtures` within the `tests` folder.

[Mocking responses for testing][5]

Automated testing tools (e.g. execute tests when you make a commit to the git repository) are part of the CI/CD tools.
CI/CD = continuous integration/continuous deployment (run tests, compile and publish applications, deploy applications)

# Package to get public holidays

There are two main python libraries for this purpose: **holidays** and **workalendar**. Based on a quick below comparison I would advise to use the `holidays` library as it is more robust and scalable mostly thanks to its clear dictionary structure.

[holidays][9] pros:
- the holidays names are in local languages
- the data are structured as a dictionary with dates as key-value pairs; you can group multiple years as dict within dict
- takes multiple date formats as an input
- active GitHub community
- it is easy to group multiple countries into a single dictionary
- easy to add custom holidays by appending to the dictionary
- possibility to distinguish based on provinces and states within states (e.g. all U.S. states)
- multiple ways to call a country: Czechia, CZE, CZ all works

[holidays][9] cons:
- the holidays names are in local languages
- you need to call the year before the data are available

[workalendar][10] pros:
- holidays names are all in English
- active GitHub community

[workalendar][10] cons:
- the data are stored in an object with U.S. mapped names as keys; e.g. boxing_day is 2020-12-25 and lists for each year; you need to call each year separately
- takes a single date format as an input
- holidays names are all in English
- the spelling of the library name
- you need to call the year before the data are available
- a list of unnecessary booleans is imported e.g. include_easter_sunday -> same for all other holidays
- a single way to call a country: CzechRepublic

# Linter

Linter is a tool that analyzes source code to flag programming errors, bugs, stylistic errors and suspicious constructs.

What does a linter do?
* find syntax errors
* find usage of undeclared variables
* detect call to undefined function
* highlight typos
* enforce types
* check compliance with a given style-guide or security rule
* code standardisation (replace all tabs for spaces, unify indents)
* performance check
* improves code readability (code reviews focused on logic and architecture, faster and easier code review)
* makes code base maintenance easier
* etc.

You can run linter:
* staticly (runs through your code source without executing it)
* within your IDE automatically, e.g. on save
* as an additional step in your CI
* all of the above

## [Pylint][13]

The default coding style used by Pylint is close to [PEP 8][14] "the Style Guide for Python".

- looks for errors and recommends suggestions
- displays messages as it analyzes the code
- displays some statistics about the number of warnings and errors found
- messages are classified under various categories such as errors and warnings
- the code is given an overall mark based on the number and severity of the warnings and errors
- provides you with a configuration file where you can adjust your preference on some particular issues

## Other python linters

[Bandit][12] a python linter focused on security of your code.

[1]: https://hackersandslackers.com/so-youve-fucked-up-your-python-path/
[2]: https://pypi.org/project/virtualenvwrapper/
[3]: https://packaging.python.org/tutorials/packaging-projects/
[4]: https://towardsdatascience.com/understand-how-to-use-namedtuple-and-dataclass-in-python-e82e535c3691
[5]: https://github.com/getsentry/responses
[6]: https://docs.pytest.org/en/latest/
[7]: https://realpython.com/python-testing/
[8]: https://docs.python.org/3/library/uuid.html
[9]: https://pypi.org/project/holidays/
[10]: https://pypi.org/project/workalendar/
[11]: https://semver.org/
[12]: https://bandit.readthedocs.io/en/latest/
[13]: http://pylint.pycqa.org/en/latest/
[14]: https://www.python.org/dev/peps/pep-0008/