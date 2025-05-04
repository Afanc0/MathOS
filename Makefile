CC = gcc
AS = nasm
CFLAGS = -ffreestanding -O2 -Wall -Wextra
LDFLAGS = -T linker.ld -nostdlib -lgcc
SOURCES = kernel.c
OBJECTS = $(SOURCES:.c=.o)
KERNEL_BIN = kernel.bin

all: $(KERNEL_BIN)

$(KERNEL_BIN): $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) -o $(KERNEL_BIN)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS) $(KERNEL_BIN)
