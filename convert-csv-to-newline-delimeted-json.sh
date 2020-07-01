
echo "install npm, then csv2json"

sudo apt update -y
sudo apt install npm -y

npm install --global csv2json

csv2json -s=";" data/firstTestData.csv data/firstTestData.json