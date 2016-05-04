updatePlanarDistance <- function(session, type, params=rep(0,6), reflection=c(1,0,0)) {

  
  dist <- 0
    
  if (type=="monoclinic") {
      beta = params[5]*pi/180;
      dist <- (((reflection[1]^2/params[1]^2+reflection[3]^2/params[3]^2-2*reflection[1]*reflection[3]*cos(beta)/(params[1]*params[3]))/(sin(beta)^2))+reflection[2]^2/params[2]^2)^-0.5
  } else if (type=="orthorhombic") {
      dist <- (reflection[1]^2/params[1]^2+reflection[2]^2/params[2]^2+reflection[3]^2/params[3]^2)^-0.5
  } else if (type=="tetragonal") {
      dist <-  ((reflection[1]^2+reflection[2]^2)/params[1]^2+reflection[3]^2/params[3]^2)^-0.5
  } else if (type=="cubic") {
      dist <- ((reflection[1]^2+reflection[2]^2+reflection[3]^2)/params[1]^2)^-0.5
  } else if (type=="hexagonal") {
      dist <- (4/3*((reflection[1]^2+reflection[1]*reflection[2]+reflection[2]^2)/params[1]^2)+reflection[3]^2/params[3]^2)^-0.5
  } else if (type=="triclinic") {
    
  } else { # trigonal
  }
  
  updateTextInput(session, "pdist1", value = ifelse(is.na(dist), "", format(dist,3)) )
  updateTextInput(session, "svect1", value = ifelse(is.na(dist), "", format(1/dist,3)) )
  updateTextInput(session, "svect3", value = ifelse(is.na(dist), "", format(2*pi/dist,3)) )
  
}


