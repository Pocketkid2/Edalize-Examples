#!/bin/bash
echo "Enter bitstream file name: "
read bitstreamfile
export BITSTREAM=$bitstreamfile
openocd -f 7series.txt