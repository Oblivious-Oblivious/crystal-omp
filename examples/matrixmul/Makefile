NAME = matrixmul

CC = clang
FLAGS = -c -fopenmp

INPUT = $(NAME).c
OUTPUT = $(NAME).o

compile:
	$(CC) $(FLAGS) -o $(OUTPUT) $(INPUT)
	crystal build test.cr
	./test

clean:
	$(RM) -r $(OUTPUT) *.dwarf test Cmat*
