\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gbt7713topic}[2026/08/21 v1.0 GB/T 7713.3-2014 topic report template]

\RequirePackage{iftex}
\ifXeTeX\else
  \ClassError{gbt7713topic}{This class requires XeLaTeX}{Select XeLaTeX as the compiler.}
\fi

\LoadClass[UTF8,a4paper,zihao=5,twoside,openright,fontset=none]{ctexbook}

\RequirePackage{geometry}
\geometry{inner=30mm,outer=25mm,top=25mm,bottom=25mm,headheight=14pt}
\RequirePackage{fontspec}
\IfFontExistsTF{Times New Roman}
  {\setmainfont{Times New Roman}}
  {\setmainfont{TeX Gyre Termes}}
\IfFontExistsTF{SimSun}{%
  \setCJKmainfont[AutoFakeBold=2.0]{SimSun}
  \setCJKfamilyfont{zhsong}[AutoFakeBold=2.0]{SimSun}
  \setCJKmonofont{SimSun}
}{%
  \setCJKmainfont[BoldFont=FandolSong-Bold.otf]{FandolSong-Regular.otf}
  \setCJKfamilyfont{zhsong}[BoldFont=FandolSong-Bold.otf]{FandolSong-Regular.otf}
  \setCJKmonofont{FandolFang-Regular.otf}
}
\IfFontExistsTF{SimHei}{%
  \setCJKsansfont{SimHei}
  \setCJKfamilyfont{zhhei}{SimHei}
}{%
  \setCJKsansfont{FandolHei-Regular.otf}
  \setCJKfamilyfont{zhhei}{FandolHei-Regular.otf}
}

\RequirePackage{setspace}
\setstretch{1.45}
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}
\RequirePackage{indentfirst}

\RequirePackage{amsmath,amssymb}
\RequirePackage{graphicx}
\RequirePackage{booktabs,longtable,tabularx,array,multirow}
\RequirePackage{enumitem}
\setlist{nosep,leftmargin=2em}
\RequirePackage[numbers,sort&compress]{natbib}
\RequirePackage{caption}
\DeclareCaptionFont{reportcaption}{\zihao{5}\heiti}
\captionsetup{font=reportcaption,labelsep=quad,justification=centering}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage{fancyhdr}
\RequirePackage{etoolbox}
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\hypersetup{
  unicode=true,
  colorlinks=false,
  pdfborder={0 0 0},
  bookmarksnumbered=true,
  bookmarksopen=true
}

% The standard's informative Appendix E uses No. 5 bold type for all numbered
% headings. Oversized book-style chapter headings are therefore intentionally
% disabled.
\titleformat{\chapter}[hang]{\heiti\zihao{5}}{\thechapter}{1em}{}
\titlespacing*{\chapter}{0pt}{0pt}{0.8\baselineskip}
\titleformat{\section}[hang]{\heiti\zihao{5}}{\thesection}{1em}{}
\titlespacing*{\section}{0pt}{1.0\baselineskip}{0.35\baselineskip}
\titleformat{\subsection}[hang]{\heiti\zihao{5}}{\thesubsection}{1em}{}
\titlespacing*{\subsection}{0pt}{0.8\baselineskip}{0.25\baselineskip}
\titleformat{\subsubsection}[hang]{\heiti\zihao{5}}{\thesubsubsection}{1em}{}
\titlespacing*{\subsubsection}{0pt}{0.6\baselineskip}{0.2\baselineskip}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\ctexset{chapter={name={,},number=\arabic{chapter}}}

% Appendix E specifies No. 5 Song type for the contents entries.
\renewcommand{\cftchapfont}{\songti\zihao{5}\mdseries}
\renewcommand{\cftchappagefont}{\songti\zihao{5}\mdseries}
\renewcommand{\cftsecfont}{\songti\zihao{5}\mdseries}
\renewcommand{\cftsecpagefont}{\songti\zihao{5}\mdseries}
\renewcommand{\cftsubsecfont}{\songti\zihao{5}\mdseries}
\renewcommand{\cftsubsecpagefont}{\songti\zihao{5}\mdseries}

% Chapter-based numbering is permitted by 5.2.3 and remains consistent
% throughout the main text.
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}

