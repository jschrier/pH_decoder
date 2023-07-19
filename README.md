# pH_decoder
 Prototype determination of pH from universal indicator spectra

## Research Notes
* `2023.07.18_pH_spectroscopy.nb`: Exploratory comparison of [PCA](https://en.wikipedia.org/wiki/Principal_component_analysis) (+ regressor) versus [Earth Mover Distance]((https://en.wikipedia.org/wiki/Earth_mover%27s_distance)) for assigning pH, along with a statistical baseline of performance
* `2023.07.19_emd_distance_distributions.nb`:  Plot of the [EMD](https://en.wikipedia.org/wiki/Earth_mover%27s_distance) spectral differences between all spectra and analysis of problem cases.

## Utilities

* `src/emd.wl`: Wasserstein-1 distance for 1D-vectors, solved as a linear program
* `src/platereader.wl`: parse a [Molecular Devices plate reader](https://www.moleculardevices.com/products/microplate-readers) txt output file

## Other notes:

Past work on using EMD for spectral assignment
* JCP 2021 [https://doi.org/10.1063/5.0069681]
* JCP 2022 [https://doi.org/10.1063/5.0087385]
