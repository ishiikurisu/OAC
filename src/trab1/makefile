default: main

.PHONY: main
main: main.exe
	./main.exe

main.exe: main.c mips.h
	gcc main.c -o main.exe -O2 -lm
