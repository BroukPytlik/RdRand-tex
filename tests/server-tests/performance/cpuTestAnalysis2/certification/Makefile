TOPLEVEL_NAMESPACE=/performance

PACKAGE_NAME=cpuTestAnalysis2

RELATIVE_PATH=certification

export TESTVERSION=1.1

export TEST=$(TOPLEVEL_NAMESPACE)/$(PACKAGE_NAME)/$(RELATIVE_PATH)

BUILT_FILES=

.PHONY: all install download clean

run: $(FILES) build
	./runtest.sh 2>&1 >> run.log

build: $(BUILT_FILES)
	chmod a+x ./runtest.sh

FILES=$(METADATA) \
	runtest.sh \
	perf_record.sh \
	Makefile \
	Benchmark-utils/

include /usr/share/rhts/lib/rhts-make.include

# Generate the testinfo.desc here:
$(METADATA): Makefile
	@touch $(METADATA)
	@echo "Owner:        Kamil Kolakowski <kkolakow@redhat.com>" > $(METADATA)
	@echo "Name:         $(TEST)" >> $(METADATA)
	@echo "Path:         $(TEST_DIR)"	>> $(METADATA)
	@echo "TestVersion:  $(TESTVERSION)"	>> $(METADATA)
	@echo "Description:  linpack and stream test with semaphores">> $(METADATA)
	@echo "TestTime:     100h" >> $(METADATA)
	@echo "Requires:     sysstat" >> $(METADATA)
	@echo "Requires:     numactl" >> $(METADATA)
	@echo "Requires:     hwloc" >> $(METADATA)
	@echo "Requires:     hwloc-devel" >> $(METADATA)
	@echo "Requires:     nfs-utils" >> $(METADATA)
	@echo "Requires:     perf" >> $(METADATA)
	@echo "Requires:     cpupowerutils" >> $(METADATA)
	@echo "Requires:     rpmdevtools" >> $(METADATA)
	
# You may need other fields here; see the documentation
	@echo "Releases:      -RHEL5" >> $(METADATA)
	@echo "Architectures: x86_64" >> $(METADATA)
	@echo "Confidential:  no" >> $(METADATA)
	@echo "Priority:      Normal" >> $(METADATA)
	@echo "Type:          Certification" >> $(METADATA)
	@echo "RunFor:        none" >> $(METADATA)
	@echo "License:       NDA" >> $(METADATA)
