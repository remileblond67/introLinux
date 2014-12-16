# ------------------------------
#        CNAM  Strasbourg
#         TMRI 1 - Linux
# ------------------------------
# Support de cours général
# Non utilisé en cours (diapo)
# 
# Auteur : Rémi LEBLOND
# ------------------------------
# Compilation des fichiers LaTeX
# Génération des fichiers PDF
# Génération des pages HTML
# ------------------------------

TEX=latex

all: linux.bbl linux.ind eps/ArboProcessus.eps eps/compilation.eps eps/noyau_modulaire.eps eps/noyau_monolythique.eps eps/partition.eps eps/exemple_vi.eps eps/modes_vi.eps eps/opensource-110x95.eps
	
pdf: cmd_vi.pdf linux.pdf linux_2pages.pdf memo_cmd.pdf princ_rep.pdf

cmd_vi.pdf: cmd_vi.dvi
	dvips -Pcmz -o cmd_vi.ps cmd_vi.dvi
	ps2pdf cmd_vi.ps cmd_vi.pdf
	rm cmd_vi.ps

princ_rep.pdf: princ_rep.dvi
	pdflatex princ_rep.tex

linux_2pages.pdf: linux.dvi
	dvips -Pcmz -o linux.ps linux.dvi
	cat linux.ps | psnup -2 > linux_2pages.ps
	ps2pdf linux_2pages.ps linux_2pages.pdf
	rm linux_2pages.ps

memo_cmd.pdf: memo_cmd.dvi
	dvips -Pcmz -o memo_cmd.ps memo_cmd.dvi
	ps2pdf memo_cmd.ps memo_cmd.pdf
	rm memo_cmd.ps

linux.pdf: linux.dvi
	dvips -Pcmz -o linux.ps linux.dvi
	ps2pdf linux.ps linux.pdf
	rm linux.ps

ps: linux.ps linux_2pages.ps

exam_int.dvi: exam_int.tex
	latex exam_int.tex

exam_int.ps: exam_int.dvi
	dvips exam_int.dvi -o exam_int.ps

exam_final.dvi: exam_final.tex
	latex exam_final.tex

exam_final.ps: exam_final.dvi
	dvips exam_final.dvi -o exam_final.ps

exam_rattrapage.dvi: exam_rattrapage.tex
	latex exam_rattrapage.tex

exam_rattrapage.ps: exam_rattrapage.dvi
	dvips exam_rattrapage.dvi -o exam_rattrapage.ps

html: linux/index.html

# Compilation du document LaTeX en HTML
linux/index.html: linux.dvi
	latex2html -transparent -image_type png -antialias -white -show_section_numbers -html_version 4.0 -antialias_text -local_icons -split 3 -address "<HR>Document rédigé par <A HREF="http://remi.leblond.free.fr">Rémi LEBLOND</A> (<A HREF="mailto:remi.leblond.free.fr">remi.leblond@free.fr</A>)" linux.tex

# Compilation des dessins réalisés avec XFig en EPS
eps/ArboProcessus.eps: images/ArboProcessus.fig
	/Applications/fig2dev3.2.3-mac-osX/fig2dev -L eps images/ArboProcessus.fig > eps/ArboProcessus.eps

eps/compilation.eps: images/compilation.fig
	/Applications/fig2dev3.2.3-mac-osX/fig2dev -L eps images/compilation.fig > eps/compilation.eps

eps/noyau_modulaire.eps: images/noyau_modulaire.fig
	/Applications/fig2dev3.2.3-mac-osX/fig2dev -L eps images/noyau_modulaire.fig > eps/noyau_modulaire.eps

eps/noyau_monolythique.eps: images/noyau_monolythique.fig
	/Applications/fig2dev3.2.3-mac-osX/fig2dev -L eps images/noyau_monolythique.fig > eps/noyau_monolythique.eps

eps/partition.eps: images/partition.fig
	/Applications/fig2dev3.2.3-mac-osX/fig2dev -L eps images/partition.fig > eps/partition.eps

eps/exemple_vi.eps: images/exemple_vi.fig
	/Applications/fig2dev3.2.3-mac-osX/fig2dev -L eps images/exemple_vi.fig > eps/exemple_vi.eps

eps/modes_vi.eps: images/modes_vi.fig
	/Applications/fig2dev3.2.3-mac-osX/fig2dev -L eps images/modes_vi.fig > eps/modes_vi.eps

eps/opensource-110x95.eps: images/opensource-110x95.png
	convert images/opensource-110x95.png eps/opensource-110x95.eps

linux.bbl: linux.tex linux.bib
	bibtex linux

linux.ind: linux.idx
	makeindex linux.idx

clean:
	\rm *~ *.log *.bak *.out 
