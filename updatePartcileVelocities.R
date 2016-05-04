updatePartcileVelocities <- function(session, particle, energy) {
  
  energy_J <- energy*1.602176565e-19
  m_e <- 9.10938356e-31
  vel_c <- 299792458
  pc <- sqrt(2*(m_e*vel_c ^2)*energy_J + energy_J^2 ) 
  vel <- pc*vel_c/ (energy_J + m_e*vel_c ^2)
  vel_beta <- vel/vel_c
  gamma <- 1/sqrt(1-vel_beta^2)


  # velocities
  if (particle=="electron") {
    updateTextInput(session, "vel_si1", value = (vel)*10^(-floor(log10(vel))) )
    updateTextInput(session, "vel_si2", value = floor(log10(vel)) )
    updateTextInput(session, "vel_beta", value = vel_beta )
    updateTextInput(session, "vel_lorentz", value = gamma )  
  }
  if (particle=="photon") {
    updateTextInput(session, "vel_si1", value = (vel_c)*10^(-floor(log10(vel_c))) )
    updateTextInput(session, "vel_si2", value = floor(log10(vel_c)) )
    updateTextInput(session, "vel_beta", value = 1 )
    updateTextInput(session, "vel_lorentz", value = 'inf' )  
  }
  
}

