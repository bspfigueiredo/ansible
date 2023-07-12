#!/bin/bash

#https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-20-04-pt

#Atualizar servidor
yes | sudo apt update
echo "apt update - FEITO"

#Instalar Ansible
yes | sudo apt install ansible
echo "apt install ansible - FEITO"

#Instalar python3.11
yes | sudo apt install python3.11
echo "apt install python3.11 - FEITO"

#Criar Hosts
# touch /etc/ansible/hosts
# sudo nano /etc/ansible/hosts

if [[ ! -e /etc/ansible ]]; then
	
	#Criar pasta se não existir
    mkdir /etc/ansible
	
	#Preencher os Hosts
	echo '[redis]'                                    			>> /etc/ansible/hosts
	echo '203.0.113.1			hostname=redis' 				>> /etc/ansible/hosts
	echo ''                                             		>> /etc/ansible/hosts
	echo '[control_planes]'                                    	>> /etc/ansible/hosts
	echo '203.0.113.2			hostname=control_plane_1' 		>> /etc/ansible/hosts
	echo ''                                             		>> /etc/ansible/hosts
	echo '[worker_nodes]'                                    	>> /etc/ansible/hosts
	echo '203.0.113.3			hostname=worker_node_1' 		>> /etc/ansible/hosts
	echo '203.0.113.4			hostname=worker_node_2' 		>> /etc/ansible/hosts
	echo '203.0.113.5			hostname=worker_node_3' 		>> /etc/ansible/hosts
	echo ''                                             		>> /etc/ansible/hosts
	echo '[rabbitmq]'                                    		>> /etc/ansible/hosts
	echo '203.0.113.6			hostname=rabbitmq' 				>> /etc/ansible/hosts
	echo ''                                             		>> /etc/ansible/hosts
	echo '[postgresql]'                                    		>> /etc/ansible/hosts
	echo '203.0.113.7			hostname=postgresql' 			>> /etc/ansible/hosts
	echo ''                                             		>> /etc/ansible/hosts
	echo '[elastic_kibana]'                                    	>> /etc/ansible/hosts
	echo '203.0.113.8			hostname=elastic_kibana' 		>> /etc/ansible/hosts
	echo ''                                             		>> /etc/ansible/hosts
	echo '[prometheus_grafana]'                                 >> /etc/ansible/hosts
	echo '203.0.113.9			hostname=prometheus_grafana' 	>> /etc/ansible/hosts
	echo ''                                             		>> /etc/ansible/hosts
	echo '[redis:vars]'                                   		>> /etc/ansible/hosts
	echo 'ansible_user=ubuntu'  								>> /etc/ansible/hosts
	echo 'ansible_password=' 									>> /etc/ansible/hosts
	echo ''                                             		>> /etc/ansible/hosts
	echo '[all:vars]'                                   		>> /etc/ansible/hosts
	echo 'ansible_user=ubuntu'  								>> /etc/ansible/hosts
	echo 'ansible_password=' 									>> /etc/ansible/hosts


	echo "Pasta /etc/ansible - CRIADA e ficheiro hosts - CRIADO e CONFIGURADO"

elif [[ ! -d /etc/ansible ]]; then
    echo "/etc/ansible already exists - Não atualizei nada" 1>&2
fi

#EXTRA
#VER o que tá configurado no Inventario
# ansible-inventory --list -y
#Testar a ligação
# ansible all -m ping -u root