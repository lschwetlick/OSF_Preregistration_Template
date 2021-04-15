
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{prereg}


% set this to "notes_on" in order to the explanations for each point
\def\noteson{notes_off}
\DeclareOption{explanations}{\def\noteson{notes_on}}
\DeclareOption{highlight}{\def\highlight{on}}
%\DeclareOption{onecolumn}{\OptionNotUsed}
\ProcessOptions\relax

%%%%%%%%%%%%%%%
% Packages
%%%%%%%%%%%%%%%
\LoadClass{article}
\usepackage{sectsty}
%\usepackage[scale=0.80]{geometry} % adjust the page margins
\usepackage{geometry}
 \geometry{
 a4paper,
 %210 mm and a length of 297 mm.
 total={160mm,240mm},
 left=25mm,
 top=25mm,
 }
\usepackage{etoolbox}
\usepackage{hyperref}
\usepackage{array}
\usepackage{xcolor}
\usepackage{graphicx}
\usepackage[T1]{fontenc}


%\usepackage{booktabs}
%\usepackage{multirow}

%%%%%%%%%%%%%%%
% Set up
%%%%%%%%%%%%%%%
\renewcommand\normalsize{\fontsize{10pt}{12pt}\selectfont}

%\setlength{\textwidth}{6.5in}
%\setlength{\textheight}{8in}
\setlength{\tabcolsep}{5pt}
\setlength{\parindent}{0pt}
\hfuzz=3pt

\pagenumbering{arabic}  % but no page numbers are printed because:
%\pagestyle{empty}       % this is actually already in the kernel


\usepackage[defaultsans,oldstyle,scale=0.90]{opensans} %% Alternatively
%% use the option 'defaultsans' instead of 'default' to replace the
%% sans serif font only.

% using sectsy package to make the titles sans serif
\sectionfont{\normalfont\LARGE\opensans\underline}
\subsectionfont{\rmfamily}

%%%%%%%%%%%%%%%
% Custom Funtions
%%%%%%%%%%%%%%%


\def\@maketitle{%
  \newpage
  \sffamily
  \null
  \vskip 2em%
  \begin{center}%
  \includegraphics[width=5cm]{osf_black.png}
     \par
    {\large Pre-Registration \par}%
    {\huge \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        {\normalsize \@author}
      \end{tabular}\par}%
    \vskip 1em%
    {\normalsize Version \version, edited \@date}%
  \end{center}%
  \par
  \vskip 1.5em}


%\AtBeginEnvironment{tabular}{\setlength{\parindent}{-5pt}}


\newcounter{example}[section]
\newenvironment{example}[1][]{\refstepcounter{example}\par\medskip
   \textbf{Example~\theexample. #1} \rmfamily}{\medskip}

\hyphenation{required}
\hyphenation{optional}

\def\compareval{notes_on}
\def\comparevalhighlight{on}

\newcounter{question}
\usepackage{setspace}
\newenvironment{question}[3] 
 {  
    \vspace{+5mm}
    \refstepcounter{question}
    
    %\hspace{-6mm}%
    \begin{tabular}{@{}>{\raggedright}p{0.2\textwidth}p{0.78\textwidth}@{}}%
      {\textsf{\textbf{\thequestion.\,\,#1}}} & \ifx\comparevalhighlight\highlight \textcolor{red}{#2}\\ \else #2\\  \fi
    \ifx\compareval\noteson & {\scriptsize \textbf{Note:} #3
        
    }\\ \else  \fi
    \end{tabular}%
    \vspace{+1mm}%
}

%\newcommand*{\cvitem}[3][.25em]{}
%\newcommand*{\cvitem}[3][.25em]{}
% \renewcommand*{\cventry}[7][.25em]{%
%   \cvitem[#1]{#2}{%
%     {\bfseries#3}%
%     \ifthenelse{\equal{#4}{}}{}{, {\slshape#4}}%
%     \ifthenelse{\equal{#5}{}}{}{, #5}%
%     \ifthenelse{\equal{#6}{}}{}{, #6}%
%     .\strut%
%     \ifx&#7&%
%       \else{\newline{}\begin{minipage}[t]{\linewidth}\small#7\end{minipage}}\fi}}