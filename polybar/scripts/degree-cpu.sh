#!/bin/bash
sensors | awk '/Core 0/ {print $3}' | tr -d '+'

