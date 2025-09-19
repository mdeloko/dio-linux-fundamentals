#!/bin/bash

echo "Criando diretórios..."

mkdir /publico /adm /ven /sec

echo "Criando grupos de usuários..."

for group in GRP_ADM GRP_VEN GRP_SEC; do
    groupadd "$group"
done

echo "Criando usuários..."

i = 0
for user_to_create in carlos maria joao debora sebastiana roberto josefina amanda rogerio; do
    if[i<=2];then
	useradd "$user_to_create" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
    elif[i<=5];then
	useradd "$user_to_create" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
    else
	useradd "$user_to_create" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
    fi
    ((i++))
done

echo "Especificando permissões dos diretórios..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

echo "Especificando permissões dos diretórios..."

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

chmod 777 /publico

echo "Fim!"


