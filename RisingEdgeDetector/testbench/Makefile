PLI=/home/edatools/verdi2018/verdi/Verdi_O-2018.09-SP2/share/PLI/VCS/LINUX64/pli.a
NOVASTAB=/home/edatools/verdi2018/verdi/Verdi_O-2018.09-SP2/share/PLI/VCS/LINUX64/novas.tab

VCS_OPTS := -full64 -debug_access+all 
VCS_OPTS := ${VCS_OPTS} -sverilog -lca -kdb -R +vcs+dumpvars+edgedetect.vcd
VCS_OPTS := ${VCS_OPTS} -f filelist

vcs_compile:
	vcs ${VCS_OPTS}
#	vcs -full64 -debug_access+all -sverilog -kdb -R +vcs+dumpvars+upcount.vcd -f filelist
	#vcs -full64 -debug_access+all -LDFLAGS -rdynamic -sverilog -kdb -P ${NOVASTAB} ${PLI} -f filelist

verdi_gui:
	#verdi -ssf edgedetect.vcd.fsdb -nologo &
	verdi -dbdir ./simv.daidir &
clean:
	rm -rf -v csrc simv* ucli.key novas* *vcd vcd2fsdbLog *Log *log vcst_* *fsdb *vpd

all:
	make clean &
	make vcs_compile
	rm -rf *.log
