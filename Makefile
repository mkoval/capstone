TARGET  = interm
PLOTS   = dist-disparity.tex
FIGURES = navigator-cad.eps \
          sync-img.eps      \
          unsync-img.eps    \
          sync-scope.eps    \
          unsync-scope.eps
TRASH   = $(TARGET).aux     \
          $(TARGET).log     \
          $(TARGET).dvi     \
          $(TARGET).pdf

GEN_DIR     = include
GEN_PLOTS   = $(addprefix $(GEN_DIR)/,$(PLOTS))
GEN_FIGURES = $(addprefix $(GEN_DIR)/,$(FIGURES))

.PHONY: all clean
.SUFFIXES:
.SECONDARY:

$(TARGET).pdf : $(GEN_PLOTS) $(GEN_FIGURES)

$(GEN_DIR) :
	mkdir -p $(GEN_DIR)

all : $(TARGET).pdf

clean :
	$(RM) $(TRASH) $(GEN_PLOTS) $(GEN_FIGURES)

%.pdf : %.tex
	latex -interaction=nonstopmode $(basename $<)
	latex -interaction=nonstopmode $(basename $<)
	dvipdf $(basename $<)

$(GEN_DIR)/%.tex : plots/%.plt $(GEN_DIR)
	gnuplot $<

$(GEN_DIR)/%.eps : figures/%.png $(GEN_DIR)
	convert -background white $< $@
