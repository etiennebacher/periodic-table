library(dplyr)
library(stringr)
library(gt)


#####################################################################
## Create data for periodic table ##
#####################################################################

elements <- tibble(
  rowname = c("1", "2", "3", "4", "5", "6", "7", "", "", ""),
  C1 = c("1 H", "3 Li", "11 Na", "19 K", "37 Rb", "55 Cs", "87 Fr", "", "", ""),
  C2 = c("", "4 Be", "12 Mg", "20 Ca", "38 Sr", "56 Ba", "88 Ra", "", "", ""),
  C3 = c("", "", "", "21 Sc", "39 Y", "57 La", "89 Ac", "", "", ""),
  C3bis = c(rep("", times = 5), "58-71", "90-103", "", "", ""),
  C4 = c("", "", "", "22 Ti", "40 Zr", "72 Hf", "104 Rf", "", "58 Ce", "90 Th"),
  C5 = c("", "", "", "23 V", "41 Nb", "73 Ta", "105 Db", "", "59 Pr", "91 Pa"),
  C6 = c("", "", "", "24 Cr", "42 Mo", "74 W", "106 Sg", "", "60 Nd", "92 U"),
  C7 = c("", "", "", "25 Mn", "43 Tc", "75 Re", "107 Bh", "", "61 Pm", "93 Np"),
  C8 = c("", "", "", "26 Fe", "44 Ru", "76 Os", "108 Hs", "", "62 Sm", "94 Pu"),
  C9 = c("", "", "", "27 Co", "45 Rh", "77 Ir", "109 Mt", "", "63 Eu", "95 Am"),
  C10 = c("", "", "", "28 Ni", "46 Pd", "78 Pt", "110 Ds", "", "64 Gd", "96 Cm"),
  C11 = c("", "", "", "29 Cu", "47 Ag", "79 Au", "111 Rg", "", "65 Tb", "97 Bk"),
  C12 = c("", "", "", "30 Zn", "48 Cd", "80 Hg", "112 Cn", "", "66 Dy", "98 Cf"),
  C13 = c("", "5 B", "13 Al", "31 Ga", "49 In", "81 Ti", "113 Nh", "", "67 Ho", "99 Es"),
  C14 = c("", "6 C", "14 Si", "32 Ge", "50 Sn", "82 Pb", "114 Fl", "", "68 Er", "100 Fm"),
  C15 = c("", "7 N", "15 P", "33 As", "51 Sb", "83 Bi", "115 Mc", "", "69 Tm", "101 Md"),
  C16 = c("", "8 O", "16 S", "34 Se", "52 Te", "84 Po", "116 Lv", "", "70 Yb", "102 No"),
  C17 = c("", "9 F", "17 Cl", "35 Br", "53 I", "85 At", "117 Ts", "", "71 Lu", "103 Lr"),
  C18 = c("2 He", "10 Ne", "18 Ar", "36 Kr", "54 Xe", "86 Rn", "118 Og", "", "", "")
)


#####################################################################
## Create the table from the data ##
#####################################################################

