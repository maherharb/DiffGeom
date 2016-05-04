library(shiny)
library(shinyjs)

# runApp("00-base") # This command though highlighted out makes it easy 
# makes it easy to run the code from the R console.

# This is a UI page with three panels
threepage <- function(headerPanel,left, middle, right) {
  bootstrapPage(div(class = "container-fluid", div(class = "row-fluid", 
                                                   headerPanel), div(class = "row-fluid", left,  middle, right)))}


# Define UI for miles per gallon application
ui <- shinyUI(threepage(
  
  headerPanel=headerPanel("electron & x-ray diffraction cheat-sheet (ver 0.1)"),
  
  
  left=sidebarPanel(
  
    
    useShinyjs(),
      
    h3("Particle-wave"),
    
    selectInput("particle", label=NULL,
                list("Electron" = "electron", 
                     "Photon" = "photon")), 
    HTML("<hr>"),
    
    
    
    selectInput("param_type", label="Define by:", list("Energy" = "energy", "Wavelength" = "wavelength", "Velocity" = "velocity")), 
    
    tags$table(
      border="0",
      cellpadding="2",
      cellspacing="6",
      tags$tr(
        tags$td(textInput(inputId="param_val1", label=NULL, value = 100)),
        tags$td(disabled(textInput(inputId="param_val3", label=NULL, value = "E"))),
        tags$td(textInput(inputId="param_val2", label=NULL, value = 3)),
        tags$td(selectInput("units", label=NULL, list("eV" = "eV", "J" = "J"), width="100px"))
      )
    ),
    
    tags$head(tags$style(type="text/css", "#param_val1 {width: 100px; height: 34px;}")),
    tags$head(tags$style(type="text/css", "#param_val2 {width: 100px; height: 34px;}")),
    tags$head(tags$style(type="text/css", "#param_val3 {width: 50px; height: 34px;}")),
    tags$style(type='text/css', ".selectize-input { margin-top: 6px;}"),
    
    HTML("<hr>"),
    
    h5("Energy:"),
    
    
    tags$table(
      border="0",
      cellpadding="2",
      cellspacing="6",
      tags$tr(
        tags$td(disabled(textInput(inputId="eng_ev", label=NULL))),
        tags$td(disabled(textInput(inputId="eng_ev2", label=NULL, value = "eV"))),   
        tags$td(HTML("&nbsp;&nbsp;")),
        tags$td(disabled(textInput(inputId="eng_kev", label=NULL))),
        tags$td(disabled(textInput(inputId="eng_kev2", label=NULL, value = "KeV")))     
      )),
    
    tags$table(
      border="0",
      cellpadding="2",
      cellspacing="6",
      tags$tr(
        tags$td(disabled(textInput(inputId="eng_mev", label=NULL))),
        tags$td(disabled(textInput(inputId="eng_mev2", label=NULL, value = "MeV"))),  
        tags$td(HTML("&nbsp;&nbsp;")),
        tags$td(disabled(textInput(inputId="eng_gev", label=NULL))),
        tags$td(disabled(textInput(inputId="eng_gev2", label=NULL, value = "GeV")))
      )),
    
    
    tags$table(
      border="0",
      cellpadding="2",
      cellspacing="6",
      tags$tr(
        tags$td(disabled(textInput(inputId="eng_j1", label=NULL))),
        tags$td(disabled(textInput(inputId="eng_j4", label=NULL, value= "J")))
      )),

    tags$head(tags$style(type="text/css", "#eng_ev {width: 100px}")),
    tags$head(tags$style(type="text/css", "#eng_kev {width: 100px}")),
    tags$head(tags$style(type="text/css", "#eng_mev {width: 100px}")),
    tags$head(tags$style(type="text/css", "#eng_gev {width: 100px}")),
    tags$head(tags$style(type="text/css", "#eng_ev2 {width: 60px}")),
    tags$head(tags$style(type="text/css", "#eng_kev2 {width: 60px}")),
    tags$head(tags$style(type="text/css", "#eng_mev2 {width: 60px}")),
    tags$head(tags$style(type="text/css", "#eng_gev2 {width: 60px}")),
    tags$head(tags$style(type="text/css", "#eng_j1 {width: 100px}")),
    tags$head(tags$style(type="text/css", "#eng_j4 {width: 60px}")),
    HTML("<hr>"),
    
    h5("Wavelength:"),
    
    tags$table(
      border="0",
      cellpadding="2",
      cellspacing="6",
      tags$tr(
        tags$td(disabled(textInput(inputId="wl_pm", label=NULL))),
        tags$td(disabled(textInput(inputId="wl_pm2", label=NULL, value = "pm"))),
        tags$td(HTML("&nbsp;&nbsp;")),
        tags$td(disabled(textInput(inputId="wl_A", label=NULL))),
        tags$td(disabled(textInput(inputId="wl_A2", label=NULL, value = "\u212b")))
      )),
    
    tags$table(
      border="0",
      cellpadding="2",
      cellspacing="6",
      tags$tr(
        tags$td(disabled(textInput(inputId="wl_nm", label=NULL))),
        tags$td(disabled(textInput(inputId="wl_nm2", label=NULL, value = "nm"))),  
        tags$td(HTML("&nbsp;&nbsp;")),
        tags$td(disabled(textInput(inputId="wl_m", label=NULL))),
        tags$td(disabled(textInput(inputId="wl_m2", label=NULL, value = "m")))
        
      )),
    
    
    tags$head(tags$style(type="text/css", "#wl_A {width: 100px}")),
    tags$head(tags$style(type="text/css", "#wl_A2 {width: 60px}")),
    tags$head(tags$style(type="text/css", "#wl_m {width: 100px}")),
    tags$head(tags$style(type="text/css", "#wl_m2 {width: 60px}")),
    tags$head(tags$style(type="text/css", "#wl_nm {width: 100px}")),
    tags$head(tags$style(type="text/css", "#wl_nm2 {width: 60px}")),
    tags$head(tags$style(type="text/css", "#wl_pm {width: 100px}")),
    tags$head(tags$style(type="text/css", "#wl_pm2 {width: 60px}")),
    
    
    HTML("<hr>"),
    
   h5("Velocity:"), 
   
   tags$table(
     border="0",
     cellpadding="2",
     cellspacing="6",
   tags$tr(
     tags$td(disabled(textInput(inputId="vel_si1", label=NULL))),
     tags$td(disabled(textInput(inputId="vel_si4", label=NULL, value="m/s" ))),
     tags$td(HTML("&nbsp;&nbsp;")),
     tags$td(disabled(textInput(inputId="vel_beta", label=NULL ))),
     tags$td(disabled(textInput(inputId="vel_beta2", label=NULL, value="c")))
   )),
   
   tags$table(
     border="0",
     cellpadding="2",
     cellspacing="6",
     tags$tr(
       tags$td(disabled(textInput(inputId="vel_lorentz", label=NULL))),
       tags$td(disabled(textInput(inputId="vel_lorentz2", label=NULL, value = "(Lorentz factor)")))
     )),
   
   
   tags$head(tags$style(type="text/css", "#vel_si1 {width: 100px}")),
   tags$head(tags$style(type="text/css", "#vel_si4 {width: 60px}")),
   tags$head(tags$style(type="text/css", "#vel_beta {width: 100px}")),
   tags$head(tags$style(type="text/css", "#vel_beta2 {width: 60px}")),
   tags$head(tags$style(type="text/css", "#vel_lorentz {width: 100px}")),
   tags$head(tags$style(type="text/css", "#vel_lorentz2 {width: 230px}")),
    

    HTML("<hr>"),
   
 
   
   
    # Display the total number of hits on the app.
    h5(textOutput("hits"))
    
    # HTML code can be input directly into the user interface.
    # In this case <hr> inserts a (barely visible) line
    # heading tags are used to indicate different text styles
    #  customized by customizing CSS syle sheets.

    
  

  ), # End Side Bar Panel Code
  
  # Middle PANEL ----------------------------------------------
  # By listing the mainPanel first we move the sidebar to 
  #    the right side of the screen.
  middle= sidebarPanel(
      h3("Crystal"),
      
      uiOutput("crystalList"),
      
      HTML("<hr>"),
      
      
      selectInput("crystalType", label="Type:",
                 list("cubic"="cubic", "tetragonal"="tetragonal", "orthorhombic"="orthorhombic",
                      "monoclinic"="monoclinic", "triclinic"="triclinic", "trigonal"="trigonal", 
                      "hexagonal"="hexagonal" )), 
  
      HTML("<hr>"),
      
      h5("Lattice parameters (\u212bngstroms, degrees):"),
      
      tags$table(
        border="0",
        cellpadding="2",
        cellspacing="6",
        tags$tr(
          tags$td(disabled(textInput(inputId="a2", label=NULL, value = "a"))),
          tags$td(textInput(inputId="a1", label=NULL)),
          tags$td(HTML("&nbsp;&nbsp;")),
          tags$td(disabled(textInput(inputId="b2", label=NULL, value = "b"))),
          tags$td(textInput(inputId="b1", label=NULL)),
          tags$td(HTML("&nbsp;&nbsp;")),
          tags$td(disabled(textInput(inputId="c2", label=NULL, value = "c"))),
          tags$td(textInput(inputId="c1", label=NULL))
        )),
      
      tags$table(
        border="0",
        cellpadding="2",
        cellspacing="6",
        tags$tr(
          tags$td(disabled(textInput(inputId="alpha2", label=NULL, value = "alpha"))),
          tags$td(textInput(inputId="alpha1", label=NULL)),
          tags$td(HTML("&nbsp;&nbsp;")),
          tags$td(disabled(textInput(inputId="beta2", label=NULL, value = "beta"))),
          tags$td(textInput(inputId="beta1", label=NULL)),
          tags$td(HTML("&nbsp;&nbsp;")),
          tags$td(disabled(textInput(inputId="gama2", label=NULL, value = "gamma"))),
          tags$td(textInput(inputId="gama1", label=NULL))
        )),
      
      
      tags$head(tags$style(type="text/css", "#a1 {width: 100px}")),
      tags$head(tags$style(type="text/css", "#a2 {width: 80px}")),
      tags$head(tags$style(type="text/css", "#b1 {width: 100px}")),
      tags$head(tags$style(type="text/css", "#b2 {width: 80px}")),
      tags$head(tags$style(type="text/css", "#c1 {width: 100px}")),
      tags$head(tags$style(type="text/css", "#c2 {width: 80px}")),
      tags$head(tags$style(type="text/css", "#alpha1 {width: 100px}")),
      tags$head(tags$style(type="text/css", "#alpha2 {width: 80px}")),
      tags$head(tags$style(type="text/css", "#beta1 {width: 100px}")),
      tags$head(tags$style(type="text/css", "#beta2 {width: 80px}")),
      tags$head(tags$style(type="text/css", "#gama1 {width: 100px}")),
      tags$head(tags$style(type="text/css", "#gama2 {width: 80px}")),
      
      HTML("<hr>"),
      
      tags$table(
        border="0",
        cellpadding="2",
        cellspacing="6",
        tags$tr(
          tags$td("Reflection indices:", colspan=8)
        ),
        tags$tr(
          tags$td(disabled(textInput(inputId="h2", label=NULL, value = "h"))),
          tags$td(textInput(inputId="h1", label=NULL, value = 1)),
          tags$td(HTML("&nbsp;&nbsp;")),
          tags$td(disabled(textInput(inputId="k2", label=NULL, value = "k"))),
          tags$td(textInput(inputId="k1", label=NULL, value = 0)),
          tags$td(HTML("&nbsp;&nbsp;")),
          tags$td(disabled(textInput(inputId="l2", label=NULL, value = "l"))),
          tags$td(textInput(inputId="l1", label=NULL, value = 0))
        )),
      
      tags$head(tags$style(type="text/css", "#h1 {width: 100px}")),
      tags$head(tags$style(type="text/css", "#h2 {width: 80px}")),
      tags$head(tags$style(type="text/css", "#k1 {width: 100px}")),
      tags$head(tags$style(type="text/css", "#k2 {width: 80px}")),
      tags$head(tags$style(type="text/css", "#l1 {width: 100px}")),
      tags$head(tags$style(type="text/css", "#l2 {width: 80px}")),
      

      tags$table(
        border="0",
        cellpadding="2",
        cellspacing="6",
        tags$tr(
          tags$td("Surface normal:", colspan=8)
        ),
        tags$tr(
          tags$td(disabled(textInput(inputId="hh2", label=NULL, value = "h"))),
          tags$td(textInput(inputId="hh1", label=NULL, value = 1)),
          tags$td(HTML("&nbsp;&nbsp;")),
          tags$td(disabled(textInput(inputId="kk2", label=NULL, value = "k"))),
          tags$td(textInput(inputId="kk1", label=NULL, value = 0)),
          tags$td(HTML("&nbsp;&nbsp;")),
          tags$td(disabled(textInput(inputId="ll2", label=NULL, value = "l"))),
          tags$td(textInput(inputId="ll1", label=NULL, value = 0))
        )),
      
      tags$head(tags$style(type="text/css", "#hh1 {width: 100px}")),
      tags$head(tags$style(type="text/css", "#hh2 {width: 80px}")),
      tags$head(tags$style(type="text/css", "#kk1 {width: 100px}")),
      tags$head(tags$style(type="text/css", "#kk2 {width: 80px}")),
      tags$head(tags$style(type="text/css", "#ll1 {width: 100px}")),
      tags$head(tags$style(type="text/css", "#ll2 {width: 80px}")),
      
      HTML("<hr>"),
      
      tags$table(
        border="0",
        cellpadding="2",
        cellspacing="6",
        tags$tr(
          tags$td("Planar distance (\u212b):", colspan=3),
          tags$td("Scattering vector (1/\u212b):", colspan=5)
        ),
        tags$tr(
          tags$td(disabled(textInput(inputId="pdist3", label=NULL, value = "d"))),
          tags$td(disabled(textInput(inputId="pdist1", label=NULL))),
    #      tags$td(disabled(textInput(inputId="pdist2", label=NULL, value = "\u212b")) ),
          tags$td(HTML("&nbsp;&nbsp;")),
          tags$td(disabled(textInput(inputId="svect5", label=NULL, value = "1/d"))),       
          tags$td(disabled(textInput(inputId="svect1", label=NULL))),
     #     tags$td(disabled(textInput(inputId="svect2", label=NULL, value = "1/\u212b")) ),
          tags$td(HTML("&nbsp;&nbsp;")),
          tags$td(disabled(textInput(inputId="svect6", label=NULL, value = "2pi/d"))),   
          tags$td(disabled(textInput(inputId="svect3", label=NULL)))
      #    tags$td(disabled(textInput(inputId="svect4", label=NULL, value = "1/\u212b")) )
          
        )),
      tags$head(tags$style(type="text/css", "#pdist1 {width: 100px}")),
    #  tags$head(tags$style(type="text/css", "#pdist2 {width: 60px}")),
      tags$head(tags$style(type="text/css", "#pdist3 {width: 80px}")),
      tags$head(tags$style(type="text/css", "#svect1 {width: 100px}")),
    #  tags$head(tags$style(type="text/css", "#svect2 {width: 60px}")),
      tags$head(tags$style(type="text/css", "#svect3 {width: 100px}")),
    #  tags$head(tags$style(type="text/css", "#svect4 {width: 60px}")),
      tags$head(tags$style(type="text/css", "#svect5 {width: 80px}")),
      tags$head(tags$style(type="text/css", "#svect6 {width: 80px}")),
     
      
      HTML("<hr>"),
      
    
    tags$table(
      border="0",
      cellpadding="2",
      cellspacing="6",
      tags$tr(
        tags$td("Lattice vectors:", colspan=4),
        tags$td("Reciprocal lattice vectors:", colspan=3)
      ),
      tags$tr(
        tags$td(disabled(textInput(inputId="x1", label=NULL))),
        tags$td(disabled(textInput(inputId="y1", label=NULL))),
        tags$td(disabled(textInput(inputId="z1", label=NULL))),
        tags$td(HTML("&nbsp;&nbsp;")),
        tags$td(disabled(textInput(inputId="ix1", label=NULL))),
        tags$td(disabled(textInput(inputId="iy1", label=NULL))),
        tags$td(disabled(textInput(inputId="iz1", label=NULL)))
      ),
      tags$tr(
        tags$td(disabled(textInput(inputId="x2", label=NULL))),
        tags$td(disabled(textInput(inputId="y2", label=NULL))),
        tags$td(disabled(textInput(inputId="z2", label=NULL))),
        tags$td(HTML("&nbsp;&nbsp;")),
        tags$td(disabled(textInput(inputId="ix2", label=NULL))),
        tags$td(disabled(textInput(inputId="iy2", label=NULL))),
        tags$td(disabled(textInput(inputId="iz2", label=NULL)))
      ),   
      tags$tr(
        tags$td(disabled(textInput(inputId="x3", label=NULL))),
        tags$td(disabled(textInput(inputId="y3", label=NULL))),
        tags$td(disabled(textInput(inputId="z3", label=NULL))),
        tags$td(HTML("&nbsp;&nbsp;")),
        tags$td(disabled(textInput(inputId="ix3", label=NULL))),
        tags$td(disabled(textInput(inputId="iy3", label=NULL))),
        tags$td(disabled(textInput(inputId="iz3", label=NULL)))
      )),
      
    tags$head(tags$style(type="text/css", "#x1 {width: 100px}")),
    tags$head(tags$style(type="text/css", "#y1 {width: 100px}")),
    tags$head(tags$style(type="text/css", "#z1 {width: 100px}")),
    tags$head(tags$style(type="text/css", "#x2 {width: 100px}")),
    tags$head(tags$style(type="text/css", "#y2 {width: 100px}")),
    tags$head(tags$style(type="text/css", "#z2 {width: 100px}")),
    tags$head(tags$style(type="text/css", "#x3 {width: 100px}")),
    tags$head(tags$style(type="text/css", "#y3 {width: 100px}")),
    tags$head(tags$style(type="text/css", "#z3 {width: 100px}")),
    tags$head(tags$style(type="text/css", "#ix1 {width: 100px}")),
    tags$head(tags$style(type="text/css", "#iy1 {width: 100px}")),
    tags$head(tags$style(type="text/css", "#iz1 {width: 100px}")),
    tags$head(tags$style(type="text/css", "#ix2 {width: 100px}")),
    tags$head(tags$style(type="text/css", "#iy2 {width: 100px}")),
    tags$head(tags$style(type="text/css", "#iz2 {width: 100px}")),
    tags$head(tags$style(type="text/css", "#ix3 {width: 100px}")),
    tags$head(tags$style(type="text/css", "#iy3 {width: 100px}")),
    tags$head(tags$style(type="text/css", "#iz3 {width: 100px}"))   
    
    
    
      
      
    ) # End middle panel code
  ,   
  
  right=  sidebarPanel(
    h3("Diffraction"),
      # Can easily be accomplished by listing them sequentially    
      
      plotOutput("mpgPlot2", width="100%", height="200px"),
      plotOutput("mpgPlot3", width="100%", height="200px")

  )    # End right panel code
  

))



