Metasploit:
  file.managed:
    - names:
      - /etc/apt/sources.list.d/msf.list:
        - source: salt://toolkit/msf.list
      - /etc/apt/trusted.gpg.d/msf.gpg:
        - source: salt://toolkit/msf.pgp
  pkg.installed:
    - pkgs:
      - metasploit-framework
Tools:
  pkg.installed:
    - pkgs:
      - curl
      - wireshark
      - nmap
