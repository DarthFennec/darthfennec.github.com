build: miskatonic
	-docco -t spinnychair.jst -o . src/*.md

miskatonic: Miskatonic-Engine/miskatonic.min.js Miskatonic-Engine/doc
	mkdir -p miskatonic
	cp -r Miskatonic-Engine/img miskatonic
	cp -r Miskatonic-Engine/snd miskatonic
	cp -r Miskatonic-Engine/txt miskatonic
	cp Miskatonic-Engine/astar-min.js miskatonic
	cp Miskatonic-Engine/modernizr.js miskatonic
	cp Miskatonic-Engine/miskatonic.min.js miskatonic
	-docco -t spinnychair.jst -o miskatonic src/miskatonic/index.md

Miskatonic-Engine/miskatonic.min.js:
	make -C Miskatonic-Engine min

Miskatonic-Engine/doc:
	-docco -t spinnychairdoc.jst -o miskatonic/docs Miskatonic-Engine/src/*.coffee

clean:
	rm -rf miskatonic *.html

test:
	python -m http.server
