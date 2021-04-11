Regelwerk der SKGB
==================

Dieses Repository enthielt früher die Satzung und Vereinsordnungen der
[SKGB][]. Es sollte die Information der Mitglieder verbessern sowie die
Diskussion um die Fortbildung des Regelwerks fördern.

Seit etwa 24. November 2019 entwickelt der Vorstand das Regelwerk jedoch
unabhängig von diesem Repository weiter, so dass es nicht länger sinnvoll
erscheint, die **möglicherweise veralteten** XML-Rohfassungen hier
prominent bereitzustellen. Sie wurden deshalb im April 2021 aus dem
Verzeichnis `src` entfernt.


Ich will doch bloß die Satzung lesen!
-------------------------------------

Eine druckfertige PDF-Fassung unserer Satzung mitsamt der Vereinsordnungen
findest du im Impressum unserer Website (unter [Kontakt][] im Hauptmenü).


Über dieses Repository
----------------------

Der `stable`-Branch enthält die XML-Fassungen, die im März 2019 zur Erzeugung
der offiziellen PDFs verwendet wurden.
Der `master`-Branch ist der Default-Branch. Er diente früher der Arbeit an
der Umsetzung der Beschlüsse in griffige Formulierungen und korrekte
XML-Auszeichnung.

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
Handarbeit nötig ist.

Der verwendete XML-Namespace lautete `http://www.skgb.de/2005/regeln`.


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
