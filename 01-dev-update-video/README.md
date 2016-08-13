Ana Origin Story
================

On July 19, 2019, a developer update video for the new Overwatch hero named Ana
was released.

https://www.youtube.com/watch?v=evghkilg2eQ

Frame Screenshots
-----------------

At the very end of the video, there flash 4 distinct frames that
look meaningless at first, in order of appearance:

![ana-frame-1](assets/ana-frame-1.png)
![ana-frame-2](assets/ana-frame-2.png)
![ana-frame-3](assets/ana-frame-3.png)
![ana-frame-4](assets/ana-frame-4.png)

These frames were extract from the video by downloading the original 1080p
video from youtube, and then running the following command to extract all frames
at the end of the video.

    ffmpeg -ss 00:12:21.000 -i ana-video.mp4 -r 30/1 ana-frame-%03d.png

I then manually pulled out the 4 distinct frames from the resulting images

Results
-------

References
----------

- http://wiki.gamedetectives.net/index.php?title=Sombra_ARG#Dev_Update_Video
