sudo cp zinc.sh /etc/init.d/zinc
sudo chmod 755 /etc/init.d/zinc
sudo chkconfig --del zinc
sudo chkconfig --add zinc
sudo chkconfig --level 345 zinc on