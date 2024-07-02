\ProvidesClass{thesis}[2024/06/28 Thesis]
\LoadClass[
  twoside,              % Layout fuer beidseitigen Druck
  %openany,             % Um leere Seiten zu vermeiden
  headsepline,          % horizontale Linie unter Kolumnentitel
  chapterprefix=true,
  BCOR=15mm,		    % Korrektur fuer die Bindung
  DIV=15,		  	    % DIV-Wert fuer die Erstellung des
  			            % Satzspiegels, siehe scrguide
  fontsize=12pt,        % Schriftgröße
  a4paper,
]{scrbook}

%%% Unterstützung für deutsche Sprache und Lokalisierung
\usepackage[ngerman]{babel}

%%% Dieses Paket ist nur für die Demozwecke des Templates:
\usepackage{blindtext}

%%% Ermöglicht erweiterte Kontrolle und Anpassung von Titel und Titelseite
\usepackage{titling}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Ermöglicht die Verwendung von OpenType-Schriften
\usepackage{fontspec}

%%% Schriftarten auswählen und konfigurieren
% Hauptschriftart mit Fallback-Optionen
\IfFontExistsTF{XCharter}{
  \setmainfont{XCharter}               % part of TEX Live
}{
  \IfFontExistsTF{Droid Serif}{
    \setmainfont{Droid Serif}                % part of TEX Live
  }{
    \IfFontExistsTF{EB Garamond}{
      \setmainfont{EB Garamond}           % part of TEX Live
    }{
      \IfFontExistsTF{QTPalatine}{
        \setmainfont{QTPalatine}          % part of TEX Live
      }{
        \setmainfont{Noto Serif}          % part of TEX Live
      }
    }
  }
}

% Serifenlose Schrift mit Fallback-Optionen
\IfFontExistsTF{Fira Sans}{
  \setsansfont{Fira Sans}                 % Not part of TEX Live
}{
  \IfFontExistsTF{Droid Sans}{
    \setsansfont{Droid Sans}              % part of TEX Live
  }{
    \IfFontExistsTF{Lato}{
      \setsansfont{Lato}                  % Not part of TEX Live
    }{
      \setsansfont{Noto Sans}[Scale=0.9]  % part of TEX Live
    }
  }
}

