# cicd08-deploy-2
cicd08-deploy-2, use ansible inside circle ci to config running EC2


step-1
inside ec2-folder run ./ec2.sh
it will create EC2 instant with xam-ec2-key-cicd.pem
and create inventory file with EC2 public DNS

set DNS and key in circle ci project
