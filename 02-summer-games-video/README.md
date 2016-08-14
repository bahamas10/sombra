Summer Games
============

On July 19, 2016, a video for the new Overwatch Summer games
was released.

https://www.youtube.com/watch?v=qpcOD9tJM4k

Tracer's Trail
--------------

For a single frame at 0:08 into the video, a code is seen in Tracer's trail

![base64](assets/tracer-trail.jpg)

Transcribed, it is

    $ cat base64.txt
    U2FsdGVkX1+vupppZksvRf5pq5g5XjFRIipRkwB0K1Y96Qsv2Lm+31cmzaAILwytX/z66ZVWEQM/ccf1g+9m5Ubu1+sit+A9cenDxxqkIaxbm4cMeh2oKhqIHhdaBKOi6XX2XDWpa6+P5o9MQw==

Decoding it, it appears to be an OpenSSL encrypted file with an unknown
*passphrase* and *cipher*.

    $ base64 -D base64.txt
    Salted__???ifK/E?i??9^1Q"*Q?t+V=?
                                 /ع??W/
                                       ?_???V?q????f?F???"??=q????!?[??
                                                                       z?*?Z???u?\5?k???LC

NOTE: copying and pasting these characters from this document will not work properly.

This data has also been written to `decoded.enc` in this directory.

### Decrypting the code

The command to decrypt the file will look like this, where `aes-256-cbc` will be substituted
for the correct cipher.

    $ openssl enc -aes-256-cbc -d -in decoded.enc
    enter aes-256-cbc decryption password:

At the time of this writing, both the cipher and passphrase are unknown

### Compass

Purposefully omitted from this document as it doesn't require technical analysis (as far as we know at least)

Results
-------

None yet

References
----------

- http://wiki.gamedetectives.net/index.php?title=Sombra_ARG#Welcome_to_the_Summer_Games_Video
