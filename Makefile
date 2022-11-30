BUILD=build
examples := $(wildcard examples/*.yaml)
roadmapContainer := containers/roadmap.yaml
activityOntology := names/activity.ontology.yaml
$(OBJFILES) : Makefile

default:
	$(MAKE) $(BUILD)/roadmap.ttl
	$(MAKE) $(BUILD)/Activity.svg
	$(MAKE) $(BUILD)/activity.ontology.schema.json

# build the roadmap as turtle
$(BUILD)/roadmap.ttl: $(roadmapContainer) $(activityOntology)
	@ mkdir -p $(BUILD)
	@ # convert to ttl using linkml-convert
	linkml-convert -s $(activityOntology) $(roadmapContainer) -o $@

# svg diagram of activity ontology
$(BUILD)/Activity.svg: $(roadmapContainer) $(activityOntology)
	gen-yuml names/activity.ontology.yaml -f svg -d build/   

$(BUILD)/activity.ontology.schema.json: $(activityOntology)
	gen-json-schema $? | jq . > $@

clean:
	@ rm -rf $(BUILD)
