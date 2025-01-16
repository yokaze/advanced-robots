# https://lua-api.factorio.com/latest/types/IconData.html
from PIL import Image, ImageDraw, ImageFilter, ImageFont

font = ImageFont.truetype('Roboto-VariableFont_wdth,wght', 20)
icons = ['F1', 'F2', 'F3', 'H1', 'H2', 'H3', 'W1', 'W2', 'W3']
for x in icons:
    img = Image.new("RGBA", (64, 64))
    drw = ImageDraw.Draw(img)
    drw.text((64, 0), x, font=font, anchor='ra', fill=(0, 0, 0), stroke_width=2)
    img = img.filter(ImageFilter.BLUR)
    drw = ImageDraw.Draw(img)
    drw.text((64, 0), x, font=font, anchor='ra', fill=(255, 255, 255), stroke_width=1)

    img.save('graphics/%s.png' % x)
