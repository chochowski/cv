\ProvidesClass{mchcv}[2016/10/13 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
\RequirePackage{graphicx}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{1C1C1C}
\definecolor{maingray}{HTML}{B9B9B9}

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\renewcommand{\bfseries}{\color{gray}} % Make \textbf produce coloured text instead

\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation

\newfontfamily\bodyfont[]{Roboto}
\newfontfamily\thinfont[]{Roboto Light}
\newfontfamily\headingfont[]{Raleway}

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\sidewidth
\setlength{\sidewidth}{6cm}

\newcommand{\profilesection}[1]{\vspace{10pt}{\begin{center} \color{white} \Large \thinfont{#1}\end{center}}\vspace{10pt}}

\newcommand{\sidelineseparator}[1]{\vspace{8pt}{\begin{center} \rule[0.15\baselineskip]{#1}{1pt}\end{center}}}

\newcommand{\lineseparator}[1]{\vspace{8pt}{\begin{center} \color{gray}\rule[0.15\baselineskip]{#1}{1pt}\end{center}}\vspace{8pt}}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}

\newcommand{\contactelement}[2]{\color{white}#1\\\color{gray}#2\\\vspace{5pt}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}

% Command for printing skill progress bars
\newcommand\skills[1]{ 
	\renewcommand{\skills}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
				\draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.4);
				\node [above right] at (0,\i+0.4) {\x};
			}
		\end{tikzpicture}
	}
}

% Command for printing skills text
\newcommand\skillstext[1]{ 
	\renewcommand{\skillstext}{
		\begin{flushleft}
			\foreach [count=\i] \x/\y in {#1}{ 
				\x$ \star $\y
			}
		\end{flushleft}
	}
}

%----------------------------------------------------------------------------------------
%	 SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
	\begin{tikzpicture}[remember picture,overlay]
	    \node[rectangle, fill=sidecolor, anchor=north west, minimum width=\sidewidth, minimum height=1.5cm, xshift=1cm] at (current page.north west) {};
	    \node[rectangle, fill=white, anchor=north west, text width=11cm, minimum height=3.5cm, align=left, xshift=1cm, yshift=-1.5cm] at (current page.north west) {\fontsize{10mm}{11mm}\headingfont{\cvname}\\ \vspace{0.5cm}\fontsize{5mm}{6mm}\thinfont{\cvjobtitle}};
	    \node[rectangle, fill=sidecolor, anchor=north west, minimum width=\sidewidth, minimum height=\paperheight-7cm, xshift=1cm, yshift=-6cm] at (current page.north west) {};
		\node[anchor=north west, inner sep=0pt, outer sep=0pt, minimum width=\sidewidth, xshift=1cm, yshift=-5cm] at (current page.north west) {\includegraphics[width=\sidewidth]{\profilepic}};
	\end{tikzpicture}

	%------------------------------------------------

	\begin{textblock}{5}(1.5, 10)
	\color{white}		
		%------------------------------------------------
		
%		\begin{center}
%			\begin{tikzpicture}
%				\node[anchor=north west, inner sep=0pt, outer sep=0pt, minimum width=\sidewidth] at (0,0) {\includegraphics[width=\sidewidth]{\profilepic}};
%			\end{tikzpicture}
%		\end{center}

		%------------------------------------------------

		\profilesection{ABOUT ME}
			
		\begin{flushleft}
%			\begingroup
%			\leftskip0.5cm
%			\rightskip\leftskip
			\bodyfont
			\aboutme
%			\par
%			\endgroup
		\end{flushleft}
		
		\sidelineseparator{4.8cm}
		%------------------------------------------------

		\profilesection{CONTACT ME}
			
		\begin{flushleft}
%			\begingroup
%			\leftskip0.5cm
%			\rightskip\leftskip
			\bodyfont
			\contactelement{Phone}{\cvnumberphone}
			\contactelement{Address}{\cvaddress}
			\contactelement{Email}{\cvmail}
			\contactelement{Website}{\cvsite}
%			\par
%			\endgroup
		\end{flushleft}
		
		%------------------------------------------------
%		\sidelineseparator

%		\profilesection{Skills}{0cm}
%
%		\skills
%		\skillstext
%		\scriptsize
%		(*)[The skill scale is from 0 (Fundamental Awareness) to 6 (Expert).]
			
		%------------------------------------------------
			
	\end{textblock}
}


\renewcommand{\section}[1]{
	{%
		\color{black}%
		\vspace{1pt}%
		\Large\bodyfont{#1}%
		\vspace{1pt}%
	}
}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\bodyfont%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitem}[4]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{#2}%
		\hfill%
		{\footnotesize#3}\\%
		#4\vspace{\parsep}%
	}\\
}

%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{#2}%
	}\\
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=7.6cm,top=0.1cm,right=1cm,bottom=0.2cm,nohead,nofoot]{geometry}

\RequirePackage{hyperref}
