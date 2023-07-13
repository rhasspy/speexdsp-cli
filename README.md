# speexdsp-cli

Tiny program to filter an audio stream through [speex](https://www.speex.org/) for noise suppression.

``` sh
arecord -r 16000 -c 1 -f S16_LE -t raw | ./speexdsp-cli | aplay -r 16000 -c 1 -f S16_LE -t raw
```
