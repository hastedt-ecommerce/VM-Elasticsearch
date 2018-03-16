wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.5.deb
sudo dpkg -i elasticsearch-5.6.5.deb

sudo update-rc.d elasticsearch defaults 95 10
sudo update-rc.d elasticsearch enable

sudo -i service elasticsearch start