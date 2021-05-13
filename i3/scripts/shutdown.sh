#!/bin/bash

ans=$(
    zenity --list \
        --text="<span font='24'>Select Action </span>" \
        --title="Confirmation" \
        --radiolist \
        --column "Pick" \
        --column "Action" \
            TRUE "Shutdown" \
            FALSE "Reboot" \
            FALSE "Logout" \
        --height 210
) 


case $ans in 
    Shutdown)
        systemctl poweroff
        ;;
    
    Reboot)
        systemctl reboot
        ;;
    Logout)
        loginctl terminate-user $USER
        ;;
    *)
        echo "nothing selected"
        ;;
esac

