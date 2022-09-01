all: check tarball hash clean

check:
ifndef VERSION
	@echo Warning: VERSION isn\'t defined\; continue? [Y/n]
	@read line; if [ $$line = "n" ]; then echo aborting; exit 1 ; fi
endif

tarball: install.py install.py motd users main.py
	tar -cvf ${VERSION}.tar.xz $?
	$(info Tarball)

hash: ${VERSION}.tar.xz
	cat ${VERSION}.tar.xz | md5 > ${VERSION}.tar.xz.md5b
	head -c 32 ${VERSION}.tar.xz.md5b > ${VERSION}.tar.xz.md5
	$(info Hash)

install: ${VERSION}.tar.xz ${VERSION}.tar.xz.md5
	cp ${VERSION}.tar.xz /data/web/nebps/motd
	cp ${VERSION}.tar.xz.md5 /data/web/nebps/motd

clean:
	$(info Cleaning)
	rm ${VERSION}.tar.xz.md5b
