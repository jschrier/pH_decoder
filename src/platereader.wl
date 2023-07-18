(* ::Package:: *)

importPlateReaderFile::usage = 
	"importPlateReaderFile[file] reads a Molecular Devices plate reader text file output "<>
	"and returns list of rules relating wavelength to measured absorbance for each sample"

(* Read in a .txt output file from the Molecular Devices plate reader*)
(* assumption:  this is a 96-well plate, and we throw away the temperature information *)
(* we also don't read any of the other metadata in the file *)
importPlateReaderFile[file_?FileExistsQ]:=With[
	{d=Import[file, "Table", "FieldSeparators"->"\t", "RepeatedSeparators"->False]},
	splitFile[d]
]

(* divide the file into groups of entries measured at each wavelength *)
splitFile[d_List]:=With[
	{splits = Table[ d[[i;;i+7]], {i,4,Length[d]-9,9}]},
	splitSpectra/@splits
]

(*  split each block of entries into a wavelength->measured absorbance rule *)
splitSpectra[d_List]:=With[
	{wavelength=d[[1,1]],
	temperature = d[[1,2]], (*we just discard this for now*)
	absorbances = Flatten@d[[1;;8,3;;14]]},
	Assert[NumericQ[wavelength]];
	Assert[VectorQ[absorbances]];
	(wavelength->absorbances)
]

