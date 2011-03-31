TARGET  = interim
FIGURES =                             \
          robot-software-all.eps      \
          robot-software-vision.eps   \
          sync-img.eps                \
          unsync-img.eps              \
          sync-scope.eps              \
          unsync-scope.eps            \
          stereo-dist.eps             \
          stereo-both.eps             \
          line-orig.eps               \
          line-pre.eps                \
          line-filter.eps             \
          line-max.eps
TRASH   = $(TARGET).aux               \
          $(TARGET).log               \
          $(TARGET).dvi               \
          $(TARGET).pdf

GEN_DIR     = include
GEN_FIGURES = $(addprefix $(GEN_DIR)/,$(FIGURES))

.PHONY: all clean
.SUFFIXES:
.SECONDARY:

$(TARGET).pdf : $(GEN_FIGURES)

$(GEN_DIR) :
	mkdir -p $(GEN_DIR)

all : $(TARGET).pdf

clean :
	$(RM) $(TRASH) $(GEN_FIGURES)

%.pdf : %.tex
	latex -interaction=nonstopmode $(basename $<)
	latex -interaction=nonstopmode $(basename $<)
	dvipdf $(basename $<)

$(GEN_DIR)/%.eps : figures/%.plt $(GEN_DIR)
	gnuplot $<

$(GEN_DIR)/%.eps : figures/%.png $(GEN_DIR)
	convert -background white $< $@

$(GEN_DIR)/%.eps : figures/%.jpg $(GEN_DIR)
	convert $< $@

$(GEN_DIR)/%.eps : figures/%.dot $(GEN_DIR)
	dot -Teps -o$@ $<

