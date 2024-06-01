FROM linuxserver/webtop:debian-kde


COPY ./Chinese_Input_Init.sh /Chinese_Input_Init.sh

RUN apt update && apt install -y wget vim &&\
    apt remove chromium-* -y && apt autoremove -y && sudo install -d -m 0755 /etc/apt/keyrings &&\
    wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null &&\
    gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}' &&\
    echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null &&\
    echo '\
        Package: *\
        Pin: origin packages.mozilla.org\
        Pin-Priority: 1000\
        ' | sudo tee /etc/apt/preferences.d/mozilla && sudo apt-get update && sudo apt-get install -y firefox && apt remove -y fcitx* && apt autoremove -y
    
        


# RUN apt install -y ibus ibus-*
# RUN apt install -y ibus ibus-* fonts-noto-cjk-* && passwd -d abc && sed -i 's/%sudo ALL=(ALL:ALL) NOPASSWD: ALL/#%sudo ALL=(ALL:ALL) NOPASSWD: ALL/g' /etc/sudoers && sed -i 's/^root*/#root/g' /etc/sudoers
CMD [ "/bin/bash","-c","sudo sed -i '54c listen 3000;' /etc/nginx/sites-enabled/default && sudo sed -i '55,57d' /etc/nginx/sites-enabled/default && sudo apt install -y ibus ibus-* fonts-noto-cjk-* && sudo mv /Chinese_Input_Init.sh  /config/Desktop/Chinese_Input_Init.sh && sudo  chmod 777 /config/Desktop/Chinese_Input_Init.sh  && sudo sed -i 's/%sudo ALL=(ALL:ALL) NOPASSWD: ALL/#%sudo ALL=(ALL:ALL) NOPASSWD: ALL/g' /etc/sudoers && sudo sed -i 's/^root*/#root/g' /etc/sudoers && passwd -d abc && touch /config/.healthy &&  sleep infinity"]

