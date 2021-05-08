#ifndef GRAPH_H_
#define GRAPH_H_

#define NUM_NODES 6
typedef int Graph[NUM_NODES][NUM_NODES];

Graph def_graph = {
//   0    1    2    3   4    5
    -1,  16,  13,  -1, -1,  -1, // 0
    -1,  -1,  10,  12, -1,  -1, // 1
    -1,   4,  -1,  14, -1,  -1, // 2
    -1,  -1,   9,  -1, -1,  20, // 3
    -1,  -1,  -1,   7, -1,   4, // 4
    -1,  -1,  -1,  -1, -1,  -1, // 5
  };


#endif //FOO_H_
