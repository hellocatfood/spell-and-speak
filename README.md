spɛl ænd spik
=============

Phonemes are the smallest units of sound in a language. Unlike letters which describe how words are written, phonemes describe how words should be pronounced. There around 44 phonemes in the English language, though this varies with different accents and dialects.

In spɛl ænd spik I hand over the composition of these phonemes to a computer program and text-to-speech software. Unlike the process of haphazardly arranging letters, when phonemes are strung together there is less chance of the result being unpronouncable.

When compososed haphazardly by a computer do these new sounds make sense to human listeners? Can they be mistaken for English? Do changes in the voice, speed, pitch and gender of the computerised voice affect how we interpret these nonsensical sounds? Does the use of a human avatar help our understanding of these sounds as English words?

spɛl ænd spik was developed by [Antonio Roberts](http://hellocatfood.com) for [Electronic Voice Phenomena](http://www.electronicvoicephenomena.net/) in 2014.  

spɛl ænd spik uses code by [Silas S. Brown](http://people.ds.cam.ac.uk/ssb22/)
* [linuxgazette.net/181/brownss.html](linuxgazette.net/181/brownss.html) - Simple lip-sync animations in Linux
* [lexconvert](http://people.ds.cam.ac.uk/ssb22/gradint/lexconvert.html) - a converter between the lexicon formats of different speech synthesizers


spɛl ænd spik was developed with programming assitance from [Michael Murtaugh](http://automatist.org/kiss/) and photographic assitance from [Pete Ashton](http://art-pete.com/)

Dependencies
============

spɛl ænd spik was developed on Ubuntu 13.10 with the following sofware:
* espeak
* python
* sox
* mencoder

Usage
=====

Take three pictures. One with your mouth closed (1.jpg), one with your mouth partly open (2.jpg) and one with your mouth fully open (3.jpg) (instructions adapted from [here](http://linuxgazette.net/181/brownss.html)). Put these in the same location as this script.

In the terminal run ./spell_and_speak.sh