# ImgDown

## Background 
I made this program as a practice to learn ruby. What this program does is to
recursively search a HTML-document for links and images a extract their source
and pointer. Then with regular expression you can choose what of those you want
to download.

## Installation
Assuming you running some Debian based OS. Install Ruby (>= 1.9.3) and Git,
run: 
```
$ sudo apt-get install ruby git
```

Choose a suitable directory and run following commands:
```
$ git clone https://github.com/medik/ImgDown.git
$ cd ImgDown
$ sudo gem install -g
```
## Usage

You should be able to run the program after completing the installation step.
For more information how to use it, consult `./imgdown -h`.

### Examples

To get all links and pictures from a webpage, just type:
`./imgdown --link http://link/to/webpage`

This works for https links as well.
`./imgdown --link https://link/to/webpage`

To specify with regex, type:
`./imgdown --link http://link/to/webpage --reg-ex "catpictures[0-9]+\.jpe?g"`

Found a range of picture you want to download? Download with:
`./imgdown --link http://link/to/webpage --reg-ex "catpictures[0-9]+\.jpe?g" --download`

You might want to specify location.. 
`./imgdown --link http://link/to/webpage --reg-ex "catpictures[0-9]+\.jpe?g" --download --destination "~/mycatpictures"`

The website didn't want you to download your catpictures? Hehehe..
`./imgdown --link http://link/to/webpage --reg-ex "catpictures[0-9]+\.jpe?g" --download --destination "~/mycatpictures" --user-agent "Catfox v.1337"`

You're a person who forgets a lot?
`./imgdown --help`

## Licence
This work is available under GPL v3.
