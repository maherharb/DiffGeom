updatePartcileValues <- function(session, particle, param.value1, param.value2, param.unit, param.type) {

  m_e <- 9.10938356e-31
  vel_c <- 299792458
  J_to_eV <- 1.602176565e-19
  planck <- 6.62607004e-34
  
  if (param.type=='energy') {
      energy_eV <- param.value1*10^(param.value2)
      if (param.unit=="eV") { energy_J <- energy_eV*J_to_eV }
      if (param.unit=="J") { energy_J <- energy_eV; energy_eV<- energy_eV/1.602176565e-19 }
      if (particle=="electron") {
          pc <- sqrt(2*(m_e*vel_c ^2)*energy_J + energy_J^2 ) 
          vel <- pc*vel_c/ (energy_J + m_e*vel_c ^2)
          vel_beta <- vel/vel_c
          gamma <- 1/sqrt(1-vel_beta^2)
          wavel <- planck*vel_c/pc
      } else { # photon
        vel <- vel_c
        vel_beta <- vel/vel_c
        gamma <- 1/sqrt(1-vel_beta^2)
        wavel <- planck*vel_c/energy_J
      }
  }
  
  if (param.type=='wavelength') {
      wavel <- param.value1*10^(param.value2)
    if (param.unit!="m") {  wavel <- wavel*1e-10 }
    if (particle=="electron") {
        pc <- planck*vel_c/wavel
        energy_total <- sqrt(pc^2 + m_e^2*vel_c^4)
        energy_J <- energy_total - m_e*vel_c ^2
        vel <- pc*vel_c/ (energy_J + m_e*vel_c ^2)
    } else { # photon
        vel <- vel_c
        energy_J <- planck*vel_c/wavel
        wavel <- planck*vel_c/energy_J
    }
    energy_eV <- energy_J/J_to_eV
    vel_beta <- vel/vel_c
    gamma <- 1/sqrt(1-vel_beta^2)
  }
  
  if (param.type=='velocity') {
    if (particle=="electron") {
        vel <- param.value1*10^(param.value2)
        if (param.unit=="c") { 
            vel_beta <- vel
            vel <- vel*vel_c 
        } else {  
            vel_beta <- vel/vel_c
        }
       
         gamma <- 1/sqrt(1-vel_beta^2)
        pc <- m_e*vel*gamma*vel_c
        energy_total <- pc*vel_c/vel
        energy_J <- energy_total - m_e*vel_c ^2
        energy_eV <- energy_J/J_to_eV
        wavel <- planck*vel_c/pc
    } else { # photon
      
    }
  }
    
  
  # energies
  updateTextInput(session, "eng_ev", value = format(energy_eV, digits=4))
  updateTextInput(session, "eng_kev", value = format(energy_eV/1e3, digits=4))
  updateTextInput(session, "eng_mev", value = format(energy_eV/1e6, digits=4))
  updateTextInput(session, "eng_gev", value = format(energy_eV/1e9, digits=4))
  updateTextInput(session, "eng_j1", value = format(energy_J, digits=4))
  updateTextInput(session, "wl_A", value = format(wavel*1e10, digits=4))
  updateTextInput(session, "wl_m", value = format(wavel, digits=4))
  updateTextInput(session, "wl_nm", value = format(wavel*1e9, digits=4))
  updateTextInput(session, "wl_pm", value = format(wavel*1e12, digits=4))
  
 #  updateTextInput(session, "vel_lorentz", value = particle )  
  
  # velocities
  if (particle=="electron") {
    updateTextInput(session, "vel_si1", value = format(vel, digits=4) )
    updateTextInput(session, "vel_beta", value = format(round(vel_beta, 3), nsmall = 3)  )
    updateTextInput(session, "vel_lorentz", value = format(round(gamma, 3), nsmall = 3) )  
  }
  if (particle=="photon") {
    updateTextInput(session, "vel_si1", value = format(vel_c, digits=4) )
    updateTextInput(session, "vel_beta", value = 1 )
    updateTextInput(session, "vel_lorentz", value = 'inf' )  
  }
  
}

