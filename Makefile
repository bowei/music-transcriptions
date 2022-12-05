LILYPOND_FILES := $(shell find . -name \*.ly)
OUTPUT_FILES := $(LILYPOND_FILES:.ly=.pdf)

all: $(OUTPUT_FILES)

.PHONY: clean
clean:
	rm -f $(OUTPUT_FILES)

%.pdf : %.ly
	@echo "[BUILD] $< -> $@"
	lilypond -o $(@:.pdf=) $<

