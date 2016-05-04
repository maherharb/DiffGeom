CartesianSystem <- function(session, type, params=rep(0,6)) {

  
 latticeVectors <-  matrix(c(0,0,0,0,0,0,0,0,0) , nrow=3, byrow=TRUE)
 reciprocalLatticeVectors <-  matrix(c(0,0,0,0,0,0,0,0,0) , nrow=3, byrow=TRUE)
  
  xprod <- function(a,b) {
         if(length(a)==3 && length(b)==3){
               getDet <- function(w,x,y,z) {
                   return(det(matrix(c(w,x,y,z),ncol=2)))
               }
               return(c(getDet(a[2],b[2],a[3],b[3]),-getDet(a[1],b[1],a[3],b[3]),getDet(a[1],b[1],a[2],b[2]))) 
           } else{ return(FALSE) }
  }
  
  
  if (type=="triclinic") {
    alpha = params[4]*pi/180
    beta = params[5]*pi/180
    gamma = params[6]*pi/180
    cosa = (cos(alpha)-cos(beta)*cos(gamma))/(sin(beta)*sin(gamma))
    sina = sqrt(1-cosa^2)
    latticeVectors <- matrix(c(1, 0, 0, cos(gamma), sin(gamma), 0, cos(beta), cosa*sin(beta), sina*sin(beta)), nrow=3, byrow=TRUE)
  }
  

  if (type=="tetragonal") {
      latticeVectors <- matrix(c(params[1],0,0,0,params[1],0,0,0,params[3]) , nrow=3, byrow=TRUE)
  }
  
  
  if (type=="monoclinic") {
      beta <- param[5]*pi/180;
      latticeVectors <-  matrix(c(params[1],0,0,0,params[2],0,params[3]*cos(beta),0,params[3]*sin(beta)) , nrow=3, byrow=TRUE)
  }
  
  
  if (type=="orthorhombic") {
      latticeVectors <- matrix(c(params[1],0,0,0,params[2],0,0,0,params[3]) , nrow=3, byrow=TRUE)
  }
  
  
  if (type=="hexagonal") {
    latticeVectors <- matrix(c(params[1]*sin(pi/6),-params[1]*cos(pi/6),0, params[1]*sin(pi/6),params[1]*cos(pi/6),0, 0,0,params[3] ) , nrow=3, byrow=TRUE)  
  }
  

  if (type=="cubic") {
      latticeVectors <- matrix(c(params[1],0,0,0,params[1],0,0,0,params[1]) , nrow=3, byrow=TRUE)
  }
  
 # latticeVectors <- latticeVectors/sqrt(apply(latticeVectors^2,1,sum))
  

  
   reciprocalLatticeVectors[1,] = 2*pi*xprod(latticeVectors[2,], latticeVectors[3,])/sum(latticeVectors[1,]*xprod(latticeVectors[2,],latticeVectors[3,]))
   reciprocalLatticeVectors[2,] = 2*pi*xprod(latticeVectors[3,], latticeVectors[1,])/sum(latticeVectors[1,]*xprod(latticeVectors[2,],latticeVectors[3,]))
   reciprocalLatticeVectors[3,] = 2*pi*xprod(latticeVectors[1,], latticeVectors[2,])/sum(latticeVectors[1,]*xprod(latticeVectors[2,],latticeVectors[3,]))
  
  updateTextInput(session, "x1", value =  latticeVectors[1,1])
  updateTextInput(session, "y1", value =  latticeVectors[1,2])
  updateTextInput(session, "z1", value =  latticeVectors[1,3])
  updateTextInput(session, "x2", value =  latticeVectors[2,1])
  updateTextInput(session, "y2", value =  latticeVectors[2,2])
  updateTextInput(session, "z2", value =  latticeVectors[2,3])
  updateTextInput(session, "x3", value =  latticeVectors[3,1])
  updateTextInput(session, "y3", value =  latticeVectors[3,2])
  updateTextInput(session, "z3", value =  latticeVectors[3,3])
  
  updateTextInput(session, "ix1", value =  reciprocalLatticeVectors[1,1])
  updateTextInput(session, "iy1", value =  reciprocalLatticeVectors[1,2])
  updateTextInput(session, "iz1", value =  reciprocalLatticeVectors[1,3])
  updateTextInput(session, "ix2", value =  reciprocalLatticeVectors[2,1])
  updateTextInput(session, "iy2", value =  reciprocalLatticeVectors[2,2])
  updateTextInput(session, "iz2", value =  reciprocalLatticeVectors[2,3])
  updateTextInput(session, "ix3", value =  reciprocalLatticeVectors[3,1])
  updateTextInput(session, "iy3", value =  reciprocalLatticeVectors[3,2])
  updateTextInput(session, "iz3", value =  reciprocalLatticeVectors[3,3])
}

