#!/bin/bash

function get_file_count {
  echo $(ls -1 | wc -l)
}

function guessing_game {
  local file_count=$(get_file_count)
  local user_guess=-1

  echo "Combien de fichiers se trouvent dans le répertoire actuel ?"

  while [[ $user_guess -ne $file_count ]]; do
    read -p "Entrez votre réponse : " user_guess
    if [[ ! $user_guess =~ ^[0-9]+$ ]]; then
      echo "Veuillez entrer un nombre valide."
      continue
    fi
    if [[ $user_guess -lt $file_count ]]; then
      echo "Trop bas ! Essayez à nouveau."
    elif [[ $user_guess -gt $file_count ]]; then
      echo "Trop haut ! Essayez à nouveau."
    else
      echo "Félicitations ! Vous avez trouvé la bonne réponse : $file_count fichiers."
    fi
  done
}

guessing_game
