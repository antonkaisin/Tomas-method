com=gfortran
ras=f95
files=$(wildcard *.$(ras))
main : $(patsubst %.$(ras), %.o, $(files))
	 $(com) $^ -o $@
%.o : %.$(ras) tomas_mod.mod
	 $(com) -c $<
tomas_mod.mod : tomas_mod.f95
	 $(com) -c $<

