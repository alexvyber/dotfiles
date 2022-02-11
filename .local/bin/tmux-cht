#!/usr/bin/env bash

languages=$(echo "golang typescript javascript python bash" | tr " " "\n")
core_utils=$(echo "find xargs sed tar awk man" | tr " " "\n")

selected=$(echo -e "$languages\n$core_utils" | fzf)
request_langs=$()

read -p "Query: " query

if [ ${#query} == 0 ]  ; then
  echo "Empty Query"
  exit 2
else 
  if echo "$languages" | grep -qs $selected; then
    modified_query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
  else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
  fi
  exit 0
fi
