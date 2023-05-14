# Miniprojekti

Miniprojekti, jossa rakennan moduulin joka asentaa verkon tarkkailuun tarkoitettuja ohjelmia. Nämä työkalut auttavat verkon ongelmien vianmäärityksessä ja haavoittuvuuksien etsimisessä.

Varoitus: käytä työkaluja vain harkitusti ja hallitusti omalla vastuulla. Suositeltavaa on käyttää maalina internetistä pois kytkettyä konetta. 

Luo kansio Metasploitable koneelle.

    mkdir target && cd target

Vagrantfile:

    wget https://raw.githubusercontent.com/Jka1123/Miniprokkis/main/Vagrantfile
    vagrant up
