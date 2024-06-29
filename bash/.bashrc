export PATH=$PATH:/home/jcd/.local/bin

#dictonary shortcut
alias define="sdcv"

#list some stuff
alias ll="ls -lhSa"

#get online
alias wifiplease="sudo wifi-menu"

#keep me from being an idiot
alias rm="rm -i"

##
export VMAIL_BROWSER='elinks'

# Im so very tired of allways using these three commands....
alias gtexpush="git add *.tex *.pdf && git commit -m \" generic tex update\" && git push"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Just some useful aliases
alias ls='ls --color=auto'

#cleans all class files out of java project
classclean (){
	find . -name \*.class -delete 	
}

#make a directory then access it
mkcd(){
	mkdir -p -- "$1" && cd -P -- "$1"
}


#makes a pages css and jsx files
mkjsxpg(){
	touch "$1.css" && touch "$1.jsx"
}

asmexc(){
	#read -p "enter asm type: " response
	
	#if[ $response = "64bit" ] then
		nasm -f elf64 $1
		ld -s -o testexc "${1%.*}.o"
	
}

#unzips all .zip folders in current directory
unzipdir(){
	find . -name "*.zip" | while read filename; do unzip -o -d "`basename -s .zip "$filename"`" "$filename"; done;	
}

#removes all .zip folders in current directory
cleanzip(){
	find . -name "*.zip" | while read filename; do rm "$filename"; done;
}

#removes all swap files from a directory
cleanswp(){
	find . -type f -name "*.sw[klmnop]" -delete
}

#matrix effect
matrix(){
	echo -e "\e[1;40m" ; clear ; while :; do echo $LINES $COLUMNS $(( $RANDOM % $COLUMNS)) $(( $RANDOM % 72 )) ;sleep 0.05; done|awk '{ letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()"; c=$4; letter=substr(letters,c,1);a[$3]=0;for (x in a) {o=a[x];a[x]=a[x]+1; printf "\033[%s;%sH\033[2;32m%s",o,x,letter; printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;if (a[x] >= $1) { a[x]=0; } }}'
}

#count all files in a given directory
count(){
	ls -l $1 | egrep -c '^-'	
}

#star wars!!
alias starwars="telnet towel.blinkenlights.nl"

# gitignores
alias getgitignore="curl -L -s https://www.toptal.com/developers/gitignore/api/$1"

# alias to open docker interactive terminal for a given container
alias dit="docker exec -it $1 /bin/bash"

# alias to run docker container on port 8080
alias drun="docker run -p 8080:8080 $1"

#alisas to list all docker containers
alias dls="docker ps -a"

