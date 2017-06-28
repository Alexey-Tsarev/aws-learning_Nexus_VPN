#!/usr/bin/env bash

ROLE_FILE=/role.txt
export PATH="/usr/local/bin:/opt/aws/bin:$PATH"

CUR_DIR=`pwd`
THIS_DIR=`dirname $0`
cd "$THIS_DIR"

if [ -f "$ROLE_FILE" ]; then
    ROLE=`cat "$ROLE_FILE"`
    PLAYBOOK="${ROLE}_all.yml"

    if [ -n "$PLAYBOOK" ]; then
        cd ../ansible
        pip install ansible boto3 netaddr
        ansible-playbook -vv -i hosts -l localhost "$PLAYBOOK" 2>&1 > "/root/${ROLE}.log"
    else
        echo "Playbook: '$PLAYBOOK' not found"
    fi
else
    echo "Role file: '$ROLE_FILE' not found"
fi

cd "$CUR_DIR"
