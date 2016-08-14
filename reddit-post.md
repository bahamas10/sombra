Sombra Overwatch ARG
====================

I've been hanging out in the [Game Detectives](https://www.reddit.com/r/gamedetectives/)
Discord for a while now, and have been keeping up pretty closely with
all of the latest developments.  The [Sombra Game Detectives
Wiki](http://wiki.gamedetectives.net/index.php?title=Sombra_ARG)
is incredibly useful for checking the current status of the ARG,
as well as to see all of the clues and hints found with their solutions.

However, there have been a couple of theories that haven't panned out, or have just
been simply made up: i.e. the "summer games" banner in the game allegedly
showing a waveform, that was falsely converted to DTMF (phone) dial tones and
then decoded.  Because of this and some of the misinformation being passed around I
want to take the time to:

1. Break down and fully explain all of the solutions we have
2. Reproduce and verify all of the solutions we have
3. Show all steps to reproduce and verify all of the solutions so others can do it too

A lot of information and tools in this post can also be found in my [Sombra
GitHub Repository](https://github.com/bahamas10/sombra).  You can click the
titles of each clue to be taken to a folder on GitHub with all of the tools and
programs referenced.

Who Am I?
---------

I'm a huge fan of Overwatch and do Software Engineering for a living
and music recording for fun.  Because of this, I've written a lot of
code to verify these clues, and am also working on a new song influenced by the
sky code song :D

**Note**: I'm not trying to take credit for any of the work done to figure out these
clues; I did *not* initially discover any of these solutions - I'm just recreating
the steps taken to solve the clues given.

---

Clues
-----

### 1. [Ana Origin Video](https://github.com/bahamas10/sombra/tree/master/00-ana-origin-video)

- Status: Solved / Verified

On July 12, 2016, a video for the new Overwatch hero named Ana was released.

https://www.youtube.com/watch?v=TE0CXgpNxG0

Hex values can be seen in the video at 2 specific time stamps:
[1:16](https://raw.githubusercontent.com/bahamas10/sombra/master/00-ana-origin-video/assets/Ana_Hex.png) and
[2:11](https://raw.githubusercontent.com/bahamas10/sombra/master/00-ana-origin-video/assets/Ana_Hex2.png)

Transcribed we get

    $ cat hex-1\:16.txt
    2E 2E 2E 7B 76 20 66 62 72 20 63 7E 72 79 72 20 7B 76 20 7E
    79 71 78 65 7A 76 74 7E D4 A4 79 2C 20 63 7E 72 79 72 20 72
    7B 20 67 78 73 72 65 2E 2E 2E 7B 76 20 66 62 72 20 63 7E 72
    79 72 20 7B 76 20 7E 79 71 78 65 7A 76 74 7E D4 A4 79 2C 20
    63 7E 72 79 72 20 72 7B 20 67 78 73 72 65 2E 2E 2E 7B 76 20
    66 62 72 20 63 7E 72 79 72 20 7B 76 20 7E 79 71 78 65 7A 76
    74 7E D4 A4 79 2C 20 63 7E 72 79 72 20 72 7B 20 67 78 73 72
    65 2E 2E 2E 7B 76 20 66 62 72 20 63 7E 72 79 72 20 7B 76 20
    7E 79 71 78 65 7A 76 74 7E D4 A4 79 2C 20 63 7E 72 79 72 20
    72 7B 20 67 78 73 72 65 2E 2E 2E 64 78 7A 75

and

    $ cat hex-1\:16.txt
    65 76 2E 2E 2E 7B 76 20 66 62 72 20 63 7E 72 79 72 20 7B 76
    20 7E 79 71 78 65 7A 76 74 7E D4 A4 79 2C 20 63 7E 72 79 72
    20 72 7B 20 67 78 73 72 65 2E 2E 2E 7B 76 20 66 62 72 20 63
    7E 72 79 72 20 7B 76 20 7E 79 71 78 65 7A 76 74 7E D4 A4 79
    2C 20 63 7E 72 79 72 20 72 7B 20 67 78 73 72 65 2E 2E 2E 7B
    76 20 66 62 72 20 63 7E 72 79 72 20 7B 76 20 7E 79 71 78 65
    7A 76 74 7E D4 A4 79 2C 20 63 7E 72 79 72 20 72 7B 20 67 78
    73 72 65 2E 2E 2E 7B 76 20 66 62 72 20 63 7E 72 79 72 20 7B
    76 20 7E 79 71 78 65 7A 76 74 7E D4 A4 79 2C 20 63 7E 72 79
    72 20 72 7B 20 67 78 73 72 65 2E 2E 2E

#### Convert to ascii

The first thing done was converting them both to ascii from hex.  This means
each group of hex values were converted to numbers i.e. `2E` becomes `46`, and
`46` is then represented as an ascii character, which is `"."`.

    $ cat hex-1\:16.txt | ./hex-to-ascii
    ...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...dxzu
    $ cat hex-2\:11.txt | ./hex-to-ascii
    ev...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...

Notice there are no line breaks or anything, just text all mashed together.

#### XOR cipher

The next step is to run the ascii through an XOR (pronounced "ex or") cipher.

Using an XOR cipher with the constant 23 (the next Overwatch hero will be the 23rd
hero added) we see this:

    $ cat hex-1\:16.txt | ./hex-to-ascii | ./xor-cipher 23
    ...la que tiene la informaciTU3n; tiene el poder...la que tiene la informaciTU3n; tiene el poder...la que tiene la informaciTU3n; tiene el poder...la que tiene la informaciTU3n; tiene el poder...somb
    $ cat hex-2\:11.txt | ./hex-to-ascii | ./xor-cipher 23
    ra...la que tiene la informaciTU3n; tiene el poder...la que tiene la informaciTU3n; tiene el poder...la que tiene la informaciTU3n; tiene el poder...la que tiene la informaciTU3n; tiene el poder...

Notice the following

1. no line breaks
2. `informacion` has weird data where the accented `"o"` should be - in the original ascii there are 2 characters there (this *may* be a bug in my code though)
3. `"."` and `" "` had to be skipped in the cipher
4. first message ends with `"...somb"` and the second begins with `"ra..."`

Massaging the data by injecting a newline after every occurrence of `"..."` yields
something slightly easier to see:

    $ cat hex-1\:16.txt hex-2\:11.txt | ./hex-to-ascii | ./xor-cipher 23 | sed -e 's/\.\.\./...\n/g'
    ...
    la que tiene la informaciTU3n; tiene el poder...
    la que tiene la informaciTU3n; tiene el poder...
    la que tiene la informaciTU3n; tiene el poder...
    la que tiene la informaciTU3n; tiene el poder...
    sombra...
    la que tiene la informaciTU3n; tiene el poder...
    la que tiene la informaciTU3n; tiene el poder...
    la que tiene la informaciTU3n; tiene el poder...
    la que tiene la informaciTU3n; tiene el poder...

We have the translated phrase "She who has the information, has the power..."
repeated a number of times, as well as the term `sombra` (uncapitalized).

#### References

- http://wiki.gamedetectives.net/index.php?title=Sombra_ARG#Ana_Origin_Video

---

### 2. [Dev Update Video](https://github.com/bahamas10/sombra/blob/master/01-dev-update-video)

- Status: Solved / Verified

On July 19, 2016, a developer update video for the new Overwatch hero named Ana
was released.

https://www.youtube.com/watch?v=evghkilg2eQ

At the very end of the video, there flash 4 distinct frames that
flash and look meaningless at first.  In order of appearance:

- [Frame 1](https://github.com/bahamas10/sombra/blob/master/01-dev-update-video/assets/ana-frame-1.png)
- [Frame 2](https://github.com/bahamas10/sombra/blob/master/01-dev-update-video/assets/ana-frame-2.png)
- [Frame 3](https://github.com/bahamas10/sombra/blob/master/01-dev-update-video/assets/ana-frame-3.png)
- [Frame 4](https://github.com/bahamas10/sombra/blob/master/01-dev-update-video/assets/ana-frame-4.png)

These frames were extracted from the video by downloading the original 1080p
video from YouTube, and then running the following command to extract all frames
at the end of the video.

    ffmpeg -ss 00:12:21.000 -i ana-video.mp4 -r 30/1 ana-frame-%03d.png

I then manually pulled out the 4 distinct frames from the resulting images

#### Barcodes in Frame 3

In frame 3 there are 9 distinct barcodes running vertically through the image.
We know the frame is 1080p resolution, so the width must be 1920px, but we can
verify this with:

    $ identify assets/ana-frame-3.png
    assets/ana-frame-3.png PNG 1920x1080 1920x1080+0+0 8-bit sRGB 146KB 0.000u 0:00.000

The image can be chopped into 9 distinct parts knowing this information

    $ echo '1920 / 9' | bc
    213

Each barcode *should* be 213 pixels wide, however upon closer inspection, it
appears some are slightly longer than others.  To compensate, 100px wide shots
were extracted every 220 pixels.

    for i in {0..8}; do
        convert -crop "100x1080+$((220*i))x0" ana-frame-3.png "ana-barcode-$i.png"
    done

#### Reading the Barcodes

To read these barcodes unfortunately I could not find a good command line
utility, however this website works really well as it allows you to pass in a
URL.

http://www.onlinebarcodereader.com/

Using the raw GitHub URLs, this be done easily for the following 9 images

- [Barcode 0](https://raw.githubusercontent.com/bahamas10/sombra/master/01-dev-update-video/assets/ana-barcode-0.png)
- [Barcode 1](https://raw.githubusercontent.com/bahamas10/sombra/master/01-dev-update-video/assets/ana-barcode-1.png)
- [Barcode 2](https://raw.githubusercontent.com/bahamas10/sombra/master/01-dev-update-video/assets/ana-barcode-2.png)
- [Barcode 3](https://raw.githubusercontent.com/bahamas10/sombra/master/01-dev-update-video/assets/ana-barcode-3.png)
- [Barcode 4](https://raw.githubusercontent.com/bahamas10/sombra/master/01-dev-update-video/assets/ana-barcode-4.png)
- [Barcode 5](https://raw.githubusercontent.com/bahamas10/sombra/master/01-dev-update-video/assets/ana-barcode-5.png)
- [Barcode 6](https://raw.githubusercontent.com/bahamas10/sombra/master/01-dev-update-video/assets/ana-barcode-6.png)
- [Barcode 7](https://raw.githubusercontent.com/bahamas10/sombra/master/01-dev-update-video/assets/ana-barcode-7.png)
- [Barcode 8](https://raw.githubusercontent.com/bahamas10/sombra/master/01-dev-update-video/assets/ana-barcode-8.png)

#### Barcodes to hex

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

#### Hex to Binary QR Code

The final step is to convert the hex to binary, rearrange it a bit, and make a
QR code out of it (where 0 is white and 1 is black).

    $ cat hex.txt | ./hex-to-qr
    1111111011000100101100010000001111111
    1000001000000010110001111010101000001
    1011101010011111100000110100001011101
    1011101011010111010010000111001011101
    1011101011110111111101000001101011101
    1000001001000111000110011110001000001
    1111111010101010101010101010101111111
    0000000001010010110010000010100000000
    1111001010000001111101100010010011101
    1001100000000100011111000000100100010
    0101101100000101101010001000111011000
    1111010110011101101110100110110011100
    0010011110010001010100111111111010111
    1001000110010110100100001111101111001
    0100101010101011111100001010110000010
    1000000000001100101000011001001010010
    0001111010010000001010110100000000110
    0011000010001101000000111101101001011
    0011111100011001110010001111110110111
    1110110111001000011001101000001010000
    1100101100111101111101110010100110010
    0110000000101110111110010100110101001
    1101111010011100001000011100001110000
    0000000010000000001000001111111101111
    0011101000001011011010101101101011110
    1010010000111011110101001011111111001
    1010111111110100100101100100000111101
    0111100100110011001001000000101100000
    0110010110001010001011111101111111110
    0000000011000011110000111110100010100
    1111111001000111100011100100101010110
    1000001000010111001000110001100011000
    1011101001000110001101000010111110001
    1011101010000000101110010011011010111
    1011101010100010100001110000110111100
    1000001011111110111110100110000100100
    1111111011010001011100101100011001111

Now using the bundled tool `binary-to-qr` we can get a
[legible QR code](https://raw.githubusercontent.com/bahamas10/sombra/master/01-dev-update-video/assets/terminal-qr.png)
on the terminal, or we can put it in the
[Binary to QR Code converter](https://bahamas10.github.io/binary-to-qrcode/) I
made it specifically for this ARG.

[Generated QR Code](https://raw.githubusercontent.com/bahamas10/sombra/master/01-dev-update-video/assets/qr.png)

#### Scan QR code

When the code is scanned we see:

> ¿Estuvo eso facilito? Ahora que tengo su atención, déjenme se las pongo más difícil.

translated

> Was that easy? Well, now that I have your attention, allow me to make things much more difficult

Things are about to get really tough... we have our work cut out for us

#### References

- http://wiki.gamedetectives.net/index.php?title=Sombra_ARG#Dev_Update_Video
- https://m.reddit.com/r/Overwatch/comments/4tn3vr/sombra_hint_in_new_dev_update/
- https://gist.github.com/zapu/31165efab0d6264e2fd0fa75cc53b1aa
- https://zapu.net/sombra.txt

---

### 3. [Summer Games Video](https://github.com/bahamas10/sombra/blob/master/02-summer-games-video)

- Unsolved

On July 19, 2016, a video for the new Overwatch Summer games
was released.

https://www.youtube.com/watch?v=qpcOD9tJM4k

#### Tracer's Trail

For a single frame at 0:08 into the video, a code is seen in
[Tracer's trail](https://raw.githubusercontent.com/bahamas10/sombra/master/02-summer-games-video/assets/tracer-trail.jpg)

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

#### Decrypting the code

The command to decrypt the file will look like this, where `aes-256-cbc` will be substituted
for the correct cipher.

    $ openssl enc -aes-256-cbc -d -in decoded.enc
    enter aes-256-cbc decryption password:

**At the time of this writing, both the cipher and passphrase are unknown**

#### Compass

Purposefully omitted from this post as it doesn't require technical analysis
(as far as we know at least)

#### References

- http://wiki.gamedetectives.net/index.php?title=Sombra_ARG#Welcome_to_the_Summer_Games_Video

---

### 4. [Dorado Screenshot](https://github.com/bahamas10/sombra/tree/master/03-dorado-screenshot)

- Solved / Verified

A [new screenshot of Dorado](https://raw.githubusercontent.com/bahamas10/sombra/master/03-dorado-screenshot/assets/dorado-screenshot-004.jpg)
was uploaded on the [Play Overwatch](https://playoverwatch.com/en-us/media/) media page.

#### Glitched Dorado Picture

It was discovered that the picture had been "Data Moshed"; Basically, some bytes
were modified in the original image to create the glitched image.  Comparing
the modified bytes to those found in the original (a byte-by-byte diff, or
difference) revealed a message.

    $ ../tools/diff-mosh assets/dorado-screenshot-005.jpg assets/dorado-screenshot-004.jpg
    143 differences
    Original Diff: Por que estan mirando al cielo? La respuesta no esta sobre sus cabezas, esta detras de ustedes. A veces, necesitan analizar sus logros previos.
    Moshed Diff: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

The glitched image had certain bytes swapped for `!` characters, and when those
bytes were extracted from the original image, that message was revealed.

> Por que estan mirando al cielo? La respuesta no esta sobre sus cabezas,
> esta detras de ustedes. A veces, necesitan analizar sus logros previos.

Translating it we see:

> "Why are you looking at the sky? The answer isn't over your heads, it's
> behind you. Sometimes, you need to analyze your previous achievements."

#### Results

1. RIP [Sky Code](https://www.reddit.com/r/Overwatch/comments/4w7ey1/the_sombra_skysong/) - you will be missed
2. Look at Overwatch achievements

#### References

- http://wiki.gamedetectives.net/index.php?title=Sombra_ARG#Dorado_Photo

---

### 5. [Mystery Achievement](https://github.com/bahamas10/sombra/tree/master/04-mystery-achievement)

- Not Known If Finished / Verified

A new achievement was added to the [Play Overwatch](http://www.playoverwatch.com/)
page for logged in users with an upside-down question mark as the icon.

#### Mystery Achievement

Viewing the source of the HTML page right above the achievement, a comment can
be seen:

    <!-- Vientos, nada mal. No obstante, me aburro. Intentemos algo nuevo en la
    misma dirección. uczihriwgsxorxwunaarawryqhbrsfmeqrjjmu 5552E494 78T3 4VM9
    OPL6 IS8208O913KRlrx -->

Translating it, we see

> Damn, not bad. However, I'm getting bored. Let's try something new in the same direction.
> uczihriwgsxorxwunaarawryqhbrsfmeqrjjmu 5552E494 78T3 4VM9 OPL6 IS8208O913KRlrx

A [Vigenère cipher](https://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher) was used to encrypt this data,
and the key used was derived from the name of the heroes as they appear on the Compass discovered
from the Summer Games video (see The [Game Detectives Wiki](http://wiki.gamedetectives.net/index.php?title=Sombra_ARG#Source_Code_of_Achievements_on_Play_Overwatch)
for a more thorough explanation of the compass).

#### Decrypting the code

    $ cat code.txt
    uczihriwgsxorxwunaarawryqhbrsfmeqrjjmu 5552E494 78T3 4VM9 OPL6 IS8208O913KRlrx

Using the passphrase `tracertorbjornwinstonsymmetradvamercybastiongenjimccree`
the data can be deciphered to the following:

    $ cat code.txt | ./vigenere-decode tracertorbjornwinstonsymmetradvamercybastiongenjimccree
    blzgdapiproaakamaihdnetmediascreenshot 5552F494 78U3 4WN9 PQM6 JT8208P913LSjpg

Adding slashes, dots, hyphens, etc. this output can be turned into an image URL.

https://blzgdapipro-a.akamaihd.net/media/screenshot/5552E494-78B3-4CE9-ACF6-EF8208F913CF.jpg

#### Extracting the hidden data

The original image is a
[Screenshot of Volskaya](https://github.com/bahamas10/sombra/blob/master/04-mystery-achievement/assets/Volskaya-screenshot-004.jpg?raw=true)
from the Overwatch media page, much like the original Dorado data mosh.

Using the same `diff-mosh` tool, we can extract the data:

    $ ../tools/diff-mosh assets/volskaya-screenshot-004.jpg assets/5552E494-78B3-4CE9-ACF6-EF8208F913CF.jpg
    1549 differences
    Original Diff: Parece que te gustan estos jueguitos... por que no jugamos uno de verdad?
                               :PB@Bk:                                                ,jB@@B@B@B@BBL.                                         7G@B@B@BMMMMMB@B@B@Nr                                  :kB@B@@@MMOMOMOMOMMMM@B@B@B1,                          :5@B@B@B@BBMMOMOMOMOMOMOMM@@@B@B@BBu.                   70@@@B@B@B@BXBBOMOMOMOMOMOMMBMPB@B@B@B@B@Nr              G@@@BJ iB@B@@  OBMOMOMOMOMOMOM@2  B@B@B. EB@B@S            @@BM@GJBU.  iSuB@OMOMOMOMOMOMM@OU1:  .kBLM@M@B@            B@MMB@B       7@BBMMOMOMOMOMOBB@:       B@BMM@B            @@@B@B         7@@@MMOMOMOMM@B@:         @@B@B@            @@OLB.          BNB@MMOMOMM@BEB          rBjM@B            @@  @           M  OBOMOMM@q  M          .@  @@            @@OvB           B:u@MMOMOMMBJiB          .BvM@B            @B@B@J         0@B@MMOMOMOMB@B@u         q@@@B@            B@MBB@v       G@@BMMMMMMMMMMMBB@5       F@BMM@B            @BBM@BPNi   LMEB@OMMMM@B@MMOMM@BZM7   rEqB@MBB@            B@@@BM  B@B@B  qBMOMB@B@B@BMOMBL  B@B@B  @B@B@M             J@@@@PB@B@B@B7G@OMBB.   ,@MMM@qLB@B@@@BqB@BBv                 iGB@,i0@M@B@MMO@E  :  M@OMM@@@B@Pii@@N:                       .   B@M@B@MMM@B@B@B@MMM@@@M@B                                  @B@B.i@MBB@B@B@@BM@::B@B@                                  B@@@ .B@B.:@B@ :B@B  @B@O                                    :0 r@B@  B@@ .@B@: P:                                          vMB :@B@ :BO7                                                  ,B@B                           
    Moshed Diff: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

Interesting points to note

1. The replaced characters in the mosh are `!` - same as Dorado
2. There is a newline character after the Spanish sentence, but nowhere else in the data

#### Translate the hint

> Parece que te gustan estos jueguitos... por que no jugamos uno de verdad?

Translated becomes

> It seems you like these little games... Why don't we play a real one?

### The skull

The lines in the "Original Diff" that have a lot of strings like "MOMOM"
appears to be ascii art, but the newlines are missing.  By arbitrarily guessing,
we can see that if a newline is added every *59th* character, a skull emerges.


    $ ../tools/diff-mosh assets/Volskaya-screenshot-004.jpg assets/5552E494-78B3-4CE9-ACF6-EF8208F913CF.jpg \
        | grep MOMOM | fold -59
                               :PB@Bk:                         
                           ,jB@@B@B@B@BBL.                     
                        7G@B@B@BMMMMMB@B@B@Nr                  
                    :kB@B@@@MMOMOMOMOMMMM@B@B@B1,              
                :5@B@B@B@BBMMOMOMOMOMOMOMM@@@B@B@BBu.          
             70@@@B@B@B@BXBBOMOMOMOMOMOMMBMPB@B@B@B@B@Nr       
           G@@@BJ iB@B@@  OBMOMOMOMOMOMOM@2  B@B@B. EB@B@S     
           @@BM@GJBU.  iSuB@OMOMOMOMOMOMM@OU1:  .kBLM@M@B@     
           B@MMB@B       7@BBMMOMOMOMOMOBB@:       B@BMM@B     
           @@@B@B         7@@@MMOMOMOMM@B@:         @@B@B@     
           @@OLB.          BNB@MMOMOMM@BEB          rBjM@B     
           @@  @           M  OBOMOMM@q  M          .@  @@     
           @@OvB           B:u@MMOMOMMBJiB          .BvM@B     
           @B@B@J         0@B@MMOMOMOMB@B@u         q@@@B@     
           B@MBB@v       G@@BMMMMMMMMMMMBB@5       F@BMM@B     
           @BBM@BPNi   LMEB@OMMMM@B@MMOMM@BZM7   rEqB@MBB@     
           B@@@BM  B@B@B  qBMOMB@B@B@BMOMBL  B@B@B  @B@B@M     
            J@@@@PB@B@B@B7G@OMBB.   ,@MMM@qLB@B@@@BqB@BBv      
               iGB@,i0@M@B@MMO@E  :  M@OMM@@@B@Pii@@N:         
                  .   B@M@B@MMM@B@B@B@MMM@@@M@B                
                      @B@B.i@MBB@B@B@@BM@::B@B@                
                      B@@@ .B@B.:@B@ :B@B  @B@O                
                        :0 r@B@  B@@ .@B@: P:                  
                            vMB :@B@ :BO7                      
                                ,B@B        

Some skull analysis can be seen in this gist:

https://gist.github.com/bahamas10/852c4dbdfeab92691f8f03eb98cf88f1

Currently, we are not sure if the skull is a puzzle itself or not.

#### Results

- 59 is a magic number for newlines in the skull

#### References

- http://wiki.gamedetectives.net/index.php?title=Sombra_ARG#Source_Code_of_Achievements_on_Play_Overwatch
- http://wiki.gamedetectives.net/index.php?title=Sombra_ARG#New_Datamoshed_Photo

Conclusion
----------

This is where we are now, we have:

1. An encrypted file from the Tracer trail in the summer games video with a missing passphrase
2. A skull that may or may not itself be a puzzle

I realize there are a lot of technical details in this post, but hopefully it
can help clear up some information, or at least show that all the clues in this
post have been successfully reproduced and verified.
