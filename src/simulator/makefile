TARGET = data/primos.asm

default: main

.PHONY: main
main: main.exe data/text.bin data/data.bin
	echo "--- # Simulating MIPS"
	./main.exe data/text.bin data/data.bin
	echo "..."

.PHONY: main.c tdd
main.exe: tdd main.c
	gcc main.c -o main.exe -ansi -Wall

tdd:
	gcc test.c -o test.exe -ansi -Wall
	./test.exe

data/text.bin: $(TARGET)
	mars a $(TARGET) mc CompactTextAtZero dump .text Binary data/text.bin

data/data.bin: $(TARGET)
	mars a $(TARGET) mc CompactTextAtZero dump .data Binary data/data.bin

.PHONY: $(TARGET)
