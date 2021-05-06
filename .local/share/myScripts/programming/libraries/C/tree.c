#define NUM_NODOS 6

typedef int Tree[NUM_NODOS][NUM_NODOS];

// currently same as graph
Tree tree = {
//   0    1    2    3   4    5
    -1,  16,  13,  -1, -1,  -1, // 0
    -1,  -1,  10,  12, -1,  -1, // 1
    -1,   4,  -1,  14, -1,  -1, // 2
    -1,  -1,   9,  -1, -1,  20, // 3
    -1,  -1,  -1,   7, -1,   4, // 4
    -1,  -1,  -1,  -1, -1,  -1, // 5
  };
