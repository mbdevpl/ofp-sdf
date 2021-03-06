# Usage:
#
# If the OFP_HOME environment variable contains the path to the Open Fortran Parser,
# then this Makefile transforms the coarray Fortran (CAF) source defined in SOURCE 
# environment variable into the OpenCoarrays CAF (OCAF) dialect printed to the 
# standard output.  Most commonly, one sets SOURCE on the command line that invokes
# "make":
#
#    make SOURCE=foo.f90 check > ocaf-foo.f90
#    make clean
#
# Alternatively, one can set OFP_HOME also in the "make" invocation: 
#
#    make SOURCE=foo.f90 OFP_HOME=/opt/ofp-sdf check >  ocaf-foo.f90
#    make OFP_HOME=/opt/ofp-sdf clean
#

OFP_HOME=/Users/rasmus/ofp-sdf
SOURCE=testfile.f90

ifeq ($(OFP_HOME),)
  $(error Usage: make SOURCE=foo.f90 OFP_HOME=/path/to/ofp-sdf check >  ocaf-foo.f90)
endif

include $(OFP_HOME)/make.inc

SYNTAX_DIR = $(OFP_HOME)/fortran/syntax
TRANS_DIR  = $(OFP_HOME)/fortran/trans
PP_DIR     = $(OFP_HOME)/fortran/pp

TBL     = $(SYNTAX_DIR)/Fortran.tbl
TO_SIM  = $(TRANS_DIR)/ofp-simplify
TO_FAST = $(TRANS_DIR)/ofp2fast
TO_PP   = $(TRANS_DIR)/fast2pp
PP      = $(PP_DIR)/Fortran.pp

CFLAGS = $(ST_CFLAGS)  -I $(SYNTAX_DIR) -I $(TRANS_DIR)
LDFLAGS = $(ST_LDFLAGS) -la stratego-lib

## Fortran targets
#  ---------------

FC = ifort
FCFLAGS = -g -I $(FOR_OCL_DIR)

%.o: %.f90
	@echo 'Building for OS $(OSUPPER) file: $<'
	$(FC) -c $(FCFLAGS) -o $@ $<


all : fast-to-ocr

caf-lower : caf-lower.str
	$(ST_PATH)/strc -i caf-lower.str $(CFLAGS) $(LDFLAGS) --main io-caf-lower

fast-to-ocr : fast-to-ocr.str
	$(ST_PATH)/strc -i fast-to-ocr.str $(CFLAGS) $(LDFLAGS) --main io-fast-to-ocr

check : fast-to-ocr
	@$(ST_PATH)/sglri -p $(TBL) -i $(SOURCE)| $(TO_FAST) | ./fast-to-ocr | $(TO_PP) | $(ST_PATH)/ast2text -p $(PP)

check-orig : fast-to-ocr
	@$(ST_PATH)/sglri -p $(TBL) -i $(SOURCE).orig | $(TO_FAST) | ./fast-to-ocr | $(TO_PP) | $(ST_PATH)/ast2text -p $(PP)

check-fast : fast-to-ocr
	$(ST_PATH)/sglri -p $(TBL) -i $(SOURCE) | $(TO_FAST) | $(ST_PATH)/pp-aterm

check-last : fast-to-ocr
	$(ST_PATH)/sglri -p $(TBL) -i $(SOURCE) | $(TO_FAST) | ./fast-to-ocr | $(ST_PATH)/pp-aterm

check-lower : caf-lower
	$(ST_PATH)/sglri -p $(TBL) -i $(SOURCE) | $(TO_FAST) | ./caf-lower | $(TO_PP) | $(ST_PATH)/ast2text -p $(PP)

check-pp :
	$(ST_PATH)/sglri -p $(TBL) -i $(SOURCE) | $(TO_FAST) | ./fast-to-ocr | ast2text -p ../pp/ocr.pp


clean :
	rm -f caf-lower caf-lower.c
	rm -f fast-to-ocr fast-to-ocr.c
	rm -f *.o *.lo *.dep .libs/*.o
