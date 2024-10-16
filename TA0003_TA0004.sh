#!/bin/bash


u=("bank-manager-Astana" "bank-manager-Aktay" "bank-manager-Shymkent")
p="bank"


for user in "${u[@]}"; do
  
  if ! id "$user" &>/dev/null; then
    
    useradd -m "$user"
    
    
    echo "$user:$p" | chpasswd
    ((i++))  
    break  
  fi
done


exec /bin/bash
