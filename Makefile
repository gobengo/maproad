BUILD=build
examples := $(wildcard examples/*.yaml)
roadmap := ipfs.roadmap.yaml
planningModel := planning.model.yaml
$(OBJFILES) : Makefile

MAKEFLAGS := --jobs=$(shell nproc)

default: \
	examples/build \
	$(BUILD)/planning/* \
	$(BUILD)/planning/typescript \
	$(BUILD)/planning/planning.model.sssom.tsv

$(BUILD):
	@ mkdir -p $(BUILD)

$(BUILD)/planning:
	@ mkdir -p $(BUILD)/planning

$(BUILD)/planning/planning.model.sssom.tsv: $(BUILD) $(planningModel)
	gen-sssom $(planningModel) -o $@

$(BUILD)/planning/*: $(BUILD)/planning $(planningModel)
	gen-project -d build/planning/ planning.model.yaml

$(BUILD)/planning/typescript: $(BUILD)/planning $(planningModel)
	gen-typescript $(planningModel) > $(BUILD)/planning/planning.model.ts

examples/build: $(planningModel) $(BUILD)/planning/*
	$(MAKE) build/*
	rm -rf examples/build
	mkdir -p examples/build
	cp -a $(BUILD)/* examples/build/

clean:
	@ rm -rf $(BUILD)
