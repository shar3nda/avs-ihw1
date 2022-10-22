void fillArray(int *a, int *b, int length, int first_neg_ind) {
    for (int i = 0; i < length; ++i) {
        b[i] = a[first_neg_ind + i];
    }
}
