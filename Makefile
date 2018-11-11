.PHONY: convert
convert: ffmpeg imagemagick

.PHONY: imagemagick
imagemagick:
	docker run -it --rm -v `pwd`/out:/home/bryce/out -v `pwd`/raw:/home/bryce/raw brycethomsen/imagemagick -resize 1280x720 -quality 100 -path /home/bryce/out /home/bryce/raw/*.jpg

.PHONY: ffmpeg
ffmpeg:
	docker run -it --rm -v `pwd`/out:/home/bryce/out -v `pwd`/raw:/home/bryce/raw brycethomsen/ffmpeg