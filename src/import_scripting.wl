(* ::Package:: *)

(* convenience functions to facilitate importing the pH data in its current format *)

importPlateReaderFilesFromDirectory[d_?DirectoryQ]:=With[
	{sortedPlateFileNames = SortBy[StringTake[#, -10]&]@FileNames["*.txt", d]},
	Normal @ Map[Flatten] @ Merge[Join] @ Map[importPlateReaderFile] @ sortedPlateFileNames
]
	
importpHData[xlsxFile_?FileExistsQ, dataRows_List]:=
	Import[ xlsxFile,
	{"Data", 2, dataRows, 2;;13},
	"EmptyField"->Missing[] ]//Flatten

importpHData[xlsxFile_?FileExistsQ]:=With[
	{defaultRows=Join[Range[4,11], Range[16,23], Range[27,34], Range[38,45], Range[49,56], Range[61,68]]},
	importpHData[xlsxFile, defaultRows]
]

(* process entire list *)
output[spectra_List, pH_List]:=
	MapThread[output, {Transpose[spectra[[All, 2, All]]],pH}]
	
(*get data into a list of {spectra}-> pH values*)
output[spectrum_List, pH_?NumericQ]:=(normalizeSpectrum[spectrum]->pH);
output[_, _]:=Nothing;  (*if there is not a Numeric pH value, then drop this entry from both sets *)


importDirectory::usage = 
	"importDirectory[d] reads a set of pH measurements from directory d, assuming the pH information is contained"<>
	"in a single standard format *.xlsx file and spectra are in files named *plate$N.txt, where $N = 1,2,3, ..." 		

importDirectory[d_?DirectoryQ]:=With[
	{spectra = importPlateReaderFilesFromDirectory[d],
	 pH = importpHData@First@FileNames["*.xlsx", d]},
	 output[spectra, pH]
]

	
