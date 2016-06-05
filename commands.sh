#!/bin/bash
if [ "$1" = "source" ];then
	# Place the token in the token file
	TOKEN=$(cat token)
	OWNER=$'ID OWNER HERE'
	# Set INLINE to 1 in order to receive inline queries.
	# To enable this option in your bot, send the /setinline command to @BotFather.
	INLINE=1
	# Set to .* to allow sending files from all locations
	FILE_REGEX='/home/user/allowed/.*'
else
	if ! tmux ls | grep -v send | grep -q $copname; then
		[ ! -z ${URLS[*]} ] && {
		curl -s ${URLS[*]} -o $NAME
			send_file "${USER[ID]}" "$NAME" "$CAPTION"
			rm "$NAME"
		}
		[ ! -z ${LOCATION[*]} ] && send_location "${USER[ID]}" "${LOCATION[LATITUDE]}" "${LOCATION[LONGITUDE]}"

		# Inline
		if [ $INLINE == 1 ]; then
			# inline query data
			iUSER[FIRST_NAME]=$(echo "$res" | sed 's/^.*\(first_name.*\)/\1/g' | cut -d '"' -f3 | tail -1)
			iUSER[LAST_NAME]=$(echo "$res" | sed 's/^.*\(last_name.*\)/\1/g' | cut -d '"' -f3)
			iUSER[USERNAME]=$(echo "$res" | sed 's/^.*\(username.*\)/\1/g' | cut -d '"' -f3 | tail -1)
			iQUERY_ID=$(echo "$res" | sed 's/^.*\(inline_query.*\)/\1/g' | cut -d '"' -f5 | tail -1)
			iQUERY_MSG=$(echo "$res" | sed 's/^.*\(inline_query.*\)/\1/g' | cut -d '"' -f5 | tail -6 | head -1)

			# Inline examples
			if [[ $iQUERY_MSG == photo ]]; then
				answer_inline_query "$iQUERY_ID" "photo" "http://blog.techhysahil.com/wp-content/uploads/2016/01/Bash_Scripting.jpeg" "http://blog.techhysahil.com/wp-content/uploads/2016/01/Bash_Scripting.jpeg"
			fi

			if [[ $iQUERY_MSG == sticker ]]; then
				answer_inline_query "$iQUERY_ID" "cached_sticker" "BQADBAADUQEAAtoAAQ4JiHH8q-niaNIC"
			fi

			if [[ $iQUERY_MSG == gif ]]; then
				answer_inline_query "$iQUERY_ID" "cached_gif" "BQADBAADIwYAAmwsDAABlIia56QGP0YC"
			fi
			if [[ $iQUERY_MSG == github ]]; then
				answer_inline_query "$iQUERY_ID" "article" "GitHub" "[Github](https://github.com/jarriztg/TgBot)
			fi
		fi
	fi
	
	echo $MESSAGE | grep "^/kick" 
        if [ $? == 0 ]; then
            kick_chat_member "${USER[ID]}" "$GETINPUT[ID]"
            unban_chat_member "${USER[ID]}" "$GETINPUT[ID]"
        fi

   echo $MESSAGE | grep "^/broadcast"
         if [ $? == 0 ]; then
echo "Sending the broadcast $* to $(wc -l count | sed 's/count//g')users."
		[ $(wc -l count | sed 's/ count//g') -gt 300 ] && sleep="sleep 0.5"
		shift
		for f in $(cat count);do send_markdown_message ${f//COUNT} "$* $GETINPUT $GETINPUT2"; $sleep;done
    fi
    
	case $MESSAGE in
		'/start')
			while true
			do
      				send_action "${USER[ID]}" "typing"
				sleep 8s
				break;
			done
			send_markdown_message "${USER[ID]}" "Hi *${USER[FIRST_NAME]}*
"Im a bot programmed in _bash_
I include *inline* and other things.

*Commands*
*/kick <ID>* kick a member with the ID.
*/leavechat* kick the own bot in any chat.
*/broadcast <message>* send message to all members and groups.
*/github* get the opensource of this bot.

Those are my commands for this moment, maybe, in a future, I will have most commands.
[API Telegram](http://core.telegram.org/bots/api)"
			;;
		'/leavechat')
			send_markdown_message "${OWNER[ID]}" "*CHAT LEAVED*"
   			leave_chat "${USER[ID]}"
     			;;
    		'/github')
       			send_markdown_message "${USER[ID]}" " *Here you have*
       			[Github](https://github.com/jarriztg/TgBot)"
			;;
	esac
fi
