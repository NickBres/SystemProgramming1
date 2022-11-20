CC = gcc
CFLAGS = -Wall -Wextra 

CFILESLOOP = basicClassification.c advancedClassificationLoop.c
CFILESREC = basicClassification.c advancedClassificationRecursion.c
OBJECTSLOOP = basicClassification.o advancedClassificationLoop.o
OBJECTSREC = basicClassification.o advancedClassificationRecursion.o

all: loops recursives recursived loopd mains maindloop maindrec

#-------extraction files-------
mains: mainl.o libclassloops.a
	$(CC)  mainl.o   -L. -lclassloops -o mains
maindloop: mainl.o libclassloops.so
	$(CC)  mainl.o   -L. -lclassloops -o maindloop
maindrec: mainr.o  libclassrec.so
	$(CC)  mainr.o  -L. -lclassrec -o maindrec
#------------------------------


#-------main o files-------
mainl.o: main.c
	$(CC) $(CFLAGS) -c $^ -o $@
mainr.o: main.c
	$(CC) $(CFLAGS) -c $^ -o $@
#------------------------------

#-------other o files-------
%.o:%.c
	$(CC) $(CFLAGS) -c $^ -o $@	
#------------------------------

#-------static libraries-------
libclassloops.a: $(OBJECTSLOOP)
	ar rc $@ $(OBJECTSLOOP) 
libclassrec.a: $(OBJECTSREC) 
	ar rc $@ $(OBJECTSREC) 
#------------------------------

#-------dynamic libraries-------
libclassrec.so: $(OBJECTSREC) 
	$(CC) -shared $(CFLAGS) $(OBJECTSREC)  -o $@
	export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
libclassloops.so: $(OBJECTSLOOP)
	$(CC) -shared $(CFLAGS) $(OBJECTSLOOP) -o $@
	export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
#------------------------------

loops: libclassloops.a
recursives: libclassrec.a
recursived: libclassrec.so
loopd: libclassloops.so

clean:
	rm  *.o *.a *so mains maindloop maindrec
