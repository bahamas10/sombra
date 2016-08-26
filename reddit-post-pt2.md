Based on the popularity of [my first post](https://www.reddit.com/r/Overwatch/comments/4xpdly/sombra_itt_i_explain_reproduce_and_verify_all/),
I've decided to make a follow up to go over all of the latest clues we have.  Like before,
I'll try my best to explain, reproduce, and verify all solutions the community has discovered
this far.

All code and assets referenced in this post can be found in my [GitHub Sombra repository]
(https://github.com/bahamas10/sombra/tree/master/05-skycoder-forum-post)

# [Skycoder Forum Post](https://github.com/bahamas10/sombra/tree/master/05-skycoder-forum-post)

- Status: In Progress / Verified

Discovered on August 23rd 2016 was a
[glitched forum post](http://us.battle.net/forums/en/overwatch/topic/20748794686)
from user "Skycoder" with a new code

Skycoder
--------

The user has supposedly 895 forum posts, and the post above
was found in the General Discussion section with the title
"00110010 0011001" (which converts to "23" in ascii, again probably
hinting at being the 23rd hero).

    $ node
    > String.fromCharCode(parseInt('00110010', 2))
    '2'
    > String.fromCharCode(parseInt('00110011', 2))
    '3'

The post text data reads:

>  la que tiene la informacion; tiene el poder

Translated

> She who has the information; has the power

Which is a callback to the original clue found in the [Ana Origin
Video](https://github.com/bahamas10/sombra/tree/master/00-ana-origin-video)

Transmission
------------

After a couple a seconds, the page completely glitches out and a code is seen:

    $ cat transmission.txt
    ICAgICAgICAgICAgICAgICAgICAgICAgICA6UEKPQms6CiAgICAgICAgICAgICAgICAgICAgICAsakKI
    QEJAQkBCQEJCTC4KICAgICAgICAgICAgICAgICAgIDdHlkKTQpVCTU1NTU1CQEJAQkBOcgogICAgICAg
    ICAgICAgICA6a0KSQpCIl01NT01PTU9NT01NTU2MQphCQEIxLAogICAgICAgICAgIDo1kUKNQphCiEJC
    TU1PTU9NT01PTU9NT01NipJuQm5CQEJCdS4KICAgICAgICA3MG6GlUKIQpJClEJYQkJPTU9NT01PTU9N
    T01NQk1QQphCiEJAQkBCQE5yCiAgICAgIEeYlpdCSiBpQohCh4ggIE9CTU9NT01PTU9NT01PTZYyICBC
    j0JAQi4gRUJAQkBTCiAgICAgIJKWQk2HR0pCVS4gIGlTdUKIT01PTU9NT01PTU9NTZdPVTE6ICAua0JM
    TYhNhkKXCiAgICAgIEKMTU1CmUIgICAgICAgN4hCQk1NT01PTU9NT01PQkKWOiAgICAgICBCh0JNTYhC
    CiAgICAgII2YiEKKQiAgICAgICAgIDeSlkBNTU9NT01PTU1AQkA6ICAgICAgICAgQEBCQEJACiAgICAg
    II+ST0xCLiAgICAgICAgICBCTkKPTU1PTU9NTY9CRUIgICAgICAgICAgckJqTYRCCiAgICAgIJBAICBA
    ICAgICAgICAgICBNICBPQk9NT01NQHEgIE0gICAgICAgICAgLkAgIEBACiAgICAgIISVT3ZCICAgICAg
    ICAgICBCOnWMTU1PTU9NTUJKaUIgICAgICAgICAgLkJ2TUBCCiAgICAgIIRCkUKYSiAgICAgICAgIDCR
    QpdNTU9NT01PTUKVQkB1ICAgICAgICAgcUBAQEJACiAgICAgIEKETUJCjHYgICAgICAgR4+LQk1NTU1N
    TU1NTU1NQkKINSAgICAgICBGhEJNTUBCCiAgICAgIIdCQk1/QlBOaSAgIExNRUKFT01NTU2PQoNNTU9N
    TYpCWk03ICAgckVxQodNQkKECiAgICAgIEKYloRCTSAgQm1ChEIgIHFCTU9NQpBChUKEQk1PTUJMICBC
    QEJAQiAgQEJAQkBNCiAgICAgICBKlm2GhFBCj0KEQplCN0eIT01CQi4gICAsQE1NTUBxTEJAQkBAQEJx
    QkBCQnYKICAgICAgICAgIGlHQpUsaTCETZZCbk1NT4tFICA6ICBNQE9NTUBAQEJAUGlpQEBOOgogICAg
    ICAgICAgICAgLiAgIEKXTZBCj01NTUBCQEJAQkBNTU1AQEBNQEIKICAgICAgICAgICAgICAgICBAQkBC
    LmlATUJCQEJAQkBAQk1AOjpCQEJACiAgICAgICAgICAgICAgICAgQkBAQCAuQkBCLjpAQkAgOkJAQiAg
    QEJATwogICAgICAgICAgICAgICAgICAgOjAgckBCQCAgQkBAIC5AQkA6IFA6CiAgICAgICAgICAgICAg
    ICAgICAgICAgdk1CIDpAQkAgOkJPNwogICAgICAgICAgICAgICAgICAgICAgICAgICAsQkBCCg==

### Base64

The code is encoded in base64 (the `==` at the end is a dead giveaway here).  Decoded, we see:

    $ base64 -d transmission.txt > decoded.txt
    $ cat decoded.txt
                              :PB?Bk:
                          ,jB?@B@B@B@BBL.
                       7G?B?B?BMMMMMB@B@B@Nr
                   :kB?B???MMOMOMOMOMMMM?B?B@B1,
               :5?B?B?B?BBMMOMOMOMOMOMOMM??nBnB@BBu.
            70n??B?B?B?BXBBOMOMOMOMOMOMMBMPB?B?B@B@B@Nr
          G???BJ iB?B??  OBMOMOMOMOMOMOM?2  B?B@B. EB@B@S
          ??BM?GJBU.  iSuB?OMOMOMOMOMOMM?OU1:  .kBLM?M?B?
          B?MMB?B       7?BBMMOMOMOMOMOBB?:       B?BMM?B
          ???B?B         7??@MMOMOMOMM@B@:         @@B@B@
          ??OLB.          BNB?MMOMOMM?BEB          rBjM?B
          ?@  @           M  OBOMOMM@q  M          .@  @@
          ??OvB           B:u?MMOMOMMBJiB          .BvM@B
          ?B?B?J         0?B?MMOMOMOMB?B@u         q@@@B@
          B?MBB?v       G??BMMMMMMMMMMMBB?5       F?BMM@B
          ?BBMBPNi   LMEB?OMMMM?B?MMOMM?BZM7   rEqB?MBB?
          B???BM  BmB?B  qBMOMB?B?B?BMOMBL  B@B@B  @B@B@M
           J?m??PB?B?B?B7G?OMBB.   ,@MMM@qLB@B@@@BqB@BBv
              iGB?,i0?M?BnMMO?E  :  M@OMM@@@B@Pii@@N:
                 .   B?M?B?MMM@B@B@B@MMM@@@M@B
                     @B@B.i@MBB@B@B@@BM@::B@B@
                     B@@@ .B@B.:@B@ :B@B  @B@O
                       :0 r@B@  B@@ .@B@: P:
                           vMB :@B@ :BO7
                               ,B@B


Which looks almost identical to the original ascii skull found in the
[Mystery Achievement](https://github.com/bahamas10/sombra/blob/master/04-mystery-achievement).

Note: What may look like `?` characters are actually unprintable
characters that have different numerical values, see
[this screenshot](https://raw.githubusercontent.com/bahamas10/sombra/master/05-skycoder-forum-post/assets/skull-unprintable.png)
for a view of the skull on the terminal.

Since we have 2 skulls now: the original and this new moshed one, let's
copy them to easy to use files: `skull-1.txt` and `skull-2.txt`.

    $ cp ../04-mystery-achievement/skull/skull.txt skull-1.txt
    $ cp decoded.txt skull-2.txt

### Data Mosh Difference

Here's the fun part - the text was data moshed in a similar fashion to the screenshots
we've seen before.  However, it's not enough to extract the different characters, we must
also substract the numerical value of the original character from the moshed character,
and the convert it back to text.

For example, the first couple differences are illustrated below:

    character 29: skull-1 64 = @ / skull-2 143 = [8f]
    143 - 64 = 79 = "O"
    character 59: skull-1 64 = @ ? skull-2 136 = [88]
    136 - 64 = 72 = "H"
    character 93: skull-1 64 = @ ? skull-2 150 = [96]
    150 - 64 = 86 = "V"

Doing this for both skulls, we get:

    $ ./diff skull-1.txt skull-2.txt
    OHVSURPHWLXQMXHJR...FUHRTXHXVWHGHVORVGHWHFWLYHVGHMXHJRVOROODPDULDQXQWUDLOKHDG?EOCJGDXVD-DPEDV-FDODYHUDV.KWPO

### Caesar Cipher

With this output, we can pass it through a [Caesar
Cipher](https://en.wikipedia.org/wiki/Caesar_cipher) with the constant 23 to
extract the following:

    $ ./diff ../04-mystery-achievement/skull/skull.txt decoded.txt | ./caeser-cipher 23
    LESPROMETIUNJUEGO...CREOQUEUSTEDESLOSDETECTIVESDEJUEGOSLOLLAMARIANUNTRAILHEAD?BLZGDAUSA-AMBAS-CALAVERAS.HTML

Adding spaces, and cleaning it up a bit we see:

> Les prometi un juego...creo que ustedes los Detectives de Juegos lo llamarían un trailhead?
> BLZGDUSA-AMBAS-CALAVERAS.HTML

Translated

> I promised you a game...I believe you Game Detectives would call it a trailhead?
> BLZGDAUSA-AMBAS-CALAVERAS.HTML

NOTE: "USA-AMBAS-CALAVERAS" translates to "USE-BOTH-SKULLS".

Constructing a URL to match Blizzard's URL scheme for hosting static files, we have

https://blzgdapipro-a.akamaihd.net/media/screenshot/usa-ambas-calaveras.html

Skull Video
-----------

The link leads to a [Skull Video](https://blzgdapipro-a.akamaihd.net/media/screenshot/usa-ambas-calaveras.html)
page ([screenshot](https://raw.githubusercontent.com/bahamas10/sombra/master/05-skycoder-forum-post/assets/skull-video.png)).

The website above is a small wrapper around a static video file that plays on a loop:

    $ curl https://blzgdapipro-a.akamaihd.net/media/screenshot/usa-ambas-calaveras.mp4
    <html>
    <video width="800" height="600" autoplay loop>
      <source src="https://blzgdapipro-a.akamaihd.net/media/screenshot/usa-ambas-calaveras.mp4" type="video/mp4" />
    </video>
    </html>

We can now download the video for further processing

    $ wget https://blzgdapipro-a.akamaihd.net/media/screenshot/usa-ambas-calaveras.mp4

### Metadata

Using `mediainfo` we see the following comment

    $ mediainfo usa-ambas-calaveras.mp4 | grep ^Comment
    Comment                                  : Parecen estar muy interesados en estos "héroes". ¿Tal vez les interese conocer algunos detallitos que he averiguado sobre ellos?

> Parecen estar muy interesados en estos "héroes".
> ¿Tal vez les interese conocer algunos detallitos que he averiguado sobre ellos?

Translated

> You seem to be very interested in these "heroes".
> Maybe interested to know some details that I found out about them?

### Heartrate Ping

A secret message is encoded in the heartrate ping animation.  We can extract the video
frame-by-frame with this:

    $ ffmpeg -i usa-ambas-calaveras.mp4 -r 30/1 assets/frames/usa-frame-%03d.png

NOTE: I didn't include every frame in this repository - I kept only those with
visible pings

- [Frame "m"](https://raw.githubusercontent.com/bahamas10/sombra/master/05-skycoder-forum-post/assets/frames/usa-frame-025-m.png)
- [Frame "o"](https://raw.githubusercontent.com/bahamas10/sombra/master/05-skycoder-forum-post/assets/frames/usa-frame-026-o.png)
- [Frame "m"](https://raw.githubusercontent.com/bahamas10/sombra/master/05-skycoder-forum-post/assets/frames/usa-frame-072-m.png)
- [Frame "e"](https://raw.githubusercontent.com/bahamas10/sombra/master/05-skycoder-forum-post/assets/frames/usa-frame-108-e.png)
- [Frame "n"](https://raw.githubusercontent.com/bahamas10/sombra/master/05-skycoder-forum-post/assets/frames/usa-frame-120-n.png)
- [Frame "t"](https://raw.githubusercontent.com/bahamas10/sombra/master/05-skycoder-forum-post/assets/frames/usa-frame-128-t.png)
- [Frame "i"](https://raw.githubusercontent.com/bahamas10/sombra/master/05-skycoder-forum-post/assets/frames/usa-frame-162-i.png)
- [Frame "n"](https://raw.githubusercontent.com/bahamas10/sombra/master/05-skycoder-forum-post/assets/frames/usa-frame-168-n.png)
- [Frame "c"](https://raw.githubusercontent.com/bahamas10/sombra/master/05-skycoder-forum-post/assets/frames/usa-frame-200-c.png)
- [Frame "r"](https://raw.githubusercontent.com/bahamas10/sombra/master/05-skycoder-forum-post/assets/frames/usa-frame-222-r.png)
- [Frame "i"](https://raw.githubusercontent.com/bahamas10/sombra/master/05-skycoder-forum-post/assets/frames/usa-frame-258-i.png)
- [Frame "m"](https://raw.githubusercontent.com/bahamas10/sombra/master/05-skycoder-forum-post/assets/frames/usa-frame-264-m.png)
- [Frame "e"](https://raw.githubusercontent.com/bahamas10/sombra/master/05-skycoder-forum-post/assets/frames/usa-frame-301-e.png)

In the screenshots I added in the letter that corresponds to each tick mark on
the heartrate ping animation.  Looking at it in order we can see the message
`"momentincrime"`.

### Moment in Crime

The clue is most likely a reference to [this YouTube video](https://www.youtube.com/watch?v=l5kTATxt7bE)
which introduced Junkrat and Roadhog before Overwatch was released.

#### Website

When we load the corresponding website http://amomentincrime.com/
([screenshot](https://raw.githubusercontent.com/bahamas10/sombra/master/05-skycoder-forum-post/assets/website.png))
currently we see:

> ...Estableciendo conexión...
> ...Protocolo Sombra v1.9 iniciado...
>
> ...Transmitiendo información a ómnicos activos... 5%
>
> ...Terminando conexión...

Translated

> ...Establishing connection...
> ...Sombra Protocol v1.9 started...
>
> ...Transmitting information to active omnics... 5%
>
> ...Ending connection...

Pulling up the source code there is a comment hidden in it as well:

    $ curl -sS http://amomentincrime.com/ | grep '<!--'
    <!-- Bien hecho, ya tienen mi clave. Hackear este programa de televisión no tuvo chiste. Espérense a lo que sigue.-->

> Bien hecho, ya tienen mi clave. Hackear este programa de televisión no tuvo chiste. Espérense a lo que sigue.

Translated

> Well done, you have my key. Hacking this television program was meaningless, wait for what is coming.

#### Email Hotline

Another thing offered in the YouTube video was to email tips@amomentincrime.com
with any tips... doing that yields the following response
([screenshot](https://raw.githubusercontent.com/bahamas10/sombra/master/05-skycoder-forum-post/assets/email.png)).

> Thank you for contacting A Moment in Crime's anonymous crime line!
>
> We have analyzed your submission and forwarded the information to the relevant parties. Your help could be vital in apprehending these cri
>
> ...Estableciendo conexión...
> ...Protocolo Sombra v1.7 iniciado...
>
>
> 01:07:47 02:02:02 01:08:06 02:13:43 01:18:32
> 01:18:21 02:10:19 01:06:21 02:05:18 01:04:02
> 01:07:08 02:18:25 01:13:04 02:19:20 01:23:02
> 01:16:40 02:16:35 01:23:04 02:17:16 01:06:42
> 01:13:29 02:18:06 01:05:02 02:15:41 01:08:34
>
> j.7F57O,NLv:qj.7B:,1qv@B1j5ivB:,
>
> ...Terminando conexión...
>
> minals and bringing them to justice. These fugitives are responsible for a string of robberies, arson, and other crimes stretching from Sydney to King's Row.
>
> Authorities believe that they have set their sights on crossing the Atlantic to America.

What looks like a normal email with some Sombra transmission injected into the
middle.

There are 2 things of interest in this email: the list of what look to be
timestamps, and a passcode of some kind.

    $ cat coordinates.txt
    01:07:47 02:02:02 01:08:06 02:13:43 01:18:32
    01:18:21 02:10:19 01:06:21 02:05:18 01:04:02
    01:07:08 02:18:25 01:13:04 02:19:20 01:23:02
    01:16:40 02:16:35 01:23:04 02:17:16 01:06:42
    01:13:29 02:18:06 01:05:02 02:15:41 01:08:34

and

    $ cat code.txt
    j.7F57O,NLv:qj.7B:,1qv@B1j5ivB:,

---

Now here's the fun part (this series of clues had multiple "fun parts"!):

The timestamp looking blocks are actually coordinates to be used with the ASCII
skulls given to us.  Given the form `AA:BB:CC`, `AA` is the number of skull (so
far only 01 or 02), `BB` is the row and `CC` is the column.

NOTE: There is an amazing [illustration of this on imgur](http://i.imgur.com/ZgN2MVQ.png),
our job is to verify it.

To do this, I wrote a program that reads coordinates over stdin, and a
variable number of input files (in our case, skulls) as arguments to
construct a map.

    $ cat coordinates.txt | ./build-square skull-1.txt skull-2.txt
    S j G B L
    . @ M O k
    i , v : 0
    E 7 r q N
    J P 5 F 1

NOTES:
- the characters seen were actually the same in both skulls
- leading whitespace must be trimmed on the skulls before processing

---

This square of text was then used in a [Bifid Cipher](https://en.wikipedia.org/wiki/Bifid_cipher)
to decode the other code given by Sombra, `j.7F57O,NLv:qj.7B:,1qv@B1j5ivB:,`.

I won't go over the details of the algorithm - that can be seen in the Wikipedia article
or by reading the code I've written.

Running it all through the cipher we see:

    $ cat coordinates.txt | \
        ./build-square skull-1.txt skull-2.txt | \
        ./bifid-cipher j.7F57O,NLv:qj.7B:,1qv@B1j5ivB:,
    SOMBr@1NF:rM@7iON1SP0vvErrSOMBr@

> SOMBr@1NF:rM@7iON1SP0vvErrSOMBr@

Which is leet-speak, translated:

> Sombra Information is power Sombra

Conclusion
----------

There may be more information in the video to extract - I'm not sure if `momentincrime`
was the only clue we were meant to find.

Questions

- We already have the key? is that for the tracer trail?
- What is that percentage leading up to on the website?

References
----------

- http://wiki.gamedetectives.net/index.php?title=Sombra_ARG#Overwatch_Forums_Glitching_Page.2F\_.22Skycoder.22
- http://us.battle.net/forums/en/overwatch/topic/20748794686
- http://pastebin.com/SsEiPB4s (seriously, this was a huge help, good job everyone)

Edits
-----

### 1. Skull non-printable wonkiness on reddit

The new skull was showing up strangely on reddit because the non-printable characters
were being stripped.  I've modified it to show "?" characters, as well as included
a screenshot of my terminal to better show it.  The
[commit is here](https://github.com/bahamas10/sombra/commit/6e363fe0d45a3c010f7d555f6ffb90a137351e11).
