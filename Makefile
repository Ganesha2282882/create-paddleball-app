all:
	mv main.sh create-paddleball-app
	chmod +x create-paddleball-app
install: all
	cp create-paddleball-app /usr/local/bin
