TARGET  = interim
FIGURES = sync-img.eps                \
          unsync-img.eps              \
          sync-scope.eps              \
          unsync-scope.eps            \
          robot-software-all.eps      \
          robot-software-vision.eps   \
          stereo-disparity-narrow.eps \
          stereo-disparity-wide.eps   \
          stereo-pointcloud.eps
TRASH   = $(TARGET).aux             \
          $(TARGET).log             \
          $(TARGET).dvi             \
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
	#gnuplot $<
	touch $@
	echo "WARNING: gnuplot disabled"

$(GEN_DIR)/%.eps : figures/%.png $(GEN_DIR)
	convert -background white $< $@

$(GEN_DIR)/%.eps : figures/%.dot $(GEN_DIR)
	dot -Teps -o$@ $<

