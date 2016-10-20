A Moment In Crime
=================

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

![Bastion Binary](assets/bastion-binary.png)

Original Comment: https://www.reddit.com/r/Overwatch/comments/58bimb/bastion_dorado_sombra_beeps/d8z0ei2

Decoding the beeps as morse code we have the following output:

    S Q O F J F B N I T I Z W G D X S D O

Bastion Morse Code
------------------

The next step is to take this string of letters and convert it to something meaningful.

Like the [Mystery Achievement](../04-mystery-achievement), a [Vigenère
cipher](https://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher) was used to encrypt
this data.  The key to the cipher is the last bit of data we found from the
[Skycoder Forum Post](../05-skycoder-forum-post), `SOMBr@1NF:rM@7iON1SP0vvErrSOMBr@`.

    $ cat bastion.txt
    SQOFJFBNITIZWGDXSDO
    $ cat bastion.txt | ../04-mystery-achievement/vigenere-decode SOMBr@1NF:rM@7iON1SP0vvErrSOMBr@
    ACCESSWWWLUMERICOMX

Adding spaces and punctuation for readability we get

> Access www.lumerico.mx

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
with the numerical constant of 52413 the above text can be decoded into Spanish.

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

Now here's the awesome part - we can now login to the Lumerico website using
the above username and password.

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

It basically says there is a page for the president to login

Page: https://lumerico.mx/president-bypass

When trying to load the page we get an Access Denied page (though, funny enough, the site actually returns
a 200 OK and not a 403 error as you would expect).

    $ curl -sI https://lumerico.mx/president-bypass | head -1
    HTTP/1.1 200 OK

Nothing important - just thought it was worth noting.  Looking in the source code
there is a very interesting comment:

    $ curl -sS https://lumerico.mx/president-bypass | grep -o '<!--[^>]*-->'
    <!-- President Auth-Bypass Revision 1.02: /.git/ -->

TODO:
- .git dump
- PHP auth code reverse engineer
- president auth emails

References
----------

- https://www.reddit.com/r/Overwatch/comments/58bimb/bastion_dorado_sombra_beeps/
- http://wiki.gamedetectives.net/index.php?title=Sombra_ARG#A_Moment_in_Crime_Transmission
- https://www.reddit.com/r/Overwatch/comments/58bimb/bastion_dorado_sombra_beeps/d8z0ei2
