PICO_TOOLCHAIN_PATH ?= ~/.pico-sdk/toolchain/13_2_Rel1
CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp
LD=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-ld
CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as
SRC=main.c
OBJS=$(patsubst %.c,%.o,$(SRC))
all: firmware.elf

main.i : main.c
	$(CPP) main.c > main.i
main.s: main.i
	$(CC) -S main.i
%.o: %.s
	$(AS) $< -o $@
firmware.elf: $(OBJS)
	$(LD) -o $@ $^
hello.txt:
	echo "hello world!" > hello.txt
clean:
	rm -f main.i main.s hello.txt main.o firmware.elf
.PHONY : clean all


