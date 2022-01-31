#!/bin/bash

PrivateIP=`aws ec2 describe-instances --filters Name=tag:Name,Values=Project1 --query "Reservations[*].Instances[*].PrivateIpAddress" --output=text`

if [ -z "$PrivateIP" ]
then
        echo "Creating Project1 EC2 instance"
        ansible-playbook playbook1.yaml
        ansible-playbook playbook2.yaml
else
        echo "Project1 EC2 instance already found, hence running docker built on $PrivateIP"
        ansible-playbook playbook3.yaml
fi
