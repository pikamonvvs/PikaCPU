#!/bin/bash

iverilog -o test.vvp tb_$1.v

vvp test.vvp

gtkwave test.vcd
