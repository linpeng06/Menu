#!/bin/bash

title="=====FINAL PROJECT-MENU====="

clear
echo "$title"
#------------------Menu Start-----------------------------------------------#
while true 
do 
echo "Option 1 File Functions"
echo "Option 2 Network Functions"
echo "Option 3 Math functions"
echo "Option 4 Display Options"
echo "Option 5 Adminusers"
echo "Option 6 Date"
echo "Option 7 Extra Functions"
echo "Option 0 to exit out of the menu"
echo -e "\n"
echo -e "Enter your selection \c"
read option
case $option in
#---------------------File Functions------------------------------#
        1)echo "File Functions"
        echo "Enter 1 to enter five comic names"
        echo "Enter 2 to read comic names"
        echo "Enter 3 to search for the file display results"   
        echo "Enter 4 to search for a folder"
	read subFun
	case $subFun in
		1)comic(){
		touch comicFile
		echo "Five Comic Names:" > comicFile
		for i in {1..5}
		do
			echo "Type the comic name:"
			read comic
			echo $comic>>comicFile
		done
		}
		comic ;;

		2) readComic(){
		cat comicFile
		}
		readComic ;;

		3) readInput(){
		echo "Enter a file name:"
		read readFile
		cat $readFile
		}
		readInput;;

		4) createFolder(){
		echo "Enter a folder name:"
		read folderName
		ls $folderName
		}
		createFolder;;	

	esac	
	;;
#-----------------------Network Functions-----------------------#
	2) echo "Network Functions"
	echo "Enter 1 to IP and scan IP"
	echo "Enter 2 to display IP"
	read subFun
	case $subFun in
	1) ip(){
	echo "Enter IP address:"
	read ip
	ping -c 50 $ip
	}
	ip;;
	2) showip(){
	ip addr show
	}
	showip;;

	esac
	;;
#----------------Math Functions--------------------------------#
        3) echo "Math Functions"
        echo "Enter 1 to add two numbers together"
        echo "Enter 2  to multiply two numbers together"
        read math
        case $math in
                1) add()
                {
                      echo "Enter two different integers:"
                        read integer1
                        read integer2
                        RESULT="$(($integer1+$integer2))"
                        echo "The total is:" $RESULT
                }
        	add;;
	        2) multiply()
                {
                        echo "Enter two different integers:"
                        read integer1
                        read integer2
                        RESULT="$(($integer1*$integer2))"
                        echo "The total is:" $RESULT
                }
       		 multiply;;
	esac
	;;
#-------------------------------Display Asterisks-----------------------#
        4) echo "Display Option"
        read -p "Enter number of rows: " rows
        echo "The number of rows - $rows"
        for (( i=0; i<rows; i++))
        do
                for(( j=0; j<=i; j++))
                do
                        echo -n '*'
                done
                echo ' '
        done
        for (( i = i -2; i >=0; i--))
        do
                for(( j=0; j<=i; j++))
                do
                        echo -n '*'
    done
                echo ' '
done
;;
#-----------------------------Adminusers----------------------------------#
        5) echo "Adminusers"
        echo "Enter 1 to display user"
        echo "Enter 2 to add user"
        echo "Enter 3 to view all added users"
        echo "Enter 4 to delete user"
        echo "Enter 5 to change user password"
	read user
	case $user in
	1) displayUser(){
	 whoami
	}
	displayUser;;
	
	2) addUser(){
	   echo "Enter user name:"
                        read $username
                        echo "The username you entered is" $username
                        sudo useradd -m -s /bin/bash $username
                        sudo passwd $username
                        echo "New user has been added!"
	}
	addUser;;

	3) viewUser() {
	echo "The current list of all added users:"
	cut -d: -f1 /etc/passwd
	}
	viewUser;;

	4) deleteUser() {
	cut -d: -f1 /etc/passwd
	echo "Enter User"
	read user
	sudo userdel $user
	}	
	deleteUser;;
	
	5) changepass(){
	echo "Change user Password"
	echo "Enter the username you want to change the password to"
	read user
	sudo passwd $user
	}	
	changepass;;

	esac
	;;
#-------------------Date-------------------------------------------#
        6) echo "Date"
        echo "Enter 1 to show current time and date"
        echo "Enter 2 to show calender for current month"
        echo "Enter 3 to show if today is Friday the 13th or not"
        read date
        case $date in
                1) currentdate()
                {
                        echo "Current Time & Date: $(date)"
                }

 	 	currentdate;;
		
		2) cal
		;;
                
		3) friday()
                {
                        TODAY="$(date +%A)"
                        DATE="$(date +%d)"

                        if [ "$TODAY" == "Friday" ] && [ "$DATE" == "13" ]
                        then echo "Today is Friday the 13th"
                        else echo "Today is NOT Friday the 13th"
                        fi
                }
        	friday;;

	esac
	;;
#-----------------------EXTRA FUNCTIONS------------------------#
	7) echo "Extra Functions"
	echo "Enter 1 to view Orlando Weather"
	echo "Enter 2 to validate if input is an integer or not"
	echo "Enter 3 to use ping for your chosen seconds"
	echo "Enter 4 to current disk space"
	echo "Enter 5 to view System Log Files"
	echo "Enter 6 for a Final Surprise!"
	echo
	read extra
	case $extra in
	1) weather(){
	URL='http://www.accuweather.com/en/us/orlando-fl/32801/weather-forecast/328169'
	echo "Today's forecast in Orlando, Florida"
	wget -q -O- "$URL" | awk -F\' '
	/acm_RecentLocationsCarousel\.push/{print $2": "$16" "$12"°" }'| head -1
	}
	weather;;
	
	2)echo "Validation for Integers"
	echo 
	echo "Enter to check if it is an integer"
	read number 
        if ! [[ "$number" =~ ^[0-9]+$ ]] ;
        then echo "This is not an integer"
        else echo "You have entered an integer"
	fi
	;;
	
	3) echo "Timeout!"
	echo
	echo "Enter ip address to scan:"
	read ipaddress
	echo "Enter the time in seconds you want to stop scanning"
	read second
	timeout "$second"s ping $ipaddress
	;;

	4)echo "Disk Space"
	df -h
	;;
	
	5) echo "View your logfile"
	cd /var/log
	cat syslog
	;;
 	
	6)cat << "EOF"

                                                                 #####
                                                                #######
                   #                                            ##O#O##
  ######          ###                                           #VVVVV#
    ##             #                                          ##  VVV  ##
    ##         ###    ### ####   ###    ###  ##### #####     #          ##
    ##        #  ##    ###    ##  ##     ##    ##   ##      #            ##
    ##       #   ##    ##     ##  ##     ##      ###        #            ###
    ##          ###    ##     ##  ##     ##      ###       QQ#           ##Q
    ##       # ###     ##     ##  ##     ##     ## ##    QQQQQQ#       #QQQQQQ
    ##      ## ### #   ##     ##  ###   ###    ##   ##   QQQQQQQ#     #QQQQQQQ
  ############  ###   ####   ####   #### ### ##### #####   QQQQQ#######QQQQQ
EOF
echo
;;

	esac
	;;
#-------------------EXIT-----------------------------------------#
	0) echo "Good Bye!"; exit ;;
	
	
#----------------------------------------------------------------#
esac
done
