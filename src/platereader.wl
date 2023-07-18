(* ::Package:: *)



(* Read in a .txt output file from the Molecular Devices plate reader*)

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



