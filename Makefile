# -*- mode: makefile-gmake; coding: utf-8 -*-

PYTHON_VER=2

all:
	@ echo "PYTHON_VER=$(PYTHON_VER)"
	$(MAKE) -C src $@

%:
	$(MAKE) -C src $@

.PHONY: clean
clean:
	$(MAKE) -C src $@
	$(RM) -r MANIFEST

install:
	@ echo "PYTHON_VER=$(PYTHON_VER)"
	python$(PYTHON_VER) setup.py install
	@ $(RM) -fr dist
	@ $(RM) -rf gattlib.egg-info


python-2-and-3:
	@ make clean
	make -B
	@ sudo make -B install
	@ make clean
	make -B PYTHON_VER=3
	@ sudo make -B PYTHON_VER=3 install

cleanall: clean
	@ $(RM) -rf build

