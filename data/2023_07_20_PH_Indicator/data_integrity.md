# Changes

2023-07-23: A new version of `20230720 pH Indicator Plates.xlsx` was uploaded:
- Adds information on sheet 1 with information about about missing remaining plates; the previous verison sheet 1 (“Sample contents”) was incomplete (only had information on the first 3 plates).
- Adds relevant photos on sheet 3 of plates 4-6

# Data Quality

Sheet 2 (“pH”), plate 4 description has 70 pH measurements (but 70 is not evenly divisible by 3, so it shouldn’t be part of a triplicate.)  
- Decision to discard this pH measurement Plate 4: F10
- (We are going to do this in code, as it is not clear that this is a "bad" data point, but it is inconsistent with the experiments being performed in triplicate and complicates statistical analysis.)

