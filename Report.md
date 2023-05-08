# h6 miniprojekti

Tarkoituksena on asentaa verkon analysointiin soveltuvia työkaluja linuxille moduulilla sekä linuxin peruskäyttöön tarkoitettuja ohjelmia.
Asennettavat työkalut:
- nmap
- wireshark
- curl
- metasploit

Tehdään alkuun uusi virtuaalikone ja haetaan päivitykset ja parannukset.

    sudo apt-get -y update
    sudo apt-get -y upgrade

Asennetaan salt-master.

    sudo apt-get -y install salt-master
    
    
Polku salt tilalle /srv/salt/toolkit. Tänne luodaan init.sls tiedosto, johon lisäämme asennettavat tilat.

<img width="402" alt="Screenshot 2023-05-08 at 21 21 31" src="https://user-images.githubusercontent.com/120730231/236901114-bf7f75e9-062b-4dbe-8502-5da7282cc6ef.png">

Tila asentaa curl:in, nmap:in sekä wireshark:in kun annamme komennon:

    sudo salt-call --local state.apply toolkit
    
Wireshark löytyy Applications valikon Network välilehdeltä.

<img width="986" alt="Screenshot 2023-05-08 at 21 25 50" src="https://user-images.githubusercontent.com/120730231/236902047-2fedd159-9e4a-479c-b1a5-0b5bd557f27f.png">


Nmap toimii myös (älä skannaa mitä tahansa ilman lupaa, kyseinen kohde on Nmapin vapaasti skannattava palvelin mitä voi käyttää porttiskannauksen testaamiseen/harjoitteluun):

<img width="716" alt="Screenshot 2023-05-08 at 21 32 48" src="https://user-images.githubusercontent.com/120730231/236903365-c19cdedc-6a4d-4552-9e18-d4d66b629d78.png">


