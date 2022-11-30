BUILD=build
examples := $(wildcard examples/*.yaml)
roadmapContainer := containers/roadmap.yaml
activityOntology := names/activity.ontology.yaml
$(OBJFILES) : Makefile

MAKEFLAGS := --jobs=$(shell nproc)

default: \
	$(BUILD)/roadmap.rdf \
	$(BUILD)/roadmap.ttl \
	$(BUILD)/roadmap.yaml \
	$(BUILD)/roadmap.json \
	$(BUILD)/Activity.svg \
	$(BUILD)/activity.ontology.schema.json \
	$(BUILD)/activity.ontology.md \
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

$(BUILD)/activity.ontology.md: $(BUILD) $(activityOntology)
	gen-markdown -i -d $(BUILD)/markdown $(activityOntology)

clean:
	@ rm -rf $(BUILD)
