TARGET = data/primos.asm

default: main

.PHONY: main
main: main.exe
	echo "--- # Simulating MIPS"
	./main.exe data/text.bin data/data.bin
	echo "..."

.PHONY: main.c tdd
main.exe: main.c
	gcc main.c -o main.exe -ansi -Wall -g -O2

tdd:
	gcc test.c -o test.exe -ansi -Wall -g -O2
	./test.exe

data/text.bin: $(TARGET)
	mars a $(TARGET) mc CompactTextAtZero dump .text Binary data/text.bin

data/data.bin: $(TARGET)
	mars a $(TARGET) mc CompactTextAtZero dump .data Binary data/data.bin

.PHONY: $(TARGET)
