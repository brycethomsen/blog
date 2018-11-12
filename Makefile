.PHONY: convert
convert: ffmpeg imagemagick

.PHONY: imagemagick
imagemagick:
	docker run -it --rm -v `pwd`/out:/home/bryce/out -v `pwd`/raw:/home/bryce/raw brycethomsen/imagemagick -resize 1280x720 -quality 100 -path /home/bryce/out /home/bryce/raw/*.jpg
	
.PHONY: touchup
touchup:
	docker run -it --rm -v /home/bryce/git/blog/static/img/out:/home/bryce/out -v /home/bryce/git/blog/static/img/raw:/home/bryce/raw brycethomsen/imagemagick -quality 82 -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -depth 8 -path /home/bryce/out /home/bryce/raw/*.png

.PHONY: ffmpeg
ffmpeg:
	docker run -it --rm -v `pwd`/out:/home/bryce/out -v `pwd`/raw:/home/bryce/raw brycethomsen/ffmpeg
