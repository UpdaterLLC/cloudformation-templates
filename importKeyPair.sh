#! /usr/bin/env bash -x
[ -z $3 ] && exit-1
profile=$1
region=$2 # ex. us-east-1
keypair=$3 # ex. id_rsa

publickeyfile=$HOME/.ssh/$keypair.pub
[ -r $publickeyfile ] || exit -1

aws --profile $profile ec2 import-key-pair \
  --region "$region" \
  --key-name "$keypair" \
  --public-key-material "file://$publickeyfile"

#__END__
