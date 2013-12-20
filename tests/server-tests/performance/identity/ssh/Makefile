# Example Makefile for RHTS
# This example is geared towards a test for a specific package
# It does most of the work for you, but may require further coding

# The toplevel namespace within which the test lives.
# FIXME: You will need to change this:
TOPLEVEL_NAMESPACE=/performance

# The name of the package under test:
# FIXME: you wil need to change this:
PACKAGE_NAME=identity

# The path of the test below the package:
# FIXME: you wil need to change this:
RELATIVE_PATH=ssh

# Version of the Test. Used with make tag.
export TESTVERSION=1.0

# The compiled namespace of the test.
export TEST=$(TOPLEVEL_NAMESPACE)/$(PACKAGE_NAME)/$(RELATIVE_PATH)

.PHONY: all install download clean

FILES=$(METADATA) \
	runtest.sh \
	Makefile \
	ssh-keys \
	bashrc.sh


run: $(FILES) build
	./runtest.sh

build: $(BUILT_FILES)
	chmod a+x ./runtest.sh

# Include Common Makefile
include /usr/share/rhts/lib/rhts-make.include

# Generate the testinfo.desc here:
$(METADATA): Makefile
	@touch $(METADATA)
	@echo "Owner:        Jiri Hladky <jhladky@redhat.com>" > $(METADATA)
	@echo "Name:         $(TEST)" >> $(METADATA)
	@echo "Path:         $(TEST_DIR)"	>> $(METADATA)
	@echo "TestVersion:  $(TESTVERSION)"	>> $(METADATA)
	@echo "Description:  Test">> $(METADATA)
	@echo "TestTime:     4h" >> $(METADATA)
	@echo "RunFor:       $(PACKAGE_NAME)" >> $(METADATA)
	@echo "Requires:     $(PACKAGE_NAME)" >> $(METADATA)
# You may need other fields here; see the documentation
	@echo "Releases:      -RHEL2.1" >> $(METADATA)
	@echo "Architectures: i386 x86_64 ia64 ppc ppc64" >> $(METADATA)
	@echo "Confidential:  no" >> $(METADATA)
	@echo "Priority:      Normal" >> $(METADATA)
	@echo "Type:          Certification" >> $(METADATA)
	@echo "RunFor:        none" >> $(METADATA)
	@echo "License:       NDA" >> $(METADATA)
