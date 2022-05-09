import 'package:flutter/material.dart';

List inhalt = [
  {
    "Zeile": "Impressum gemäß § 5 TMG / § 55 RStV",
  },
  {
    "Zeile": "Technische Hochschule Ostwestfalen-Lippe",
  },
  {
    "Zeile": "Campusallee 12",
  },
  {
    "Zeile": "32657 Lemgo",
  },
  {
    "Zeile": "Telefon: +49 XXXX XXXX X",
  },
  {
    "Zeile": "Telefax: +49 XXXX XXX XXXX",
  },
  {
    "Zeile": "E-Mail: mustermail@th-owl.de",
  },
  {
    "Zeile":
        "Die Technische Hochschule Ostwestfalen-Lippe ist eine vom Land getragene rechtsfähige Körperschaft des öffentlichen Rechts.",
  },
  {
    "Zeile":
        "Sie wird vertreten durch: Professor Dr. Max Mustermann, Präsident der Technischen Hochschule OWL",
  },
  {
    "Zeile": "Umsatzsteuer-ID",
  },
  {
    "Zeile":
        "Umsatzsteuer-Identifikationsnummer gemäß §27 a Umsatzsteuergesetz: DE XXX XXX XXX, Finanzamt Lemgo",
  },
  {
    "Zeile": "Zuständige Aufsichtsbehörde",
  },
  {
    "Zeile":
        "Ministerium für Kultur und Wissenschaft des Landes Nordrhein-Westfalen, Völklinger Straße 49, 40221 Düsseldorf",
  },
  {
    "Zeile": "Inhaltliche Verantwortung",
  },
  {
    "Zeile": "Dezernat Kommunikation und Marketing",
  },
  {
    "Zeile": "Campusallee 12",
  },
  {
    "Zeile": "32657 Lemgo",
  },
  {
    "Zeile": "Telefon: +49 XXXX XXXX X",
  },
  {
    "Zeile": "Telefax: +49 XXXX XXX XXXX",
  },
  {
    "Zeile": "E-Mail: mustermail@th-owl.de",
  },
  {
    "Zeile":
        "Für alle anderen Internetseiten (bspw. der Fachbereiche, Institute, Betriebseinheiten oder Verwaltungsstellen) liegt die inhaltliche Verantwortung bei den Stellen (oder Personen) die die Seiten erstellt oder veröffentlicht haben. Falls Sie Fragen zu einem dieser Internetangebote haben, wenden Sie sich bitte an die jeweils angegebene Stelle oder Person.",
  },
  {
    "Zeile": "Haftung für Inhalte",
  },
  {
    "Zeile":
        "Als Diensteanbieter sind wir gemäß § 7 Abs.1 TMG für eigene Inhalte auf diesen Seiten nach den allgemeinen Gesetzen verantwortlich. Nach §§ 8 bis 10 TMG sind wir als Diensteanbieter jedoch nicht verpflichtet, übermittelte oder gespeicherte fremde Informationen zu überwachen oder nach Umständen zu forschen, die auf eine rechtswidrige Tätigkeit hinweisen. Verpflichtungen zur Entfernung oder Sperrung der Nutzung von Informationen nach den allgemeinen Gesetzen bleiben hiervon unberührt. Eine diesbezügliche Haftung ist jedoch erst ab dem Zeitpunkt der Kenntnis einer konkreten Rechtsverletzung möglich. Bei Bekanntwerden von entsprechenden Rechtsverletzungen werden wir diese Inhalte umgehend entfernen.",
  },
];

class Impressum extends StatelessWidget {
  const Impressum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Impressum',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: ListView.builder(
        itemCount: inhalt.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              inhalt[index]['Zeile'],
              style: Theme.of(context).textTheme.bodyText2,
            ),
          );
        },
      ),
    );
  }
}
