CC = gcc
CFLAGS = -Wall -Wextra 

CFILESLOOP = basicClassification.c advancedClassificationLoop.c
CFILESREC = basicClassification.c advancedClassificationRecursion.c
OBJECTSLOOP = basicClassification.o advancedClassificationLoop.o
OBJECTSREC = basicClassification.o advancedClassificationRecursion.o

all:  mains maindloop maindrec loops recursives recursived loopd

#-------extraction files-------
mains: main.o libclassloops.a
	$(CC)  main.o  -L. -lclassloops -o mains
maindloop: main.o libclassloops.so
	$(CC)  main.o  -L. -lclassloops -o maindloop
maindrec: main.o libclassloops.so
	$(CC)  main.o  -L. -lclassrec -o maindrec
#------------------------------



#------- o files-------
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
