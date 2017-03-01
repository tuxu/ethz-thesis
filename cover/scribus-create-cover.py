from __future__ import print_function, division
import scribus

page_width = scribus.valueDialog('Cover Assistant', 'Page width (mm)', '148')
page_height = scribus.valueDialog('Cover Assistant', 'Page height (mm)', '210')
spine_width = scribus.valueDialog('Cover Assistant', 'Spine width (mm)', '8')
page_width = float(page_width)
page_height = float(page_height)
spine_width = float(spine_width)

cover_width = 2 * page_width + spine_width
cover_height = page_height

print('Spine width: {} mm'.format(spine_width))
print('Cover width: {} mm'.format(cover_width))
print('Cover height: {} mm'.format(cover_height))

scribus.newDocument((cover_width, cover_height),
                    (0, 0, 0, 0),
                    scribus.PORTRAIT, 1, scribus.UNIT_MILLIMETERS,
                    scribus.PAGE_1, 0, 1)
vguides = [page_width, page_width + spine_width]
scribus.setVGuides(vguides)
