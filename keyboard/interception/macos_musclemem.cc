#include <stdio.h>
#include <stdlib.h>
#include <libgen.h>
#include <getopt.h>
#include <linux/input.h>

#define DEFAULT_PROGNAME "macos_musclemem"
#define OPTSTR "s:h"
#define USAGE_FMT  "%s [-s] [-h]\n    -s: add SHIFT modifier key to CTRL on intercepted output"
#define MAX_EVENTS 5

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

typedef struct {
  int           with_shift;
} options_t;

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

event_t events[MAX_EVENTS];
void write_event(event_t* event) {
    fwrite(event, sizeof(event_t), 1, stdout);
}

void write_event2(event_t* e1, event_t* e2) {
    events[0] = *e1; events[1] = *e2;
    fwrite(events, sizeof(event_t), 2, stdout);
}

void write_event3(event_t* e1, event_t* e2, event_t* e3) {
    events[0] = *e1; events[1] = *e2; events[2] = *e3;
    fwrite(events, sizeof(event_t), 3, stdout);
}

void write_event4(event_t* e1, event_t* e2, event_t* e3, event_t* e4) {
    events[0] = *e1; events[1] = *e2; events[2] = *e3; events[3] = *e4;
    fwrite(events, sizeof(event_t), 4, stdout);
}


void event_loop(int with_shift) {
    // Don't buffer stdin or stdout--we want instant reactions
    setbuf(stdin, NULL), setbuf(stdout, NULL);

    state_t state = START;

    event_t shift_event;
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
                    if (
                        event.code == KEY_TAB ||
                        event.code == KEY_SPACE ||
                        event.code == KEY_GRAVE
                    ) {
                        write_event3(&meta_pressed_event, &syn_event, &event);
                        state = META_AS_META;
                    } else {
                        meta_pressed_event.code = getHandedEquivalent(
                            meta_pressed_event.code, CTRL);
                        if (!with_shift) {
                            write_event3(&meta_pressed_event, &syn_event, &event);
                        } else {
                            shift_event = meta_pressed_event;
                            shift_event.code = getHandedEquivalent(
                                meta_pressed_event.code, SHIFT);
                            write_event4(&meta_pressed_event, &shift_event, &syn_event, &event);
                        }
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
                    // Release the same key, whether META or CTRL
                    event.code = meta_pressed_event.code;
                    if (!with_shift) {
                        write_event(&event);
                    } else {
                        shift_event.value = KEY_STROKE_UP;
                        write_event2(&shift_event, &event);
                    }
                    state = START;
                } else {
                    write_event(&event);
                }
            break;
        }
    }
}

void usage(char *progname, int opt) {
    fprintf(stderr, USAGE_FMT, progname ? progname : DEFAULT_PROGNAME);
    exit(EXIT_FAILURE);   
}

int main(int argc, char* argv[]) {
    int opt;
    options_t options = { 0 };

    while ((opt = getopt(argc, argv, OPTSTR)) != EOF)
       switch(opt) {
            case 's':
                options.with_shift = 1;
            break;


            case 'h':
            default:
                usage(basename(argv[0]), opt);
            break;
       }

    event_loop(options.with_shift);
}
