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

Metasploit:ia ei löydy pakettikirjastosta, joten se täytyy lisätä sinne. Tehdään käyttäjän kotihakemistoon kansio "msf" ja ladataan tänne metasploit asennuspaketti.

        wget https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb

Komento asentaa msfupdate.erb tiedoston ja tästä tiedostosta tarvitsemme pgp avaimen.

        micro msfupdate.erb
        
Kopioidaan pitkä rimpsu alusta, missä lukee BEGIN PGP PUBLIC KEY BLOCK ja päättyy END PGP PUBLIC KEY BLOCK. 

Luodaan tyhjä tekstitiedosto polkuun ~/msf, nimeltä "msf.pgp" ja liitetään kopioitu avain tänne. Tämän jälkeen voimme lisätä avaimen luotettujen apt pakettien listaan. Päivitetään pakettihakemisto.

        sudo apt-key add msf.pgp
        sudo apt-get update


Nyt voimme asentaa metasploitin suoraan apt:illa.

        sudo apt-get install metasploit-framework



Muokataan /srv/salt/toolkit hakemistossa olevaa init.sls tiedostoa, että se sisältää metasploitin asentavan tilan.


Init.sls sisältö:

<img width="390" alt="Screenshot 2023-05-15 at 21 53 40" src="https://github.com/Jka1123/Miniprokkis/assets/120730231/5d02a4c8-3c2f-4751-b51e-4241344ff50c">

Nyt voimme ajaa tilan uudestaan.

        sudo salt-call --local state.apply toolkit
        
<img width="906" alt="Screenshot 2023-05-15 at 21 57 42" src="https://github.com/Jka1123/Miniprokkis/assets/120730231/4b7479c5-6c0d-4f0d-8458-3d2abecd6e0a">




### Lähteet 

https://terokarvinen.com/2023/palvelinten-hallinta-2023-kevat/
https://stackoverflow.com/questions/19640829/how-can-i-execute-multiple-commands-using-salt-stack
https://github.com/Justus-stack/h7_moduli/blob/main/report.md
https://docs.metasploit.com/docs/using-metasploit/getting-started/nightly-installers.html
https://github.com/tonijaaskelainen/beginnerpentest/tree/master
