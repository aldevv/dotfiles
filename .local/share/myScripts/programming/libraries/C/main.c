#include <stdio.h>
#include <stdlib.h>

#define HEY getenv("SCRIPTS")

int main(int argc, char *argv[])
{
    printf("%s", HEY);
    return 0;

}
