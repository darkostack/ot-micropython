PLATFORM = posix

all:

ot:
	@cd third_party/openthread && ./bootstrap
	@cd third_party/openthread && make -s -f examples/Makefile-$(PLATFORM)

mp:
ifeq ($(PLATFORM),posix)
	@rm -rf third_party/micropython/ports/unix/include
	@cp -R third_party/openthread/output/include third_party/micropython/ports/unix
	@cd third_party/micropython/ports/unix && make clean all
endif

clean:
	-rm -rf third_party/openthread/build
	-rm -rf third_party/openthread/output
ifeq ($(PLATFORM),posix)
	-rm -rf third_party/micropython/ports/unix/build
endif
