#!/bin/bash
echo "[i] We will now install ddos to your bin path..."
if [ -d "/usr/share/ddos" ] ; then
    echo "[i] Found an old version of ddos, proceeding to update..."
    echo "[i] Backing up old verison."
    if [ -d "/usr/share/ddos/Backup" ] ; then
        sudo mv /usr/share/ddos/Backup ./Backup
    else
        mkdir ./Backup
    fi
    name="./Backup/ddos"
    if [ -d $name ] ; then
        i=0
        while [ -d "$name.bak$i" ] ; do
            let i++
        done
            name="$name.bak$i"
    fi
    sudo mv /usr/share/ddos $name
    mv ./Backup ./ddos/
    sudo cp -ar ./ddos /usr/share/
    echo "[i] Installation sucessful."
    echo "[i] Making ddos executable..."
    sudo mv /usr/share/ddos/main.py /usr/share/ddos/rst
    sudo chmod +x /usr/share/ddos/rst
    sudo ln -s /usr/share/ddos/rst /usr/bin/rst || echo "[i] Link already seems to exist."
else
    sudo cp -ar ./ddos /usr/share/
    echo "[i] Installation sucessful."
    echo "[i] Making ddos executable..."
    sudo mv /usr/share/ddos/main.py /usr/share/ddos/rst
    sudo chmod +x /usr/share/ddos/rst
    sudo ln -s /usr/share/ddos/rst /usr/bin/rst || echo "[i] Link already seems to exist."
fi

echo "[i] You can delete the ddos folder now."
echo "----------------------------------------"
echo "[i] Run 'sudo rst' to start ddos."
echo "----------------------------------------"
exit 0
