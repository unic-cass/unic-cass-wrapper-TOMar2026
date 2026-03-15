NAME = unic_cass_wrapper_2x2
TOP = unic_cass_wrapper_analog/unic_cass_wrapper_2x2
TAG = $(TOP)_tag
PROJECT_DIR = ../..
LIBRELANE_DIR ?= $(PROJECT_DIR)/librelane
PDK_ROOT = $(PROJECT_DIR)/IHP-Open-PDK
PDK=ihp-sg13g2

CONFIG_FILE = $(PROJECT_DIR)/$(TOP)/config.json

.PHONY: all
all: librelane make_analog_padring view_results

librelane: final/gds/$(NAME).gds
.PHONY: librelane

final/gds/$(NAME).gds:
	# Run librelane to generate the layout
	nix-shell --pure $(LIBRELANE_DIR) --run "PDK_ROOT=$(PDK_ROOT) PDK=$(PDK) librelane --run-tag $(TAG) --overwrite --manual-pdk $(CONFIG_FILE) --to OpenROAD.GeneratePDN"

.PHONY: make_analog_padring
make_analog_padring:
	# Create analog padring
	nix-shell --pure $(LIBRELANE_DIR) --run "PDK_ROOT=$(PDK_ROOT) PDK=$(PDK) librelane --run-tag $(TAG)_padring --manual-pdk --from Magic.StreamOut --to Magic.SpiceExtraction --with-initial-state $(PROJECT_DIR)/$(TOP)/runs/$(TAG)/17-openroad-padring/state_out.json $(CONFIG_FILE)" 

	# copy final results to top directory
	rm -rf $(PROJECT_DIR)/$(TOP)/final
	cp -r $(PROJECT_DIR)/$(TOP)/runs/$(TAG)_padring/final $(PROJECT_DIR)/$(TOP)

.PHONY: view_results
view_results: 
	# View the results in KLayout
	nix-shell --pure $(LIBRELANE_DIR) --run "PDK_ROOT=$(PDK_ROOT) PDK=$(PDK) librelane --last-run --manual-pdk $(CONFIG_FILE) --flow OpenInOpenROAD"
