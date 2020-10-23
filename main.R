library(dplyr)
library(gt)

elements <- tibble(
  C1 = c("1 H", "3 Li", "11 Na", "19 K", "37 Rb", "55 Cs", "87 Fr", NA, NA, NA),
  C2 = c(NA, "4 Be", "12 Mg", "20 Ca", "38 Sr", "56 Ba", "88 Ra", NA, NA, NA),
  C3 = c(NA, NA, NA, "21 Sc", "39 Y", "57 La", "89 Ac", NA, NA, NA),
  C3bis = c(rep(NA, times = 5), "58-71", "90-103", NA, NA, NA),
  C4 = c(NA, NA, NA, "22 Ti", "40, Zr", "72 Hf", "104 Rf", NA, "58 Ce", "90 Th"),
  C5 = c(NA, NA, NA, "23 V", "41 Nb", "73 Ta", "105 Db", NA, "59 Pr", "91 Pa"),
  C6 = c(NA, NA, NA, "24 Cr", "42 Mo", "74 W", "106 Sg", NA, "60 Nd", "92 U"),
  C7 = c(NA, NA, NA, "25 Mn", "43 Tc", "75 Re", "107 Bh", NA, "61 Pm", "93 Np"),
  C8 = c(NA, NA, NA, "26 Fe", "44 Ru", "76 Os", "108 Hs", NA, "62 Sm", "94 Pu"),
  C9 = c(NA, NA, NA, "27 Co", "45 Rh", "77 Ir", "109 Mt", NA, "63 Eu", "95 Am"),
  C10 = c(NA, NA, NA, "28 Ni", "46 Pd", "78 Pt", "110 Ds", NA, "64 Gd", "96 Cm"),
  C11 = c(NA, NA, NA, "29 Cu", "47 Ag", "79 Au", "111 Rg", NA, "65 Tb", "97 Bk"),
  C12 = c(NA, NA, NA, "30 Zn", "48 Cd", "80 Hg", "112 Cn", NA, "66 Dy", "98 Cf"),
  C13 = c(NA, "5 B", "13 Al", "31 Ga", "49 In", "81 Ti", "113 Nh", NA, "67 Ho", "99 Es"),
  C14 = c(NA, "6 C", "14 Si", "32 Ge", "50 Sn", "82 Pb", "114 Fl", NA, "68 Er", "100 Fm"),
  C15 = c(NA, "7 N", "15 P", "33 As", "51 Sb", "83 Bi", "115 Mc", NA, "69 Tm", "101 Md"),
  C16 = c(NA, "8 O", "16 S", "34 Se", "52 Te", "84 Po", "116 Lv", NA, "70 Yb", "102 No"),
  C17 = c(NA, "9 F", "17 Cl", "35 Br", "53 I", "85 At", "117 Ts", NA, "71 Lu", "103 Lr"),
  C18 = c("2 He", "10 Ne", "18 Ar", "36 Kr", "54 Xe", "86 Rn", "118 Og", NA, NA, NA)
)
