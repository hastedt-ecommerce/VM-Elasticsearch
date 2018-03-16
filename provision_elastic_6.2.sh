wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list

sudo apt-get update

sudo apt-get install -y elasticsearch

sudo update-rc.d elasticsearch defaults 95 10
sudo update-rc.d elasticsearch enable

sudo -i service elasticsearch start