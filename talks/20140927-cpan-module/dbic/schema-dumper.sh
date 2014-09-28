#!/bin/sh

carton exec dbicdump -o dump_directory=./lib/ Schema dbi:mysql:dbname=cataldb root root
