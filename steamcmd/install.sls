OS Update:
  pkg.uptodate:
   - refresh: True

software-properties-common:
  pkg.installed

lib32gcc1:
  pkg.installed:
    - refresh: True

Steam user:
  user.present:
    - name: steam

add-apt-repository non-free:
  cmd.run
    
add_i386_architecture:
  cmd.run:
    - name: dpkg --add-architecture i386
    - unless: dpkg --print-foreign-architectures | grep -q i386

"libsdl2-2.0-0:i386":
  pkg.installed:
    - refresh: True
    - require:
      - cmd: dpkg --add-architecture i386
      
steamcmd-debconf:
  debconf.set:
    - name: steamcmd
    - data:
        steam/question: {'type': 'select', 'value': 'I AGREE'}
        steam/license: {'type': 'note', 'value': ''}

Install steamcmd:
  pkg.installed:
    - refresh: True
    - name: 'steamcmd:i386'
    - require:
      - debconf: steamcmd