BUILD=build
examples := $(wildcard examples/*.yaml)
roadmap := ipfs.roadmap.yaml
planningModel := planning.model.yaml
$(OBJFILES) : Makefile

MAKEFLAGS := --jobs=$(shell nproc)

default: \
	examples/build \
	$(BUILD)/roadmap.rdf \
	$(BUILD)/roadmap.ttl \
	$(BUILD)/roadmap.yaml \
	$(BUILD)/roadmap.json \
	$(BUILD)/Activity.svg \
	$(BUILD)/planning.model.schema.json \
	$(BUILD)/markdown/* \
	$(BUILD)/planning.model.owl.ttl \
	$(BUILD)/planning.model.jsonld \
	$(BUILD)/planning.py \
	$(BUILD)/planning.model.shex \
	$(BUILD)/planning.model.shacl.ttl

$(BUILD):
	@ mkdir -p $(BUILD)

# build the roadmap as turtle
$(BUILD)/roadmap.rdf: $(BUILD) $(roadmap) $(planningModel)
	linkml-convert -t rdf -s $(planningModel) $(roadmap) -o $@

# build the roadmap as turtle
$(BUILD)/roadmap.ttl: $(BUILD) $(roadmap) $(planningModel)
	linkml-convert -t ttl -s $(planningModel) $(roadmap) -o $@

$(BUILD)/roadmap.yaml: $(BUILD) $(roadmap) $(planningModel)
	linkml-convert -t yaml -s $(planningModel) $(roadmap) -o $@

$(BUILD)/roadmap.json: $(BUILD) $(roadmap) $(planningModel)
	linkml-convert -t json -s $(planningModel) $(roadmap) -o $@

$(BUILD)/roadmap.jsonld: $(BUILD) $(roadmap) $(planningModel)
	linkml-convert -t json-ld -s $(planningModel) $(roadmap) -o $@

# svg diagram of activity ontology
$(BUILD)/Activity.svg: $(BUILD) $(planningModel)
	gen-yuml $(planningModel) -f svg -d build/   

$(BUILD)/planning.model.schema.json: $(BUILD) $(planningModel)
	gen-json-schema $(planningModel) | jq . > $@

$(BUILD)/planning.model.owl.ttl: $(BUILD) $(planningModel)
	gen-owl $(planningModel) > $@

$(BUILD)/planning.model.jsonld: $(BUILD) $(planningModel)
	gen-jsonld-context $(planningModel) > $@

$(BUILD)/planning.model.shex: $(BUILD) $(planningModel)
	gen-shex $(planningModel) > $@

$(BUILD)/planning.model.shacl.ttl: $(BUILD) $(planningModel)
	gen-shacl $(planningModel) > $@

$(BUILD)/doc: $(BUILD) $(planningModel)
	gen-doc -d $@ $(planningModel)

$(BUILD)/planning.py: $(BUILD) $(planningModel)
	gen-python $(planningModel) > $@

$(BUILD)/markdown/%: $(planningModel)
	gen-markdown -i -d $(BUILD)/markdown/ $(planningModel)

examples/build: $(planningModel) $(BUILD)
	$(MAKE) build/*
	rm -rf examples/build
	mkdir -p examples/build
	cp -a $(BUILD)/* examples/build/

clean:
	@ rm -rf $(BUILD)
