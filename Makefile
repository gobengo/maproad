BUILD=build
examples := $(wildcard examples/*.yaml)
roadmapContainer := roadmap.yaml
activityOntology := names/activity.ontology.yaml
$(OBJFILES) : Makefile

MAKEFLAGS := --jobs=$(shell nproc)

default: \
	examples/build \
	$(BUILD)/roadmap.rdf \
	$(BUILD)/roadmap.ttl \
	$(BUILD)/roadmap.yaml \
	$(BUILD)/roadmap.json \
	$(BUILD)/Activity.svg \
	$(BUILD)/activity.ontology.schema.json \
	$(BUILD)/markdown/* \
	$(BUILD)/activity.ontology.owl.ttl \
	$(BUILD)/activity.ontology.jsonld

$(BUILD):
	@ mkdir -p $(BUILD)

# build the roadmap as turtle
$(BUILD)/roadmap.rdf: $(BUILD) $(roadmapContainer) $(activityOntology)
	linkml-convert -t rdf -s $(activityOntology) $(roadmapContainer) -o $@

# build the roadmap as turtle
$(BUILD)/roadmap.ttl: $(BUILD) $(roadmapContainer) $(activityOntology)
	linkml-convert -t ttl -s $(activityOntology) $(roadmapContainer) -o $@

$(BUILD)/roadmap.yaml: $(BUILD) $(roadmapContainer) $(activityOntology)
	linkml-convert -t yaml -s $(activityOntology) $(roadmapContainer) -o $@

$(BUILD)/roadmap.json: $(BUILD) $(roadmapContainer) $(activityOntology)
	linkml-convert -t json -s $(activityOntology) $(roadmapContainer) -o $@

$(BUILD)/roadmap.jsonld: $(BUILD) $(roadmapContainer) $(activityOntology)
	linkml-convert -t json-ld -s $(activityOntology) $(roadmapContainer) -o $@

# svg diagram of activity ontology
$(BUILD)/Activity.svg: $(BUILD) $(roadmapContainer) $(activityOntology)
	gen-yuml names/activity.ontology.yaml -f svg -d build/   

$(BUILD)/activity.ontology.schema.json: $(BUILD) $(activityOntology)
	gen-json-schema $(activityOntology) | jq . > $@

$(BUILD)/activity.ontology.owl.ttl: $(BUILD) $(activityOntology)
	gen-owl $(activityOntology) > $@

$(BUILD)/activity.ontology.jsonld: $(BUILD) $(activityOntology)
	gen-jsonld-context $(activityOntology) > $@

$(BUILD)/markdown/%: $(activityOntology)
	gen-markdown -i -d $(BUILD)/markdown/ $(activityOntology)
	touch $@

examples/build: $(activityOntology) $(roadmapContainer) $(BUILD)
	$(MAKE) build/*
	rm -rf examples/build
	mkdir -p examples/build
	cp -a $(BUILD)/* examples/build/

clean:
	@ rm -rf $(BUILD)
