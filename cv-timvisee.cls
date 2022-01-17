%%%%%%%%%%
% Tim Visée's CV theme.
% Forked from Friggeri's CV theme.
%%%%%%%%%%

\ProvidesClass{cv-timvisee}[CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
% \RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

% \newfontfamily\bodyfont[]{Helvetica Neue}
% \newfontfamily\thinfont[]{Helvetica Neue UltraLight}
% \newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}
\newfontfamily\bodyfont[]{Ubuntu Bold}
\newfontfamily\thinfont[]{Ubuntu Light}
\newfontfamily\headingfont[]{Ubuntu Mono Bold}

\defaultfontfeatures{Mapping=tex-text}
% \setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica Neue Light}
\setmainfont[Mapping=tex-text, Color=textcolor]{Ubuntu}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=2cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{24pt}{24pt}\color{header}%
      {\bodyfont #1}\thinfont{~~ \textperiodcentered{} ~~#2~~ \textperiodcentered{} ~~#3}
    };
  \end{tikzpicture}
  \vspace{0.3cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
        brown\or%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
        brown\else%
        headercolor\fi%
    } #1%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{0.5\parskip}
  {%
    \Large\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par%\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #1}
  \par\vspace{.25\parskip}%
}

\renewcommand{\subsubsection}[2]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #2}
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{0.8\parsep}%
  }\\}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{4.4}(0.5, 1.95)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[book]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{book}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}


\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

% \DeclareNameFormat{author}{%
%   \small\addfontfeature{Color=lightgray}%
%   \ifblank{#3}{}{#3\space}#1%
%   \ifthenelse{\value{listcount}<\value{liststop}}
%     {\addcomma\space}
%     {}%
% }

\defbibheading{bibheading}[\bibname]{%   \subsubsection*{#1}   \markboth{#1}{#1}
}

\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \nocite{*}
    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=bibheading]
  \end{refsection}
}

\DeclareSortingScheme{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=5.6cm,top=2cm,right=1.0cm,bottom=1.0cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=false,
    linkcolor=red,
    citecolor=red,
    filecolor=red,
    urlcolor = red}

% A fix for \href{}{} colors not working with fontspec
\makeatletter
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=#1}}
\makeatother
