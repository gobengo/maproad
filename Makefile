BUILD=build
examples := $(wildcard examples/*.yaml)
roadmap := ipfs.roadmap.yaml
planningModel := planning.model.yaml
$(OBJFILES) : Makefile

MAKEFLAGS := --jobs=$(shell nproc)

default: \
	examples/build \
	$(BUILD)/* \
	$(BUILD)/typescript \
	$(BUILD)/planning.model.sssom.tsv

$(BUILD):
	@ mkdir -p $(BUILD)

$(BUILD)/planning.model.sssom.tsv: $(BUILD) $(planningModel)
	gen-sssom $(planningModel) -o $@

$(BUILD)/*: $(BUILD) $(planningModel)
	gen-project -d build/ planning.model.yaml

$(BUILD)/typescript: $(BUILD) $(planningModel)
	gen-typescript $(planningModel) > $(BUILD)/planning.model.ts

examples/build: $(planningModel) $(BUILD) $(BUILD)/*
	$(MAKE) build/*
	rm -rf examples/build
	mkdir -p examples/build
	cp -a $(BUILD)/* examples/build/

clean:
	@ rm -rf $(BUILD)
