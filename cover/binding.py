#!/usr/bin/env python
""" Spine thickness calculation for soft cover binding. """
from __future__ import print_function, division

paper_weight = 100  # g / m**2
paper_volume = 1.08  # = thickness [um] / weight [g/m**2]
paper_thickness = paper_volume * paper_weight / 1000  # mm

cover_weight = 300  # g /m**2
cover_volume = 1.0
cover_thickness = cover_volume * cover_weight / 1000  # mm

num_pages = 100
num_sheets = num_pages / 2.
spine_width_cover = 2 * cover_thickness
spine_width_innerbook = num_sheets * paper_thickness
spine_width = spine_width_cover + spine_width_innerbook

print('Net spine width: {} mm'.format(spine_width))
print('     inner book: {} mm'.format(spine_width_innerbook))
print('          cover: {} mm'.format(spine_width_cover))
