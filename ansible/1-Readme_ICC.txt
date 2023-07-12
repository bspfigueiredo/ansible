Instalação ANSIBLE

0 - Criar Control plane e criar outras maquinas na AWS por exemplo

1 - ligar por ssh às maquinas

-- REDIS 2
ssh -i C:\Temp\WN1.pem ubuntu@13.38.245.66

colocar uma variavel com o nome para não enganar no sitio
export NOME="Redis2"

validar a variavel
printenv NOME

-- CP 2
ssh -i C:\Temp\WN1.pem ubuntu@13.38.88.114

colocar uma variavel com o nome para não enganar no sitio
export NOME="CP2"

validar a variavel
printenv NOME


2 - Colocar os ficheiros no servidor - neste da AWS eu fiz por git clone (coloquei os ficheiros no meu git e depois saquei para o control plane que é onde preciso deles)
cmd: git clone https://github.com/bspfigueiredo/ansible.git


3 - Modificar o bash "1-Instalar_Ansible_no_Control_Plane_1.bash" para ter os ips correctos

4 - Modificar o yaml "0-inventory.yaml" para ter os ips correctos

5 - mudar as permissoes do ficheiro bash (não funcionou apenas ao criar um ficheiro novo é que deu - VER ISTO e RESOLVER)
cmd: chmod +x 1-Instalar_Ansible_no_Control_Plane_1.sh

6 - correr o parte 1 no control plane é um BASH com o nome "1-Instalar_Ansible_no_Control_Plane_1.bash" para instalar o ansible e criar as coisas que preciso
cmd: bash 1-Instalar_Ansible_no_Control_Plane_1.bash

7 - validar se o ansible tem ligação ao inventario

primeiro meter o ficheiro PEM no servidor

/home/ubuntu/key/WN1.pem

segundo dar permissoes especificas ao ficheiros
cmd: chmod 0400 WN1.pem

terceiro testar o ping
cmd: ansible --private-key /home/ubuntu/key/WN1.pem all -m ping

8 - depois vou correr o parte 2 no control plane para instalar as outras marquinas neste caso o redis.
cmd: ansible-playbook --private-key /home/ubuntu/key/WN1.pem /home/ubuntu/ansible/ansible/P2_AT_CP1/7_playbook_redis.yaml

9 - depois vou correr o parte 2 no control plane para instalar as outras marquinas .. an so on..
cmd: ansible-playbook --private-key /home/ubuntu/key/WN1.pem /home/ubuntu/ansible/ansible/P2_AT_CP1/2_playbook_worker_nodes.yaml

10 - depois vou correr o parte 2 no control plane para instalar as outras marquinas .. an so on..
cmd: ansible-playbook --private-key /home/ubuntu/key/WN1.pem /home/ubuntu/ansible/ansible/P2_AT_CP1/3_playbook_control_planes.yaml

11 - depois vou correr o parte 2 no control plane para instalar as outras marquinas .. an so on..
cmd: ansible-playbook --private-key /home/ubuntu/key/WN1.pem /home/ubuntu/ansible/ansible/P2_AT_CP1/4_playbook_rabbitmq.yaml

12 - depois vou correr o parte 2 no control plane para instalar as outras marquinas .. an so on..
cmd: ansible-playbook --private-key /home/ubuntu/key/WN1.pem /home/ubuntu/ansible/ansible/P2_AT_CP1/5_playbook_postgresql.yaml

13 - depois vou correr o parte 2 no control plane para instalar as outras marquinas .. an so on..
cmd: ansible-playbook --private-key /home/ubuntu/key/WN1.pem /home/ubuntu/ansible/ansible/P2_AT_CP1/6_playbook_elastic_kibana.yaml

14 - depois vou correr o parte 2 no control plane para instalar as outras marquinas .. an so on..
cmd: ansible-playbook --private-key /home/ubuntu/key/WN1.pem /home/ubuntu/ansible/ansible/P2_AT_CP1/8_playbook_prometheus_grafana.yaml
