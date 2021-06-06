BeginPackage["Centrifuge`drawCentrifuge`"]

PlotCentrifuge::usage = "PlotCentrifuge[z, roots]";
DrawCentrifugeSols::usage = "DrawCentrifugeSols[solutions]";

Begin["`Private`"]

PlotCentrifuge[z_, roots_] := Module[{},
  PlotComplexBase[roots] := ListPlot[
    {Re[#], Im[#]} & /@ roots,
    AxesOrigin -> {0, 0},
    Axes -> False,
    PlotRange -> {{-1.2, 1.2}, {-1.2, 1.2}},
    ImagePadding -> 0,
    AspectRatio -> 1,
    Frame -> False,
    FrameLabel -> {{Im, None}, {Re, None}},
    PlotStyle -> Directive[GrayLevel[0.7], PointSize[0.2]]
    ];
  PlotComplex[z] := ListPlot[
    {Re[#], Im[#]} & /@ z,
    AxesOrigin -> {0, 0},
    Axes -> False,
    PlotRange -> {{-1.2, 1.2}, {-1.2, 1.2}},
    ImagePadding -> 0,
    AspectRatio -> 1,
    Frame -> False,
    FrameLabel -> {{Im, None}, {Re, None}},
    PlotStyle -> Directive[Red, PointSize[.2]]
    ];
  (*Return*)
  Show[
    Graphics@Circle[{0, 0}, 1],
    PlotComplexBase[roots],
    PlotComplex[z],
    ImageSize -> Tiny
  ]
]

DrawCentrifugeSols[solutions_] := Module[{numSubSets, roots, n, solsTable, i},
  n = Length[solutions[[1]]];
  roots = solutions[[1]];
  numSubSets = Length[solutions[[2]]];
  solsTable = {{"Elements", "Representation"}};
  (*Loop over subsets*)
  For[i = 1, i <= numSubSets, i++,
   solsTable = Append[
      solsTable,
      {solutions[[2]][[i]][[1]],
      PlotCentrifuge[#, roots] & /@ solutions[[2]][[i]][[2]]}
    ]
  ];
  Print["Roots for ", n, " holes: ", roots];
  Print["Solutions:"];
  (*Return*)
  Grid[solsTable,
    Background -> {None, {Lighter[Yellow, .9], None}},
    Alignment -> {{Center, Left}},
    Dividers -> {All, All}
  ]
]

End[];

EndPackage[];
