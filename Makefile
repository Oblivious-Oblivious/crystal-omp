NAME = matrixmul

CC = clang
FLAGS = -c -fopenmp

INPUT = $(NAME).c
OUTPUT = $(NAME).o

compile:
	$(CC) $(FLAGS) -o $(OUTPUT) $(INPUT)

crystal:
	crystal build test.cr

clean:
	$(RM) -r $(OUTPUT) *.dwarf test Cmat*
