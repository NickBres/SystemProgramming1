
# files: basicClassification,advancedClassificationLoop,advancedClassificationRecursion
BASIC = basicClassification
LOOP = advancedClassificationLoop
REC = advancedClassificationRecursion

all: loops recursives recursived loopd mains maindloop maindrec


mains: mainl.o $(BASIC).o $(LOOP).o recursives
	gcc  mainl.o  $(BASIC).o $(LOOP).o -o mains

maindloop: mainl.o $(BASIC).o $(LOOP).o  loopd
	gcc  mainl.o  $(BASIC).o $(LOOP).o -o maindloop

maindrec: mainr.o $(BASIC).o $(REC).o recursived
	gcc  mainr.o  $(BASIC).o $(REC).o -o maindrec

mainl.o: main.c loops loopd
	gcc -Wall -c main.c -L. -lclassloops -o mainl.o
mainr.o: main.c recursives recursived
	gcc -Wall -c main.c -L. -lclassrec -o mainr.o	

loops: $(BASIC).o $(LOOP).o
	ar rc libclassloops.a $(BASIC).o $(LOOP).o -o libclassloops.a
	#ranlib libclassloops.a

recursives: $(BASIC).o $(REC).o
	ar rc libclassrec.a $(BASIC).o $(REC).o -o libclassrec.a
    	#ranlib libclassrec.a

recursived: $(BASIC).o $(REC).o
	gcc -shared -Wall $(BASIC).o $(REC).o -o libclassrec.so
	export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH

loopd: $(BASIC).o $(LOOP).o
	gcc -shared -Wall $(BASIC).o $(LOOP).o -o libclassloops.so
	export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH


$(BASIC).o: $(BASIC).c
	gcc -Wall -c $(BASIC).c -o $(BASIC).o

$(LOOP).o: $(LOOP).c
	gcc -Wall -c $(LOOP).c -o $(LOOP).o 

$(REC).o: $(REC).c
	gcc -Wall -c $(REC).c -o $(REC).o 

clean:
	rm  *.o *.a *.exe *so
