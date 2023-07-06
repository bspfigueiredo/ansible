#!/bin/bash

#https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-20-04-pt

#Atualizar servidor
sudo apt update
echo "apt update - FEITO"

#Instalar Ansible
sudo apt install ansible
echo "apt install ansible - FEITO"

#Instalar python3.11
sudo apt install python3.11
echo "apt install python3.11 - FEITO"

#Criar Hosts
# touch /etc/ansible/hosts
# sudo nano /etc/ansible/hosts

if [[ ! -e /etc/ansible ]]; then
	
	#Criar pasta se não existir
    mkdir /etc/ansible
	
	#Preencher os Hosts
	echo '[servers]'                                    		>> /etc/ansible/hosts
	echo 'ControlPlane1           ansible_host=203.0.113.111' 	>> /etc/ansible/hosts
	echo 'WorkerNode1             ansible_host=203.0.113.112' 	>> /etc/ansible/hosts
	echo 'WorkerNode2             ansible_host=203.0.113.113' 	>> /etc/ansible/hosts
	echo 'WorkerNode3             ansible_host=203.0.113.114' 	>> /etc/ansible/hosts
	echo 'RabbitMQ                ansible_host=203.0.113.115' 	>> /etc/ansible/hosts
	echo 'PostgreSQL              ansible_host=203.0.113.116' 	>> /etc/ansible/hosts
	echo 'Elastic_Kibana          ansible_host=203.0.113.117' 	>> /etc/ansible/hosts
	echo 'Redis                   ansible_host=203.0.113.118' 	>> /etc/ansible/hosts
	echo 'Prometheus_Grafana      ansible_host=203.0.113.119' 	>> /etc/ansible/hosts
	echo ''                                             		>> /etc/ansible/hosts
	echo '[all:vars]'                                   		>> /etc/ansible/hosts
	echo 'ansible_user=bsimple'  								>> /etc/ansible/hosts
	echo 'ansible_password=Master67' 							>> /etc/ansible/hosts

	echo "Pasta /etc/ansible - CRIADA e ficheiro hosts - CRIADO e CONFIGURADO"

elif [[ ! -d /etc/ansible ]]; then
    echo "/etc/ansible already exists - Não atualizei nada" 1>&2
fi

#EXTRA
#VER o que tá configurado no Inventario
# ansible-inventory --list -y
#Testar a ligação
# ansible all -m ping -u root