# Python Development Guidelines
<p align="justify">This document provides a set of best practices and guidelines to follow when developing Python code. It aims to ensure that our team's code is consistent, maintainable, and scalable, facilitating collaboration among team members.</p>

<p align="justify">By following these guidelines, we can improve the quality of our code, reduce the risk of errors, and increase productivity, contributing to the success of our team's projects.</p>

## Table of Contents
* [Tools](#tools)
    - [Managing Dependencies](#managing-dependencies)
    - [Static Check](#static-check)
    - [Unit Tests](#unit-tests)
    - [Docstrings](#docstrings)
* [Setup](#setup)
* [Typical Project Structures](#typical-project-structures)
* [Tests](#tests)
* [Git Best Practices](#git-best-practices-commits-pull-requests-and-code-reviews)

## Tools
#### Managing dependencies:

- [**pyenv**](https://github.com/pyenv/pyenv) (recommended): allows for concurrently managing multiple Python versions on the same machine.

- [**poetry**](https://python-poetry.org/) (mandatory): enables the specification of all project dependencies via the `poetry.lock` file (i.e. not only dependencies but also their dependencies recursively). Can also be used to manage virtual environment creation although other tools are available.

#### Static check:

- [**isort**](https://pycqa.github.io/isort/) (mandatory): automatic sorting of imports.

- [**black**](https://black.readthedocs.io/en/stable/) (mandatory): code formatting tool used to ensure consistency across projects.

- [**flake8**](https://flake8.pycqa.org/en/latest/) (mandatory): Python linter that wraps three other tools:
    - *pycodestyle* for style checking.
    - *PyFlakes* for syntax checking.
    - *Ned Batchelder's McCabe script* for code complexity checking.

- [**mypy**](https://mypy.readthedocs.io/en/stable/getting_started.html) (mandatory): for static type checking.

#### Unit tests:

- [**pytest**](https://docs.pytest.org/en/7.2.x/) (mandatory): framework to write small, readable tests, yet scales to support complex functional testing for applications and libraries.

- [**pytest-cov**](https://pytest-cov.readthedocs.io/en/latest/) (mandatory): plugin that produces coverage reports.

#### Docstrings:

- [**pydocstyle**](http://www.pydocstyle.org/en/stable/) (optional): static analysis tool for checking compliance with Python docstring conventions.

## Setup
1. Clone the template repository to your desired folder:
```bash
git clone git@github.com:visionspacetec/python-development-guidelines.git <desired-folder-name>
```

2. Enter the desired folder:
```bash
cd <desired-folder-name>
```

3. Update the cloned repository to point to your desired remote:
```bash
# Change the cloned repository's remote URL
git remote set-url origin <url-of-the-desired-remote>

# Verify that the new remote URL is correctly set
git remote -v
```

4. Clear the previous commit history:
```bash
git checkout --orphan new-main
git add -A
git commit -m "Repository setup"
git branch -D main
git branch -m main
git push -f
git gc --aggressive --prune=all
```

5. Adjust any desired dependencies (or they versions) in the `pyproject.toml` file ('*' finds and installs the most recent compatible version).

6. Install the dependencies for your project:
    
    6.1. If your package is a library, use:
    ```bash
    poetry install
    ```
    **Note**: do not forget to edit the 'name' and 'packages' inside the `pyproject.toml` file.

    6.2. Else, if it's an executable, we recommend:
    ```bash
    poetry install --no-root
    ```

7. Clear the `README.md` file:
```bash
rm README.md && touch README.md
```

## Typical Project Structures
TBD

## Tests
<p align="justify">Unit tests are typically stored in a `tests/` folder at the project root level. They follow the directory structure and naming of `src/` (or equivalent), with the exception that every file and function is prefixed by `test_`.</p>

#### Best Practice Recommendations:
- Test one small bit of functionality per testing unit, and verify its correctness.

- Ensure that each testing unit is fully independent and can be executed in isolation.

- Make an effort to create fast-running tests so the feedback loop is quick.

- Run tests frequently, and ideally set up automatic testing to trigger on code saving.

- Always run the full test collection before and after coding sessions to catch regressions.

- Use descriptive names for testing functions that indicate their purpose and expected behaviour.

- Avoid writing unit tests whose purpose is unclear or that provide limited value to the project.

<p align="justify">By following these guidelines, you can ensure that your Python codebase is thoroughly tested and maintainable, which can reduce the risk of introducing bugs and improve your development productivity.</p>

## Git Best Practices: Commits, Pull Requests and Code Reviews
#### How to Write Meaningful Commit Messages

- **Use Imperative Commands**: it helps to make messages more concise and easier to understand (e.g., use `Fix`, `Add`, `Refactor`, `Remove`, or `Update`).

- **Keep it Brief**: keep your commit messages brief, ideally with less than 50 characters. It makes it easier to scan through the commit history and quickly understand the changes made.

#### How to Create Efficient Pull Requests

- **Decide When to Push**: before pushing your changes, ensure they are complete and ready to be reviewed. Also, confirm you have addressed any feedback from previous reviews before pushing new changes.

- **Keep it small**: try to keep your pull requests small and focused. Large pull requests with multiple changes can be tough to review and may slow down the review process.

#### How to Review a Pull Request

- **What to Look For**: check that the code is correct, complete, and adheres to the project's standards and guidelines. Look for potential bugs, security issues, or any other problems that could arise from the changes.

    - Check for unused imports and variables.

    - Check for "magic numbers", but consider asking for their reasoning (they might be necessary in ML experiments to define the number of epochs or classification thresholds).
    
    - Check for duplicate code and modularise functions when possible.
    
    - Check for high cyclomatic complexity (e.g., multiple nested loops and if conditions) and consider vectorization in some cases (e.g, instead of iterating over all elements of a matrix with for loops, vectorize this operation.).
    
    - Check the naming choices for variables, classes, and functions.
    
    - Review unit tests for expected inputs, outputs, warnings, and edge cases (hypothesis testing framework may be helpful).

- **Review PRs in a Timely Manner**: don't let pull requests sit for too long, as this can slow down the development process and make it harder to resolve any conflicts that arise.

- **Describe Changes Clearly and Word Your Comments Carefully**: clearly describe the changes that you would like to see. Use specific examples to help the author understand the problem and offer suggestions for how to fix it. Be careful to word your comments in a constructive and helpful manner.

- **Offer Suggestions for Improvement**: offer suggestions for how to improve the code or fix any problems that you find. It can help the author improve their code and prevent similar issues from arising later.

- **Communicate That the PR is Approved**: once you are satisfied with the changes and believe the pull request is ready to be merged, communicate your approval. This lets the author know their work is ready to be integrated into the project.

## Useful Links

- [Google Python Style Guides](https://google.github.io/styleguide/pyguide.html)

## 🤝 Contributing
Contributions, issues and feature requests are welcome.

Feel free to check the [issues page](https://github.com/visionspacetec/python-development-guidelines/issues) if you want to contribute.
