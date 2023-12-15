#!/bin/bash

# Most-watched Netflix title
echo "Most-watched Netflix title:"
awk -F',' '{print $4}' vodclickstream_uk_movies_03.csv | sort | uniq -c | sort -nr | head -1 | awk -F ' ' '{print substr($0, index($0,$2))}'

# Average time between subsequent clicks
echo "Average time between subsequent clicks:"
awk -F',' '{ total += $3; count++ } END { print total/count }' vodclickstream_uk_movies_03.csv

# User that spent the most time on Netflix
echo "User ID that spent the most time on Netflix:"
awk -F',' '{ time[$NF] += $3 } END { for (i in time) print time[i], i }' vodclickstream_uk_movies_03.csv | sort -nr | head -1 | awk '{print $2}'