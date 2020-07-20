venv:
	python3 -m venv venv
	source venv/bin/activate ; pip install --upgrade setuptools wheel pip twine

clean:
	rm -rf venv
	rm -rf build
	rm -rf dist
	rm -rf src/*.egg-info

.PHONY: dist
dist: venv
	rm -rf build
	rm -rf dist
	rm -rf src/*.egg-info
	source venv/bin/activate ; python setup.py sdist bdist_wheel

twine-test: dist
	source venv/bin/activate ; python -m twine upload --repository testpypi dist/* -u __token__
