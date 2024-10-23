#!/bin/bash

# Список пользователей и паролей
declare -A users=( ["aidos_nurgaliev"]="aptuser1" ["zhanara_sadykova"]="aptuser2" ["meirambek_tulegenov"]="aptuser3" )

# Создание пользователей и добавление их в группу sudo
for user in "${!users[@]}"; do
  # Проверка, существует ли пользователь
  if id "$user" &>/dev/null; then
    echo "Пользователь $user уже существует. Пропуск."
  else
    # Создание пользователя
    useradd -m "$user"

    # Установка пароля для пользователя
    echo "$user:${users[$user]}" | chpasswd

    # Добавление пользователя в группу sudo
    usermod -aG sudo "$user"

    echo "Пользователь $user создан, установлен пароль и добавлен в группу sudo."
  fi
done

echo "Все пользователи успешно созданы!"
