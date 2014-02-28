#amount of phonems to string together
N=$(shuf --input-range=1-10 | head -n 1)

genderArray=("m" "f")

phonemeArray=("i:" "ɪ" "ʊ" "u:" "e" "ə" "ɜ:" "ɔ:" "æ" "ʌ" "ɑ:" "ɒ" "p" "b" "t" "d" "ʧ" "ʤ" "k" "g" "f" "v" "θ" "ð" "s" "z" "ʃ" "ʒ" "m" "n" "ŋ" "h" "l" "r" "w" "j" "ɪə" "eɪ" "ʊə" "ɔɪ" "əʊ" "eə" "aɪ" "aʊ")

voiceArray=("afrikaans" "aragonese" "bulgarian" "bosnian" "catalan" "czech" "welsh" "danish" "german" "greek" "default" "english" "en-scottish" "english-north" "english_rp" "english_wmids" "english-us" "en-westindies" "esperanto" "spanish" "spanish-latin-am" "estonian" "Farsi" "Farsi-Pinglish" "finnish" "french-Belgium" "french" "irish-gaeilge" "greek-ancient" "hindi" "croatian" "hungarian" "armenian" "armenian-west" "indonesian" "icelandic" "italian" "lojban" "georgian" "kannada" "kurdish" "latin" "lithuanian" "latvian" "macedonian" "malayalam" "malay" "nepali" "dutch" "norwegian" "punjabi" "polish" "brazil" "portugal" "romanian" "russian" "slovak" "albanian" "serbian" "swedish" "swahili-test" "tamil" "turkish" "vietnam" "vietnam_hue" "vietnam_sgn" "Mandarin" "cantonese")

text=$(
	for index in `shuf --input-range=0-$(( ${#phonemeArray[*]} -1 )) | head -${N}`
	do
		echo -ne ${phonemeArray[$index]}
	done
)

voice=${voiceArray[$(shuf --input-range=1-68 | head -n 1)]}

gender=${genderArray[$(shuf --input-range=0-1 | head -n 1)]}

echo "$text" >> spokentext.txt

python lexconvert.py --phones2phones unicode-ipa espeak $text | espeak -p $(shuf --input-range=0-99 | head -n 1) -v $voice+"$gender"$(shuf --input-range=0-4 | head -n 1) -s $(shuf --input-range=100-200 | head -n 1) -w speech.wav

sox speech.wav padded.wav pad 0.1 0.3

sox padded.wav -1 -u -c 1 -r 4000 -t raw rawfile

#add the text to the images
convert pango:'<span size="300000" rise="-10000" foreground="white" background="#A80000"> '$text' </span>' 1.jpg +swap -gravity south -composite -scale 40% mouth-closed.png

convert pango:'<span size="300000" rise="-10000" foreground="white" background="#A80000"> '$text' </span>' 2.jpg +swap -gravity south -composite -scale 40% mouthopen-1.png

convert pango:'<span size="300000" rise="-10000" foreground="white" background="#A80000"> '$text' </span>' 3.jpg +swap -gravity south -composite -scale 40% mouthopen-2.png

#run the lip-sync software to generate a video
python lip-sync.py

#clean up files
rm speech.wav padded.wav rawfile spokentext.txt
