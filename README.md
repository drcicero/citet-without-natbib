# citet-without-natbib

Lipics doesnt support natbib, biblatex or biber but requires plain bibtex use.
When switching between ACM and Lipics latex classes, therefore all uses of `\textcite` and `\citet` need to be replaced by raw `\cite`, however it would be convenient to somehow get access to the author name.
The poor-mans-citet shell script above, uses `pandoc` to convert a bib file to json, and `jq` to convert the json file to a latex file.
This latex file defines a `\citet{...}` command by pattern matching on the provided bib id.

Setup:
As just said, you need to install pandoc and jq, for example
`apt install pandoc jq`.

To use:
Whenever your bib file changes, re-run `poor-mans-citet.sh`, to write a `bibAuthorNames.tex` file, containing the `\citet` definition.
In the beginning of your document, add `\input{bibAuthorNames}`, this provides the `\citet` command.
In your text, use `\citet{bibid}` as you are used to.
