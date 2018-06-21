Regelwerk der SKGB
==================

Dieses Repository enthält die **Satzung und Vereinsordnungen** der [SKGB][]
(in `src`). Es soll die Information der Mitglieder verbessern sowie die
Diskussion um die Fortbildung des Regelwerks fördern.


Ich will doch bloß die Satzung lesen!
-------------------------------------

Eine druckfertige PDF-Fassung unserer Satzung mitsamt der Vereinsordnungen
findest Du im Impressum unserer Website (unter [Kontakt][] im Hauptmenü).


Über dieses Repository
----------------------

Der `stable`-Branch soll nur Textfassungen enthalten, welche die offiziellen,
von den Vereinsorganen beschlossenen Regelungen bestmöglich wiedergeben. Er
kommt damit einer verbindlichen Quelle für die Gesamtfassung am nächsten.
Wirklich verbindlich sind indes allein die Wortlaute der jeweiligen Beschlüsse!

Der `master`-Branch ist der Default-Branch. Er dient der Arbeit an
der Umsetzung der Beschlüsse in griffige Formulierungen und korrekte
XML-Auszeichnung. Wenn aktuell keine Änderungen anstehen, sollten `master`
und `stable` somit auf dem gleichen Stand sein.

Weitere Branches können fallweise für Ordnungsentwürfe zur Vorbereitung
von Änderungen oder zu experimentellen Zwecken genutzt werden.

Die Idee, das SKGB-Regelwerk in [XML][] zu kodieren, entstand um 2005 aus der
Notwendigkeit, identische Inhalte sowohl im Web-Browser als auch in gedruckter
Fassung verfügbar zu machen. Damals ließ die Druckqualität aus dem Browser
oft zu wünschen übrig, und PDF- und andere Dokumente konnten meist nur über
Plug-ins im Browser angezeigt werden. [XSL][] versprach die Chance, technisch
neutrale Inhalt je nach Ziel in HTML oder in ein PDF umzuwandeln.

Tatsächlich stellte sich die gewünschte Umwandlung mit XSL wie auch die
notwendige präzise Nachführung der XML-Quelldokumente als eher mühselig
heraus. Mittlerweile existiert jedoch eine Toolchain, welche die Erzeugung
der benötigten Dokumente zumindest soweit vereinfacht, dass nur noch wenig
Handarbeit nötig ist. Die bestehende Technik kann daher bis auf Weiteres
weiter genutzt werden. Perspektivisch könnte theoretisch die bisher gepflegte
Kennzeichnung der Änderungsgeschichte über XML-Attribute entfallen, falls
sich im Vorstand stattdessen die Nutzung dieses Repositories etabliert.

Neue **Issues und Pull Requests** sind in diesem Repository gerne gesehen,
stellen jedoch **keine** Anträge für Regeländerungen dar. Vielmehr erlauben
Issues und Pull Requests hier (neben Fehlerkorrekturen), das Regelwerk offen
zu diskutieren und Ideen zu entwickeln, die später einmal den Vereinsorganen
zur Abstimmung vorgelegt werden könnten oder auch nicht.

Wenn du zeitnah eine konkrete Regeländerung wünschst, nimmst du also am besten
formlos [Kontakt][] mit dem Vereinsvorstand auf, idealerweise mindestens drei
Monate vor der nächsten Mitgliederversammlung.


Abkürzungen
-----------

Die einzelnen Dokumente sind mit Abkürzungen gekennzeichnet, um die Dateinamen
übersichtlich kurz zu halten. Diese Abkürzungen sind größtenteils nicht
allgemein üblich. Sie sollten in der normalen Kommunikation durch die folgenden
umgangssprachlichen Kurznamen ersetzt werden:

**ANutzO** – Allgemeine Vereinsboots-Nutzungsordnung  
**DSE** – Datenschutzerklärung  
**FinO** – Finanzordnung  
**HausO** – Bootshausordnung  
**JO** – Jugendordnung  
**JungSV** – Jüngstensegel-Vorschrift  
**NutzOJuB** – Jugendboot-Nutzungsordnung  
**NutzOVayu** – Sailhorse-Nutzungsordnung  
**NutzOvG** – Lelievlet-Nutzungsordnung  
**StegO** – Steg- und Liegeplatzordnung


Weiterverwendung
----------------

Der Vorstand hat sich bisher mangels Notwendigkeit noch nicht zum Nutzungsrecht
der Inhalte dieses Repositorys durch Dritte positioniert. Es ist jedoch
die persönliche inoffizielle Meinung des Verfassers dieser Zeilen, dass
[§ 5 Abs. 1 UrhG][] über die Gemeinfreiheit amtlicher Werke entsprechend
angewendet werden kann.


[SKGB]: https://www.skgb.de/
[Kontakt]: https://www.skgb.de/kontakt
[XML]: https://de.wikipedia.org/wiki/Extensible_Markup_Language
[XSL]: https://de.wikipedia.org/wiki/Extensible_Stylesheet_Language
[§ 5 Abs. 1 UrhG]: http://www.gesetze-im-internet.de/urhg/__5.html
