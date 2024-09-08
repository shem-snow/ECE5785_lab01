PICO_TOOLCHAIN_PATH= .pico-sdk
SRC=main.c
OBJS=$(patsubst %.c,%.o,$(SRC))
CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp
LD=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-ld
CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as
main.i : main.c
	$(CPP) main.c > main.i
main.s: main.i
	$(CC) -S main.i
%.o: %.s
	$(AS) $< -o $@
firmware.elf: $(OBJS)
	$(LD) -o $@ $^
all: firmware.elf
hello.txt:
	echo "hello world!" > hello.txt
clean:
	rm -f main.i hello.txt main.o
.PHONY : clean all


