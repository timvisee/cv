[![View CV as PDF][badge-pdf]][pdf]
[![Pipeline status][badge-pipeline]][pipeline]

# Curriculum Vitae

My personal curriculum vitae.

[→ PDF][pdf]

## Compile

Make sure [tectonic] is installed, then use:

```bash
# Clone repository
git clone git@github.com:timvisee/cv.git
cd cv

# Compile with tectonic
tectonic cv.tex

# Open PDF
xdg-open cv.pdf
```

## License

This project is released under the GNU GPL-v3.0 licence.
Check out the [LICENSE](LICENSE) file for more information.

## Resources

The curriculum vitae template I used is based on [CV][ref-cv] by Adrien Friggeri.

[badge-pdf]: https://img.shields.io/badge/cv-pdf-blue.svg
[badge-pipeline]: https://gitlab.com/timvisee/cv/badges/master/pipeline.svg
[pdf]: https://timvisee.gitlab.io/cv/cv.pdf
[pipeline]: https://gitlab.com/timvisee/cv/pipelines
[ref-cv]: https://www.latextemplates.com/template/friggeri-resume-cv
[tectonic]: https://github.com/tectonic-typesetting/tectonic#readme
