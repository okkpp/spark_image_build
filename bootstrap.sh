#!/bin/bash
echo 'bootstrap...'
/etc/init.d/ssh start
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
#chmod 0600 ~/.ssh/authorized_keys

if [[ $SPARK_MASTER_HOST ]]
then
  echo $(hostname -i) $SPARK_MASTER_HOST >> /etc/hosts
  cat /etc/hosts
fi

if [[ $1 == "-d" ]]; then
  # 默认行为
  while true; do sleep 1000; done
else
  # 其他参数 默认应执行 spark/sbin/*.sh
  /bin/bash -c "$*"
  tail -f spark/logs/*
fi

exit 0