#!/bin/bash
# Input
cover_width=148  # mm
cover_height=210  # mm
cover_filename="../cover.pdf"

# Output
cover_front_filename="cover_front.pdf"
cover_back_filename="cover_back.pdf"
cover_spine_filename="cover_spine.pdf"

# Convert mm to pts
mm_to_pts=$(echo "scale=6; 72 / 25.4" | bc)
cover_width_pts=$(echo "scale=6; $cover_width * $mm_to_pts" | bc)
cover_height_pts=$(echo "scale=6; $cover_height * $mm_to_pts" | bc)

trimbox=$(pdfinfo -box ../cover.pdf | grep TrimBox)
trimbox=(${trimbox:8}) # to array: left bottom right top

bbox_back="${trimbox[0]} ${trimbox[1]} "
bbox_back+="$(echo "scale=6; ${trimbox[0]} + $cover_width_pts" | bc) "
bbox_back+="$(echo "scale=6; ${trimbox[1]} + $cover_height_pts" | bc)"

bbox_front=""
bbox_front+="$(echo "scale=6; ${trimbox[2]} - $cover_width_pts" | bc) "
bbox_front+="$(echo "scale=6; ${trimbox[3]} - $cover_height_pts" | bc) "
bbox_front+="${trimbox[2]} ${trimbox[3]}"

bbox_spine=""
bbox_spine+="$(echo "scale=6; ${trimbox[0]} + $cover_width_pts" | bc) "
bbox_spine+="${trimbox[1]} "
bbox_spine+="$(echo "scale=6; ${trimbox[2]} - $cover_width_pts" | bc) "
bbox_spine+="${trimbox[3]}"

pdfcrop --clip --bbox "$bbox_front" $cover_filename $cover_front_filename
pdfcrop --clip --bbox "$bbox_back" $cover_filename $cover_back_filename
pdfcrop --clip --bbox "$bbox_spine" $cover_filename $cover_spine_filename
