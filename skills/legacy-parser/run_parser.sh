if [ "$#" -ne 1 ]; then  #can only be one arguement
    echo "Error: Exactly one argument required"
    exit 1
fi

if [[ "$1" != "$HOME/csce465-agentsec/hw3/inbox/"* ]]; then #path must start with inbox/
    echo "Error: Incorrect argument, only files under inbox/ allowed"
    exit 1
fi

if [ ! -f "$1" ]; then #file must actually exist
    echo "Error: File not found : $1"
    exit 1
fi

"$HOME/csce465-agentsec/hw3/legacy_log_parser" "$1"
exit 0
