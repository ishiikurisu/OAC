TARGET = data/primos.asm

default: main

.PHONY: main
main: main.exe data/text.bin data/data.bin
	./main.exe data/text.bin data/data.bin

.PHONY: main.c tdd
main.exe: tdd main.c
	gcc main.c -o main.exe -g -ansi -Wall

tdd:
	gcc test.c -o test.exe -g -ansi -Wall
	./test.exe

data/text.bin:
	mars a $(TARGET) dump .text Binary data/text.bin

data/data.bin:
	mars a $(TARGET) dump .text Binary data/data.bin
