\ProvidesClass{hci-thesis}[2026 Thesis Template]

% =============
% Base class
% =============

\LoadClass[
  12pt,
  a4paper,
  abstract=true,
  bibliography=totoc,
  headings=small
]{scrreprt}

% =============
% Core packages
% =============

\RequirePackage{etoolbox}
\RequirePackage[\thesislang]{babel}

\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
% \RequirePackage{microtype}

\RequirePackage[
    top=2.5cm,
    bottom=2.5cm,
    inner=3cm,
    outer=3cm,
    includehead,
    includefoot,
    headheight=18pt,
    head=24pt,
    foot=24pt
]{geometry}

% =============
% Math
% =============

\RequirePackage{amsmath}
\RequirePackage{amssymb}

% =============
% Figures, tables, captions
% =============

\RequirePackage{graphicx}
\RequirePackage{booktabs}

% =============
% Layout
% =============

\RequirePackage{setspace}

\doublespacing
% \onehalfspacing


% =============
% Lists
% =============

\RequirePackage{enumitem}
\setlist[itemize]{noitemsep}
\setlist[enumerate]{noitemsep}

% =============
% Page style
% =============

\RequirePackage[automark, singlespacing=true]{scrlayer-scrpage}

\clearpairofpagestyles
\automark[chapter]{chapter}

\ohead{\headmark}
\cfoot{\pagemark}
\ihead{}

\pagestyle{scrheadings}
\renewcommand*{\chapterpagestyle}{scrheadings}

% =============
% Code listings
% =============

\RequirePackage{fancyvrb}
\RequirePackage{float}
\RequirePackage{xcolor}
\definecolor{codebg}{rgb}{0.97,0.97,0.97}

\newfloat{listing}{H}{lop}  

\DefineVerbatimEnvironment{code}{Verbatim}{
    frame=single,
    fontsize=\small,
    numbers=left,
    numbersep=5pt,
    xleftmargin=5pt,
    fillcolor=\color{codebg}
}

% =============
% Bibliography
% =============

\RequirePackage{csquotes}

\RequirePackage[
  backend=bibtex,
  style=authoryear,
  natbib=true,
  maxcitenames=2,
  maxbibnames=99,
  giveninits=true,
  uniquename=init
]{biblatex}

% everything should be cited with "et al."
\DefineBibliographyStrings{ngerman}{andothers={et\addabbrvspace al\adddot}}

\let\oldcite\cite
\renewcommand{\cite}[2][]{%
  \ifstrempty{#1}{\citep{#2}}{\citep[#1]{#2}}%
}

% =============
% Hyperlinks and references
% =============

\RequirePackage[hidelinks]{hyperref}


% =============
% Checkboxes
% =============
\usepackage{pifont}

\newcommand{\checkboxUnchecked}{%
  \makebox[1.5em][c]{$\square$}%
}

\newcommand{\checkboxChecked}{%
  \makebox[1.5em][c]{%
    \ooalign{%
      $\square$\cr
      \hfil\raisebox{0.05ex}{\ding{53}}\hfil\cr
    }
  }
}


% =============
% Thesis type
% =============

\newif\ifmaster

\ifdefstring{\thesislevel}{master}
  {\mastertrue}
  {\masterfalse}

\ifmaster
    \ifdefstring{\thesislang}{ngerman}{
        \newcommand{\thesistype}{Masterarbeit Medieninformatik}
    }{
        \newcommand{\thesistype}{Master Thesis Media Informatics}
    }
\else
    \ifdefstring{\thesislang}{ngerman}{
        \newcommand{\thesistype}{Bachelorarbeit Medieninformatik}
    }{
        \newcommand{\thesistype}{Bachelor Thesis Media Informatics}
    }
\fi

% =============
% Language labels
% =============

\newcommand{\setthesislabels}{
\ifdefstring{\thesislang}{ngerman}{

    \def\labeluniversity{Universität Tübingen}
    \def\labelfaculty{Mathematisch-Naturwissenschaftliche Fakultät}
    \def\labelinstitute{Fachbereich für Informatik}
    \def\labelreviewers{Gutachter}
    \def\labelsup{Betreuung}
    \def\labelperiod{Arbeitszeitraum}

    \floatname{listing}{Codebeispiel}
}{

    \def\labeluniversity{University of Tübingen}
    \def\labelfaculty{Faculty of Science}
    \def\labelinstitute{Department of Computer Science}
    \def\labelreviewers{Reviewers}
    \def\labelsup{Supervision}
    \def\labelperiod{Thesis period}

    \floatname{listing}{Code Example}
}
}

% =============
% Front matter / main matter
% =============

\newcommand{\frontmattermode}{
  \clearpairofpagestyles
  \pagestyle{empty}
}

\newcommand{\mainmattermode}{
  \clearpairofpagestyles
  \automark[chapter]{chapter}
  \ohead{\headmark}
  \cfoot{\pagemark}
  \ihead{}
  \pagestyle{scrheadings}
}

% =============
% Title page
% =============

\newcommand{\makethesistitle}{

\setthesislabels
\thispagestyle{empty}

\begin{titlepage}
\begin{center}
\begin{singlespace}

{\LARGE \labeluniversity}\\[0.1cm]

{\large \labelfaculty\\ \labelinstitute\\[2cm]}

{\large \thesistype\\[1.5cm]}

{\Huge \bfseries \thesistitle\\[1.2cm]}

{\large \thesisauthorfirst\ \thesisauthorlast}\\[0.3cm]

\thesisend\\[1.8cm]

{\small \bfseries \labelreviewers}\\[0.3cm]

\ifmaster
\parbox{7cm}{
\begin{center}
\revieweronename\\
(\revieweronefield)\\[0.5em]
{\footnotesize \revieweroneinstitute}\\
{\footnotesize \revieweroneuniversity}
\end{center}
}
\hfill
\parbox{7cm}{
\begin{center}
\reviewertwoname\\
(\reviewertwofield)\\[0.5em]
{\footnotesize \reviewertwoinstitute}\\
{\footnotesize \reviewertwouniversity}
\end{center}
}\\[0.5cm]
\else
\parbox{7cm}{
\begin{center}
\revieweronename\\
(\revieweronefield)\\[0.5em]
{\footnotesize \revieweroneinstitute}\\
{\footnotesize \revieweroneuniversity}
\end{center}
}\\[0.5cm]
\fi

{\small \bfseries \labelsup}\\[0.2cm]

\supervisorname\\
{\footnotesize \supervisorinstitute}

\end{singlespace}
\end{center}
\end{titlepage}

% =============
% Second title page
% =============

\clearpage
\thispagestyle{empty}

\begin{singlespace}

\vspace*{\fill}

\noindent
\begin{minipage}{11.2cm}
\textbf{\thesisauthorlast, \thesisauthorfirst}\\
\thesisauthormatrikulationnumber\\
\textit{\thesistitle}\\
\thesistype\\
\labeluniversity\\
\labelperiod: \thesisstart{} -- \thesisend
\end{minipage}

\vspace*{1cm}

\end{singlespace}
\clearpage
}