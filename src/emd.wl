(* ::Package:: *)

(* compute the Wassserstein distance ("earth mover distance" between two normalized 1D-vectors *)
(* see: https://en.wikipedia.org/wiki/Earth_mover%27s_distance *)
emd::usage = "emd[p, q] returns the Wasserstein-1 (\"earth mover\") distance between two normalized 1D-vectors"

emd[p_?VectorQ, q_?VectorQ]:=With[
	(*alternatively, `metric = DistanceMatrix[Range[n],Range[n]]`, but this is slower for n=30, but faster for n=1000 *)
	{metric = Table[N@Abs[i-j], {i, Length[p]}, {j, Length[p]}]},
	Assert[Total[p]==Total[q]== 1]; (*verify assumptions about normalization*)
	Assert[Length[p]==Length[q]]; (* ame finite basis for the two vectors *)
	With[
		{flow=LinearOptimization[
			Total[Inactivate[f*metric], 2],(*needs special multiply symbol...or Inactivate*)
			{Total[f, {2}]\[VectorLessEqual]p,(*outflux constraint*)
			Total[f, {1}]\[VectorLessEqual]q,(*influx constraint*)
			Total[f, 2]==1 (* flow normalization constraint, simply 1 because p and q are normalized*)},
			f\[Element]Matrices[Dimensions[metric], NonNegativeReals]][[1,2]]},
		Total[flow*metric, 2] (*return cost; denominator of Total[flow, 2] will be 1 if p and q are normalized by constraint*)
	]
]

