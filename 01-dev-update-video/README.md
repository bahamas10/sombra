Ana Origin Story
================

On July 19, 2019, a developer update video for the new Overwatch hero named Ana
was released.

https://www.youtube.com/watch?v=evghkilg2eQ

Frame Screenshots
-----------------

At the very end of the video, there flash 4 distinct frames that
look meaningless at first, in order of appearance:

### Frame 1

![ana-frame-1](assets/ana-frame-1.png)

### Frame 1

![ana-frame-2](assets/ana-frame-2.png)

### Frame 3

![ana-frame-3](assets/ana-frame-3.png)

### Frame 4

![ana-frame-4](assets/ana-frame-4.png)

These frames were extract from the video by downloading the original 1080p
video from youtube, and then running the following command to extract all frames
at the end of the video.

    ffmpeg -ss 00:12:21.000 -i ana-video.mp4 -r 30/1 ana-frame-%03d.png

I then manually pulled out the 4 distinct frames from the resulting images

### Barcodes in Frame 3

In frame 3 there are 9 distinct barcodes running vertically through the image.
We know the frame is 1080p resolution, so the width must be 1920px, but we can
verify this with:

    $ identify assets/ana-frame-3.png
    assets/ana-frame-3.png PNG 1920x1080 1920x1080+0+0 8-bit sRGB 146KB 0.000u 0:00.000

The image can be chopped into 9 distinct parts knowing this information (already done,
see the [assets/](assets) directory).

    $ echo '1920 / 9' | bc
    213

Each barcode will be 213 pixels wide (this isn't quite the case, some are a tiny bit longer than
others upon closer inspection, but this still works)

    for i in {0..8}; do convert -crop "213x1080+$((213*i))x0" ana-frame-3.png "ana-barcode-$i.png"; done

Results
-------

References
----------

- http://wiki.gamedetectives.net/index.php?title=Sombra_ARG#Dev_Update_Video
