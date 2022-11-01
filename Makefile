LILYPOND_FILES := $(shell find . -name \*.ly)
OUTPUT_FILES := $(LILYPOND_FILES:.ly=.pdf)

all: $(OUTPUT_FILES)
	echo $(OUTPUT_FILES)

.PHONY: clean
clean:
	rm -f $(OUTPUT_FILES)

%.pdf : %.ly
	lilypond -o $@ $< 
