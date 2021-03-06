# Make file for Profiler

###############################################################
# Variables
CPP      = g++
#CPP_OPTS = -g -Wall
CPP_OPTS = -g -Wall -W -Wunused -Wuninitialized -Wshadow 

###############################################################
# The first rule is run of only make is typed
msg:
	@echo 'Targets are:'
	@echo '  profiler:'
	@echo '  sorting:'
	@echo '  p-sorting:'    
	@echo '  gprof:'
	@echo '  clean:'

###############################################################
profiler : main.o ASTree.o 
	$(CPP) $(CPP_OPTS) -o profiler main.o ASTree.o 
  
main.o : main.cpp ASTree.hpp
	$(CPP) $(CPP_OPTS) -c main.cpp

ASTree.o   : ASTree.hpp ASTree.cpp
	$(CPP) $(CPP_OPTS) -c ASTree.cpp

#==============================================================
# sorting
sorting : sort.o sort_lib.o
	$(CPP) $(CPP_OPTS) -o sorting sort.o sort_lib.o

sort.o: sort_lib.h sort.cpp
	$(CPP) $(CPP_OPTS) -c sort.cpp

sort_lib.o: sort_lib.h sort_lib.cpp
	$(CPP) $(CPP_OPTS) -c sort_lib.cpp

#==============================================================
# p-sort
# p-sort.cpp
# p-sort_lib.cpp

p-sorting : profile.o p-sort.o p-sort_lib.o
	$(CPP) $(CPP_OPTS) -o p-sorting profile.o p-sort.o p-sort_lib.o

p-sort.o: profile.hpp sort_lib.h p-sort.cpp
	$(CPP) $(CPP_OPTS) -c p-sort.cpp

p-sort_lib.o: profile.hpp sort_lib.h p-sort_lib.cpp
	$(CPP) $(CPP_OPTS) -c p-sort_lib.cpp

profile.o: profile.hpp profile.cpp
	$(CPP) $(CPP_OPTS) -c profile.cpp

#==============================================================
# Profiling version of sort
gprof: CPP_OPTS   = -g -Wall -pg
gprof: clean sorting
	@echo -n ''

###############################################################
#This will clean up everything via "make clean"
clean:
	rm -f profiler
	rm -f sorting
	rm -f *.o
	rm -f p-*
	rm -f gmon.out

