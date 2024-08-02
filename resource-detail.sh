#!/bin/bash
#
#
###############################
# Author: Rishabh
# Date: 31 July 2024
#
# This Script shows the available s3 buckets, iam users and instances
#
# ############


set -x
set -e
set -o


aws s3 ls > "resources-details.txt"

aws ec2 describe-instances | jq ' .Reservations[].Instances[] | "\(.InstanceId) \(.InstanceType)"' >> "resources-details.txt"


aws iam list-users >> "resources-details.txt"

