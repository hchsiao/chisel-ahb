CACHE_DIR  = test_run_dir
VLOG       = AHB.v AHB-harness.v
VLOG_DEPS  = $(addprefix $(CACHE_DIR)/,$(VLOG))

$(CACHE_DIR)/%.v:
	-mkdir $(CACHE_DIR)
	sbt 'testOnly ahb.AHBTester'
	cp $(CACHE_DIR)/*/*.v $(CACHE_DIR)

all: $(VLOG_DEPS)
	ls $(CACHE_DIR)

.PHONY: clean
clean:
	-rm -rf $(CACHE_DIR)