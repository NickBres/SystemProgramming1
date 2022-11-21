CC = gcc
CFLAGS = -Wall -Wextra 

CFILESLOOP = basicClassification.c advancedClassificationLoop.c
CFILESREC = basicClassification.c advancedClassificationRecursion.c
OBJECTSLOOP = NumClass.h basicClassification.o advancedClassificationLoop.o
OBJECTSREC = NumClass.h basicClassification.o advancedClassificationRecursion.o

all:  mains maindloop maindrec loops recursives recursived loopd

#-------extraction files-------
mains: main.o libclassloops.a
	$(CC) $(CFLAGS) main.o  -o mains libclassloops.a
maindloop: main.o libclassloops.so
	$(CC) $(CFLAGS) main.o -o maindloop ./libclassloops.so
maindrec: main.o libclassrec.so
	$(CC) $(CFLAGS) main.o -o maindrec ./libclassrec.so
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
libclassloops.so: $(OBJECTSLOOP)
	$(CC) -shared $(CFLAGS) $(OBJECTSLOOP) -o $@
#------------------------------

loops: libclassloops.a
recursives: libclassrec.a
recursived: libclassrec.so
loopd: libclassloops.so

.PHONY: clean all

clean:
	rm  *.o *.a *so mains maindloop maindrec
