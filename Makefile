HUGO_VER=0.30.2
S3_BUCKET=brycethomsen.com

all: clean init site push

init:
	mkdir -p build/
	curl -sL -o build/hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VER)/hugo_$(HUGO_VER)_Linux-64bit.tar.gz
	tar xvf build/hugo.tar.gz --directory build/ && \
	cd build && rm hugo.tar.gz README.md LICENSE.md

site: init
	cd build/ && \
	./hugo new site ../build/brycethomsen && \
	cp ../config.toml brycethomsen/config.toml && \
	cp -r ../posts/* brycethomsen/content && \
	cd ../build/brycethomsen && \
	git clone --depth 1 https://github.com/MunifTanjim/minimo themes/minimo && \
	echo 'theme = "minimo"' >> config.toml && \
	../hugo -v
	cp robots.txt build/brycethomsen/public

push:
	## careful ##
	aws s3 rm s3://$(S3_BUCKET) --recursive
	##
	aws s3 cp --recursive build/brycethomsen/public s3://$(S3_BUCKET)

cfn:
	aws cloudformation package \
	   --template-file cfn-template.yml \
	   --output-template-file serverless-output.yaml \
	   --s3-bucket func-pkg/bryce/
	aws cloudformation deploy \
   --template-file serverless-output.yaml \
	 --stack-name brycethomsen \
   --capabilities CAPABILITY_IAM \
	 --parameter-overrides \
	 		S3BucketName=$(S3_BUCKET)

test: clean init site
	cd build/brycethomsen && \
	../hugo server -D

clean:
	rm -rf build/ serverless-output.yaml
