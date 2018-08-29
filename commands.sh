#!/bin/bash
chmod -R 777 /tmp
mkdir ~/.ssh
echo -e $PLUGIN_PUBLICKEY > ~/.ssh/id_rsa.pub
echo -e $PLUGIN_PRIVATEKEY > ~/.ssh/id_rsa
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
echo -e "Host *\n\tStrictHostKeyChecking no\n\tIdentityFile ~/.ssh/id_rsa\n\tAddKeysToAgent yes\n\tForwardAgent yes" >> ~/.ssh/config
ssh-add -K ~/.ssh/id_rsa
$PLUGIN_RUN
echo -e "deploy:\n  comment: false\n  exit_code: $?\n  ignore: false" >> ./.framgia-ci-result.temp.yml
