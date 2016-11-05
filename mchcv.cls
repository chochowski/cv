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
\RequirePackage{titlesec}

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

%\newfontfamily\bodyfont[]{Roboto}
%\newfontfamily\thinfont[]{Roboto Light}
%\newfontfamily\headingfont[]{Raleway}

\newfontfamily\bodyfont[]{Lato}
\newfontfamily\thinfont[]{Lato Light}
\newfontfamily\headingfont[]{Raleway}
\newfontfamily\sidefont[]{Open Sans}
\newfontfamily\sectiontitlefont[]{Open Sans Semibold}

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\sidewidth
\setlength{\sidewidth}{6cm}

\newcommand{\sidesection}[1]{\vspace{10pt}{\begin{center} \color{white} \Large \thinfont{#1}\end{center}}\vspace{10pt}}

\newcommand{\sidelineseparator}[1]{\vspace{8pt}{\begin{center} \rule[0.15\baselineskip]{#1}{0.5pt}\end{center}}}

\newcommand{\lineseparator}{\vspace{8pt}\noindent{\color{maingray}\rule[0.5ex]{\linewidth}{1pt}}}

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

\newcommand{\contactelement}[2]{\color{white}\thinfont{#1}\\\color{gray}\bodyfont{#2}\\\vspace{5pt}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}

% Command for printing skill progress bars
%\newcommand\skills[1]{ 
%	\renewcommand{\skills}{
%		\begin{tikzpicture}
%			\foreach [count=\i] \x/\y in {#1}{
%				\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
%				\draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.4);
%				\node [above right] at (0,\i+0.4) {\x};
%			}
%		\end{tikzpicture}
%	}
%}
\newcommand\skills[2]{ 
	\begin{tikzpicture}[style={text width=1.5cm}]
	%	\node[left] at (0,0) {PROFESSIONAL SKILLS}
		\foreach [count=\i] \x/\y in {#1}{
			\draw[fill=maingray,maingray] (0,\i*0.5) rectangle (4,\i*0.5+0.2);
			\draw[fill=white,gray](0,\i*0.5) rectangle (\y,\i*0.5+0.2);
			\node [left] at (0,\i*0.5+0.1) {\x};
		}
		\foreach [count=\i] \x/\y in {#2}{
			\draw[fill=maingray,maingray] (6,\i*0.5) rectangle (10,\i*0.5+0.2);
			\draw[fill=white,gray](6,\i*0.5) rectangle (6+\y,\i*0.5+0.2);
			\node [left] at (6,\i*0.5+0.1) {\x};
		}
	\end{tikzpicture}
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
		
		\sidesection{ABOUT ME}
			
%		\begin{justify}
		\sidefont \parbox{\linewidth}{\aboutme}
%		\end{justify}
		
		\sidelineseparator{4.8cm}
		%------------------------------------------------

		\sidesection{CONTACT ME}
			
		\begin{flushleft}
			\bodyfont
			\contactelement{Phone}{\cvnumberphone}
			\contactelement{Address}{\cvaddress}
			\contactelement{Email}{\cvmail}
			\contactelement{Website}{\cvsite}
		\end{flushleft}
		
		%------------------------------------------------
%		\sidelineseparator

%		\sidesection{Skills}{0cm}
%
%		\skills
%		\skillstext
%		\scriptsize
%		(*)[The skill scale is from 0 (Fundamental Awareness) to 6 (Expert).]
			
		%------------------------------------------------
			
	\end{textblock}
}

\titleformat{\section}         % Customise the \section command 
  {\color{black}\large\scshape\raggedright\sectiontitlefont} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  []
\titlespacing*{\section}{0pt}{0pt}{0pt}
%\renewcommand{\section}[1]{
%	{%
%		\color{black}%
%		\vspace{1pt}%
%		\large\sectiontitlefont{#1}%
%		\vspace{1pt}%
%	}
%}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}%
	\bodyfont%
}{%
	\end{tabular*}
}

\newcommand{\twentyitem}[4]{%
	\sectiontitlefont{#1}&\parbox[t]{0.83\textwidth}{%
		\headingfont{#2}\\%
		\sectiontitlefont{#3}\\%
		\color{gray}\bodyfont{#4}\vspace{\parsep}%
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
