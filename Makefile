# Makefile for LuaLaTeX project

# Variables
MAIN_TEX = thesis.tex
PARTS_DIR = parts
IMAGES_DIR = figures
AUXFILES = *.aux *.log *.out *.toc *.bbl *.blg *.run.xml *.bcf *.lof *.lot *.idx

# Find all .tex files in the IMAGES_DIR
IMAGE_TEX_FILES = $(wildcard $(IMAGES_DIR)/*.tex)

# Generate corresponding .pdf targets
IMAGE_PDF_FILES = $(IMAGE_TEX_FILES:.tex=.pdf)

all: $(MAIN_TEX) $(IMAGE_PDF_FILES)
	@echo "Compiling LaTeX document..."
	lualatex -shell-escape $(MAIN_TEX)
	biber $(basename $(MAIN_TEX))
	lualatex -shell-escape $(MAIN_TEX)
	lualatex -shell-escape $(MAIN_TEX)
	@echo "Compilation finished."
	make clean

$(IMAGES_DIR)/%.pdf: $(IMAGES_DIR)/%.tex
	cd $(IMAGES_DIR) && lualatex -shell-escape $(notdir $<)

clean:
	@echo "Cleaning up..."
ifeq ($(OS),Windows_NT)
	del /Q $(AUXFILES)
	del /Q $(PARTS_DIR)\$(AUXFILES)
	del /Q $(IMAGES_DIR)\$(AUXFILES)
else
	rm -f $(AUXFILES)
	rm -f $(PARTS_DIR)/$(AUXFILES)
	rm -f $(IMAGES_DIR)/$(AUXFILES)
endif
	@echo "Clean up finished."

.PHONY: all clean
