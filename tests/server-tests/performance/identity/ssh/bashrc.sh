export PS1='\[\e[4;36m\]\t\[\e[24m\] \u@\H: \w\[\e[m\]\n$ '

alias ...='cd ../..'
alias ....='cd ../../..'

#{{{ function lll to list complete path including hostname suitable for scp command
function lll {
echo "root@`uname -n`:`pwd`"
}
#}}}

#{{{function c() to call bc to do the calculation
function c() {
	BC_ENV_ARGS=-l
	echo "scale=4; $@" | bc
}
#}}}

#{{{ function dusf()
function dusf() {
	du -c -h --max-depth=1 -x $@
}

#}}}

#{{{ function mkdir_date to create directory with current date as prefix

function mkdir_date ()
{
    NAME=`date +%Y-%b-%d`-$1;
    mkdir $NAME;
    ls -F -ld $NAME
}

#}}}

#{{{ function touch_date  to create file with current date as prefix
function touch_date ()
{
    DIR=`dirname $1`
    FILE=`basename $1`
    NAME=`date +%Y-%b-%d`-$FILE;
    touch $DIR/$NAME;
    ls -F -ld $DIR/$NAME
}
#}}}

# {{{ password_generate to create random passwords
function password_generate {
LENGTH=${1:-20}
LINES=${2:-10}
INPUT=$((LENGTH * LINES * 3 ))  #for 1 printable character, ~3 random chars are needed
(head -c $INPUT /dev/urandom | tr -cd '[:graph:]' | fold -w $LENGTH && echo ) | head -n $LINES
}
#}}}

#{{{ function rpm_list (list contans of rpm file)
function rpm_list() {
for option in $@
do
  if [ -f $option ] 
  then
    cecho "$option is a file - running /bin/rpm -q --package -l $option" $yellow 1>&2
    /bin/rpm -q --package -l $option
  else
    cecho "$option is not a file - looking in installed rpm packages - running /bin/rpm -q -l $option" $yellow 1>&2
    /bin/rpm -q -l $option
  fi
done
return 0
}
#}}}

#{{{ function rpm_contents (reports the contents of installed rpm)

#rpm_by_date | tail -1
#1209250468 (Sun 27 Apr 2008 12:54:28 AM CEST) ffmpeg
#rpm_contents ffmpeg
#Name        : ffmpeg                       Relocations: /usr
#Version     : 0.4.9                             Vendor: http://packman.links2linux.de

alias rpm_contents='rpm_list'
#}}}

#{{{ function rpm_by_date (list all installed rpms by installation date)
function rpm_by_date() {
	/bin/rpm -qa --queryformat '%{installtime} (%{installtime:date}) %{name}\n' | sort -n
}
#}}}

#{{{ function rpm_unpack (unpack contants of rpm)
function rpm_unpack() {
	/usr/bin/rpm2cpio $@ | cpio -idmv
}
#}}}

#{{{ function rpm_specfile (acts only on installed rpm)
function rpm_specfile(){
for option in $@
do
  if [ -f $option ]
  then
    cecho "$option is a file - but this command is acting ONLY on installed packages!" $red 1>&2
    cecho "Skipping $option" $red 1>&2
  else
    cecho "Running /usr/bin/rpmrebuild -s - $option" $yellow 1>&2
    /usr/bin/rpmrebuild -s - $option
  fi
done	
return 0
}
# }}}

#{{{ #function rpm_info
function rpm_info(){
for option in $@
do
  if [ -f $option ] 
  then
    cecho "$option is a file - running /bin/rpm -q --package -i $option" $yellow 1>&2
    /bin/rpm -q --package -i $option
  else
    cecho "$option is not a file - looking in installed rpm packages - running /bin/rpm -q -i $option" $yellow 1>&2
    /bin/rpm -q -i $option
  fi
done
return 0
}
#}}}

#{{{ #function rpm_scripts
function rpm_scripts(){
for option in $@
do
  if [ -f $option ] 
  then
    cecho "$option is a file - running /bin/rpm -q --package --scripts $option" $yellow 1>&2
    /bin/rpm -q --package --scripts $option
  else
    cecho "$option is not a file - looking in installed rpm packages - running /bin/rpm -q --scripts $option" $yellow 1>&2
    /bin/rpm -q --scripts $option
  fi
done
return 0
}
#}}}

#{{{ #function rpm_provides
function rpm_provides(){
for option in $@
do
  if [ -f $option ] 
  then
    cecho "$option is a file - running /bin/rpm -q --package --provides $option" $yellow 1>&2
    /bin/rpm -q --package --provides $option
  else
    cecho "$option is not a file - looking in installed rpm packages - running /bin/rpm -q --provides $option" $yellow 1>&2
    /bin/rpm -q --provides $option
  fi
done
return 0
}
#}}}

#{{{ #function rpm_requires
function rpm_requires(){
for option in $@
do
  if [ -f $option ] 
  then
    cecho "$option is a file - running /bin/rpm -q --package --requires $option" $yellow 1>&2
    /bin/rpm -q --package --requires $option
  else
    cecho "$option is not a file - looking in installed rpm packages - running /bin/rpm -q --requires $option" $yellow 1>&2
    /bin/rpm -q --requires $option
  fi
done
return 0
}
#}}}

#{{{ #function in which rpm is given file?
function rpm_file_in_which_rpm(){
for option in $@
do
  if [ -f $option ]
  then
    echo -ne "Checking '$option'\t" 1>&2
    /bin/rpm -qf $option
  else
    echo "'$option' is not a file." 1>&2
    echo "Trying which $option" 1>&2
    which_option=`which $option| grep -v alias` 1>&2
    if [ -z $which_option ]
    then
      echo "which failed - skipping $option." 1>&2
    else
      echo -ne "Checking '$which_option'\t" 1>&2
      /bin/rpm -qf $which_option
    fi   
  fi
done
return 0
}
#}}}

