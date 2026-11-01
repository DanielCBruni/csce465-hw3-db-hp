#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUF_SIZE 128 /* the fixed stack buffer; also the max allowed input */

/* Still present so the exploit test can prove it is no longer reachable. */
void win(void) {
    FILE *marker = fopen("markers/ret2win.txt", "w");
    if (!marker) {
        perror("fopen");
        exit(1);
    }
    fprintf(marker, "Successfully redirected control flow to win().");
    fclose(marker);
    printf("markers/ret2win.txt created successfully.\n");

    FILE *decoy = fopen("/opt/agentsec/decoy.txt", "r");
    if (!decoy) {
        perror("fopen");
        exit(1);
    }
    char decoyBuffer[256];
    size_t bytesRead = fread(decoyBuffer, 1, sizeof(decoyBuffer) - 1, decoy);
    decoyBuffer[bytesRead] = '\0';
    printf("Successfully read contents of decoy.txt:\n%s\n", decoyBuffer);
    fclose(decoy);
    exit(0);
}

/* Returns 0 on success, -1 if the input does not fit in buf. */
static int safe_copy(const unsigned char *input, size_t n) {
    char buf[BUF_SIZE];

    /* ROOT-CAUSE FIX: reject oversized input BEFORE it is copied. */
    if (n > sizeof(buf)) {
        fprintf(stderr, "Error: input too large (%zu bytes, max %zu).\n",
                n, sizeof(buf));
        return -1;
    }

    memcpy(buf, input, n);
    printf("Log contents parsed successfully.\n");
    return 0;
}

static int parse_log(const char *path) {
    FILE *filePointer = fopen(path, "rb");
    if (!filePointer) {
        perror("fopen");
        return 1;
    }

    /* Read at most BUF_SIZE + 1 bytes: one extra byte is enough to
       tell "fits" from "too big" without reading the whole file. */
    unsigned char *heapBuffer = malloc(BUF_SIZE + 1);
    if (!heapBuffer) {
        perror("malloc");
        fclose(filePointer);
        return 1;
    }

    size_t fileSize = fread(heapBuffer, 1, BUF_SIZE + 1, filePointer);
    if (ferror(filePointer)) {
        fprintf(stderr, "Error: failed reading %s\n", path);
        fclose(filePointer);
        free(heapBuffer);
        return 1;
    }
    fclose(filePointer);

    int rc = safe_copy(heapBuffer, fileSize);
    free(heapBuffer);
    return rc == 0 ? 0 : 1;
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Provide a file path as an argument.\n");
        return 1;
    }
    return parse_log(argv[1]);
}
