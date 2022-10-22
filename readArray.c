#include <stdio.h>
int readArray(int *a, int length) {
    int index = -1;
    int last_pos_found = 0;
    for (int i = 0; i < length; ++i) {
        scanf("%i", &a[i]);
        if (!last_pos_found) {
            if (a[i] > 0) {
                index = i;
            } else {
                last_pos_found = 1;
            }
        }
    }
    return index;
}
