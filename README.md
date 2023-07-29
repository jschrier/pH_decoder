# pH_decoder
 Prototype determination of pH from universal indicator spectra

## Research Notes
* `2023.07.18_pH_spectroscopy.nb`: Exploratory comparison of [PCA](https://en.wikipedia.org/wiki/Principal_component_analysis) (+ regressor) versus [Earth Mover Distance]((https://en.wikipedia.org/wiki/Earth_mover%27s_distance)) for assigning pH, along with a statistical baseline of performance
* `2023.07.19_emd_distance_distributions.nb`:  Plot of the [EMD](https://en.wikipedia.org/wiki/Earth_mover%27s_distance) spectral differences between all spectra and analysis of problem cases.
* `2023.07.20_expanded_dataset.nb`:  Baseline analysis and ML model performance on a dataset of 393 pH/spectra examples; key takeaways are that the mean absolute deviation of pH within triplicates is 0.09 +/- 0.09, and that a variety of straightforward models can achieve a MAE of 0.23 +/- 0.03 pH units on prediction (notably GBT); *(addendum 26 Jul 2023: Analysis of distribution of errors as a function of pH)*
* `2023.07.21_examples_for_maurer.nb`: Some resources for learning Mathematica (with a focus on data), and a minimal example of reading/parsing a plate-reader output file into a more convenient form for analysis.
* `2023.07.26_infer_amphiphile_pH.nb`: Example of using the 2023-07-20 dataset of 393 spectra->pH examples to perform an inference for unknown amphiphiles, using a GBT model *(in progress; waiting for experimental data)*
* `2023.07.29_expanded_dataset.nb`: ML model performance analysis of 898 spectra->pH examples;  the new dataset adds more examples and different buffers; pH prediction is still MAE of 0.25 pH units using GBT on the normalized spectra


## Utilities

* `src/emd.wl`: Wasserstein-1 distance for 1D-vectors, solved as a linear program
* `src/platereader.wl`: parse a [Molecular Devices plate reader](https://www.moleculardevices.com/products/microplate-readers) txt output file
* `src/import_scripting.wl`: facilitates batch imports of the XLSX and platereader files that have been used; former assumes that a fixed layout of the pH measurements on sheet 2

## Other notes:

Past work on using EMD for spectral assignment
* JCP 2021 [https://doi.org/10.1063/5.0069681]
* JCP 2022 [https://doi.org/10.1063/5.0087385]
