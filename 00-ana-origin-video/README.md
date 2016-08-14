Ana Origin Story
================

On July 12, 2016, a video for the new Overwatch hero named Ana was released.

https://www.youtube.com/watch?v=TE0CXgpNxG0

Hex Screenshots
---------------

Hex values can be seen in the video at 2 specific time stamps

### 1:16

![hex1](assets/Ana_Hex.png)

### 2:11

![hex2](assets/Ana_Hex2.png)

### Hex Text Files

Hex values were extracted 1:16 and 2:11 in the video and are included
in this directory as text files.

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

    $ cat hex-2\:11.txt
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

### Hex To Ascii

Converting them both to ascii we see

    $ cat hex-1\:16.txt | ./hex-to-ascii
    ...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...dxzu
    $ cat hex-2\:11.txt | ./hex-to-ascii
    ev...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...

Both at once

    $ cat hex-1\:16.txt hex-2\:11.txt | ./hex-to-ascii
    ...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...dxzuev...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...{v fbr c~ryr {v ~yqxezvt~Ô¤y, c~ryr r{ gxsre...

Notice there are no line breaks or anything, just text all mashed together.

### Ascii Through XOR Cipher

Using an XOR cipher with the constant 23 (the next Overwatch hero will be the 23rd
hero added) we see this:

    $ cat hex-1\:16.txt | ./hex-to-ascii | ./xor-cipher 23
    ...la que tiene la informaciTU3n; tiene el poder...la que tiene la informaciTU3n; tiene el poder...la que tiene la informaciTU3n; tiene el poder...la que tiene la informaciTU3n; tiene el poder...somb
    $ cat hex-2\:11.txt | ./hex-to-ascii | ./xor-cipher 23
    ra...la que tiene la informaciTU3n; tiene el poder...la que tiene la informaciTU3n; tiene el poder...la que tiene la informaciTU3n; tiene el poder...la que tiene la informaciTU3n; tiene el poder...

Both at once

    $ cat hex-1\:16.txt hex-2\:11.txt | ./hex-to-ascii | ./xor-cipher 23
    ...la que tiene la informaciTU3n; tiene el poder...la que tiene la informaciTU3n; tiene el poder...la que tiene la informaciTU3n; tiene el poder...la que tiene la informaciTU3n; tiene el poder...sombra...la que tiene la informaciTU3n; tiene el poder...la que tiene la informaciTU3n; tiene el poder...la que tiene la informaciTU3n; tiene el poder...la que tiene la informaciTU3n; tiene el poder...

Notice the following

1. no line breaks
2. `informacion` has weird data where the accented `"o"` should be - in the original ascii there are 2 characters there.  perhaps my code is faulty here with encoding problems
3. `"."` and `" "` had to be skipped in the cipher
4. first message ends with `"...somb"` and the second begins with `"ra..."`

Results
-------

We have the translated phrase "She who has the information, has the power..."
repeated a number of times, as well as the term `sombra` (uncapitalized).

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


References
----------

- http://wiki.gamedetectives.net/index.php?title=Sombra_ARG#Ana_Origin_Video