% Monospace-Schrift mit Fallback-Optionen
\IfFontExistsTF{DejaVu Sans Mono}{
  \setmonofont{DejaVu Sans Mono}[Scale=0.9]     % Not part of TEX Live
}{
  \IfFontExistsTF{JetBrains Mono}{
    \setmonofont{JetBrains Mono}[Scale=0.9]     % Not part of TEX Live
  }{
    \IfFontExistsTF{Inconsolata}{
      \setmonofont{Inconsolata}                 % Not part of TEX Live
    }{
      \setmonofont{AnonymousPro}                % part of TEX Live
    }
  }
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% Statt der standardmäßigen Umschaltung bei KOMAscript auf serifenlose
%%% Schrift bei Kapitel-, Sectionüberschriften, etc. lieber Standardschrift
%%% verwenden
%%% disposition:  Überschriften von Kapiteln, Abschnitten, Unterabschnitten
%%% pageheadfoot: Seitenkopf und -fuß
\setkomafont{disposition}{\normalfont}
\setkomafont{pageheadfoot}{\normalfont}
\setkomafont{pagenumber}{\normalfont}
%%% Falls Umschaltung auf serifenlose Schrift gewünscht wäre:
% \setkomafont{disposition}{\sffamily}
% \setkomafont{pageheadfoot}{\sffamily}
% \setkomafont{pagenumber}{\sffamily}

\usepackage[%
  headsepline=0.5pt:0pt,  % Aktiviert eine Linie unter der Kopfzeile
                          % Breite 0.5pt, Abstand zwischen der Kopfzeile und der
                          % Linie 0 Punkt
  automark,               % automatische Markierung von Kopf- und Fußzeilen
  pagestyleset=KOMA-Script,
  markcase=ignoreuppercase  % Text in Kopf- und Fußzeilen wird nicht in
                            % Großbuchstaben umgewandelt
]{scrlayer-scrpage}

\pagestyle{scrheadings}    % Kopf- und Fußzeilen
\clearpairofpagestyles     % Löscht die aktuellen Einstellungen für Kopf- und Fußzeilen
\ohead{\pagemark}          % Äußerer Kopf: Seitenzahl
\ihead{\headmark}          % Innerer Kopf: Kapitelname
\ofoot[]{}                 % Äußerer Fuß: leer
\automark[section]{chapter}% Kopfzeile: [rechts]{links}
\setkomafont{pagehead}{\normalfont} % Schriftart für Kopfzeile
% \setkomafont{pagefoot}{\normalfont} % Schriftart für Fußzeile
\setcounter{secnumdepth}{4}% Gliederungsebenen
\setcounter{tocdepth}{4}   % Gliederungsebenen im Inhaltsverzeichnis


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Formatierung der Kapitelüberschriften
\RedeclareSectionCommand[
  afterindent=false,  % Kein Einzug nach Kapitelüberschrift
  beforeskip=0pt,     % Kein Abstand vor der Kapitelüberschrift
  afterskip=60pt,     % Vertikaler Abstand nach zweiter horizontaler Linie zum Text
  innerskip=-10pt     % Vertikaler Abstand zwischen "Kapitel x" und der ersten horizontalen Linie
]{chapter}

% Definiert das Format für den Titel des Kapitels
\renewcommand*{\chapterformat}{%
  \IfUsePrefixLine{%
    % Wenn eine Präfixzeile verwendet wird:
    % Formatiert den Titel als große, fette Schrift mit Buchstabenabstand
    \textls{\large\bfseries\chapapp\nobreakspace\thechapter\autodot}%
  }{%
    % Wenn keine Präfixzeile verwendet wird:
    % Gibt nur die Kapitelnummer mit Punkt aus und fügt Abstand ein
    \thechapter\autodot\endskip
  }%
}

% Format für Kapitelüberschriften ohne Präfix
\renewcommand*{\chapterlinesformat}[3]{%
  \Ifstr{#1}{chapter}{%
    % Wenn es sich um ein Kapitel handelt:
    % Zeichnet eine Linie über der Kapitelüberschrift
    \rule[.3\baselineskip]{\linewidth}{1pt}\par\nobreak
  }{}%
  % Setzt die Schriftart der Kapitelüberschrift und gibt Nummer und Titel aus
  \usekomafont{chapter}{#2#3}%
  \Ifstr{#1}{chapter}{%
    % Wenn es sich um ein Kapitel handelt:
    % Zeichnet eine Linie unter der Kapitelüberschrift
    \rule[.3\baselineskip]{\linewidth}{1pt}\par\nobreak
  }{}%
}

% Format für Kapitelüberschrift mit Präfix
% #1: Typ des Abschnitts (hier: "chapter")
% #2: Das Präfix des Kapitels (typischerweise die Kapitelnummer)
% #3: Der Haupttext der Kapitelüberschrift
\renewcommand*{\chapterlineswithprefixformat}[3]{%
  \Ifstr{#1}{chapter}{%
    % Wenn es sich um ein Kapitel handelt:
    \centering%
    % Gibt die Kapitelnummer zentriert aus
    #2%
    % Zeichnet eine Linie unter der Kapitelnummer
    \rule[.3\baselineskip]{\linewidth}{1pt}\par\nobreak
    % Zentriert die Kapitelüberschrift
    \raggedchapter\centering
    % Gibt den Haupttext der Kapitelüberschrift aus
    {#3}%
    % Zeichnet eine Linie unter der Kapitelüberschrift
    \rule[.3\baselineskip]{\linewidth}{1pt}\par\nobreak
  }{%
    % Wenn es sich nicht um ein Kapitel handelt:
    % Gibt Präfix und Haupttext ohne spezielle Formatierung aus
    #2#3%
  }%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%% Korrigiert den Weißraum um Auslassungspunkte (...)
\usepackage{ellipsis}

%%% Umbrüche und Mikrotypografie verbessern
\usepackage[
  expansion=true,        % Zeichenweitenanpassung für besseren Blocksatz
  protrusion=true,       % Randausgleich für bessere optische Randausrichtung
  activate={true,nocompatibility}, % Aktiviert Mikrotypografie-Funktionen
  final,                 % Wendet Mikrotypografie-Einstellungen an
  tracking=true          % Aktiviert Buchstabenabstand-Anpassung
]{microtype}


%%% Zeilenabstand leicht erhöhen für bessere Lesbarkeit
\usepackage{setspace}
  \setstretch{1.07}   % Zeilenabstand auf 1,07 erhöhen
  \recalctypearea     % Seitengestaltung nach Änderung des Zeilenabstands neu
                      % berechnen

%%% Schusterjungen vermeiden
%%% (Seitenumbruch direkt nach der ersten Zeile eines neuen Absatzes)
\clubpenalty=10000

%%% Hurenkinder vermeiden
%%% (Letzte Zeile eines Absatzes landet auf neuer Seite)
\widowpenalty=10000
\displaywidowpenalty=10000

\raggedbottom               % Erlaubt variable Seitenlängen
\emergencystretch=1em       % Erlaubt etwas mehr Streckung zur Vermeidung von Überfüllungen
\tolerance=1000             % Erhöht die Toleranz für "schlechte" Zeilenumbrüche
\hbadness=10000             % Unterdrückt Warnungen für "underfull" Boxen


\usepackage{amssymb}  % Für zusätzliche mathematische Symbole wie \bullet und \circ
\usepackage[all, error]{onlyamsmath}  % Erzwingt die Verwendung von amsmath für
                                      % mathematische Umgebungen und zeigt Fehler
                                      % für andere


%%% Beschriftungen für Tabellen und Abbildungen: Typ fett, dahinter kursiv
\usepackage{caption}
\captionsetup{
    labelfont=bf,        % Label (z.B., "Abbildung 3.4:") fett
    textfont=it,         % Text der Beschriftung kursiv
    %font=small           % Größe der Beschriftung
}

%%% Paket für Unterabbildungen und Untertabellen
\usepackage{subcaption}

%%% Für erweiterte Farbfunktionen
\usepackage{xcolor}
\definecolor{hse-dunkelblau}{cmyk}{1,.7,.08,.54}  % HS Esslingen Dunkelblau (100 / 70 / 8 / 54)
\definecolor{hse-rot}{cmyk}{.1,1,.7,0}            % HS Esslingen Rot (10 / 100 / 70 / 0)
\definecolor{hse-hellblau}{cmyk}{.75,.1,.06,0}    % HS Esslingen Hellblau (75 / 10 / 6 / 0)
\definecolor{hse-blau75}{HTML}{8abde2}            % HS Esslingen Blau 75%
\definecolor{hse-blau50}{HTML}{b4d3ed}            % HS Esslingen Blau 50%
\definecolor{hse-blau25}{HTML}{dbe9f7}            % HS Esslingen Blau 25%
\definecolor{hse-blau15}{HTML}{eaf2fa}            % HS Esslingen Blau 15%
\definecolor{hse-hellgrau}{cmyk}{0,0,0,.08}       % HS Esslingen Hellgrau (0 /0 /0 /8)
\definecolor{dunkelgrau}{gray}{0.7}               % Dunkelgrau mit einem Grauwert von 70%
\definecolor{mittelgrau}{gray}{0.9}               % Mittelgrau mit einem Grauwert von 90%
\definecolor{hellgrau}{cmyk}{0,0,0,.08}           % Hellgrau (gleiche Werte wie hse-hellgrau)
\definecolor{dunkelblau}{cmyk}{1,.7,.08,.54}      % Dunkelblau (gleiche Werte wie hse-dunkelblau)
\definecolor{weiss}{cmyk}{0,0,0,0}                % Weiß


%%% Ändert die Nummerierung der Aufzählungselemente im ersten Level
%%% von nummerischen (1, 2, 3, ...) zu alphabetischen (a, b, c, ...)
%\renewcommand{\labelenumi}{(\alph{enumi})}

%%% Aufzählung bei enumerate (1) statt 1.
\def\labelenumi{(\theenumi)}     \def\theenumi{\arabic{enumi}}


%%% TikZ-Paket für fortgeschrittene Zeichenfunktionen und präzise Positionierung
\usepackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{backgrounds}  % Wird bei Titelseite ggf. gebraucht


%%% Einbinden von Grafiken
\usepackage{graphicx}
  % Pfade angeben, an denen sich die Abbildungen finden lassen
  \graphicspath{{figures/}}
  \DeclareGraphicsExtensions{.pdf,.jpeg,.png}


%%% Nutzung von Tabellen
\usepackage{tabularray}
\UseTblrLibrary{booktabs, color}
  \setlength{\aboverulesep}{0pt} % Abstand oberhalb der horizontalen Linien
  \setlength{\belowrulesep}{0pt} % Abstand unterhalb der horizontalen Linien
% Definiere leere Templates für die Kopfzeilen der ersten, mittleren und letzten
% Seiten der Tabelle
\DefTblrTemplate{firsthead, middlehead,lasthead}{default}{}
% Definieren der deutschen Übersetzungen
\DefTblrTemplate{contfoot-text}{default}{Fortsetzung auf der nächsten Seite}
\DefTblrTemplate{conthead-text}{default}{Fortsetzung von der vorherigen Seite}


%%% URL-Umbrüche anpassen
\usepackage{url}
\def\UrlBreaks{\do\/\do-}


%%% Möglichkeiten für ToDo-Notizen
\usepackage[
    ngerman,
    textcolor=weiss,
    linecolor=hse-rot,
    bordercolor=hse-rot,
    backgroundcolor=hse-rot,
    textsize=small,
]{todonotes}
%%% z.B.:
%%% \todo{Make a cake \ldots}
%%% \todo[inline]{A todonote placed in the text}
%%% \missingfigure{Make a sketch of the structure of a trebuchet.}
%%% \listoftodos


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Nutzung von biblatex und biber als Backend
\usepackage[style=alphabetic, backend=biber]{biblatex}

%%% Bibliographiedateien hinzufügen
\addbibresource{thesis.bib}

%%% Zusätzliche Bibliographie-Optionen
\ExecuteBibliographyOptions{
  giveninits=true,     % Vornamen als Initialen
  maxnames=3,          % Maximale Anzahl der angezeigten Namen vor dem Kürzen mit "et al."
  sorting=nyt          % Sortiert nach Name, Jahr und Titel
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% Um einen Index zu erstellen
%\usepackage{makeidx}
%\makeindex


%%% Falls ein Glossar erstellt werden soll
%\usepackage[toc]{glossaries}
%\makeglossaries


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Hier wird eine eigene "mybox"-Umgebung definiert
%%% Das optionale (erste) Argument kann für einen Titel der Box genutzt werden
%%% Das zweite Argument gibt den Typ an, um ein passendes Symbol zu zeichnen
%%% file: zeichnet ein Dateisystem
%%% console: zeichnet ein Konsolensymbol
% \begin{mybox}[Bildschirmausgabe]{console}
% Kleinstes Element: 2
% \end{mybox}

\usepackage{fontawesome}  % Für die Verwendung von Symbolen
\usepackage{etoolbox}     % Für erweiterte Makroprogrammierung, z.B. \ifstrequal
\usepackage{fancyvrb}     % Für erweiterte Verbatim-Umgebung
\usepackage{tcolorbox}    % Für die Erstellung farbiger Boxen
\tcbuselibrary{breakable} % Ermöglicht Fortsetzen von Inhalten in tcolorbox-Umgebungen über Seitenumbrüche hinweg

%%% Ermöglicht Verwendung bedingter Anweisungen in LaTeX
\usepackage{ifthen}


%%% Das Kommando \highlight{} kann innerhalb einer mybox verwendet werden,
%%% um einzelne Teile in Fettschrift zu drucken
\newcommand\highlight[1]{\textbf{#1}}

\newenvironment{mybox}[2][]{
  \VerbatimEnvironment
  \begin{tcolorbox}[
    breakable,          % Seitenumbrüche erlauben
    colback=hellgrau,
    coltitle=weiss,
    colbacktitle=dunkelgrau,
    colframe=dunkelgrau,
    boxrule=0.9pt,      % Dicke des Rahmens der Box
    boxsep=5pt,         % Abstand zwischen dem Inhalt der Box und ihrem Rahmen
    arc=1pt,            % Radius der Ecken der Box
    fonttitle=\sffamily,
    toptitle=1mm,       % Abstand vom oberen Rand des Titelbereichs zur Titelzeile
    bottomtitle=1mm,    % Abstand vom unteren Rand des Titelbereichs zur Titelzeile
    left=3pt,           % Abstand des Inhalts der Box vom linken Innenrand der Box
    right=3pt,          % Abstand des Inhalts der Box vom rechten Innenrand der Box
    before upper={\begin{BVerbatim}}, % Fügt BVerbatim am Anfang ein
    after upper={\end{BVerbatim}},    % Fügt BVerbatim am Ende ein
    before upper={\DisableQuotes},    % Deaktiviert Guillemets in der Box und berücksichtigt Zeilenumbrüche
    after upper={\EnableQuotes},      % Stellt Guillemets nach der Box wieder her
    title={%
      \ifstrequal{#2}{file}{\faFileTextO\hspace{5mm}}{%
        \ifstrequal{#2}{console}{\faTerminal\hspace{5mm}}{}%
      }#1
    },
  ]
  \begin{Verbatim}[commandchars=\\\{\}]%
    }{
  \end{Verbatim}
  \end{tcolorbox}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\usepackage[
  raiselinks=true,        % Hebt Links an, um sie auf die Höhe der Linie zu
                          % bringen (nützlich für Links in der Fußzeile)
  bookmarks=true,         % Erzeugt Lesezeichen im PDF
  bookmarksopenlevel=0,   % Setzt das Level der Lesezeichen, die im PDF-Viewer
                          % standardmäßig geöffnet sind (0 = root level)
  bookmarksopen=true,     % Öffnet alle Lesezeichen im PDF-Viewer
  bookmarksnumbered=true, % Fügt Nummerierung zu den Lesezeichen hinzu
  hyperindex=true,        % Macht Einträge im Index klickbar
  hypertexnames=false,    % Deaktiviert die Verwendung von TeX-Namen für Links.
                          % Kann helfen, Probleme mit gleichnamigen Links zu
                          % verhindern.
  plainpages=false,       % Verhindert Probleme bei der Seitennummerierung
                          % (wichtig, wenn Text und arabische Seitenzahlen
                          % gemischt sind).
  pdfpagelabels=true,     % Nutzt LaTeX-Seitenlabels für PDF-Seitenlabels
                          % (z.B. römische Ziffern, arabische Zahlen)
  pdfpagelayout=SinglePage, % Setzt das Layout des PDFs auf Einzelseitenansicht
  pdfborder={0 0 0}       % Setzt die Rahmenbreite der Links auf 0,
                          % entfernt also Rahmen um die Links
]{hyperref}

%%% Erstellt Vorschaubilder für PDF-Seiten (Thumbnails)
\usepackage[pdftex]{thumbpdf}

%%% Automatisch "Table of Contents" in die Bookmarks aufnehmen
\usepackage{bookmark}
\bookmark[dest=toc]{\contentsname}


%%% Falls für Code Syntax-Highlighting verwendet werden soll
%%% empfehle ich die Verwendung des minted-Pakets
%%% Dafür ist dann aber auch eine Python-Installation notwendig
\usepackage[setspace=false]{scrhack} % für minted-Paket benötigt
\usepackage{minted}

\setminted[c]{
    bgcolor=hellgrau,
    %fontsize=\small,
    breaklines,
    %linenos,
    style=friendly
}
\setmintedinline{
    bgcolor={},
    %fontsize=\small,
    breaklines,
    style=friendly
}

%%% Paket für einheitliche Zitatstile, 
%%% Nutzung von Guillemets (« ») als deutsche Anführungszeichen
\usepackage[german=guillemets]{csquotes}
\MakeOuterQuote{"}  % Aktiviert " als Anführungszeichen für äußere Zitate