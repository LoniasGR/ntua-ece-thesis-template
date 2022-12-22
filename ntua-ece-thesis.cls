%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Filename: ntua-ece-thesis.cls
%% Description: NTUA ECE Thesis class - simplified
%%
%% Sections:
%% - Control Flow
%% - Class info
%% - Page sizes
%% - Langauges
%% - Images
%% - Links
%% - Text control
%% - Page numbers
%% - Math
%% - Bibliography
%% - Arguments
%% - Title page
%% - Blank page
%% - Examination page
%% - Copyright page
%%
%%
%% Class arguments:
%% - LICENCE: "crerativecommons" (default) or "nonprofituse"
%%      -"creativecommons" = CC licence
%%      -"nonprofituse"    = Only non-profit use allowed
%%
%% - Bibliography Style: "apa" or "ieee" (default)
%%      - "apa"     = "APA style references"
%%      - "ieee"    = "IEEE style references"
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Class info
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}

% Class Information
\newcommand\filename{ntua-ece-thesis}
\newcommand\fileversion{1.0}
\newcommand\filedate{2022/12/20}
\ProvidesClass{ntua-ece-thesis}[\filedate\space v\fileversion\space NTUA ECE Thesis class.]

% Defining creativecommons as 0 and non-profit license as 1
\newcommand{\@license}{0}
\DeclareOption{noprofituse}{\renewcommand{\@license}{1}}
\DeclareOption{creativecommons}{\renewcommand{\@license}{0}}

% Defining bibliography style
\newcommand{\@bibstyle}{apa}
\DeclareOption{apa}{\renewcommand{\@bibstyle}{apa}}
\DeclareOption{ieee}{\renewcommand{\@bibstyle}{ieee}}
\ProcessOptions\relax


\LoadClass[12pt, twoside, a4paper]{report}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Control Flow
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{etoolbox} % ifdefempty

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Page sizes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[a4paper, total={15cm, 20cm}]{geometry}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Languages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[LGR, T1]{fontenc} % Set the font (output) encodings
\RequirePackage[greek, english]{babel} % Greek and english
\RequirePackage{alphabeta}

% typeset short english phrases
\newcommand{\en}[1]{\foreignlanguage{english}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{graphicx} % Package for images

% Set the \pyrforos command to return the image.
\newcommand{\pyrforos}{logo/pyrforos.eps}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Links
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    filecolor=magenta,
    urlcolor=blue,
    pdftitle={\@title},
}

\urlstyle{same}

