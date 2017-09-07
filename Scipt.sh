#!/bin/bash
#Written by Senthuran Sivanthan to install sequence of tools on jenkins server
update_system()
{
    sudo apt-get update
}

install_dev_tools()
{
    sudo apt-get install -y default-jdk
    sudo apt-get install -y git
    
    #sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    #echo deb http://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
    sudo apt-get update
    #sudo apt-get install -y jenkins

    sudo apt-get install -y python-software-properties
    sudo curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -

    sudo apt-get install -y nodejs
    sudo apt-get install -y npm
}

install_ethereum_tools()
{
    sudo npm install -g ethereumjs-testrpc
    sudo npm install -g solc
    sudo npm install -g truffle
    sudo npm install -g mocha
    sudo npm install -g mocha-junit-reporter
}

echo "Installing Tooling ..."
update_system
install_dev_tools
install_ethereum_tools
echo "Installation Complete."

echo "Starting Jenkins"
start systemctl start jenkins
