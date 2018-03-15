echo "Update package list"
sudo apt-get update


### Installing SSH
echo "Install SSH"
sudo apt-get install -y ssh


### Installing cURL
echo "Install cURL"
sudo apt-get install -y curl


sudo apt-get install -y apt-transport-https


### Installing Java
echo "Install Java"

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update

echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections 
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

sudo apt-get install -y oracle-java8-installer


### Installing Elastic Search
echo "Install Elastic Search"
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list

sudo apt-get update

sudo apt-get install -y elasticsearch

sudo update-rc.d elasticsearch defaults 95 10
sudo update-rc.d elasticsearch enable

sudo -i service elasticsearch start


echo "You've been provisioned"