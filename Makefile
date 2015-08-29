PACK=-package bytestring -package bytestring-trie -package posix-paths -package Glob -package directory -package aeson
C_CMD=-no-hs-main dropbox_inj.c ignore.o -optl -dynamiclib $(PACK) -optl -static
HS_CMD=-c ignore.hs

all: build

build:
	/usr/local/bin/ghc -threaded $(HS_CMD)
	/usr/local/bin/ghc -threaded $(C_CMD) -o dropbox_inj.dylib

install: build
	./install

clean:
	rm -rf *.hi *.o dropbox_inj.dylib