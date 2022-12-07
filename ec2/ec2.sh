#!/bin/bash

ENV="XAM"
STK="xam-ec2"
INV="../inventory.txt"
############################################################################
./create.sh $STK ec2.yml ec2.json $ENV
############################################################################

IP=`aws cloudformation list-exports \
--query "Exports[?Name=='$ENV-EC2PublicIp'].Value" \
--output text`
echo $IP

DNS=`aws cloudformation list-exports \
--query "Exports[?Name=='$ENV-EC2PublicDnsName'].Value" \
--output text`

echo $DNS

echo "[all]" > $INV
echo $IP >> $INV
