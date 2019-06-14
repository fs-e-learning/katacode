#!/bin/bash

show_progress()
{
  local -r msg1="${1}"
  local -r msg2="${2}"
  echo -n "${msg1}"
  local -r delay='0.75'
  local spinstr='\|/-'
  local temp
  while true; do 
    sudo grep -i "done" /root/katacoda-finished &> /dev/null
    if [[ "$?" -ne 0 ]]; then     
      temp="${spinstr#?}"
      printf " [%c]  " "${spinstr}"
      spinstr=${temp}${spinstr%"${temp}"}
      sleep "${delay}"
      printf "\b\b\b\b\b\b"
    else
      break
    fi
  done
  printf "    \b\b\b\b"
  echo ""
  echo "${msg2}"
}

sleep 1
show_progress 'クラスタ起動中。少し時間がかかる場合があります。' '準備完了！ お待たせしました。'
