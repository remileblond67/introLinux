all: td1.pdf td2.pdf td3.pdf td4.pdf td5.pdf td6.pdf td7.pdf td8.pdf

td1.pdf: td1.dvi
	pdflatex td1.tex

td2.pdf: td2.dvi
	dvips -Pcmz -o td2.ps td2.dvi
	ps2pdf td2.ps td2.pdf
	rm td2.ps

td3.pdf: td3.dvi
	pdflatex td3.tex

td4.pdf: td4.dvi
	pdflatex td4.tex

td5.pdf: td5.dvi
	dvips -Pcmz -o td5.ps td5.dvi
	ps2pdf td5.ps td5.pdf
	rm td5.ps

td6.pdf: td6.dvi
	dvips -Pcmz -o td6.ps td6.dvi
	ps2pdf td6.ps td6.pdf
	rm td6.ps

td7.pdf: td7.dvi
	dvips -Pcmz -o td7.ps td7.dvi
	ps2pdf td7.ps td7.pdf
	rm td7.ps

td8.pdf: td8.dvi
	pdflatex td8.tex

