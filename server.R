library(shiny)

source('updatePartcileValues.R')
source('updatePartcileVelocities.R')
source('updateCrystalValues.R')
source("updatePlanarDistance.R")
source("CartesianSystem.R")

ds <- read.csv("crystals.csv", header=TRUE)

# Define server logic required to draw a histogram
shinyServer(function(input, output, clientData, session) {
  
  output$crystalList <- renderUI({
    selectInput("crystalList", NULL, choices = as.character(ds[,1]))
  })
  
  observeEvent(input$param_val1, {updatePartcileValues(session, input$particle, as.numeric(input$param_val1), as.numeric(input$param_val2), input$units, input$param_type)})
  observeEvent(input$param_val2, {updatePartcileValues(session, input$particle, as.numeric(input$param_val1), as.numeric(input$param_val2), input$units, input$param_type)})
  observeEvent(input$units, {updatePartcileValues(session, input$particle, as.numeric(input$param_val1), as.numeric(input$param_val2), input$units, input$param_type)})
  
  observeEvent(input$particle, {
      if(input$particle == "electron") {
        updateSelectInput(session, "param_type", label="Define by:", list("Energy" = "energy", "Wavelength" = "wavelength", "Velocity" = "velocity"))
      } else {
        updateSelectInput(session, "param_type", label="Define by:", list("Energy" = "energy", "Wavelength" = "wavelength"))
      }
      updatePartcileValues(session, input$particle, as.numeric(input$param_val1), as.numeric(input$param_val2), input$units, input$param_type)
  })
  
  
  observeEvent(input$param_type, {
    if(input$param_type == "energy") {
      updateSelectInput(session, "units", label = NULL, choices = c("eV", "J"))
    } else if(input$param_type == "wavelength") {
      updateSelectInput(session, "units", label = NULL, choices = c("m", "\u212b"))
    } else {
      updateSelectInput(session, "units", label = NULL, choices = c("m/s", "c"))
    }
   # updatePartcileValues(session, input$particle, as.numeric(input$param_val1), as.numeric(input$param_val2), input$units, input$param_type)
  })
  
  
   observeEvent(input$crystalList, {    
    cryst <- ds[ds$name==input$crystalList,]
    updateSelectInput(session, "crystalType", selected=cryst$type)
    
    if (input$crystalList=="(custom)") { enable("crystalType") } else { disable ("crystalType")}
    updateCrystalValues(session, input$crystalType, as.numeric(cryst[1,3:8]), c(as.numeric(input$h1), as.numeric(input$k1), as.numeric(input$l1)))
 
   })
  
  observeEvent(input$crystalType, {
    cryst <- ds[ds$name==input$crystalList,]
    updateCrystalValues(session, input$crystalType, as.numeric(cryst[1,3:8]), c(as.numeric(input$h1), as.numeric(input$k1), as.numeric(input$l1)))

    # updateTextInput(session, "pdist1", value =  as.character(input$h2))
    
  })
  
  
  observeEvent(input$h1, {
    params <- c(as.numeric(input$a1), as.numeric(input$b1), as.numeric(input$c1),
                as.numeric(input$alpha1), as.numeric(input$beta1), as.numeric(input$gama1))
    updatePlanarDistance(session, input$crystalType, params, c(as.numeric(input$h1), as.numeric(input$k1), as.numeric(input$l1)))
  })
  
  observeEvent(input$k1, {
    params <- c(as.numeric(input$a1), as.numeric(input$b1), as.numeric(input$c1),
                as.numeric(input$alpha1), as.numeric(input$beta1), as.numeric(input$gama1))
    updatePlanarDistance(session, input$crystalType, params, c(as.numeric(input$h1), as.numeric(input$k1), as.numeric(input$l1)))
  })
  
  observeEvent(input$l1, {
    params <- c(as.numeric(input$a1), as.numeric(input$b1), as.numeric(input$c1),
                as.numeric(input$alpha1), as.numeric(input$beta1), as.numeric(input$gama1))
    updatePlanarDistance(session, input$crystalType, params, c(as.numeric(input$h1), as.numeric(input$k1), as.numeric(input$l1)))
  })
   
  observeEvent(input$a1, {
    params <- c(as.numeric(input$a1), as.numeric(input$b1), as.numeric(input$c1),
                as.numeric(input$alpha1), as.numeric(input$beta1), as.numeric(input$gama1))
    updatePlanarDistance(session, input$crystalType, params, c(as.numeric(input$h1), as.numeric(input$k1), as.numeric(input$l1)))
    CartesianSystem(session, input$crystalType, params)
  })
  
  observeEvent(input$b1, {
    params <- c(as.numeric(input$a1), as.numeric(input$b1), as.numeric(input$c1),
                as.numeric(input$alpha1), as.numeric(input$beta1), as.numeric(input$gama1))
    updatePlanarDistance(session, input$crystalType, params, c(as.numeric(input$h1), as.numeric(input$k1), as.numeric(input$l1)))
  })
  
  observeEvent(input$c1, {
    params <- c(as.numeric(input$a1), as.numeric(input$b1), as.numeric(input$c1),
                as.numeric(input$alpha1), as.numeric(input$beta1), as.numeric(input$gama1))
    updatePlanarDistance(session, input$crystalType, params, c(as.numeric(input$h1), as.numeric(input$k1), as.numeric(input$l1)))
  })
  
  observeEvent(input$alpha1, {
    params <- c(as.numeric(input$a1), as.numeric(input$b1), as.numeric(input$c1),
                as.numeric(input$alpha1), as.numeric(input$beta1), as.numeric(input$gama1))
    updatePlanarDistance(session, input$crystalType, params, c(as.numeric(input$h1), as.numeric(input$k1), as.numeric(input$l1)))
  })
  
  observeEvent(input$beta1, {
    params <- c(as.numeric(input$a1), as.numeric(input$b1), as.numeric(input$c1),
                as.numeric(input$alpha1), as.numeric(input$beta1), as.numeric(input$gama1))
    updatePlanarDistance(session, input$crystalType, params, c(as.numeric(input$h1), as.numeric(input$k1), as.numeric(input$l1)))
  })
  
  observeEvent(input$gama1, {
    params <- c(as.numeric(input$a1), as.numeric(input$b1), as.numeric(input$c1),
                as.numeric(input$alpha1), as.numeric(input$beta1), as.numeric(input$gama1))
    updatePlanarDistance(session, input$crystalType, params, c(as.numeric(input$h1), as.numeric(input$k1), as.numeric(input$l1)))
    CartesianSystem(session, input$crystalType, params)
  })
  
  
  })

  
  
  
  #observeEvent(input$vel_si1, {updatePartcileValues(session, input$particle, as.numeric(input$eng_gev)*1e9, "vel")})
  
 #  observeEvent(input$vel_si2, {updatePartcileValues(session, input$particle, as.numeric(input$eng_gev)*1e9, "vel")})
  
  #  observeEvent(input$vel_beta, {updatePartcileValues(session, input$particle, as.numeric(input$vel_beta)*299792458, "vel")})
  
  
#  observeEvent(input$eng_j1, {updatePartcileValues(session, input$particle, as.numeric(input$eng_j1)*10^as.numeric(input$eng_j2)*6.241509e18)})
  
#  observeEvent(input$eng_j2, {updatePartcileValues(session, input$particle, as.numeric(input$eng_j1)*10^as.numeric(input$eng_j2)*6.241509e18)})
  



