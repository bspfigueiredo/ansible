Instalação ANSIBLE

0 - Criar Control plane e criar outras maquinas na AWS por exemplo

1 - Modificar o bash "1-Instalar_Ansible_no_Control_Plane_1.bash" para ter os ips correctos

2 - Modificar o yaml "0-inventory.yaml" para ter os ips correctos

3 - correr o parte 1 no control plane é um BASH com o nome "1-Instalar_Ansible_no_Control_Plane_1.bash" para instalar o ansible e criar as coisas que preciso
cmd: bash 1-Instalar_Ansible_no_Control_Plane_1.bash

4 - validar se o ansible tem ligação ao inventario
cmd: ansible all -m ping

5 - depois vou correr o parte 2 no control plane para instalar as outras marquinas neste caso o redis.
cmd: ansible-playbook --private-key /home/ubuntu/key/WN1.pem /home/ubuntu/ansible/ansible/Parte_2-Control_Plane_1/7_playbook_redis.yaml

6 - depois vou correr o parte 2 no control plane para instalar as outras marquinas .. an so on..
cmd: ansible-playbook --private-key /home/ubuntu/key/WN1.pem /home/ubuntu/ansible/ansible/Parte_2-Control_Plane_1/2_playbook_worker_nodes.yaml

7 - depois vou correr o parte 2 no control plane para instalar as outras marquinas .. an so on..
cmd: ansible-playbook --private-key /home/ubuntu/key/WN1.pem /home/ubuntu/ansible/ansible/Parte_2-Control_Plane_1/3_playbook_control_planes.yaml

8 - depois vou correr o parte 2 no control plane para instalar as outras marquinas .. an so on..
cmd: ansible-playbook --private-key /home/ubuntu/key/WN1.pem /home/ubuntu/ansible/ansible/Parte_2-Control_Plane_1/4_playbook_rabbitmq.yaml

9 - depois vou correr o parte 2 no control plane para instalar as outras marquinas .. an so on..
cmd: ansible-playbook --private-key /home/ubuntu/key/WN1.pem /home/ubuntu/ansible/ansible/Parte_2-Control_Plane_1/5_playbook_postgresql.yaml

10 - depois vou correr o parte 2 no control plane para instalar as outras marquinas .. an so on..
cmd: ansible-playbook --private-key /home/ubuntu/key/WN1.pem /home/ubuntu/ansible/ansible/Parte_2-Control_Plane_1/6_playbook_elastic_kibana.yaml

11 - depois vou correr o parte 2 no control plane para instalar as outras marquinas .. an so on..
cmd: ansible-playbook --private-key /home/ubuntu/key/WN1.pem /home/ubuntu/ansible/ansible/Parte_2-Control_Plane_1/8_playbook_prometheus_grafana.yaml