gt_colored <- elements %>%
  mutate(
    across(
      .cols = everything(), 
      .fns = ~ str_replace_all(string = .," ","<br>")
    )
  ) %>% 
  gt(rowname_col = "rowname") %>% 
  fmt_markdown(columns = TRUE) %>%
  cols_align(align = "center") %>%
  tab_style(
    style = cell_fill(color = "#FFD700"),
    locations = cells_body(
      columns = "C1",
      rows = "1"
    )
  ) %>%
  
  
  # Non metals reactive
  tab_style(
    style = cell_fill(color = "#FFD700"),
    locations = cells_body(
      columns = c("C14", "C15", "C16", "C17"),
      rows = "2"
    )
  ) %>%
  tab_style(
    style = cell_fill(color = "#FFD700"),
    locations = cells_body(
      columns = c("C15", "C16", "C17"),
      rows = "3"
    )
  ) %>%
  tab_style(
    style = cell_fill(color = "#FFD700"),
    locations = cells_body(
      columns = c("C16", "C17"),
      rows = "4"
    )
  ) %>%
  tab_style(
    style = cell_fill(color = "#FFD700"),
    locations = cells_body(
      columns = "C17",
      rows = "5"
    )
  ) %>%
  
  
  # non metal noble gas
  tab_style(
    style = cell_fill(color = "#7FFFD4"),
    locations = cells_body(
      columns = "C18",
      rows = c(1:6)
    )
  ) %>%
  
  
  # metals alkali
  tab_style(
    style = cell_fill(color = "#CD5C5C"),
    locations = cells_body(
      columns = "C1",
      rows = c(2:7)
    )
  ) %>%
  
  
  # metals alkaline earth
  tab_style(
    style = cell_fill(color = "#F0E68C"),
    locations = cells_body(
      columns = "C2",
      rows = c(2:7)
    )
  ) %>%
  
  
  # metals transition
  tab_style(
    style = cell_fill(color = "#DB7093"),
    locations = cells_body(
      columns = c("C4", "C5", "C6", "C7", "C8", "C9", "C10", "C11"),
      rows = c(4:6)
    )
  ) %>%
  tab_style(
    style = cell_fill(color = "#DB7093"),
    locations = cells_body(
      columns = "C3",
      rows = c(4:5)
    )
  ) %>%
  tab_style(
    style = cell_fill(color = "#DB7093"),
    locations = cells_body(
      columns = c("C4", "C5", "C6", "C7", "C8"),
      rows = 7
    )
  ) %>%
  
  
  # metals actinide
  tab_style(
    style = cell_fill(color = "#FF00FF"),
    locations = cells_body(
      columns = c("C3", "C3bis"),
      rows = 7
    )
  ) %>%
  tab_style(
    style = cell_fill(color = "#FF00FF"),
    locations = cells_body(
      columns = c("C4", "C5", "C6", "C7", "C8", "C9", "C10", "C11", "C12", "C13", "C14", "C15", "C16", "C17"),
      rows = 10
    )
  ) %>%
  
  
  # metals lanthanide
  tab_style(
    style = cell_fill(color = "#FFC0CB"),
    locations = cells_body(
      columns = c("C3", "C3bis"),
      rows = 6
    )
  ) %>%
  tab_style(
    style = cell_fill(color = "#FFC0CB"),
    locations = cells_body(
      columns = c("C4", "C5", "C6", "C7", "C8", "C9", "C10", "C11", "C12", "C13", "C14", "C15", "C16", "C17"),
      rows = 9
    )
  ) %>%
  
  # properties not yet determined
  tab_style(
    style = cell_fill(color = "#D8BFD8"),
    locations = cells_body(
      columns = c("C9", "C10", "C11", "C12", "C13", "C14", "C15", "C16", "C17", "C18"),
      rows = 7
    )
  ) %>%
  
  
  # metals post transition
  tab_style(
    style = cell_fill(color = "#B0C4DE"),
    locations = cells_body(
      columns = "C13",
      rows = 3
    )
  ) %>%
  tab_style(
    style = cell_fill(color = "#B0C4DE"),
    locations = cells_body(
      columns = c("C12", "C13"),
      rows = 4
    )
  ) %>%
  tab_style(
    style = cell_fill(color = "#B0C4DE"),
    locations = cells_body(
      columns = c("C12", "C13", "C14"),
      rows = 5
    )
  ) %>%
  tab_style(
    style = cell_fill(color = "#B0C4DE"),
    locations = cells_body(
      columns = c("C12", "C13", "C14", "C15", "C16", "C17"),
      rows = 6
    )
  ) %>%
  
  # metalloids
  tab_style(
    style = list(
      cell_fill(color = "#BDB76B")
    ),
    locations = list(
      cells_body(
        columns = "C13",
        rows = 2
      ),
      cells_body(
        columns = "C14",
        rows = c(3:4)
      ),
      cells_body(
        columns = "C15",
        rows = c(4:5)
      ),
      cells_body(
        columns = "C16",
        rows = 5
      )
    )
  )



gt_colored %>%
  tab_header(
    title = "Periodic table of elements"
  ) %>%
  tab_style(
    style = list(
      cell_borders(
        sides = "all",
        color = "#FFFFFF"
      )
    ),
    locations = list(
      cells_column_labels("C2"),
      cells_body(
        columns = c("C2", "C3", "C3bis", "C4", "C5", "C6", "C7", "C8", "C9", "C10", "C11", "C12", "C13", "C14", "C15", "C16", "C17"),
        rows = 1
      ),
      cells_body(
        columns = c("C3", "C3bis", "C4", "C5", "C6", "C7", "C8", "C9", "C10", "C11", "C12"),
        rows = c(2:3)
      ),
      cells_body(
        columns = c("C3bis"),
        rows = c(4:5)
      )
    )
  ) %>%
  tab_options(
    table.width = "100%"
  )