\NewCommandCopy{\oldurl}{\url}
\renewcommand{\url}[1]{\en{\oldurl{#1}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Text control
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[document]{ragged2e}
\RequirePackage{parskip}
\RequirePackage{csquotes}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Page numbers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Use Arabic numerals (1, 2, 3, etc.) for all pages.The title page counts as page 1.
\pagenumbering{arabic}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Math
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{amsmath}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bibliography
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage[
    backend=biber,    % Default liblatex backend
    style=\@bibstyle, % Depending on the cls parameters
    sorting=ynt,       % Year Name Title sorting
    autolang=other    % Use babel for language selection on bibliography
]{biblatex}

\addbibresource{thesis.bib}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Arguments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Implementation from:
% https://stackoverflow.com/questions/2833954/how-do-i-create-a-command-like-title-in-latex

% School sector
\newcommand\thesissector[1]{\renewcommand\@thesissector{#1}}
\newcommand\@thesissector{\ClassError{ntua-ece-thesis}{No \noexpand\thesissector given}}

% Lab of the sector (optional)
\newcommand\thesislab[1]{\renewcommand\@thesislab{#1}}
\newcommand\@thesislab{}

% Pronoun of the author
\newcommand\thesisauthorpronoun[1]{\renewcommand\@thesisauthorpronoun{#1}}
\newcommand\@thesisauthorpronoun{\ClassError{ntua-ece-thesis}{No \noexpand\thesisauthorpronoun given}}

% Genetive of the authors name
\newcommand\authorgenitive[1]{\renewcommand\@authorgenitive{#1}}
\newcommand\@authorgenitive{\ClassError{ntua-ece-thesis}{No \noexpand\authorgenitive given}}



% Name of the supervisor
\newcommand\thesissupervisorname[1]{\renewcommand\@thesissupervisorname{#1}}
\newcommand\@thesissupervisorname{\ClassError{ntua-ece-thesis}{No \noexpand\thesissupervisorname given}}

% Title of the supervisor
\newcommand\thesissupervisortitle[1]{\renewcommand\@thesissupervisortitle{#1}}
\newcommand\@thesissupervisortitle{\ClassError{ntua-ece-thesis}{No \noexpand\thesissupervisortitle given}}

% Date of submission
\newcommand\thesissubmissiondate[1]{\renewcommand\@thesissubmissiondate{#1}}
\newcommand\@thesissubmissiondate{\ClassError{ntua-ece-thesis}{No \noexpand\thesissubmissiondate given}}

% Year of submission
\newcommand\submissionyear[1]{\renewcommand\@submissionyear{#1}}
\newcommand\@submissionyear{\ClassError{ntua-ece-thesis}{No \noexpand\submissionyear given}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Title Page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\maketitle}%
{
    \begin{titlepage}
        % Set the pagestyle to "empty"
        \thispagestyle{empty}
        \begin{center}
            \includegraphics[width=2.5cm]{\pyrforos}\\
            \Large{Ε}\large{ΘΝΙΚΟ}
            \Large{Μ}\large{ΕΤΣΟΒΙΟ}
            \Large{Π}\large{ΟΛΥΤΕΧΝΕΙΟ} \\
            \normalsize{Σ}\small{ΧΟΛΗ}
            \normalsize{Η}\small{ΛΕΚΤΡΟΛΟΓΩΝ}
            \normalsize{Μ}\small{ΗΧΑΝΙΚΩΝ}
            \normalsize{Κ}\small{ΑΙ}
            \normalsize{Μ}\small{ΗΧΑΝΙΚΩΝ}
            \normalsize{Υ}\small{ΥΠΟΛΟΓΙΣΤΩΝ} \\
            \@thesissector \\
            % If lab is not defined don't show anything, else show the lab.
            \ifdefempty{\@thesislab}{}{\@thesislab \\}
            \vspace{8ex}
            \large \textbf{\@title} \\
            \vspace{10ex}
            \large
            ΔΙΠΛΩΜΑΤΙΚΗ ΕΡΓΑΣΙΑ \\
            \vspace{2ex}
            \normalsize
            \@thesisauthorpronoun \\
            \vspace{2ex}
            \parbox[c]{0.5\textwidth}{\center\textbf{\@authorgenitive}}
            \vspace{10ex}
        \end{center}
        \begin{tabbing}
            \textbf{Επιβλέπων}: \= \@thesissupervisorname \\
            \> \@thesissupervisortitle
        \end{tabbing}
        \vspace{2ex}
        \begin{center}
            \@date
        \end{center}
    \end{titlepage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Blank Page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Code from:
% https://tex.stackexchange.com/questions/36880/insert-a-blank-page-after-current-page

\newcommand{\blankpagecount}{%
    \clearpage%
    \thispagestyle{empty}%
    \null%
    \clearpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Examination Page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Defence date
\newcommand\thesisdefencedate[1]{\renewcommand\@thesisdefencedate{#1}}
\newcommand\@thesisdefencedate{\ClassError{ntua-ece-thesis}{No \noexpand\thesisdefencedate given}}

% First examiner name
\newcommand\firstexaminername[1]{\renewcommand\@firstexaminername{#1}}
\newcommand\@firstexaminername{\ClassError{ntua-ece-thesis}{No \noexpand\firstexaminername given}}

% First examiner title
\newcommand\firstexaminertitle[1]{\renewcommand\@firstexaminertitle{#1}}
\newcommand\@firstexaminertitle{\ClassError{ntua-ece-thesis}{No \noexpand\firstexaminertitle given}}

% Second examiner name
\newcommand\secondexaminername[1]{\renewcommand\@secondexaminername{#1}}
\newcommand\@secondexaminername{\ClassError{ntua-ece-thesis}{No \noexpand\secondexaminername given}}

% Second examiner title
\newcommand\secondexaminertitle[1]{\renewcommand\@secondexaminertitle{#1}}
\newcommand\@secondexaminertitle{\ClassError{ntua-ece-thesis}{No \noexpand\secondexaminertitle{} given}}

% Third examiner name
\newcommand\thirdexaminername[1]{\renewcommand\@thirdexaminername{#1}}
\newcommand\@thirdexaminername{\ClassError{ntua-ece-thesis}{No \noexpand\thirdexaminername given}}

% Third examiner title
\newcommand\thirdexaminertitle[1]{\renewcommand\@thirdexaminertitle{#1}}
\newcommand\@thirdexaminertitle{\ClassError{ntua-ece-thesis}{No \noexpand\thirdexaminertitle given}}

\newcommand{\examinationpage}{%
    \thispagestyle{empty}

    \begin{center}
    \begin{minipage}{0.2\textwidth}
        \includegraphics[width=2.5cm]{\pyrforos}
    \end{minipage}%
    %
    \begin{minipage}{0.6\textwidth}
        \textbf{%
            \normalsize{Ε}\small{ΘΝΙΚΟ}
            \normalsize{Μ}\small{ΕΤΣΟΒΙΟ}
            \normalsize{Π}\small{ΟΛΥΤΕΧΝΕΙΟ}} \\
        \small
        ΤΜΗΜΑ ΗΛΕΚΤΡΟΛΟΓΩΝ ΜΗΧΑΝΙΚΩΝ ΚΑΙ \\
        ΜΗΧΑΝΙΚΩΝ ΥΠΟΛΟΓΙΣΤΩΝ \\
        \@thesissector \\
        % If lab is not defined don't show anything, else show the lab.
        \ifdefempty{\@thesislab}{}{\@thesislab \\}
    \end{minipage}

        \vspace{8ex}
        \large \textbf{\@title} \\
        \vspace{10ex}
        \large
        ΔΙΠΛΩΜΑΤΙΚΗ ΕΡΓΑΣΙΑ \\
        \vspace{2ex}
        \normalsize
        \@thesisauthorpronoun \\
        \vspace{2ex}
        \parbox[c]{0.5\textwidth} { \center\textbf{\@authorgenitive}}
        \vspace{10ex}
        \begin{tabbing}
            \textbf{Επιβλέπων}: \= \@thesissupervisorname \\
            \> \@thesissupervisortitle
        \end{tabbing}
    \end{center}

    \vspace{2ex}
    Εγκρίθηκε από την τριμελή εξεταστική επιτροπή την \@thesisdefencedate.
    \vspace{6ex}
    \begin{center}
        \scriptsize
        \parbox[b]{0.3\textwidth} {\center
            ........................................
            \@firstexaminername\\
            \@firstexaminertitle
        }
        \parbox[b]{0.3\textwidth} {\center
            ........................................
            \@secondexaminername\\
            \@secondexaminertitle
        }
        \parbox[b]{0.3\textwidth} {\center
            ........................................
            \@thirdexaminername\\
            \@thirdexaminertitle
        }
    \end{center}
    \vspace{10ex}
    \normalsize\center\@date.
    \newpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Copyrights Page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\@creativecommons}{%
Η Εργασία διατίθεται με άδεια \en{Creative Commons} Αναφορά Δημιουργού 4.0 Διεθνές.
Για να δείτε ένα αντίγραφο αυτής της άδειας, επισκεφθείτε το \url{http://creativecommons.org/licenses/by/4.0/}
ή στείλετε επιστολή στο \en{Creative Commons,PO Box 1866, Mountain View, CA 94042, USA.}
}

\newcommand{\@nonprofituse}{%
Απαγορεύεται η αντιγραφή, αποθήκευση και διανομή της παρούσας Εργασίας,
εξ ολοκλήρου ή τμήματος αυτής, για εμπορικό σκοπό. Επιτρέπεται η ανατύπωση,
αποθήκευση και διανομή για σκοπό μη κερδοσκοπικό, εκπαιδευτικής ή
ερευνητικής φύσης, υπό την προϋπόθεση να αναφέρεται η πηγή προέλευσης και
να διατηρείται το παρόν μήνυμα. Ερωτήματα που αφορούν τη χρήση της Εργασίας
για κερδοσκοπικό σκοπό πρέπει να απευθύνονται προς τον συγγραφέα.


}

\newcommand{\copyrightspage}{%
    \thispagestyle{empty}

    \vspace*{40ex}
    \begin{FlushLeft}
    \
    ................................... \\
    \textbf{\@author} \\
    Διπλωματούχος Ηλεκτρολόγος Μηχανικός και Μηχανικός Υπολογιστών Ε.Μ.Π. \\
    \end{FlushLeft}
    \vspace{30ex}
    \small
    \copyright \hspace{0.5em} \@author, \@submissionyear.\\
    \vspace{5ex}
    \begin{justify}
    \ifnum \@license=0
        \noindent \@creativecommons

    \else
        \noindent \@nonprofituse
    \fi
    \end{justify}

    \begin{justify}
        \noindent
        Οι απόψεις και τα συμπεράσματα που περιέχονται σε αυτό το έγγραφο εκφράζουν
        τον συγγραφέα και δεν πρέπει να ερμηνευθεί ότι αντιπροσωπεύουν τις επίσημες θέσεις του
        Εθνικού Μετσόβιου Πολυτεχνείου.
    \end{justify}
}
