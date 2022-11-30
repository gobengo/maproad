BUILD=build
examples := $(wildcard examples/*.yaml)
roadmap := ipfs.roadmap.yaml
planningModel := planning.model.yaml
$(OBJFILES) : Makefile

MAKEFLAGS := --jobs=$(shell nproc)

default: \
	examples/build \
	$(BUILD)/* \
	$(BUILD)/typescript

$(BUILD):
	@ mkdir -p $(BUILD)

$(BUILD)/*: $(BUILD) $(planningModel)
	gen-project -d build/ planning.model.yaml
	touch $@

$(BUILD)/typescript: $(BUILD) $(planningModel)
	gen-typescript $(planningModel) > $(BUILD)/planning.model.ts

examples/build: $(planningModel) $(BUILD)
	$(MAKE) build/*
	rm -rf examples/build
	mkdir -p examples/build
	cp -a $(BUILD)/* examples/build/

clean:
	@ rm -rf $(BUILD)
