./algorithms/vips/vips.sh \
  --archive webis-webseg-20/000000/ \
  --pdoc 5 \
  --url "http://008345152.blog.fc2.com/blog-date-201305.html" \
  --id 000000 \
  --output segmentations

# Convert hierarchical segmentation to a flat one
Rscript cikm20/src/main/r/flatten-segmentations.R \
  --input segmentations/vips.json \
  --output segmentations/vips-flattened.json

#rm segmentations/vips.json

#Rscript algorithms/baseline/src/main/r/segmentation-baseline.R \
#  --input webis-webseg-20/000000/screenshot.png \
#  --output segmentations/baseline.json

# Get BCubed precision, recall, and F-measure
#Rscript cikm20/src/main/r/evaluate-segmentation.R \
#  --algorithm segmentations/baseline.json \
#  --ground-truth webis-webseg-20/000000/ground-truth.json \
#  --size-function pixels \
#  --output segmentations/baseline-pixels.csv


#Rscript cikm20/src/main/r/fit-segmentations-to-dom-nodes.R \
#  --input  segmentations/vips-flattened.json \
#  --output segmentations/fit-segmentations.json \
#  --nodes webis-webseg-20/000000/nodes.csv \
#   make_option("--input", type="character", default=NULL, help="JSON file of segmentations to fit"),
#    make_option("--output", type="character", default=NULL, help="JSON file to which segmentations should be written"),
#    make_option("--nodes", type="character", default=NULL, help="The nodes.csv file that contains the nodes to fit to; default: take the nodes.csv next to the input file."),
#    make_option("--fit-containment-threshold", type="double", default=fit.containment.threshold.default, help=paste("Fitted segments are the minimum axis-aligned rectangles that contain all elements that where contained to at least this percentage in the original rectangle; default=", fit.containment.threshold.default, sep=""), dest="fit.containment.threshold"),
#    make_option("--segmentations", type="character", default=".*", help="Pattern that matches the names of the segmentations that should be fitted (default: .*)"),
#    make_option("--tolerance", type="numeric", default=0, help="Tolerance for simplification; default: 0")


Rscript cikm20/src/main/r/plot-segmentations.R \
  --input segmentations/vips.json \
  --screenshot webis-recipes-archive/000000/page.png \
  --output segmentations/out.png \
  --color-per-segment \
  --frames \
#  --line-width 7 \


Rscript cikm20/src/main/r/plot-segmentation-mask.R\
  --input segmentations/vips.json \
  --output segmentations/out-mask.png

