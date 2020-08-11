#!/bin/bash

ip add  | grep tun0 | tail -1 | awk '{print $2}' | cut -d / -f1 

