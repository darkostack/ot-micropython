PLATFORM = posix

VERBOSITY ?= 0

# set verbosity
ifeq ($(v),1)
VERBOSITY = 1
endif

all:

ot:
	@cd third_party/openthread && ./bootstrap
	@cd third_party/openthread && make -s -f examples/Makefile-$(PLATFORM)

mp:
ifeq ($(PLATFORM),posix)
	@rm -rf third_party/micropython/ot/include/openthread
	@cp -R third_party/openthread/output/include/openthread third_party/micropython/ot/include
	@cd third_party/micropython/ports/unix && make V=$(VERBOSITY) clean all
endif

clean:
	-rm -rf third_party/openthread/build
	-rm -rf third_party/openthread/output
ifeq ($(PLATFORM),posix)
	-rm -rf third_party/micropython/ports/unix/build
endif
