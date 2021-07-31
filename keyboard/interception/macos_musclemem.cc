#include <stdio.h>
#include <stdlib.h>
#include <linux/input.h>
#include <vector>

typedef enum {
    START,
    FIRST_KEY,
    META_AS_META,
    META_AS_CTRL
} state_t;

typedef enum {
    NOT_MODIFIER,
    SHIFT,
    CTRL,
    ALT,
    META
} modifier_t;

typedef enum {
    NOT_HANDED,
    LEFT,
    RIGHT
} handed_t;

typedef struct input_event event_t;

const int KEY_STROKE_UP = 0, KEY_STROKE_DOWN = 1, KEY_STROKE_REPEAT = 2;

event_t syn_event = {
    .time = { .tv_sec = 0, .tv_usec = 0},
    .type = EV_SYN,
    .code = SYN_REPORT,
    .value = KEY_STROKE_UP
};

modifier_t getModifier(int code) {
    switch (code) {
        case KEY_LEFTSHIFT: case KEY_RIGHTSHIFT: return SHIFT;
        case KEY_LEFTCTRL:  case KEY_RIGHTCTRL:  return CTRL;
        case KEY_LEFTALT:   case KEY_RIGHTALT:   return ALT;
        case KEY_LEFTMETA:  case KEY_RIGHTMETA:  return META;
        default:
            return NOT_MODIFIER;
    }
}

handed_t getHanded(int code) {
    switch (code) {
        case KEY_LEFTSHIFT: case KEY_LEFTCTRL:
        case KEY_LEFTALT: case KEY_LEFTMETA:
            return LEFT;
        
        case KEY_RIGHTSHIFT: case KEY_RIGHTCTRL:
        case KEY_RIGHTALT: case KEY_RIGHTMETA:
            return RIGHT;
        
        default:
            return NOT_HANDED;
    }
}


int getHandedEquivalent(int code, modifier_t result) {
    handed_t h = getHanded(code);

    switch (result) {
        case SHIFT:
            if (h == LEFT) return KEY_LEFTSHIFT;
            else if (h == RIGHT) return KEY_RIGHTSHIFT;
        case CTRL:
            if (h == LEFT) return KEY_LEFTCTRL;
            else if (h == RIGHT) return KEY_RIGHTCTRL;
        case ALT:
            if (h == LEFT) return KEY_LEFTALT;
            else if (h == RIGHT) return KEY_RIGHTALT;
        case META:
            if (h == LEFT) return KEY_LEFTMETA;
            else if (h == RIGHT) return KEY_RIGHTMETA;
    }

    return -1;
}

void write_event(event_t* event) {
    fwrite(event, sizeof(event_t), 1, stdout);
}

event_t event3[3];
void write_event3(event_t* e1, event_t* e2, event_t* e3) {
    event3[0] = *e1;
    event3[1] = *e2;
    event3[2] = *e3;
    fwrite(event3, sizeof(event_t), 3, stdout);
}

int main(void) {
    // Don't buffer stdin or stdout--we want instant reactions
    setbuf(stdin, NULL), setbuf(stdout, NULL);

    state_t state = START;

    event_t meta_pressed_event;

    event_t event;
    while (fread(&event, sizeof(event), 1, stdin) == 1) {
        modifier_t mod = getModifier(event.code);

        switch (state) {    
            case START:
                if (mod == META && event.value == KEY_STROKE_DOWN) {
                    meta_pressed_event = event;
                    state = FIRST_KEY;
                } else {
                    write_event(&event);
                }
            break;

            case FIRST_KEY:
                if (mod == META && event.value == KEY_STROKE_UP) {
                    // If meta key is released here, then just forward the simple
                    // fact that the meta key was pressed:
                    write_event3(&meta_pressed_event, &syn_event, &event);
                    state = START;
                } else if (event.value == KEY_STROKE_DOWN) {
                    if (event.code == KEY_TAB || event.code == KEY_SPACE || event.code == KEY_GRAVE) {
                        write_event3(&meta_pressed_event, &syn_event, &event);
                        state = META_AS_META;
                    } else {
                        meta_pressed_event.code = getHandedEquivalent(
                            meta_pressed_event.code,
                            CTRL);
                        write_event3(&meta_pressed_event, &syn_event, &event);
                        state = META_AS_CTRL;
                    }
                }
            break;

            case META_AS_META:
                if (mod == META && event.value == KEY_STROKE_UP) {
                    write_event(&event);
                    state = START;
                } else {
                    write_event(&event);
                }
            break;

            case META_AS_CTRL:
                if (mod == META && event.value == KEY_STROKE_UP) {
                    event.code = meta_pressed_event.code;
                    write_event(&event);
                    state = START;
                } else {
                    write_event(&event);
                }
            break;
        }
    }
}
