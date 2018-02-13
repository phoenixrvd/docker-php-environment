# PHP - Development environment

Eine Sammlung von Docker-Containern mit unterschiedlichen PHP-Versionen, gleichen INI-Einstellungen und PHP-Extensions.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Anleitung](#anleitung)
- [Funktionsweise](#funktionsweise)
- [PHP-Versionen](#php-versionen)
  - [Apache2-Module](#apache2-module)
- [Extensions](#extensions)
- [Contributing](#contributing)
- [Copyright and license](#copyright-and-license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Anleitung

Einfach in Projekt-Verzeichnis ablegen und folgendes in Console ausführen.
 
```bash
docker-compose up
```

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
| PHP    | URL                                     |
| ------ | --------------------------------------- |
| 5.6.33 | [localhost:8056](http://localhost:8056) |
| 7.0.27 | [localhost:8070](http://localhost:8070) |
| 7.1.14 | [localhost:8071](http://localhost:8071) |
| 7.2.2  | [localhost:8022](http://localhost:8022) |

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

## Contributing

**Aktualisieren von Inhaltsverzeichnis**

```bash
doctoc README.md --notitle
```

## Copyright and license

Code released under the [MIT License](https://opensource.org/licenses/MIT). 