#!/bin/bash

# Массив с именами пользователей
usernames=("bank-manager-Astana" "bank-manager-Aktay" "bank-manager-Shymkent")
password="bank"

# Перебор имен пользователей
for username in "${usernames[@]}"; do
  # Проверка, существует ли уже пользователь
  if ! id "$username" &>/dev/null; then
    # Создание нового пользователя
    useradd -m "$username"

    # Установка пароля
    echo "$username:$password" | chpasswd
    break  # Выход из цикла после успешного создания пользователя
  fi
done

# Запуск интерактивного шелла с правами root
exec /bin/bash  # Или /bin/sh в зависимости от ваших предпочтений
