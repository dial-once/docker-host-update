if [ -f /data/authorized_keys ] && [ -w /data/authorized_keys ]; then
  echo 'Generating rsa...'
  ssh-keygen -t rsa -b 4096 -C "updatebot@localhost" -q -N "" -f /root/.ssh/id_rsa
else
  echo 'You have to mount with rw permission the host authorized_keys in /data/authorized_keys'
  exit 1;
fi

cat /root/.ssh/id_rsa.pub >> /data/authorized_keys

#ssh -o StrictHostKeyChecking=no docker@$HOSTNAME

cat /data/authorized_keys
echo 'OKAY'
sed -i `echo /root/.ssh/id_rsa.pub` /data/authorized_keys
echo 'OKAY2'
cat /data/authorized_keys
