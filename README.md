# pH_decoder
 Prototype determination of pH from universal indicator spectra

## Research Notes
* `2023.07.18_pH_spectroscopy.nb`: Exploratory comparison of PCA (+ regressor) versus Earth Mover Distance for assigning pH, along with a statistical baseline of performance


## Utilities

* `src/emd.wl`: Wasserstein-1 distance for 1D-vectors, solved as a linear program
* `src/platereader.wl`: parse a Molecular Devices plate reader txt output file
