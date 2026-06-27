// 設定ファイル
#import "../settings.typ": *

#heading(numbering: none)[記号表]

#h(-1em)
// 英語のアルファベット順で並べる
#text(font: "Segoe UI", weight: "bold")[Alphabet]
#table(
  columns: (1fr, 3fr),
  stroke: none,
  align: left,
  [$d$], [Channel width [$m$]],
  [$L_j$], [Computational domain size in $j$-direction [$m$]],
  [$N_j$], [Number of grid points in $j$-direction],
  [$"Re"$], [Reynolds number, $= u d slash nu$],
  [$u$], [Velocity [$m slash s$]],
)

#v(8mm)

// ギリシャ語のアルファベット順で並べる
#text(font: "Segoe UI", weight: "bold")[Greek]
#table(
  columns: (1fr, 3fr),
  stroke: none,
  align: left,
  [$delta$], [Channel half width [$m$]],
  [$epsilon_(i j k)$], [Levi--Civita symbol],
  [$nu$], [Kinematic viscosity [$m^2 slash s$]],
)

#v(8mm)

#text(font: "Segoe UI", weight: "bold")[Superscripts]
#table(
  columns: (1fr, 3fr),
  stroke: none,
  align: left,
  [$(quad)^*$], [Normalized by outer variables, e.g., $delta$],
  [$(quad)^+$], [Normalized by inner variables, e.g., $nu slash u_tau$ (wall unit)],
  [$(quad)^prime$], [Fluctuation component],
  [$overline((quad))$], [Statistically averaged],
)

#v(8mm)

#text(font: "Segoe UI", weight: "bold")[Subscripts]
#table(
  columns: (1fr, 3fr),
  stroke: none,
  align: left,
  [$(quad)_("rms")$], [Root mean square],
  [$(quad)_("w")$], [Wall],
  [$(quad)_tau$], [Wall unit],
)

#v(8mm)

#text(font: "Segoe UI", weight: "bold")[Abbreviations]
#table(
  columns: (1fr, 3fr),
  stroke: none,
  align: left,
  [CFD], [Computational fluid dynamics],
  [DNS], [Direct numerical simulation],
  [LES], [Large eddy simulation],
)

