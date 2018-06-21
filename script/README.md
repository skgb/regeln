Werkzeuge zur Arbeit mit SKGB-Regeln
====================================

Mit diesen Werkzeugen lassen sich die Satzung und Ordnungen des Vereins parsen
und in bestimmte Fassungen transformieren. Die mit diesen Werkzeugen erzeugten
Dokumente sind nicht offiziell.


Installation
------------

```sh
git clone https://github.com/skgb/regeln.git skgb-regeln
```

Voraussetzungen:

- [POSIX][]-kompatible Shell-Umgebung (z. B. `bash` in [macOS][] oder Linux;
  [WSL][] oder [Cygwin][] für Windows nicht getestet, sollten aber auch gehen)
- `perl` 5.14+ (5.24+ empfohlen)
- `libxml2` und `XML::LibXML` 1.70+ (2.0124+ empfohlen)
- `libxslt` und `XML::LibXSLT` (1.94+ empfohlen)


Verwendung
----------

Es wird direkt `regeln.pl` aufgerufen. Das Perl-Skript führt die Transformation
selbsttätig durch und liefert das Ergebnis auf `stdout`.

Einige Beispiele:

```sh
# aktuelle Fassung der Satzung im OpenDocument-Format ausgeben
script/regeln.pl -f odf src/Satzung.xml > Satzung.fodt

# Änderungen der Finanzordnung auf der MV 2014-04-05 in HTML ausgeben
script/regeln.pl -f html -c 2014-04-05 src/FinO.xml > FinO.2014.diff.xhtml

# Übersichtsliste aller Änderungen der Steg- und Liegeplatzordnung ausgeben
script/regeln.pl -l src/StegO.xml

# alle Änderungen der Steg- und Liegeplatzordnung in jeweils eigener Datei ausgeben
script/regeln.pl -l src/StegO.xml | while read a
do
  script/regeln.pl -c "$a" -f html src/StegO.xml > "StegO.$a.diff.xhtml"
done

# weitere Optionen im Handbuch nachschlagen
script/regeln.pl --man
```


Über die Transformation nach OpenDocument (LibreOffice)
-------------------------------------------------------

Die SKGB ist dabei, von proprietärer Office-Software der Entwickler [RagTime][]
oder [Microsoft][] zu [freier Software][] zu wechseln. Dieser Prozess nahm kurz
nach der Abspaltung von [LibreOffice][] Fahrt auf, weswegen nun primär dieses
Paket eingesetzt wird. Wie OpenOffice benutzt LibreOffice als natives Format
[OpenDocument][] (ODF).

Da sowohl SKGB-Regeln als auch OpenDocument XML-Anwendungen sind, liegt es
nahe, zur Konvertierung ein einfaches [XSLT][] zu verwenden. `regeln.pl`
liefert das Ergebnis als Flat-File-OpenDocument. Die hier vorliegende Fassung
ist etwas (zu) einfach gestrickt; das Ergebnis-Dokument der Transformation
enthält noch einige Fehler. Diese werden als schnelle Interims-Lösung einfach
mit [Perl][] ausgebügelt; das Ergebnis ist in den meisten Fällen well-formed.

Zwar ist dieses Verfahren verbesserungsfähig. Dennoch lassen sich so mit nur
minimaler manueller Nachbearbeitung in LibreOffice schnell qualitativ sehr
zufriedenstellende PDF-Versionen der Regeln-XML erzeugen. Auch die Integration
in SKGB-intern 2 ist möglich.


[POSIX]: https://de.wikipedia.org/wiki/Portable_Operating_System_Interface
[macOS]: https://www.apple.com/de/macos/
[WSL]: https://de.wikipedia.org/wiki/Windows_Subsystem_for_Linux
[Cygwin]: https://de.wikipedia.org/wiki/Cygwin
[RagTime]: http://www.ragtime.de/
[Microsoft]: https://de.wikipedia.org/wiki/Microsoft
[freier Software]: https://de.wikipedia.org/wiki/Freie_Software#Die_vier_Freiheiten
[LibreOffice]: https://de.libreoffice.org/
[OpenDocument]: https://de.wikipedia.org/wiki/OpenDocument
[XSLT]: https://de.wikipedia.org/wiki/XSL_Transformation
[Perl]: https://de.wikipedia.org/wiki/Perl_(Programmiersprache)
