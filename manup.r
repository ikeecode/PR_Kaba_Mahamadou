# CSV: C'est un fichier dont les valeurs sont separees par des virgules qui porte l'extension .csv
#STRUCTURE:chaque ligne est un enregistrement de donnee et chaque enregistrement est compose d'un ou de plusieurs champs separer par des virgules

#IMPORTATION DE FICHIERT:
d=read.csv("data.csv")

#RECUPERATION NOTE
my_note=d$Note
lignes <- list(data.frame('Nom' = d$Nom, 'Prénom'=d$Prénom))
my_names <- d$Prénom
#TRANSFORMATION DE LA COLONNE NOTE EN DATA FRAME
my_note=data.frame(my_note)


liste_de_notes <- list()

for (i in 1:nrow(my_note)){
  notes_eleve <- data.frame('','','','','')
  colnames(notes_eleve) <- c("nom_matiere", "d1", "d2", "d3","examen")
  notes_eleve <- notes_eleve[-c(1,2,3,4,5)]

  linenote <- strsplit(my_note[i,],"#")
  linenote <- linenote[[1]]
  k <- 1
  while (k <= length(linenote)){
    sep_mat_not <- strsplit(linenote[k],"\\[")
    matiere <- sep_mat_not[[1]][1]
    notes <- sep_mat_not[[1]][2]
    notes <- strsplit(notes,"]")
    notes <- notes[[1]][1]
    sep_dev_exam <- strsplit(notes,":")
    devoir <- sep_dev_exam[[1]][1]
    examen <- sep_dev_exam[[1]][2]
    devoir <- strsplit(devoir,";")
    d1 <- devoir[[1]][1]
    d2 <- devoir[[1]][2]
    d3 <- devoir[[1]][3]
    nom_matiere=sep_mat_not[[1]][1]
    base <- data.frame(nom_matiere,d1,d2,d3,examen)
    # print(base)
    notes_eleve <- rbind(notes_eleve, base)
    k <- k + 1
  }
  liste_de_notes[[i]] <- notes_eleve
  # if (i>4) {break}
}

for (x in 1:length(liste_de_notes)){
  print(lignes[[1]][x,])
  print(liste_de_notes[x], na.print='0')
  print("*********************************************************************")
}

# print(lignes[[1]][2,])
