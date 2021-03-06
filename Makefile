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
	@rm -rf tmp
	@rm -rf third_party/micropython/ot/include/openthread
	@cp -R third_party/openthread/output/include/openthread third_party/micropython/ot/include
	@rm -rf third_party/micropython/ot/lib
ifeq ($(PLATFORM),posix)
	@cp -R third_party/openthread/output/x86_64-apple-darwin/lib third_party/micropython/ot
	@cd third_party/micropython/ports/unix && make V=$(VERBOSITY) clean all
else
	@cp -R third_party/openthread/output/$(PLATFORM)/lib third_party/micropython/ot
endif

clean:
	-rm -rf third_party/openthread/build
	-rm -rf third_party/openthread/output
	-rm -rf tmp
ifeq ($(PLATFORM),posix)
	-rm -rf third_party/micropython/ports/unix/build
else
	-rm -rf third_party/micropython/ports/$(PLATFORM)
endif
