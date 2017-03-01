# Cover

- Calculate spine width with `binding.py`. Adjust paper weights and number of
  pages as required.

- Run the cover assistant plugin, `scribus-create-cover.py`, from within
  [Scribus](https://www.scribus.net/). Enter page sizes and spine width.
  This will create a new document with correct dimensions and guides.

- Customize the cover. Make sure that background colors and images extend beyond
  the page into the bleed region.

- Save as `cover.pdf`. Add crop and bleed marks (pre-press tab). Hand this file
  over to your copy shop.

- Run `crop/crop.sh` to create a crops for front, back, and spine.
  (Requires `pdfinfo` from [Poppler](https://poppler.freedesktop.org/) and
   [`pdfcrop`](https://www.ctan.org/tex-archive/support/pdfcrop))
