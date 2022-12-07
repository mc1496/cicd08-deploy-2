#!/bin/bash
# VPCID=`aws ec2 describe-vpcs \
# --query "Vpcs[].VpcId" \
# --filters "Name=isDefault, Values='true'" \
# --output text`

# echo "Using default VPC with VpcId: $VPCID"
# sed -i "/DefaultVpcId/{n;s/.*/\t\t\"ParameterValue\": \"$VPCID\"/}" $3

#Note this is from course supporting materials with some modifications
if [ ! "$4" ]; then
    echo -e "WARNING: NO EnvironmentName-Value is provided \n"
    #ENVAL="XAMYXAR"
else
    sed -i "/EnvironmentName/{n;s/.*/\t\t\"ParameterValue\": \"$4\"/}" $3
fi
######################################################################
echo "updatin stack: $1"
######################################################################
aws cloudformation update-stack \
--stack-name $1 \
--template-body file://$2 \
--parameters file://$3 \
--capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
--region=us-east-1
######################################################################
echo "WAIT..."
aws cloudformation wait stack-update-complete --stack-name $1
echo "$1 stack is updated."
######################################################################
aws cloudformation list-exports 