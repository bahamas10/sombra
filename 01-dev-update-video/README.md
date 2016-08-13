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

Each barcode *should* be 213 pixels wide, however upon closer inspection, it
appears some are slightly longer than others.  To compensate, 100px wide shots
were extracted every 220 pixels.

    for i in {0..8}; do convert -crop "100x1080+$((220*i))x0" ana-frame-3.png "ana-barcode-$i.png"; done

### Reading the Barcodes

To read these barcodes unfortunately I could not find a good command line utility, however this
website works really well as it allows you to pass in a URL.

http://www.onlinebarcodereader.com/

Using the raw GitHub URLs, this be done easily for the following 9 images

- https://raw.githubusercontent.com/bahamas10/sombra/dave-1471116722/01-dev-update-video/assets/ana-barcode-0.png
- https://raw.githubusercontent.com/bahamas10/sombra/dave-1471116722/01-dev-update-video/assets/ana-barcode-1.png
- https://raw.githubusercontent.com/bahamas10/sombra/dave-1471116722/01-dev-update-video/assets/ana-barcode-2.png
- https://raw.githubusercontent.com/bahamas10/sombra/dave-1471116722/01-dev-update-video/assets/ana-barcode-3.png
- https://raw.githubusercontent.com/bahamas10/sombra/dave-1471116722/01-dev-update-video/assets/ana-barcode-4.png
- https://raw.githubusercontent.com/bahamas10/sombra/dave-1471116722/01-dev-update-video/assets/ana-barcode-5.png
- https://raw.githubusercontent.com/bahamas10/sombra/dave-1471116722/01-dev-update-video/assets/ana-barcode-6.png
- https://raw.githubusercontent.com/bahamas10/sombra/dave-1471116722/01-dev-update-video/assets/ana-barcode-7.png
- https://raw.githubusercontent.com/bahamas10/sombra/dave-1471116722/01-dev-update-video/assets/ana-barcode-8.png

### Barcodes to hex

Reading the 9 barcodes give us the following hex output (in order)

    $ cat hex.txt
    FEC-820-BA9-BAD-BAF-824-FEA-5-F28-980-5B0-F59
    4B1-2C7-F83-748-7F4-719-AAA-2C8-1F6-47C-5A8-DBA
    7F-1541-85D-E5D-35D-1C41-157F-500-49D-122-11D8-D9C
    279-919-4AA-800-1E9-308-3F1-EDC-CB3-602-DE9-8
    153-690-BF0-CA1-2B-D03-9C8-866-DF7-EF9-C21-20
    1FD7-1F79-1582-1252-806-1B4B-1FB7-1050-532-9A9-1870-1FEF
    3A0-A43-AFF-793-658-C-FE4-821-BA4-BA8-BAA-82F-FED
    B6A-BD4-496-324-A2F-3C3-78E-723-634-B9-287-EFA-172
    1B5E-17F9-83D-160-1BFE-1D14-956-318-5F1-6D7-1BC-C24-18CF

Results
-------

References
----------

- http://wiki.gamedetectives.net/index.php?title=Sombra_ARG#Dev_Update_Video
- https://m.reddit.com/r/Overwatch/comments/4tn3vr/sombra_hint_in_new_dev_update/
