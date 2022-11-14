CC = gcc
CFLAGS = -Wall -Wextra 

CFILESLOOP = basicClassification.c advancedClassificationLoop.c
CFILESREC = basicClassification.c advancedClassificationRecursion.c
OBJECTSLOOP = basicClassification.o advancedClassificationLoop.o
OBJECTSREC = basicClassification.o advancedClassificationRecursion.o

all: loops recursives recursived loopd mains maindloop maindrec

#-------extraction files-------
mains: mainl.o $(OBJECTSLOOP) 
	$(CC)  mainl.o  $(OBJECTSLOOP) -o mains
maindloop: mainl.o $(OBJECTSLOOP)  
	$(CC)  mainl.o  $(OBJECTSLOOP) -o maindloop
maindrec: mainr.o $(OBJECTSREC) 
	$(CC)  mainr.o  $(OBJECTSREC)  -o maindrec
#------------------------------


#-------main o files-------
mainl.o: main.c
	$(CC) $(CFLAGS) -c $^ -L. -lclassloops -o $@
mainr.o: main.c
	$(CC) $(CFLAGS) -c $^ -L. -lclassrec -o $@
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
