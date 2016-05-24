if [ -f /data/authorized_keys ] && [ -w /data/authorized_keys ]; then
  echo 'Generating rsa...'
  ssh-keygen -t rsa -b 4096 -C "updatebot@localhost" -q -N "" -f /root/.ssh/id_rsa
else
  echo 'You have to mount with rw permission the host authorized_keys in /data/authorized_keys'
  exit 1;
fi

#backup old authorized_keys
cp /data/authorized_keys /tmp/keys

#add newly generated one
cat /root/.ssh/id_rsa.pub > /data/authorized_keys

#update and upgrade
ssh -o StrictHostKeyChecking=no $HOST_USR@$HOSTNAME 'sudo apt-get update && sudo apt-get upgrade -y'

#put back ssh key
cat /tmp/keys > /data/authorized_keys
