# h6 miniprojekti


### Johdanto

Tarkoituksena on asentaa verkon analysointiin soveltuvia työkaluja linuxille moduulilla sekä linuxin peruskäyttöön tarkoitettuja ohjelmia.
Asennettavat työkalut:
- nmap
- wireshark
- curl
- metasploit


### Projektin alustus

Tehdään alkuun uusi virtuaalikone ja haetaan päivitykset ja parannukset.

    sudo apt-get -y update
    sudo apt-get -y upgrade

Asennetaan salt-master.

    sudo apt-get -y install salt-master
    

### Tilan rakennus

Polku salt tilalle /srv/salt/toolkit. Tänne luodaan init.sls tiedosto, johon lisäämme asennettavat tilat.

<img width="402" alt="Screenshot 2023-05-08 at 21 21 31" src="https://user-images.githubusercontent.com/120730231/236901114-bf7f75e9-062b-4dbe-8502-5da7282cc6ef.png">

Tila asentaa curl:in, nmap:in sekä wireshark:in kun annamme komennon:

    sudo salt-call --local state.apply toolkit
    
Wireshark löytyy Applications valikon Network välilehdeltä.

<img width="986" alt="Screenshot 2023-05-08 at 21 25 50" src="https://user-images.githubusercontent.com/120730231/236902047-2fedd159-9e4a-479c-b1a5-0b5bd557f27f.png">


Nmap toimii myös (älä skannaa mitä tahansa ilman lupaa, kyseinen kohde on Nmapin vapaasti skannattava palvelin mitä voi käyttää porttiskannauksen testaamiseen/harjoitteluun):

<img width="716" alt="Screenshot 2023-05-08 at 21 32 48" src="https://user-images.githubusercontent.com/120730231/236903365-c19cdedc-6a4d-4552-9e18-d4d66b629d78.png">

### Metasploit

Metasploitin asennus vaati curl:in käyttöä ja cmd.run tilan käyttöä, jotta asennus onnistuisi. Metasploitin sivuilta löytyy scripti, millä asentaa ohjelma Linuxille tai macOS:lle (https://docs.metasploit.com/docs/using-metasploit/getting-started/nightly-installers.html). 
Tarvitsee siis muokata /srv/salt/toolkit polussa sijaitsevaa init.sls tiedostoa, että tila ajaa scriptissä olevat komennot järjestyksessä.

Yritettyäni ajaa koko scriptiä yhdellä komennolla, tuli virheilmoitus:

<img width="984" alt="Screenshot 2023-05-08 at 22 20 12" src="https://user-images.githubusercontent.com/120730231/236913629-48da1485-c047-47e7-bbaf-fe52afdcfeff.png">


Päädyin etsimään vastausta Google:sta ja löysin mallin cmd.run komentojen ketjutukseen (https://stackoverflow.com/questions/19640829/how-can-i-execute-multiple-commands-using-salt-stack).

Init.sls sisältö:

<img width="985" alt="Screenshot 2023-05-08 at 22 17 51" src="https://user-images.githubusercontent.com/120730231/236912998-70cdd3d0-5f15-4851-b215-f4f65b17b1d7.png">


Muutoksen jälkeen, tilan ajaminen onnistui virheittä ja Metasploit asentui. Tilan ajosta tuli sen verran pitkä lista tekstiä, joten en ottanut screenshottia. Käynnistettyäni Metasploitin sain herjauksen tilan puutteesta, joten joudun lisäämään virtuaalikoneelle lisää muistia käyttääkseni tätä.

### Lähteet 

https://terokarvinen.com/2023/palvelinten-hallinta-2023-kevat/
https://stackoverflow.com/questions/19640829/how-can-i-execute-multiple-commands-using-salt-stack
https://github.com/Justus-stack/h7_moduli/blob/main/report.md
https://docs.metasploit.com/docs/using-metasploit/getting-started/nightly-installers.html
