BUILD=build
examples := $(wildcard examples/*.yaml)
roadmapContainer := containers/roadmap.yaml
activityOntology := names/activity.ontology.yaml
$(OBJFILES) : Makefile

# build the roadmap as turtle
$(BUILD)/roadmap.ttl: $(roadmapContainer) names/activity.ontology.yaml
	@ # First things first, create the dir if it doesn't exist.
	@ mkdir -p $(BUILD)
	@ # convert to ttl using linkml-convert
	linkml-convert -s $(activityOntology) $(roadmapContainer) -o $@

clean:
	@ rm -rf $(BUILD)
