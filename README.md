# Nutzung des Templates

Dieses Projekt dient als LaTeX-Vorlage für Bachelor- oder
Master-Abschlussarbeiten. Es wurde bewusst so entworfen, dass Struktur und
Quelltext auch für Einsteiger noch leicht nachzuvollziehen sein sollten und es
entsprechend auch schnell auf die eigenen Bedürfnisse angepasst werden kann.

Die Vorlage ist darauf ausgelegt, möglichst aktuelle/moderne Pakete und "Best
Practices" anzuwenden. Sofern einem Nutzer dieser Vorlage auffällt, dass sich
bestimmte Dinge einfacher/eleganter/... lösen lassen, würde ich mich über eine
Rückmeldung freuen.

## Voraussetzungen

Sie benötigen für die Nutzung dieser LaTeX-Vorlage im Wesentlichen nur eine
aktuelle LaTeX-Installation. Unter Windows beispielsweise MikteX, unter Mac OS X
beispielsweise MacTeX und unter Linux beispielsweise TexLive.

Ergänzende, hilfreiche, Software ist weiter unten aufgeführt, allerdings ist
diese optional.

## Erzeugung der PDF-Datei

Um ein PDF aus den vorliegenden Quellen zu erzeugen, können Sie die
entsprechenden Befehle manuell nacheinander ausführen oder das mitgelieferte
`Makefile` verwenden. Für die Nutzung des `Makefile`s benötigen Sie das freie
Programm `Make`.

### Manuelle Übersetzung

Für die manuelle Übersetzung empfehle ich zum einen die Verwendung des (in Ihrer
LateX-Installation enthaltene) Programms `LuaLaTeX`, sowie die folgende
Befehlsausführung:

```bash
lualatex -shell-escape thesis.tex
biber thesis
lualatex -shell-escape thesis.tex
lualatex -shell-escape thesis.tex
```

### Automatische Übersetzung mittels Make

Falls Sie das `Makefile` nutzen möchten, reicht in der Kommandozeile ein Aufruf
von

```bash
make
```

## Schriftarten

Die Vorlage nutzt verschiedene Schriftarten, die in den meisten Systemen nicht
standardmäßig installiert sind. Hierbei handelt es sich u.a. um:

- Fira Sans (serifenlose Schrift)
  - Lizenzhinweis: "*These fonts are licensed under the Open Font License. You
    can use them in your products & projects – print or digital, commercial or
    otherwise.*"
  - [Download](https://fonts.google.com/specimen/Fira+Sans)
- DejaVu Fonts (Festbreitenschrift)
  - [Lizenz](https://github.com/dejavu-fonts/dejavu-fonts/blob/master/LICENSE)
  - [Download](https://github.com/dejavu-fonts/dejavu-fonts/releases)

Ich empfehle, diese Schriftarten auf Ihrem System zu installieren, um ein
optimales Ergebnis zu erzielen. Andernfalls werden Rückfalloptionen mit
Schriften genutzt, die standardmäßig installiert sein sollten.

## Syntax-Highlighting mittels des minted-Pakets

Um Quelltext (bspw. aus einer C-Datei) mit Syntax-Highlighting erzeugen zu
lassen, empfehle ich die Nutzung des `minted`-Pakets. Ein Beispiel hierfür
befindet sich bereits im Kapitel `latex-tipps.tex`.

Das `minted`-Paket setzt allerdings zwei Dinge voraus:

- Eine Python-Installation
- Die Installation des `pygments`-Paket unter Python

Sofern Python installiert ist, können Sie das `pygments`-Paket wie folgt
installieren:

```bash
pip install pygments
```
