# SIH Hackathon

## Topic1 :- Enhancment of Permanenetly Shadowed Region (PSR) of Lunar Craters Captured by OHRC of Chandrayan -2
### Desired Outcomes
#### Desired Outcome: Software for generating low light image enhancement.

[for more info click to visit:](https://www.sih.gov.in/sih2024PS?technology_bucket=QWxs&category=U29mdHdhcmU=&organization=SW5kaWFuIFNwYWNlIFJlc2VhcmNoIE9yZ2FuaXphdGlvbiAoSVNSTyk=&organization_type=QWxs)

### Reference Links to Research paper:
#### [Low Light Image Enhancement](https://paperswithcode.com/task/low-light-image-enhancement)
#### [Analysis of the permanently shadowed region of Cabeus crater in lunar south pole using orbiter high resolution camera imagery](https://www.sciencedirect.com/science/article/pii/S0019103523003391#:~:text=Permanently%20shadowed%20regions%20(PSRs)%20on,elevation%20angles%20throughout%20the%20year.)
#### [Surface morphology inside the PSR area of lunar polar crater Shoemaker in comparison with that of the sunlit areas](https://www.sciencedirect.com/science/article/pii/S0032063324000035)
#### [Automated detection and classification of lunar craters using multiple approaches](https://www.sciencedirect.com/science/article/pii/S0273117705010392#bbib14)
#### [Noise2Void - Learning Denoising from Single Noisy Images](https://arxiv.org/abs/1811.10980)
### Important Terms:
#### [Color Spaces](https://developer.mozilla.org/en-US/docs/Glossary/Color_space)


### Code:
#### How to do selenorefrencing of an image
#### First you need to install gdal
```bash
conda create -n gdal
conda activate gdal
conda install -c conda-forge gdal
```

#### Verify installation
```bash
python
from osgeo import gdal
```
#### if no error occur hence the installation was succesful
#### if you are using Linux use the .sh file
#### if you are using Win use .bat file
