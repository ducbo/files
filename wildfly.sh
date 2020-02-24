apt update
apt install default-jdk -y
groupadd -r wildfly
useradd -r -g wildfly -d /opt/wildfly -s /sbin/nologin wildfly
wget http://107.175.83.110/wildfly.tar.gz -P /tmp
tar xf /tmp/wildfly.tar.gz -C /opt/
chown -RH wildfly: /opt/wildfly
mkdir -p /etc/wildfly
cp /opt/wildfly/docs/contrib/scripts/systemd/wildfly.conf /etc/wildfly/
cp /opt/wildfly/docs/contrib/scripts/systemd/launch.sh /opt/wildfly/bin/
sh -c 'chmod +x /opt/wildfly/bin/*.sh'
cp /opt/wildfly/docs/contrib/scripts/systemd/wildfly.service /etc/systemd/system/
ufw disable
systemctl enable wildfly
/opt/wildfly/bin/add-user.sh
mkdir /var/run/wildfly/
chown wildfly: /var/run/wildfly/
systemctl daemon-reload
systemctl restart wildfly
rm -rf /tmp/wildfly.tar.gz
