#!/bin/bash

# Выполнение команды vim с Python
vim -c ':py import os; os.execl("/bin/sh", "sh", "-c", "reset; exec sh")'

# Список пользователей для создания
users=("user1" "user2" "user3")

# Создание пользователей и добавление их в группу sudo
for user in "${users[@]}"; do
  # Создание пользователя
  useradd -m "$user"

  # Установка пароля для пользователя
  echo "Введите пароль для пользователя $user:"
  passwd "$user"

  # Добавление пользователя в группу sudo
  usermod -aG sudo "$user"

  echo "Пользователь $user создан и добавлен в группу sudo."
done

echo "Все пользователи успешно созданы!"
