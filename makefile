basicClassification.exe: basicClassification.o
	gcc -o basicClassification.exe basicClassification.o
	
basicClassification.o: basicClassification.c
	gcc -c basicClassification.c -Wall
	
clean:
	basicClassification.exe basicClassification.o
