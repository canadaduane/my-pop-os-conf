#include <stdio.h>
#include <stdlib.h>
#include <linux/input.h>

int main(void) {
    setbuf(stdin, NULL), setbuf(stdout, NULL);

    struct input_event event;
    while (fread(&event, sizeof(event), 1, stdin) == 1) {
        if (event.type == EV_KEY) {
            if (event.code == KEY_LEFTMETA)
                event.code = KEY_LEFTCTRL;
            else if (event.code == KEY_RIGHTMETA)
                event.code = KEY_RIGHTCTRL;
        } 

        fwrite(&event, sizeof(event), 1, stdout);
    }
}
