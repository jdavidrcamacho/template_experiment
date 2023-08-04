.DEFAULT_GOAL := help

.PHONY: help
help:
		@echo "Please use 'make <target>' where <target> is one of:"
		@echo ""
		@echo "	format-check	runs the formatting tools, only checking for errors"
		@echo "	format-fix	runs the formatting tools, fixing errors where possible"
		@echo "	lint-check	runs the linting tools, only checking for errors"
		@echo "	type-check	runs the static type checker, only checking for errors"
		@echo "	static-check	runs the following targets: format-check, lint and typing"
		@echo "	static-fix	runs the following targets: format-fix, lint and typing"
		@echo "	unit-test	runs the unit tests"
		@echo "	docstring-check	runs the docstring checker for missing doctrings"
		@echo ""

.PHONY: format-check
format-check:
	black --check .
	isort --check-only .

.PHONY: format-fix
format-fix:
	black .
	isort .

.PHONY: lint-check
lint-check:
	flake8 .

.PHONY: type-check
type-check:
	mypy .

.PHONY: static-check
static-check: format-check lint-check type-check

.PHONY: static-fix
static-fix: format-fix lint-check type-check

.PHONY: unit-test
unit-test:
	pytest --cov-report term-missing --cov=src/

.PHONY: docstring-check
docstring-check:
	pydocstyle src/ tests/
