PICO_TOOLCHAIN_PATH= .pico-sdk
CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp
main.i: main.c
	$(CPP) main.c > main.i
hello.txt:
	echo "hello world!" > hello.txt
clean:
	rm -f main.i hello.txt
.PHONY : clean
CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as
main.s: main.i
	$(CC) -S main.i
main.o: main.s
	$(AS) main.s -o main.o

