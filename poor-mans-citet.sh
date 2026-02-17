#!/bin/sh

cat << EOF > bibAuthorNames.tex
% AUTO GENERATED, SEE poor-mans-biber.sh
\ExplSyntaxOn
\cs_new:Npn \citet:n #1 {
  \str_case:nnF {#1} {
EOF

pandoc bib.bib -t csljson | jq '.[] | "{" + .id + "} {" + (.author | if length == 1 then .[0].family else if length == 2 then .[0].family + "~and~" + .[1].family else .[0].family + "~et.\\,al." end end)
+ "~\\cite{" + .id + "}}"' -r >> bibAuthorNames.tex

cat << EOF >> bibAuthorNames.tex
  }
  {??~\cite{#1}}
}
\NewDocumentCommand{\citet}{m}{ \citet:n{#1} }
\ExplSyntaxOff
EOF
