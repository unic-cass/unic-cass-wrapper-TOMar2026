MAKEFLAGS+=--warn-undefined-variables

designs = $(shell find * -maxdepth 0 -type d)
TAG ?= user_project_run
PROJECT_DIR = ../
current_design = null

LIBRELANE_DIR ?= $(PROJECT_DIR)/librelane
PDK_ROOT = $(PROJECT_DIR)/IHP-Open-PDK
PDK=ihp-sg13g2

list:
	@echo $(designs)

ifeq ($(VIEW_RESULTS),1)
.PHONY: $(designs)
$(designs): export current_design=$@
$(designs):
	# View the results in KLayout
	nix-shell --pure $(LIBRELANE_DIR) --run "PDK_ROOT=$(PDK_ROOT) PDK=$(PDK) librelane --last-run --manual-pdk $(current_design)/config.json --flow OpenInOpenROAD"

else 
.PHONY: $(designs)
$(designs): export current_design=$@
$(designs):
	# Run librelane to generate the layout
	nix-shell --pure $(LIBRELANE_DIR) --run "PDK_ROOT=$(PDK_ROOT) PDK=$(PDK) librelane --run-tag $(TAG) --overwrite --manual-pdk $(current_design)/config.json"
	# copy final results to top directory
	rm -rf $(current_design)/final
	cp -r $(current_design)/runs/$(TAG)/final $(current_design)/final
 
endif