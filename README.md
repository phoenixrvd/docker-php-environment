# PHP - Development environment

Eine Sammlung von Docker-Containern mit unterschiedlichen PHP-Versionen, gleichen INI-Einstellungen und PHP-Extensions.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Anleitung](#anleitung)
  - [Start](#start)
  - [APP-Domäne](#app-dom%C3%A4ne)
- [Purpose](#purpose)
- [Funktionsweise](#funktionsweise)
- [PHP](#php)
  - [Hosts und Versionen](#hosts-und-versionen)
  - [Extensions](#extensions)
  - [Debugging und Profiling](#debugging-und-profiling)
- [Datenbanken](#datenbanken)
  - [Hosts und Versionen](#hosts-und-versionen-1)
  - [Dump](#dump)
  - [Restore](#restore)
- [Login ins Container](#login-ins-container)
- [Contributing](#contributing)
- [Copyright and license](#copyright-and-license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Anleitung

### Start
Einfach in Projekt-Verzeichnis ablegen und folgendes in Console ausführen.
 
```bash
docker-compose up
```

### APP-Domäne

Damit die Webapp auf eine echte Domäne läuft, sollte man jeweilige Container-IP ([Apache2-Module](#Apache2-Module)) 
in statische DNS-Tabelle auf eigenem Rechner eintragen.

* [Linux](https://wiki.ubuntuusers.de/hosts/)
* [Windows](http://www.thewindowsclub.com/hosts-file-in-windows)
* [Mac](https://www.tippscout.de/hosts-datei-mac-os-x_tipp_5032.html)

## Purpose

Fast immer muss ein PHP-Entwickler seine Anwendung unter unterschiedlichen PHP-Version laufen lassen und testen.

Das Aufsetzen von eine PHP-Umgebung kann teilweise Stunden in Anspruch nehmen. Die Sammlung startet gleichzeitig mehrere 
unterschiedliche PHP-Versionen und mappt sie automatisch auf lokale ports, sodass man ganz ohne Aufwand zwischen 
unterschiedlichen PHP-Versionen wechseln kann.

## Funktionsweise

Die Automatisierung ist mit [Docker Compose](https://docs.docker.com/compose/) realisiert und 
bleibt somit nach Möglichkeit eine Standard-Lösung.

## PHP

Alle PHP-Versionen sind offizielle [PHP-Docker-Container](https://docs.docker.com/samples/library/php/).

### Hosts und Versionen

Folgende Versionen sind als Apache2-Module installiert.

| PHP    | URL                                     | IP            |
| ------ | --------------------------------------- | ------------- |
| 5.6.33 | [localhost:8056](http://localhost:8056) | 10.100.110.56 |
| 7.0.27 | [localhost:8070](http://localhost:8070) | 10.100.110.70 |
| 7.1.14 | [localhost:8071](http://localhost:8071) | 10.100.110.71 |
| 7.2.2  | [localhost:8072](http://localhost:8072) | 10.100.110.72 |

### Extensions

Liste aller installierten PHP-Extensions

* xdebug
* mcrypt
* gd
* curl
* iconv
* json
* libxml
* mbstring
* mysqlnd
* sqlite3
* pgsql
* mysql
* zip
* libxml
* soap
* mysqli
* [IonCube](https://www.ioncube.com/loaders.php)

### Debugging und Profiling

Beim Starten eines Containers wird automatisch 'tmp' - Verzeichnis im Projekt-Root 
angelegt. Das Verzeichnis muss **unbedingt** beschreibbar gemacht werden, weil 
PHP da die cachegrid.* und trace.* Dateien mit www-data speichert.

Xdebug ist im Standard bereits aktiviert und kann in 'Auto-Mode' ohne 
besondere IDE- und Server-Einstellungen genutzt werden. Gute Artikel dazu findet man
[[hier](https://confluence.jetbrains.com/display/PhpStorm/Zero-configuration+Web+Application+Debugging+with+Xdebug+and+PhpStorm)]

## Datenbanken

Datenbank-Server werden bereits mit eine datenbank installiert. Innerhalb von 
PHP-Container sind die Host-Namen bekannt. D.h. in eigene Applikation kann man 
als Host beispielsweise einfach 'mysql' verwenden. 

Sollte man die Datenbank von IDE aus verwenden, so muss man die IP statt hostname
nutzen.

Es werden keine Dumps automatisch eingespielt, die Datenbanken werden Leer erzeugt.
Wenn man bereits eine SQL-Datei mit daten zur verfügung hat kann man sie [Manuell Einspielen](#restore)

### Hosts und Versionen

| Version                      | IP             | Host    | Port | User   | Password | Database |
| ---------------------------- | -------------- | ------- | ---- | ------ | -------- | -------- |
| MariaDB 10.2 (Like Mysql5.7) | 10.100.110.241 | mysql57 | 3306 | webapp | webapp   | webapp   |

### Dump

Die Sicherung-SQL werden im Standard unter ./tmp - Verzeichnis im Root - Verzeichnis des Projektes abgelegt.

Dei Einstellung kann man anpassen in dem man **DATABESES_BACKUP_PATH** in Environment setzt. (.env-Datei)

```bash
docker exec phpenv_mysql57_1 dump
```

### Restore

Die gesicherte Datenbanken kann man auch wiederherstellen.

```bash
docker exec phpenv_mysql57_1 restore demps/backup.sql
```

1. Den Pfad muss relative zu Projekt-Root sein. 
2. Die Sym-Links werden nicht funktionieren.

## Login ins Container

```bash
docker exec -it <container_name> /bin/bash
```

Example: 'docker exec -it phpenv_php56_1 /bin/bash'

## Contributing

**Aktualisieren von Inhaltsverzeichnis**

```bash
doctoc README.md --notitle
```

## Copyright and license

Code released under the [MIT License](https://opensource.org/licenses/MIT). 