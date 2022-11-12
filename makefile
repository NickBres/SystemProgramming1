
# files: basicClassification,advancedClassificationLoop,advancedClassificationRecursion
BASIC = basicClassification
LOOP = advancedClassificationLoop
REC = advancedClassificationRecursion

Matala1: main.o $(BASIC).o $(LOOP).o
	gcc main.o $(BASIC).o $(LOOP).o -o Matala1 -Wall

main.o: main.c
	gcc -c main.c -o main.o -Wall

$(BASIC).o: $(BASIC).c
	gcc -c $(BASIC).c -o $(BASIC).o -Wall

$(LOOP).o: $(LOOP).c
	gcc -c $(LOOP).c -o $(LOOP).o -Wall

clean:
	rm Matala1 *.o
