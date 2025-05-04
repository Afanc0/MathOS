#include <stdint.h>

// VGA text mode buffer
uint16_t *video_memory = (uint16_t *)0xB8000;

// Simple function to print a character at a specific position
void print_char(char c, int x, int y) {
    uint16_t *pixel = video_memory + (y * 80 + x);
    *pixel = (0x0F << 8) | c; // 0x0F is the white text color
}

// Simple kernel entry point
void kernel_main(void) {
    const char *message = "Hello, World!";
    int x = 0, y = 0;

    // Print the message character by character
    while (*message) {
        print_char(*message++, x++, y);
        if (x >= 80) {
            x = 0;
            y++;
        }
    }

    // Infinite loop to keep the kernel running
    while (1) {}
}
