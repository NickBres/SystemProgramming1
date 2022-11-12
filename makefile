
# files: basicClassification,advancedClassificationLoop,advancedClassificationRecursion
FILENAME = advancedClassificationRecursion
	
$(FILENAME).exe: $(FILENAME).o
	gcc -o $(FILENAME).exe $(FILENAME).o
	
$(FILENAME).o: $(FILENAME).c
	gcc -c $(FILENAME).c -Wall
	
clean:
	$(FILENAME).exe $(FILENAME).o
