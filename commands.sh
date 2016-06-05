#!/bin/bash
if [ "$1" = "source" ];then
	# Place the token in the token file
	TOKEN=$(cat token)
	OWNER=$'189041244'
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
			if [[ $iQUERY_MSG == gay ]]; then
				answer_inline_query "$iQUERY_ID" "article" "Mensaje" "*El de arriba es gay*"
			fi
		fi
	fi
	
	echo $MESSAGE | grep "^/kick" 
        if [ $? == 0 ]; then
            kick_chat_member "${USER[ID]}" "$GETINPUT[ID]"
            unban_chat_member "${USER[ID]}" "$GETINPUT[ID]"
        fi

   echo $MESSAGE | grep "^/enviar"
         if [ $? == 0 ]; then
echo "Sending the broadcast $* to $(wc -l count | sed 's/count//g')users."
		[ $(wc -l count | sed 's/ count//g') -gt 300 ] && sleep="sleep 0.5"
		shift
		for f in $(cat count);do send_markdown_message ${f//COUNT} "$* $GETINPUT $GETINPUT2"; $sleep;done
    fi
    
	case $MESSAGE in
		'/restart')
		
			send_markdown_message "${USER[ID]}" "*Hola* Estoy programado en bash.."
			;;
		'/start')
		while true
			do
      			send_action "${USER[ID]}" "typing"
		sleep 8s
		break;
		done
			send_markdown_message "${USER[ID]}" "Hola *${USER[FIRST_NAME]}*
Soy un bot en test programado en _bash_
Incluyo *inline* entre otras cosas.

*Comandos*
*/kick <ID>* expulsa a un usuario por ID

Por el momento son todos mis comandos pero en un futuro habrÃ¡n mÃ¡s y posiblemente se abra un repositorio en _github_ con las funciones que incluye.
*Funciones API* [aquÃ­](http://core.telegram.org/bots/api)"
			;;
		'/salir')
			send_markdown_message "${USER[ID]}" "*CHAT ABANDONADO*"
   leave_chat "${USER[ID]}"
     ;;
    '/google')
       send_reply "${USER[ID]}" " `aqui` [Google](http://google.com)"
			;;
	esac
fi
