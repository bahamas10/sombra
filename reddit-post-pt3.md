Sombra Overwatch ARG
====================

Thank you everyone for the great responses I have received from Part 1 and Part
2 of this "series"... I present to you part 3!

**DISCLAIMER**: I didn't discover ANY of these hints - I only went through to verify
and hopefully explain all of the findings from the community.  This is not meant to
reiterate or replace what [The
Wiki](http://wiki.gamedetectives.net/index.php?title=Sombra_ARG#A_Moment_in_Crime_Transmission) has,
but instead is meant to provide very clear and very explicit steps to show that these hints
can be reproduced and verified by others.

- [Part 1](https://www.reddit.com/r/Overwatch/comments/4xpdly/sombra_itt_i_explain_reproduce_and_verify_all/)
- [Part 2](https://www.reddit.com/r/Overwatch/comments/4zpbs2/sombra_itt_i_explain_reproduce_and_verify_all/)
- Part 3

All code and assets referenced in this post can be found in my [GitHub Sombra Repository]
(https://github.com/bahamas10/sombra/tree/master/06-a-moment-in-crime) released for free
under the [MIT License](https://opensource.org/licenses/MIT)

# [A Moment In Crime](https://github.com/bahamas10/sombra/tree/master/06-a-moment-in-crime)

- Status: Solved / Verified

On Tuesday, October 18th, the progress bar on http://amomentincrime.com finally reached 100%.

amomentincrime.com
------------------

Pulling the source code now reveals:

    $ curl amomentincrime.com
    <html>
    <p><br>
    <body bgcolor="black">
    <font face="lucida console" color="a939ff">
    ...Estableciendo conexi?n...<br>
    ...Protocolo Sombra v1.95 iniciado...<br>
    <br>
    ...Transmisi?n finalizada - finalizando carga... <br>
    ...Carga finalizada. Unidad Bastion E-54 comprometida...<br>
    <!-- v1.4.0.2.32448 -->
    <br>
    ...Terminando conexi?n...
    </body>
    </font>
    </p>
    </html>

You can see mention of Bastion (E-54) being compromised, as well as what looks like
an Overwatch version number in the comments

    v1.4.0.2.32448

Overwatch Patch 10/19/2016
--------------------------

A patch went out on Wednesday that made it so Bastion would start spewing out seemingly random
beeps when in Dorado.

YouTube Video: https://www.youtube.com/watch?v=Hkd__ceYm-Y

Reddit user [DecimalPoint](https://www.reddit.com/user/DecimalPoint) took the audio from it, ran it through Audacity, and
extracted the waveform revealing binary morse code.

![Bastion Binary](https://raw.githubusercontent.com/bahamas10/sombra/master/06-a-moment-in-crime/assets/bastion-binary.png)

Original Comment: https://www.reddit.com/r/Overwatch/comments/58bimb/bastion_dorado_sombra_beeps/d8z0ei2

Decoding the beeps as morse code we have the following output:

    S Q O F J F B N I T I Z W G D X S D O

Bastion Morse Code
------------------

The next step is to take this string of letters and convert it to something meaningful.

Like the [Mystery Achievement](https://github.com/bahamas10/sombra/tree/master/04-mystery-achievement), a [Vigenère
cipher](https://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher) was used to encrypt
this data.  The key to the cipher is the last bit of data we found from the
[Skycoder Forum Post](https://github.com/bahamas10/sombra/tree/master/05-skycoder-forum-post), `SOMBr@1NF:rM@7iON1SP0vvErrSOMBr@`.

    $ cat bastion.txt
    SQOFJFBNITIZWGDXSDO
    $ cat bastion.txt | ../04-mystery-achievement/vigenere-decode SOMBr@1NF:rM@7iON1SP0vvErrSOMBr@
    ACCESSWWWLUMERICOMX

Adding spaces and punctuation for readability we get

> Access www.lumerico.mx

Note: some Vigenere cipher algorithms online incorrectly handle special
characters in the input or key - a proper cipher should strip special
characters from the key and passthrough special characters from the input field.

Lumerico's Website
------------------

Accessing the website we see a phone number at the bottom of the page

> (510) 766-2726

Calling this phone number results in a pre recorded Spanish message
that eventually gets cut off, and all that is heard is a womans voice
reading numbers in Spanish (really awesome Blizzard!!)

Recording: https://soundcloud.com/jackwilsdon/510-766-2726a

Here are the numbers heard

    5 2 4 1 3 static 23 4 14 8 6 18 17 23 21 18 15

Converting the numbers to letters by using their value to represent
their spot in the alphabet (1 is a, 2 is b, etc.) we get:

    $ cat numbers.txt | ./numbers-to-text
    EBDAC WDNHFRQWURO

Now, running the result through a Caesar Cipher with the constant 23 we see:

    $ cat numbers.txt | ./numbers-to-text | ../05-skycoder-forum-post/caeser-cipher 23
    BYAXZ TAKECONTROL

Ignoring the first section for now (used later), we have `TAKECONTROL`.  This gets
appended to the original URL which gives us http://lumerico.mx/TAKECONTROL

    $ curl https://lumerico.mx/TAKECONTROL/index.html
    <html>
    <p><br>
    <body bgcolor="black">
    <font face="lucida console" color="a939ff">

    ethldt?o?esnoemfetuylm.bnlsssqtann)hcnslararuCpdGeoop?qubdsroaan.arnasdmdor1vrsmer?erlsdacnnnoaexedsidcn.iarsgcyi,iqeqnd.pooitoaeaaransterLet??edasodocMrnseeiuCsimnosetl?jnueodacapsadcoanfasest.rnucaodacadmdoemoip?ogPoipbehaSussai.,yccandin.reueatenaoiorneoeetao?yenimt?rPehec,uurobude?lrysriteenasni,adngpjr?lireecgrolsmhYnao?nmonomepeldezmapcpunoaulrrruCstmeitltetlr?esoapsd?yufcuascaa,rensbuinergnqedlmvlbpdtaz.enebuineuldoerecrGefqfirrasulrbeatHsilnba?aeeaaooassraooa,ioedo:aLiuielPr ursmoootlnieltee?nlosulobeauaanopearr?ieslt?yrosssisuaaeaenremsieaismdjmolrsspebiecd?yusittnvrcacp.taebrtLiunr?porner<br>
    <br>
    e?crneuyraarsettsyrseen.aaPnrneuyraeastuCpnhl/wLloaloa.qartlsyu?nreute.evgdpiu?bdmPooucvdeccmoreurr.o?unriorydbaSnalege?ezadien?utalaaioeemfcbgdinableoc??ppoeocelsumuoaHearsosqadrrrftuLiorannnoneneriiatcnlomoqnaqdunrcno,enmerosaereisloabolii.e.dormerosepopd?,eo:r#5scoegaqoeaibs(edioraamtd?rnlyoetjcgratmnrrobnrsstloeYqoeocicpn?mlpernmaepogenmodqamubodnaeasuaenMoolloupeqvgrLt?r<br>
    <br>
    tsosrdvoeaerroaeusdmaauamoMobsnaeanraunnt,roierbeoiemaodbmantursot?auoureeuoerreopc.etlr<br>
    <br>
    sot?neerLimeaFsNJ
    <br><br>
    <img src="https://lumerico.mx/calavera.png">
    </body>
    </font>
    </p>
    </html>

Stripping out HTML tags, we have just the raw code

    $ cat takecontrol.txt
    ethldtíoíesnoemfetuylm.bnlsssqtann)hcnslararuCpdGeoopéqubdsroaan.arnasdmdor1vrsmerñerlsdacnnnoaexedsidcn.iarsgcyi,iqeqnd.pooitoaeaaransterLetéáedasodocMrnseeiuCsimnosetlójnueodacapsadcoanfasest.rnucaodacadmdoemoipíogPoipbehaSussai.,yccandin.reueatenaoiorneoeetaoéyenimt¿rPehec,uurobudeílrysriteenasni,adngpjrálireecgrolsmhYnao?nmonomepeldezmapcpunoaulrrruCstmeitltetlróesoapsdéyufcuascaa,rensbuinergnqedlmvlbpdtaz.enebuineuldoerecrGefqfirrasulrbeatHsilnbaúaeeaaooassraooa,ioedo:aLiuielPr ursmoootlnielteeánlosulobeauaanopearrúiesltéyrosssisuaaeaenremsieaismdjmolrsspebiecdéyusittnvrcacp.taebrtLiunróporner

    eúcrneuyraarsettsyrseen.aaPnrneuyraeastuCpnhl/wLloaloa.qartlsyuínreute.evgdpiuábdmPooucvdeccmoreurr.o?unriorydbaSnalegeáezadienáutalaaioeemfcbgdinableoc¿éppoeocelsumuoaHearsosqadrrrftuLiorannnoneneriiatcnlomoqnaqdunrcno,enmerosaereisloabolii.e.dormerosepopdé,eo:r#5scoegaqoeaibs(edioraamtdírnlyoetjcgratmnrrobnrsstloeYqoeocicpnómlpernmaepogenmodqamubodnaeasuaenMoolloupeqvgrLtúr

    tsosrdvoeaerroaeusdmaauamoMobsnaeanraunnt,roierbeoiemaodbmantursotñauoureeuoerreopc.etlr

    sotñneerLimeaFsNJ

Take Control
------------

Using a [Columnar Transposition Cipher](https://www.staff.uni-mainz.de/pommeren/Cryptology/Classic/8_Transpos/Examples.html)
with the numerical constant of `52413` (from the phone call before the static),
the above text can be decoded into Spanish.

    $ cat takecontrol.txt | ./columnar-decode 52413
    Losfelicitoporhaberllegadohastaaquí.Soloqueríasabersiestabanlistos.(Hey,esmuydifícilencontrarbuenaayudaúltimamente...deberíanveralgunosdelospayasitosqueestántrabajandoconmigo)Porahora,continuemosconelverdaderoreto:acabarconLumériCoysupresidenteGuillermoPortero.¿Y porqué?Porqueesunhombrecodicioso,corruptoyunladrónabominable.Suplandetraerenlíneaelmásgrandeyelmáspoderosoziguratel1denoviembrenoesnadamásqueunaartimaña,unelaboradoplandesignadoparaejerceraúnmásinfluenciasobrelagentedeMéxicoyengordarlosbolsillosdesuscompinches.¿Yquiénvaapagarporeso?Lagentecomúnycorriente,losmismosquesiemprequedanolvidados.HeempezadoamejorarmisprotocolosparaqueseanusadosparaderrumbarlainfraestructuradeLumériCoyLosMuertostambiénestánintentandolevantarseencontradelacorrupción.Mientrastanto,escarbenporelsitiodeLumériCoybusqueninformaciónquepodamosusarencontradelcabrón,mejoraún,encuentrensunombredeusuarioycontraseñaparaasegurarnosdequeciertosdetallesnomuyfavorablessobreelpresidentito...aparezcan...PudeencontrarelnombredeusuarioycontraseñadeunempleadodesoportedeLumériCo,empiecenporahí:GFlores/g#fNwP5qJ

Adding spaces and newlines for legibility we have:

> Los felicito por haber llegado hasta aquí. Solo quería saber si estaban
> listos. (Hey, es muy difícil encontrar buena ayuda últimamente...deberían ver
> algunos de los payasitos que están trabajando conmigo) Por ahora, continuemos
> con el verdadero reto: acabar con LumériCo y su president e Guillermo
> Portero. ¿Y porqué? Porque es un hombre codicioso, corrupto y un ladrón
> abominable. Su plan de traer en línea el más grande y el más poderoso zigurat
> el 1 de noviembre no es nada más que una artimaña, un elaborado plan
> designado para ejercer aún más influencia sobre la gente de México y en
> gordar los bolsillos de sus compinches. ¿Y quién va a pagar por eso? La gente
> común y corriente, los mismos que siempre quedan olvidados.
>
> He empezado a mejorar mis protocolos para que sean usados para derrumbar la
> infraestructura de LumériCo y Los Muertos también están intentando levantarse
> en contra de la corrupción. Mientras tanto, escarben por el sitio de LumériCo
> y busquen información que podamos usar en contra del cabrón, mejor aún,
> encuentren su nombre de usuario y contraseña para asegurarnos de que ciertos
> detalles no muy favorables sobre el presidentito...aparezcan...
>
> Pude encontrar el nombre de usuario y contraseña de un empleado de soporte de
> LumériCo, empiecen por ahí:
>
> GFlores/g#fNwP5qJ

Translated

> I'm congratulating you for getting in here. I only wanted to know if you were
> ready or not. (Hey, it's really difficult to get good help lately... you
> should see some of the clowns I'm working with). For now, let's continue with
> the true challenge: taking down Lumerico Corp president Guillermo Portero.
> Why? Because he's a greedy and corrupt man, and an abominable thief. His plan
> of bringing in line the most powerful and biggest zigurat the 1st of november
> us nothing more than a deceit, an elaborate plan by his gang to become even
> more influential in the people of Mexico and get more money. And who's gonna
> pay for that? Common people, the ones that are always forgotten.
>
> I've started upgrading my protocols so that they are used to take down the
> Lumerico Corp infraestructure and Los Muertos are also trying to go against
> the corruption. Meanwhile, search the Lumerico Corp site for info we can use
> against the bastard, or better, get his username and password so that
> hundreds "not so favorable" facts about the president start popping up.
>
> I was able to get the username and pass of a Lumerico Corp employee, start here:
>
> GFlores/g#fNwP5qJ

Lumerico Login
--------------

This is where it gets fun - we can now login to the Lumerico website using
the above username and password! Sombra's turning us into the hackers? Using us
as her personal army?

Login page: https://lumerico.mx/login

The username is `GFlores` and the password is `g#fNwP5qJ` - it's common practice to separate
username and password with a single `/` character.

There are a lot of emails to sift through, but the most important one seems to be this one:

> De:Valeria Valderrama<VValderama@lumerico.mx>
> Para:Gonzalo Flores<GFlores@lumerico.mx>
> Asunto:Página de Guillermo
>
> Hola, Gonzo:
> ¿Puedes ver el tráfico de https://lumerico.mx/president-bypass? Guillermo
> debería ser el único accediendo desde su página de inicio privada, pero
> parece que está teniendo mucho tráfico. Tal vez tengamos que escalar esto a
> la señorita Jiménez, pero quiero estar segura de que es digno de su tiempo.
>
> Valeria Valderrama

Translated

>
> Hello, Gonzo: Can you see traffic https://lumerico.mx/president-bypass?
> William should be the only page by pointing your private home, but seems to
> be having a lot of traffic. We may have to escalate this to Miss Jimenez, but
> I want to be sure it's worth your time.
>
> Valeria Valderrama

It basically says there is a page for the President to login

Page: https://lumerico.mx/president-bypass

When trying to load the page we get an Access Denied page (though, funny enough, the site actually returns
a 200 OK and not a 403 error as you would expect).

    $ curl -sI https://lumerico.mx/president-bypass | head -1
    HTTP/1.1 200 OK

Not strictly important - just thought it was worth noting.  Looking in the source code
there is a very interesting comment:

    $ curl -sS https://lumerico.mx/president-bypass | grep -o '<!--[^>]*-->'
    <!-- President Auth-Bypass Revision 1.02: /.git/ -->

The `/.git/` line is giving is a hint that this `president-bypass` section of the website
is controlled by [Git](https://git-scm.com/) - source code revision control software.

President Bypass Source Code
----------------------------

Doing web requests for `git` style files reveals something interesting.

    $ curl -sSI https://lumerico.mx/president-bypass/.git | head -1
    HTTP/1.1 403 Forbidden
    $ curl -sSI https://lumerico.mx/president-bypass/.git/HEAD | head -1
    HTTP/1.1 200 OK
    $ curl -sSI https://lumerico.mx/president-bypass/.git/config | head -1
    HTTP/1.1 200 OK

The directory listings on this webserver have been disabled (we get a 403 when
hitting `./git` directly) but the files inside the repository seem to be accessible
if you know the URLs.

NOTE: `HEAD` and `config` are common file names for git repositories - I only know this
because I've worked with `git` for source control almost exclusively for the last ~6 years.

[GitDumper](https://github.com/internetwache/GitTools/tree/master/Dumper) was used
by some on Reddit (can't find original link, sorry!) to pull as many files as they could
to rebuild the git repository locally to find any interesting files.  I personally
could not get `gitdumper.sh` to work because it made a lot of assumptions about the version
of `grep` installed and how it was compiled.

So instead, I wrote my own program in node based on GitDumper called
[git-dump](https://github.com/bahamas10/node-git-dump) to do this.  Running it,
we can rebuild the repository:

    $ npm install -g git-dump
    $ git dump https://lumerico.mx/president-bypass/.git president-bypass
    ...
    $ cd president-bypass
    $ git log
    commit 677d90499d571221e2ec71914e56aee35afa9340
    Author: pedro <pedro@lumerico.mx>
    Date:   Wed Oct 12 20:09:41 2016 -0400

        president auth bypass

        Signed-off-by: pedro <pedro@lumerico.mx>
    $ git ls-files
    class.authentication.php
    class.president-bypass.php
    login.php
    style.css

The full output is a bit long and can be found
[here](https://gist.github.com/bahamas10/6d8d4855fcbcfa22e5ac915a9ef01e62).
The 4 files found can also be seen formatted nicely
[here](https://gist.github.com/bahamas10/fe6331b01e4ba6b5266248c6e06644e3).

There are a couple things to note

1. There is only 1 commit so the code was very easy to extract
2. The `file corrupted` text seems to have been added manually (on purpose)

The code files are in [PHP](https://secure.php.net/): PHP is a server-side
language used commonly for web applications.  Because the code is executed on
the server, it is impossible for us to know (without the source code) what
exactly is happening.  However, now that we have the President's encrypted
password in
[class.president-bypass.php](https://gist.github.com/bahamas10/fe6331b01e4ba6b5266248c6e06644e3#file-class-president-bypass-php):

    private $encrypted_password = "?MzY:MTI5:?AzY:OWM?:?EDO:ZGU?:jVTM:MTJm:2ITM:MTUw:?QjY:OWY?:?kTO:MTQx:?MzY";

as well as the encrypt function in
[class.authentication.php](https://gist.github.com/bahamas10/fe6331b01e4ba6b5266248c6e06644e3#file-class-authentication-php):

    public function encrypt($password) {
        $passArray = str_split($password);
        $encrypted = array();
        foreach($passArray as $char) {
            $salt = count($encrypted);
            $char = base64_encode(dechex(ord($this->str_rot($char,($salt+3)))*3));
            if($salt % 2 == 0) $char = strrev($char);
            array_push($encrypted, $char);
        }
        $encrypted = implode(":", $encrypted);
        $encrypted = str_replace("=", "?", $encrypted);
        return $encrypted;
    }

We can reverse engineer it and create our own `decrypt` function to get the
President's password!

The President's Password
------------------------

Using the logic in `encrypt()`, we can take the President's encrypted password
and decrypt it.  This line in the code basically has the meat of the encryption
function:

    $char = base64_encode(dechex(ord($this->str_rot($char,($salt+3)))*3));

Indenting it, we get

    base64_encode(
      dechex(
        ord(
         $this->str_rot(
           $char, ($salt + 3)
         )
        ) * 3
      )
    );

Or in pesudo-code

    str_rot($char, ($salt + 3)
    ord(result)
    dechex(result)
    base64_encode(result)

To create the program
[decrypt-password](https://github.com/bahamas10/sombra/blob/master/06-a-moment-in-crime/decrypt-password)
I had to reverse all of the functions used.  For example, `ord` (convert ascii
to numerical value) required its compliment `chr` (convert number to ascii
representation), `dechex` (convert decimal to hex) required its compliment
`hexdec` (convert hex to decimal), `base64_encode` required `base64_decode`,
and `str_rot` doesn't have a compliment in code.  To reverse a `rot-n` of a
number you just use `26 - n`.  For example, a rot-2 can be undone with a
rot-24.

Writing all of that logic, the command line program can be used to decrypt the password:

    $ ./decrypt-password '?MzY:MTI5:?AzY:OWM?:?EDO:ZGU?:jVTM:MTJm:2ITM:MTUw:?QjY:OWY?:?kTO:MTQx:?MzY'
    Xy@4+Bkuqd<53uJ

Using the username `GPortero` (based off the login in the PHP file) and this password, we
can [login](https://lumerico.mx/email) and see the President's emails

The President's Email
---------------------

After browsing the email for a bit, a new email came in from `#Mantenimiento<#Mantenimiento@lumerico.mx>`
which translates to maintenance with the subject Buen Trabajo, or Good Job and signed with a skull image.

> Veo que se han podido infiltrar en su correo.
>
> No se preocupen, él no puede ver este correo, lo he ocultado de su vista si
> se conecta desde una de sus direcciones conocidas de IP.
>
> Necesito un poco más de tiempo para establecer el próximo grupo de potocolos.
> Manténganse atentos a principios de la otra semana. Le echaré unos cuantos
> trapitos sucios en sus correos para que se filtren al público
> "accidentalmente". Ya veremos como reaccionan los medios de comunicación.

Translated

> I see you have been able to infiltrate in your mail.
>
> Do not worry, he can not see this email, I've hidden from view if you connect
> from one of the known IP addresses.
>
> I need a little more time to set the next group of protocols. Stay tuned
> early next week. I'll take a few dirty rags in their emails to be filtered to
> the public "accidentally". We'll see how they react to the media.

Conclusion
----------

It looks like we are waiting until next week for anything more!

References
----------

- https://www.reddit.com/r/Overwatch/comments/58bimb/bastion_dorado_sombra_beeps/
- http://wiki.gamedetectives.net/index.php?title=Sombra_ARG#A_Moment_in_Crime_Transmission
- https://www.reddit.com/r/Overwatch/comments/58bimb/bastion_dorado_sombra_beeps/d8z0ei2
