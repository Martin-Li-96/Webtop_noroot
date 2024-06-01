FROM linuxserver/webtop:debian-kde


RUN apt update && apt install -y wget && cd  /etc/nginx/sites-enabled && rm -rf ./* && \ 
    wget https://github.com/Martin-Li-96/Webtop-nginx-config/releases/download/beta/default &&\
    apt remove chromium-* -y && apt autoremove -y && sudo install -d -m 0755 /etc/apt/keyrings &&\
    wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null &&\
    gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}' &&\
    echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null &&\
    echo '\
        Package: *\
        Pin: origin packages.mozilla.org\
        Pin-Priority: 1000\
        ' | sudo tee /etc/apt/preferences.d/mozilla && sudo apt-get update && sudo apt-get install -y firefox 




CMD [ "/bin/bash","-c","sudo passwd -d abc && sed -i 's/%sudo ALL=(ALL:ALL) NOPASSWD: ALL/#%sudo ALL=(ALL:ALL) NOPASSWD: ALL/g' /etc/sudoers && sed -i 's/^root*/#root/g' /etc/sudoers && sleep infinity"]



