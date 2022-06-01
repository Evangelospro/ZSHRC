# Get my (public) IP
function pubip() {
    echo -n "Current External IP: "
    curl icanhazip.com
}

# Get local IPs
function localip() {
    ifconfig | grep "inet " | awk '{ print $2 }'
}

# An all in one extract function for all archive types
function extract {
if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                        tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                        7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                        echo "extract: '$n' - unknown archive method"
                        return 1
                        ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}


# navigation
up () {
local d=""
local limit="$1"

# Default to limit of 1
if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
limit=1
fi

for ((i=1;i<=limit;i++)); do
d="../$d"
done

# perform cd. Show error if cd fails
if ! cd "$d"; then
echo "Couldn't go up $limit dirs.";
fi
}

# Adding onefetch to every cd you do with a .git dir
cd () {
	__zoxide_z "$@"
	git rev-parse 2> /dev/null
	if [ $? -eq 0 ]
	then
		if [ "$LAST_REPO" != $(basename "$(git rev-parse --show-toplevel)") ]
		then
			onefetch
			LAST_REPO=$(basename "$(git rev-parse --show-toplevel)") 
		fi
	fi
}

copyfile(){
[ -n "$1" ]\
&& CPFILE="$@"\
&& readlink -f "$CPFILE" | tr -d '\n' | pbcopy
}

urlencode() {
LC_ALL=C awk -- '
    BEGIN {
    for (i = 1; i <= 255; i++) hex[sprintf("%c", i)] = sprintf("%%%02X", i)
    }
    function urlencode(s,  c,i,r,l) {
    l = length(s)
    for (i = 1; i <= l; i++) {
        c = substr(s, i, 1)
        r = r "" (c ~ /^[-._~0-9a-zA-Z]$/ ? c : hex[c])
    }
    return r
    }
    BEGIN {
    for (i = 1; i < ARGC; i++)
        print urlencode(ARGV[i])
    }' "$@"
}