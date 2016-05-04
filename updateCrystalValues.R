updateCrystalValues <- function(session, type, params=rep(0,6), reflection=c(1,0,0)) {

  

  if (type=="monoclinic") {
    enable("a1")
    enable("b1")
    enable("c1")
    disable("alpha1")
    enable("beta1")
    disable("gama1")
    updateTextInput(session, "a1", value =  ifelse(params[1]==0, "", params[1]))
    updateTextInput(session, "b1", value =  ifelse(params[2]==0, "", params[2]))
    updateTextInput(session, "c1", value =  ifelse(params[3]==0, "", params[3]))
    updateTextInput(session, "alpha1", value =  90)
    updateTextInput(session, "beta1", value =  ifelse(params[5]==0, "", params[5]))
    updateTextInput(session, "gama1", value =  90)
  }
  
  if (type=="orthorhombic") {
    enable("a1")
    enable("b1")
    enable("c1")
    disable("alpha1")
    disable("beta1")
    disable("gama1")
    updateTextInput(session, "a1", value =  ifelse(params[1]==0, "", params[1]))
    updateTextInput(session, "b1", value =  ifelse(params[2]==0, "", params[2]))
    updateTextInput(session, "c1", value =  ifelse(params[3]==0, "", params[3]))
    updateTextInput(session, "alpha1", value =  90)
    updateTextInput(session, "beta1", value =  90)
    updateTextInput(session, "gama1", value =  90)
  
  }
  
  if (type=="tetragonal") {
    enable("a1")
    disable("b1")
    enable("c1")
    disable("alpha1")
    disable("beta1")
    disable("gama1")
    updateTextInput(session, "a1", value =  ifelse(params[1]==0, "", params[1]))
    updateTextInput(session, "b1", value =  ifelse(params[2]==0, "", params[2]))
    updateTextInput(session, "c1", value =  ifelse(params[3]==0, "", params[3]))
    updateTextInput(session, "alpha1", value =  90)
    updateTextInput(session, "beta1", value =  90)
    updateTextInput(session, "gama1", value =  90)

    
  }
  
  if (type=="cubic") {
    enable("a1")
    disable("b1")
    disable("c1")
    disable("alpha1")
    disable("beta1")
    disable("gama1")
    updateTextInput(session, "a1", value =  ifelse(params[1]==0, "", params[1]))
    updateTextInput(session, "b1", value =  ifelse(params[2]==0, "", params[2]))
    updateTextInput(session, "c1", value =  ifelse(params[3]==0, "", params[3]))
    updateTextInput(session, "alpha1", value =  90)
    updateTextInput(session, "beta1", value =  90)
    updateTextInput(session, "gama1", value =  90)

  }
  
  if (type=="hexagonal") {
    enable("a1")
    disable("b1")
    enable("c1")
    disable("alpha1")
    disable("beta1")
    disable("gama1")
    
    updateTextInput(session, "a1", value =  ifelse(params[1]==0, "", params[1]))
    updateTextInput(session, "b1", value =  ifelse(params[2]==0, "", params[2]))
    updateTextInput(session, "c1", value =  ifelse(params[1]==0, "", params[3]))
    updateTextInput(session, "alpha1", value =  90)
    updateTextInput(session, "beta1", value =  90)
    updateTextInput(session, "gama1", value =  120)
    
  }
  
  
  if (type=="triclinic") {
      enable("a1")
      enable("b1")
      enable("c1")
      enable("alpha1")
      enable("beta1")
      enable("gama1")
      updateTextInput(session, "a1", value =  ifelse(params[1]==0, "", params[1]))
      updateTextInput(session, "b1", value =  ifelse(params[2]==0, "", params[2]))
      updateTextInput(session, "c1", value =  ifelse(params[3]==0, "", params[3]))
      updateTextInput(session, "alpha1", value =  ifelse(params[4]==0, "", params[4]))
      updateTextInput(session, "beta1", value =  ifelse(params[5]==0, "", params[5]))
      updateTextInput(session, "gama1", value =  ifelse(params[6]==0, "", params[6]))
  }
  
  
 
  
  if (type=="trigonal") {
    enable("a1")
    disable("b1")
    disable("c1")
    enable("alpha1")
    disable("beta1")
    disable("gama1")
    updateTextInput(session, "a1", value =  ifelse(params[1]==0, "", params[1]))
    updateTextInput(session, "b1", value =  ifelse(params[2]==0, "", params[2]))
    updateTextInput(session, "c1", value =  ifelse(params[3]==0, "", params[3]))
    updateTextInput(session, "alpha1", value =  ifelse(params[4]==0, "", params[4]))
    updateTextInput(session, "beta1", value =  ifelse(params[5]==0, "", params[5]))
    updateTextInput(session, "gama1", value =  ifelse(params[6]==0, "", params[6]))
  }
  
  updateTextInput(session, "pdist1", value =  dist)
  
}


