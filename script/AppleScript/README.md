SKGB-Regeln für RagTime
=======================

Für über ein Jahrzehnt war das Office/Layout–Paket [RagTime][] *das* Rückgrat
der internen Mitgliederinformation der SKGB. Die schon immer hervorragende
[AppleScript][]-Unterstützung von RagTime legte nahe, so die XML-Dokumente
zu parsen und deren Inhalte in ein neues RagTime-Dokument zu übertragen, um
professionellen Satz und Layout zu ermöglichen.

Leider stellte sich trotz extrem nützlicher Software Dritter wie [TestXSLT][],
[XSLPalette][] und vor allem der Scripting Additions XML Tools sowie XSLT Tools
von [Late Night Software][] das Parsen mit AppleScript als eher unpraktisch
heraus.

Hinzu kam, dass diese Lösung den zunehmend problematischen [Vendor-Lock-in][]
in proprietäre Software weiter verstärkte. Die stockende Entwicklung von
RagTime und die [Insolvenz][] des Entwicklers zerstörte das in RagTime gesetzte
Vertrauen, so dass um 2010 von einer weiteren Verfolgung dieses Ansatzes
Abstand genommen wurde. Stattdessen wurde begonnen, nach Lösungen zu suchen,
die auf [freier Software][] aufbauen, was letztlich zur Entwicklung von
`regeln2odf.xsl` führte.


[RagTime]: http://www.ragtime.de/
[AppleScript]: https://de.wikipedia.org/wiki/AppleScript
[TestXSLT]: https://github.com/liyanage/testxslt
[XSLPalette]: https://github.com/itod/xslpalette
[Late Night Software]: https://en.wikipedia.org/wiki/Late_Night_Software#Scripting_Additions
[Vendor-Lock-in]: https://de.wikipedia.org/wiki/Lock-in-Effekt
[Insolvenz]: https://de.wikipedia.org/wiki/RagTime_(Software)#Geschichte
[freier Software]: https://de.wikipedia.org/wiki/Freie_Software#Die_vier_Freiheiten
