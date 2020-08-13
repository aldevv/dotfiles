#!/bin/bash
value=$(sudo eopkg lu | wc -l )
echo "$(($value - 1)) Updates!"
