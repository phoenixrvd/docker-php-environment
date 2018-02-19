# PHP - Development environment

Eine Sammlung von Docker-Containern mit unterschiedlichen PHP-Versionen, gleichen INI-Einstellungen und PHP-Extensions.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Anleitung](#anleitung)
  - [Start](#start)
  - [APP-Domäne](#app-dom%C3%A4ne)
- [Funktionsweise](#funktionsweise)
- [PHP-Versionen](#php-versionen)
  - [Apache2-Module](#apache2-module)
- [Extensions](#extensions)
- [Debugging und Profiling](#debugging-und-profiling)
- [Login in Container](#login-in-container)
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

## Funktionsweise

Fast immer muss ein PHP-Entwickler seine Anwendung unter unterschiedlichen PHP-Version laufen lassen und testen.

Das Aufsetzen von eine PHP-Umgebung kann teilweise Stunden in Anspruch nehmen. Die Sammlung startet gleichzeitig mehrere 
unterschiedliche PHP-Versionen und mappt sie automatisch auf lokale ports, sodass man ganz ohne Aufwand zwischen 
unterschiedlichen PHP-Versionen wechseln kann.

Die Automatisierung und Portmapping ist mit [Docker Compose](https://docs.docker.com/compose/) realisiert und 
bleibt somit eine Standard-Lösung.

## PHP-Versionen

Alle PHP-Versionen sind offizielle [PHP-Docker-Container](https://docs.docker.com/samples/library/php/).

### Apache2-Module
| PHP    | URL                                     | IP            |
| ------ | --------------------------------------- | ------------- |
| 5.6.33 | [localhost:8056](http://localhost:8056) | 10.100.110.56 |
| 7.0.27 | [localhost:8070](http://localhost:8070) | 10.100.110.70 |
| 7.1.14 | [localhost:8071](http://localhost:8071) | 10.100.110.71 |
| 7.2.2  | [localhost:8022](http://localhost:8022) | 10.100.110.72 |

## Extensions

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
* libxml
* [IonCube](https://www.ioncube.com/loaders.php)

## Debugging und Profiling

Beim Starten eines Containers wird automatisch 'tmp' - Verzeichnis im Projekt-Root 
angelegt. Das Verzeichnis muss **unbedingt** beschreibbar gemacht werden, weil 
PHP da die cachegrid.* und trace.* Dateien mit www-data speichert.

Xdebug ist im Standard bereits aktiviert und kann in 'Auto-Mode' ohne 
besondere IDE- und Server-Einstellungen genutzt werden. Gute Artikel dazu findet man
[[hier](https://confluence.jetbrains.com/display/PhpStorm/Zero-configuration+Web+Application+Debugging+with+Xdebug+and+PhpStorm)]

## Login ins Container

```bash
docker exec -it phpenv_php56_1 /bin/bash
docker exec -it phpenv_php70_1 /bin/bash
docker exec -it phpenv_php71_1 /bin/bash
docker exec -it phpenv_php72_1 /bin/bash
```

## Contributing

**Aktualisieren von Inhaltsverzeichnis**

```bash
doctoc README.md --notitle
```

## Copyright and license

Code released under the [MIT License](https://opensource.org/licenses/MIT). 