\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\zihao{-5}\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyfoot[C]{\zihao{-5}\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\makeatletter

% Metadata storage. All fields have visible placeholders so omissions are easy
% to spot before submission.
\def\report@number{【科技报告编号】}
\def\report@security{公开}
\def\report@securityterm{}
\def\report@issuedate{【制发日期】}
\def\report@title{【专题科技报告题名】}
\def\report@englishtitle{Title of the Scientific and Technical Report}
\def\report@volume{}
\def\report@englishvolume{}
\def\report@author{【作者】}
\def\report@institution{【作者单位】}
\def\report@completiondate{【YYYY-MM-DD】}
\def\report@type{专题报告}
\def\report@period{【起止日期】}
\def\report@note{无}
\def\report@abstractcn{【填写 300--600 字中文摘要，包括目的、方法、结果和结论。】}
\def\report@abstracten{Replace this text with an English abstract of about 300 content words.}
\def\report@keywordscn{科技报告；专题报告；编写规则}
\def\report@keywordsen{scientific and technical report; topic report; presentation rules}
\def\report@projectname{【项目（课题）名称】}
\def\report@contractor{【承担单位】}
\def\report@projectleader{【项目（课题）负责人】}
\def\report@sponsor{【立项部门】}
\def\report@projectnumber{【项目（课题）编号】}
\def\report@programname{【计划名称】}
\def\report@contactname{【联系人】}
\def\report@contactdetails{【电话/电子邮箱】}
\def\report@supportchannel{【支持渠道】}
\def\report@publisherplace{【出版地】}
\def\report@publisher{【出版者】}
\def\report@publisherdate{【出版日期】}

\newcommand{\ReportNumber}[1]{\gdef\report@number{#1}}
\newcommand{\ReportSecurity}[1]{\gdef\report@security{#1}}
\newcommand{\ReportSecurityTerm}[1]{\gdef\report@securityterm{#1}}
\newcommand{\ReportIssueDate}[1]{\gdef\report@issuedate{#1}}
\newcommand{\ReportTitle}[1]{\gdef\report@title{#1}}
\newcommand{\ReportEnglishTitle}[1]{\gdef\report@englishtitle{#1}}
\newcommand{\ReportVolume}[1]{\gdef\report@volume{#1}}
\newcommand{\ReportEnglishVolume}[1]{\gdef\report@englishvolume{#1}}
\newcommand{\ReportAuthor}[1]{\gdef\report@author{#1}}
\newcommand{\ReportInstitution}[1]{\gdef\report@institution{#1}}
\newcommand{\ReportCompletionDate}[1]{\gdef\report@completiondate{#1}}
\newcommand{\ReportType}[1]{\gdef\report@type{#1}}
\newcommand{\ReportPeriod}[1]{\gdef\report@period{#1}}
\newcommand{\ReportNote}[1]{\gdef\report@note{#1}}
\newcommand{\ReportAbstractCN}[1]{\gdef\report@abstractcn{#1}}
\newcommand{\ReportAbstractEN}[1]{\gdef\report@abstracten{#1}}
\newcommand{\ReportKeywordsCN}[1]{\gdef\report@keywordscn{#1}}
\newcommand{\ReportKeywordsEN}[1]{\gdef\report@keywordsen{#1}}
\newcommand{\ReportProjectName}[1]{\gdef\report@projectname{#1}}
\newcommand{\ReportContractor}[1]{\gdef\report@contractor{#1}}
\newcommand{\ReportProjectLeader}[1]{\gdef\report@projectleader{#1}}
\newcommand{\ReportSponsor}[1]{\gdef\report@sponsor{#1}}
\newcommand{\ReportProjectNumber}[1]{\gdef\report@projectnumber{#1}}
\newcommand{\ReportProgramName}[1]{\gdef\report@programname{#1}}
\newcommand{\ReportContactName}[1]{\gdef\report@contactname{#1}}
\newcommand{\ReportContactDetails}[1]{\gdef\report@contactdetails{#1}}
\newcommand{\ReportSupportChannel}[1]{\gdef\report@supportchannel{#1}}
\newcommand{\ReportPublisherPlace}[1]{\gdef\report@publisherplace{#1}}
\newcommand{\ReportPublisher}[1]{\gdef\report@publisher{#1}}
\newcommand{\ReportPublisherDate}[1]{\gdef\report@publisherdate{#1}}

\newcommand{\ReportTotalPages}{%
  \@ifundefined{@abspage@last}{--}{\@abspage@last}%
}

\providecommand{\songti}{\CJKfamily{zhsong}}
\providecommand{\heiti}{\CJKfamily{zhhei}}

\newcommand{\ReportFrontHeading}[1]{%
  \begin{center}
    {\heiti\zihao{3}#1}
  \end{center}
  \vspace{0.8\baselineskip}
}

\newcommand{\makecover}{%
  \clearpage
  \newgeometry{left=28mm,right=28mm,top=24mm,bottom=24mm}
  \thispagestyle{empty}
  \noindent
  \begin{minipage}[t][0.91\textheight][t]{\textwidth}
    \begin{tabularx}{\textwidth}{@{}Xr@{}}
      {\zihao{4}\songti \report@number} &
      {\zihao{4}\songti \report@security\ifdefempty{\report@securityterm}{}{\ensuremath{\bigstar}\report@securityterm}}\\[1.2ex]
      & {\zihao{4}\songti 制发日：\report@issuedate}
    \end{tabularx}
    \vfill
    \begin{center}
      {\heiti\zihao{3}专题科技报告\par}
      \vspace{2.2\baselineskip}
      {\heiti\zihao{2}\report@title\par}
      \ifstrempty{\report@volume}{}{\vspace{0.8\baselineskip}{\songti\zihao{-2}\report@volume\par}}
      \vspace{1.8\baselineskip}
      {\rmfamily\bfseries\zihao{-2}\report@englishtitle\par}
      \ifstrempty{\report@englishvolume}{}{\vspace{0.6\baselineskip}{\rmfamily\zihao{3}\report@englishvolume\par}}
    \end{center}
    \vfill
    \begin{center}
      {\songti\zihao{4}\report@author\par}
      \vspace{0.8\baselineskip}
      {\songti\zihao{4}\report@institution\par}
      \vspace{0.8\baselineskip}
      {\songti\zihao{4}\report@completiondate\par}
    \end{center}
  \end{minipage}
  \restoregeometry
}

\newcommand{\makereporttitlepage}{%
  \clearpage
  \thispagestyle{plain}
  \noindent
  \begin{minipage}[t][0.88\textheight][t]{\textwidth}
    \begin{tabularx}{\textwidth}{@{}Xr@{}}
      {\zihao{4}\report@number} & {\zihao{4}\report@security}
    \end{tabularx}
    \vspace{24mm}
    \begin{center}
      \parbox[c][22mm][c]{\textwidth}{\centering\heiti\fontsize{36bp}{50bp}\selectfont 科技报告}
    \end{center}
    \vspace{32mm}
    \renewcommand{\arraystretch}{1.7}
    \begin{tabularx}{\textwidth}{>{\heiti\zihao{4}}p{6em}>{\songti\zihao{4}}X}
      报告名称： & \report@title\\
      报告类型： & \report@type（\report@period）\\
      支持渠道： & \report@supportchannel\\
      编制单位： & \report@institution\\
      编制时间： & \report@completiondate\\
    \end{tabularx}
    \vfill
    {\centering\zihao{5}\report@publisherplace：\report@publisher，\report@publisherdate\par}
  \end{minipage}
  \clearpage
}

\newcommand{\reportdocbox}[3]{%
  \noindent\fbox{%
    \begin{minipage}[t][#1][t]{\dimexpr\textwidth-2\fboxsep-2\fboxrule\relax}
      {\zihao{5}\songti #2\par}\vspace{0.4ex}
      {\zihao{5}\songti #3\par}
    \end{minipage}%
  }\par\vspace{-\fboxrule}
}

\newcommand{\makereportdocumentation}{%
  \clearpage
  \newgeometry{left=19mm,right=19mm,top=16mm,bottom=16mm}
  \thispagestyle{plain}
  \ReportFrontHeading{辑要页}
  \begingroup
  \setlength{\fboxsep}{4pt}
  \setlength{\fboxrule}{0.4pt}
  \renewcommand{\arraystretch}{1.45}
  \reportdocbox{13mm}{1. 题名}{\report@title}
  \reportdocbox{11mm}{2. 作者及作者单位}{\report@author；\report@institution}
  \noindent\begin{tabularx}{\textwidth}{|X|X|X|}
    \hline
    3. 科技报告类型、起止日期\newline \report@type；\report@period &
    4. 辑要页密级\newline \report@security &
    5. 科技报告密级\newline \report@security\\
    \hline
    6. 科技报告编号\newline \report@number &
    7. 完成日期\newline \report@completiondate &
    8. 总页数\newline \ReportTotalPages\\
    \hline
  \end{tabularx}\par\vspace{-\fboxrule}
  \reportdocbox{9mm}{9. 备注}{\report@note}
  \reportdocbox{79mm}{10. 摘要}{\report@abstractcn\par\vfill 关键词：\report@keywordscn}
  \noindent\begin{tabularx}{\textwidth}{|p{5em}|p{7em}|X|p{7em}|X|}
    \hline
    \multirow{4}{5em}{\centering 11. 支持\newline 渠道} & 项目（课题）名称 & \multicolumn{3}{l|}{\report@projectname}\\ \cline{2-5}
      & 承担单位 & \multicolumn{3}{l|}{\report@contractor}\\ \cline{2-5}
      & 项目（课题）负责人 & \report@projectleader & 项目（课题）编号 & \report@projectnumber\\ \cline{2-5}
      & 立项部门 & \report@sponsor & 计划名称 & \report@programname\\
    \hline
    12. 联系人 & 姓名 & \report@contactname & 联系方式 & \report@contactdetails\\
    \hline
  \end{tabularx}
  \endgroup
  \restoregeometry
}

\newcommand{\makereportabstracts}{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{摘要}
  \ReportFrontHeading{摘要}
  {\songti\zihao{5}\report@abstractcn\par}
  \vspace{1.2\baselineskip}
  {\heiti\zihao{5}关键词：}{\songti\zihao{5}\report@keywordscn\par}
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{Abstract}
  \begin{center}{\rmfamily\bfseries\zihao{3}Abstract}\end{center}
  \vspace{0.8\baselineskip}
  {\rmfamily\zihao{5}\report@abstracten\par}
  \vspace{1.2\baselineskip}
  {\rmfamily\bfseries\zihao{5}Keywords: }{\rmfamily\zihao{5}\report@keywordsen\par}
}

\renewcommand{\contentsname}{目次}
\newcommand{\makereporttoc}{%
  \cleardoublepage
  \phantomsection
  \ReportFrontHeading{目次}
  \begingroup\songti\zihao{5}\@starttoc{toc}\endgroup
}

\newcommand{\makereportlists}{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{插图和附表清单}
  \ReportFrontHeading{插图和附表清单}
  {\heiti\zihao{5}插图清单\par}
  \begingroup\songti\zihao{5}\@starttoc{lof}\endgroup
  \vspace{1.2\baselineskip}
  {\heiti\zihao{5}附表清单\par}
  \begingroup\songti\zihao{5}\@starttoc{lot}\endgroup
}

\newcommand{\makereportsymbols}[1]{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{符号和缩略语说明}
  \ReportFrontHeading{符号和缩略语说明}
  {\songti\zihao{5}#1\par}
}

\renewcommand{\bibname}{参考文献}

% Appendices use A1/A2 numbering and a two-line centered heading, as required
% by 5.2.4.
\let\report@originalappendix\appendix
\renewcommand{\appendix}{%
  \report@originalappendix
  \ctexset{chapter={name={附录\space,},number=\Alph{chapter}}}
  \renewcommand{\thefigure}{\thechapter\arabic{figure}}
  \renewcommand{\thetable}{\thechapter\arabic{table}}
  \renewcommand{\theequation}{\thechapter\arabic{equation}}
  \titleformat{\chapter}[display]{\centering\heiti\zihao{5}}{附录\space\thechapter}{0.5\baselineskip}{}
  \titlespacing*{\chapter}{0pt}{0pt}{0.8\baselineskip}
}

\newcommand{\ReportTableText}{\zihao{-5}\songti}

\makeatother

\endinput
