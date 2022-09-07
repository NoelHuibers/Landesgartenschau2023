import 'package:flutter/material.dart';

/*
Die Datei bildet den Text für die 
ImpressumPage
*/

List inhalt = [
  {
    "Zeile": "Technische Hochschule Ostwestfalen-Lippe",
  },
  {
    "Zeile":
        "Campusallee 12  \nTelefon: +49 XXXX XXXX X \nTelefax: +49 XXXX XXX XXXX \nE-Mail: mustermail@th-owl.de",
  },
  {
    "Zeile":
        "\nDie Technische Hochschule Ostwestfalen-Lippe ist eine vom Land getragene rechtsfähige Körperschaft des öffentlichen Rechts.",
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
    "Zeile":
        "\nInhaltliche Verantwortung \n \nDezernat Kommunikation und Marketing \nCampusallee 12 \n32657 Lemgo \nTelefon: +49 XXXX XXXX X \nTelefax: +49 XXXX XXX XXXX \nE-Mail: mustermail@th-owl.de \n",
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

class Impressumview extends StatelessWidget {
  const Impressumview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 490,
      child: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.down,
              color: Theme.of(context).colorScheme.surfaceTint,
              child: ListView.builder(
                itemCount: inhalt.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      inhalt[index]['Zeile'],
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  );
                },
              ))),
    );
  }
}
