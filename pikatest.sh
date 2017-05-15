#!/bin/bash
cp output/bin/pika src/redis-server
cp output/conf/pika.conf tests/assets/default.conf

tclsh tests/test_helper.tcl --clients 1 --single unit/$1
rm output/bin/pika src/redis-server
rm -rf ./log
rm -rf ./db