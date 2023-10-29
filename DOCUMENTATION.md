DOCUMENTATION



EXPLAINING WHAT THESE REPOSITORY IS ALL ABOUT

1 LARAVEL
2 LAMP STACK
3 MASTER AND SLAVE
4 ANSIBLE

LARAVEL:  Laravel has useful built-in features like the Artisan command-line interface (CLI), native authentication and model-view-controller (MVC) architecture. These features make the framework easy to use and are the main reason for its popularity.
It is a trendy web framework and it has become a go for many web developers on GitHub, that is one the reason it has become an in-demand skill on the job market.
   On this exam project we were provided a laravel repository from GitHub “” https://github.com/laravel/laravel.git” we are expected to clone the laravel repository and deploy on apache2.

LAMP STACK: A LAMP stack is a bundle of four different software technologies that developers use to build websites and web applications. LAMP is an acronym for the operating system, Linux; the web server, Apache; the database server, MySQL; and the programming language, PHP.
Meanwhile, I installed the LAMP stack on master node in this particular project using bash script.



MASTER AND SLAVE: I created master and slave machine using vagrant and virtual box to provision it.
On this project, master and slave were used to represent server that host the LAMP using bash script for it on master and sensible on the slave

ANSIBLE:  is an open source, command-line IT automation software application written in Python. It can configure systems, deploy software, and orchestrate advanced workflows to support application deployment, system updates, and more.
On this project, ansible was used to run the LAMP bash script Iran  on master, on slave automatically



EXPLAIN DIFFERENT SECTION OF THE REPOSITORY

Ansible Playbooks are lists of tasks that automatically execute for your specified inventory or group of host
                          
                            FILE
Inside “file” directory is bash .sh, which happen to be the bash script that provision master and slave machine using vagrant and virtual box. In this same directory is “laravel-slave.sh” script is created.
Laravel-slave.sh is an executable file which install the LAMP stack and spins up master and slave.its also deploy laravel on the master

                          ANSIBLE.CFG
Ansible.cfg is an ansible configuration script where a line of code can be used for ;
Ansible all —key-file ~/.ssh/id_rsa -iinventory.
But in this project I used “vim ansible.cfg”and  when it opens, i input [default]
           Inventory = inventory
           Private_key_file = ~/.ssh/id_rsa
           Host-custom = false

                         INVENTORY
The inventory part of the ansible is where the domain name of the website, ip address, ssh pass and port depending on the project. But in this project it was slave machine ip address of 192.168.20.11, that is inside the inventory.

                          ANSIBLE-SITE.YAML
This is where the whole configuration that will run the bash script on ansible is located with a double spacing methodology. While writing this file you should avoid spacing error or syntax error.

                        HOW TO RUN THE REPOSITORY
Must Have:
1 Have vagrant installed
2 Have virtual box installed
    Create a directory 2nd semester exam
         Inside the directory is a folder ‘file’
         Inside  the directory are bask.sh, which is script that will create master and slave machine and laravel-slave.sh which is the script that install lamp stack on master node and deploy laravel on master node

 reconfiguring the Vagrantfile





Then.use vagrant ssh master to gain access to the machine
Open laravel-slave.sh script with nano or vim.i used vim to open it and make suer that I check critically the three main conditions that will make the script to run perfectly. Which are;
1 change  servername on apache2 configuration to ip address of master node. Which is 192.168.20.10

![image](https://github.com/oluwadamilolaalli/AltSchool-of-Cloud-Engineering-2nd-Semester/assets/118380013/35c9799c-704d-4e2f-8ec8-85c275f667f4)

![image](https://github.com/oluwadamilolaalli/AltSchool-of-Cloud-Engineering-2nd-Semester/assets/118380013/3d5e24d2-88fa-4601-b51c-ee06e7634f92)

![image](https://github.com/oluwadamilolaalli/AltSchool-of-Cloud-Engineering-2nd-Semester/assets/118380013/7d5035e2-866b-4594-a85b-40966a87a67d)


