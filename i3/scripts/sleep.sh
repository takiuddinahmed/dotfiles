function lock {
    i3lock -c "#222222"
}


ans=$(
    zenity --list \
        --text="<span font='24'>Select Action </span>" \
        --title="Confirmation" \
        --radiolist \
        --column "Pick" \
        --column "Action" \
            TRUE "Suspend" \
            FALSE "Lock" \
            FALSE "Hibernate" \
            FALSE "Logout" \
        --height 250
) 

case $ans in 
    Suspend)
        systemctl suspend
        ;;
    Lock)
        lock 
        ;;
    Hibernate)
        systemctl hibernate
        ;;
    
    Logout)
        loginctl terminate-user $USER
        ;;
    *)
        echo "Nothing selected"
        ;;
esac