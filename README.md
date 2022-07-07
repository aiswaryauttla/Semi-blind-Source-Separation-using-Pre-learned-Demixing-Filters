# Semi-blind-Source-Separation-using-Pre-learned-Demixing-Filters

Source separation from an instantaneous mixture of signals is a challenging problem. Speech that is perfectly understood in a quiet environment is rendered unintelligible in an environment with many interfering sources such as a cocktail party. In this project applications of relative transfer functions (RTFs) to blind source separation (BSS) are investigated. We analyze auxiliary function-based Independant Vector Analysis (auxIVA) and propose methods to estimate the auxiliary variables and demixing matrices in tne Short-Time Fourier Transform (STFT) domain. In essence we solve the outer permutation ambiguity which is present in auxIVA by introducing prior information about the desired source.

# Dependency

libRIR generator

# References

N. Ono, “Stable and fast update rules for independent vector analysis based on
auxiliary function technique,” in IEEE Workshop on Applications of Signal Processing to
Audio and Acoustics(WASPAA), New Paltz, NY, USA, Oct. 2011.

Andreas Brendel, Thomas Haubner and Walter Kellermann, ”Spatially Guided
Independent Vector Analysis,” in ICASSP 2020 - 2020 IEEE International Conference on
Acoustics, Speech and Signal Processing (ICASSP).

Zbyněk Koldovský, Jiří Málek, and Sharon Gannot, ”Spatial Source Subtraction
Based on Incomplete Measurements of Relative Transfer Function,” in IEEE Trans.
on Speech, Audio and Language Processing, 2015.

Jakub Janský, Zbyněk Koldovský, and Nobutaka Ono, ”A computationally cheaper
method for blind speech separation based on AuxIVA and incomplete demixing
transform,” in 2016 IEEE International Workshop on Acoustic Signal Enhancement
(IWAENC).