#{{{ #function rpm_verify - 
#To verify an installed package. This command will list all files 
#that do NOT pass the verify tests (done on size, MD5 signature, etc).
#Where a file does NOT pass, the output is listed using the following
#codes that signify what failed:
#
#  S File size
#  M Mode (includes permissions and file type)
#  5 MD5 sum
#  L Symlink 
#  D Device 
#  U User 
#  G Group 
#  T Mtime
function rpm_verify(){
for option in $@
do
  if [ -f $option ] 
  then
    echo "'$option' is a file, still trying to run check." 1>&2
  fi
  /bin/rpm --verify $option
done
cat <<InputComesFromHERE
Where a file does NOT pass, the output is listed using the following
codes that signify what failed:

  S File size
  M Mode (includes permissions and file type)
  5 MD5 sum
  L Symlink 
  D Device 
  U User 
  G Group 
  T Mtime
  c tells us this is a configuration file so that explains the changes
InputComesFromHERE
return 0
}
#{{{ #function fix_sound
function fix_sound() {
/etc/init.d/alsasound stop
rmmod cx88_dvb cx88_vp3054_i2c dvb_core video_buf_dvb dvb_core cx88_alsa snd_pcm snd_timer snd_pcm_oss snd_hda_intel cx88_alsa
rmmod cx88_dvb cx88_vp3054_i2c dvb_core video_buf_dvb dvb_core cx88_alsa snd_pcm snd_timer snd_pcm_oss snd_hda_intel cx88_alsa
alsaconf
/etc/init.d/alsasound start
}
#}}}
#}}}

#{{{ Mouse button 3 function:
   #   if the argument is a file,
   #   then check if the file is excetuble or script and call it
   #   else call the application regarding the extension 
   #   else, if the selection is a directory then go into this directory and list the files
   #   else, if the argument is empty, go one directory up
   #   else give error message
   #   while without argument it goes one directory up it makes good sense to define alias .. for this
#---------------------------------------------------------------------------
function Btn3Down()
   {
      buffer=$1
      if [[ -f "${buffer}" ]] 
      then
         #filetype=$(head -1 ${buffer} | awk '{print $1}')
	 #tohle je zahada, co tim chtel basnik rici, co ted s filetype?
	 #prvni slovo v souboru
	 #if [[ "$filetype" = "<MakerFile" ]]
	 #	then
	 #       $CADENV_HOME/cadbin/demomakersgml -f ${PWD}/${buffer}
	 #	else
	 first_two=$(head -1 ${buffer} | cut -b 1-2)
	 first_four=$(head -1 ${buffer} | cut -b 1-4 | cat -vet)
	 if [[ "${first_four}" = "^?ELF$" || "${first_two}" = "#!" ]]
	 then
		 $buffer
	 else
         #ext=$(echo ${buffer}|awk '{split($1,tmp,".");n=split($1,tmp,".");printf("%s\n",tmp[n])}') Staci snad jeden split????
         ext=$(echo ${buffer}|awk '{n=split($1,tmp,".");printf("%s\n",tolower(tmp[n]))}')
            case ${ext} in
               ps) /usr/bin/gv ${buffer} &;;
	       eps) /usr/bin/gv ${buffer} &;;
               pdf) /usr/bin/okular ${buffer} &;;
	       htm) /usr/bin/firefox ${buffer} &;;
	       html) /usr/bin/firefox ${buffer} &;;
	       jpg) /usr/bin/gwenview ${buffer} &;;
	       gif) /usr/bin/gwenview ${buffer} &;;
	       png) /usr/bin/gwenview ${buffer} &;;
               tar) /bin/tar xvf ${buffer} ;;
	       zip) /usr/bin/unzip ${buffer} ;;
	       bz2) if [[ ${buffer} == *tar.bz2 ]] ;
       				then
	#				/usr/bin/bzcat ${buffer} | tar xvf - 
					/bin/tar jxvf ${buffer} 
				else
					/usr/bin/bunzip2 ${buffer} 
				fi ;;
		gz) if [[ ${buffer} == *tar.gz ]] ;
		then
	#		/bin/zcat ${buffer} | tar xvf - 
			/bin/tar zxvf ${buffer} 
		else
			/bin/gunzip ${buffer} 
		fi ;;
		z) if [[ ${buffer} == *tar.[z,Z] ]] ;
		then
		/bin/tar -zxvf ${buffer}		
		else
			/bin/gunzip ${buffer} 
		fi ;;
		7z) if [[ ${buffer} == *tar.7z ]] ;
		then
		7za x -so ${buffer} | tar xvf -
		else
		7za x ${buffer}
		fi ;;
		lzma) if [[ ${buffer} =~ .*tar[.]lzma ]] ;
		then
		/bin/tar -xv --lzma -f ${buffer}
		else
		7za x ${buffer}
		fi ;;

		tgz) /bin/tar zxvf ${buffer} ;;

	       *)  /usr/bin/gview ${buffer} &;;
            esac
	  fi  
	elif [[ -d "${buffer}" ]]
	then 
		cd ${buffer}
		ls
	elif [[ -z "$buffer" ]]
	then
		 echo "Going one directory up" 
		 cd ..
		 ls
	else 
		 echo 'Not a readable file nor directory'
	fi
   }
alias ..='Btn3Down'
#}}}

