library(shiny)
library(shinydashboard)
library(shinyWidgets)

source("C:/FACULTAD/4 to/MODELOS LINEALES GENERALIZADOS/TP/Datos para cirrhosis/descriptiva.R")

cabeza <- dashboardHeader()
menu <- dashboardSidebar(
  sidebarMenu(
    menuItem(tabName = "intro","Introducción",icon = icon("circle-info")),
    menuItem(tabName = "descriptiva", "Descriptiva",icon = icon("chart-line"),
             menuSubItem(tabName = "respuesta","Respuesta"),
             menuSubItem(tabName = "bilirrubina","Bilirrubina"),
             menuSubItem(tabName = "spiders","Arañas vasculares"),
             menuSubItem(tabName = "stage","Etapa de la enfermedad"),
             menuSubItem(tabName = "alk","Fosfatasa alcalina")
             ),
    menuItem("Modelización", icon = icon("circle-up"),
             menuSubItem(tabName = "modelo", "Modelo"),
             menuSubItem(tabName = "interpretacion", "Interpretaciones"),
             menuItem("Adecuación del modelo",
                      menuSubItem(tabName = "fcenlace","Función de enlace"),
                      menuSubItem(tabName = "residuos","Residuos")),
             menuSubItem(tabName = "cap_predict","Capacidad predictiva")
             )
  )
)


cuerpo <- dashboardBody(
  tabItems(
    tabItem(tabName = "intro",
            fluidRow(column(1),box(width = 10,img(src = "Introduccion.jpg"))
                     )),
     tabItem(tabName = "respuesta",
            fluidRow(box(
              width = 12, status = "primary",plotOutput("graf_resp")))),
    tabItem(tabName = "spiders",
            fluidRow(
              box(
                width = 12,status = "primary",
                fluidRow(
                  box(width = 6,plotOutput("graf_spiders")),
                  box(width = 6,plotOutput("graf_spiders_2"))
                ),
                fluidRow(
                  box(width = 12,plotOutput("graf_spiders_3"))
                )
              )
            )),
    tabItem(tabName = "bilirrubina",
            fluidRow(
              box(width = 12,status = "primary",
                  fluidRow(box(width = 12,plotOutput("graf_bilirrubina"))),
                  fluidRow(
                    column(4),
                    column(4,tableOutput("tabla_bilirrubina_1")),
                    column(4)
                  ))),
            fluidRow(
              box(width = 12,status = "primary",
                  fluidRow(box(width = 12,plotOutput("graf_bilirrubina_resp"))),
                  fluidRow(
                    column(4),
                    column(4,tableOutput("tabla_bilirrubina_2")),
                    column(4)
                  )))),
    tabItem(tabName = "stage",
            fluidRow(box(width = 12,status = "primary",
                         fluidRow(
                           box(width = 6,plotOutput("graf_stage")),
                           box(width = 6,plotOutput("graf_stage_2"))
                         ),
                         fluidRow(box(width = 12,plotOutput("graf_stage_3")))
                         ))),
    tabItem(tabName = "alk",
            fluidRow(box(width = 12,status = "primary",
                         fluidRow(box(width = 12,plotOutput("graf_alk"))),
                         fluidRow(
                           column(4),
                           column(4,tableOutput("tabla_alk_1")),
                           column(4)
                         )
                         )),
            fluidRow(box(width = 12,status = "primary",
                         fluidRow(box(width = 12,plotOutput("grafico_alk"))),
                         fluidRow(
                           column(3),
                           column(5,tableOutput("tabla_alk_2")),
                           column(4)
                         )
            ))),
    tabItem(tabName = "modelo",
            fluidRow(
              column(1),
              column(10,box(width = 12,status = "primary",img(src="modelo.jpg"),
                            title = "MODELO DE REGRESIÓN LOGÍSTICA",solidHeader = T)),
              column(1)
            )),
    tabItem(tabName = "interpretacion",
            fluidRow(
              box(width = 6, background = "black", height = 160,  title = "ARAÑAS VASCULARES",
                  column(7,"La chance de presentar agrandamiento del hígado por encima de su 
                  tamaño normal en pacientes con cirrosis es dos veces mayor para los 
                  que presentan arañas vasculares."),
                  column(5, valueBox("100%",  "",
                                     icon = icon("list"),width = 12))
                  
                  ),
              box(width = 6, background = "black", height = 160, title = "FOSFATASA ALCALINA",
                  column(7,"La chance de presentar agrandamiento del hígado por encima de su 
                  tamaño normal en pacientes con cirrosis aumenta en un 12% cuando la fosfatasa 
                  alcalina aumenta en 1000 unidades por litro. "),
                  column(5,valueBox("12%",  "",
                                    icon = icon("list"),width = 12))
                  )),
            fluidRow(
              box(width = 12,background = "black", title = "BILIRRUBINA",
                  fluidRow(
                    box(width = 6,background = "black", title = "Primera etapa de la enfermedad",
                        column(7,"la chance de presentar agrandamiento del hígado por encima de su 
                             tamaño normal aumenta en un 55% cuando la bilirrubina sérica aumenta 
                             en 1 miligramo por decilitro de sangre"),
                        column(5,valueBox("55%",  "", icon = icon("list"),width = 12))),
                    box(width = 6,background = "black", title = "Segunda etapa de la enfermedad",
                        column(7,"la chance de presentar agrandamiento del hígado por encima de su 
                             tamaño normal aumenta en un 35% cuando la bilirrubina sérica aumenta 
                             en 1 miligramo por decilitro de sangre"),
                        column(5,valueBox("35%",  "", icon = icon("list"),width = 12)))
                  ),
                  fluidRow(
                    box(width = 6,background = "black", title = "Tercera etapa de la enfermedad",
                        column(7,"la chance de presentar agrandamiento del hígado por encima de su 
                             tamaño normal aumenta en un 17% cuando la bilirrubina sérica aumenta 
                             en 1 miligramo por decilitro de sangre"),
                        column(5,valueBox("17%",  "", icon = icon("list"),width = 12))),
                    box(width = 6,background = "black", title = "Cuarta etapa de la enfermedad",
                        column(7,"la chance de presentar agrandamiento del hígado por encima de su 
                             tamaño normal aumenta en un 1% cuando la bilirrubina sérica aumenta 
                             en 1 miligramo por decilitro de sangre"),
                        column(5,valueBox("1%",  "", icon = icon("list"),width = 12)))
                  )))),
    tabItem(tabName = "fcenlace",
            fluidRow(box(width = 12, status = "primary",
                         fluidRow(
                           box(width = 6, img(src = "residuos vs predichos.png")),
                           box(width = 6, img(src = "z vs nu.png"))
                         ),
                         fluidRow(
                           column(4),
                           column(4,infoBox(title = "Test RV",0.8539,subtitle = "P_value",width = 8)),
                           column(4)
                         )))),
    tabItem(tabName = "residuos",
            fluidRow(
              box(width = 12, status = "primary",
                  fluidRow(
                    box(width = 6, height = 400, img(src = "residuos cuantil.png")),
                    box(width = 6, height = 400, img(src = "qqplot residuos.png"))
                  ),
                  fluidRow(
                    column(4),
                    column(4,infoBox("Test H-L",0.8254,subtitle = "P_value",width = 8)),
                    column(4)
                  )
                  
                  )
            )
            ),
    tabItem(tabName = "cap_predict",
            fluidRow(
              box(width = 7, status = "primary", solidHeader = T, title = "Curva ROC",
                  img(src = "roc.png")),
              box(width = 5, status = "primary", solidHeader = T, title = "Especificidad - Sensibilidad",
                  tableOutput("tabla_cap"),
                  
                  fluidRow(column(2),"Especificidad = 0.716"),
                  fluidRow(column(2),"Sensibilidad = 0.767"))
            )
            )
  )
)

ui <- dashboardPage(
  cabeza,
  menu,
  cuerpo
)

server <- function(input, output, session) {
  output$graf_resp <- renderPlot({graf_resp})
  
  output$graf_spiders <- renderPlot({graf_spiders})
  output$graf_spiders_2 <- renderPlot({graf_spiders_2})
  output$graf_spiders_3 <- renderPlot({graf_spiders_3()})
  
  output$graf_bilirrubina <- renderPlot({graf_bilirrubina})
  output$graf_bilirrubina_resp <- renderPlot({grafico_bilirrubina()})
  output$tabla_bilirrubina_1 <- renderTable({tabla_bilirrubina_1})
  output$tabla_bilirrubina_2 <- renderTable({tabla_bilirrubina_2})
  
  output$graf_stage <- renderPlot({graf_stage})
  output$graf_stage_2 <- renderPlot({graf_stage_2})
  output$graf_stage_3 <- renderPlot({graf_stage_3()})
  
  output$graf_alk <- renderPlot({graf_alk})
  output$grafico_alk <- renderPlot({grafico_alk()})
  output$tabla_alk_1 <- renderTable({tabla_alk_1})
  output$tabla_alk_2 <- renderTable({tabla_alk_2})
  
  output$intro1 <- renderText({
    "Durante este informe surge el interés de indagar acerca de la cirrosis. 
    La mencionada enfermedad es una condición médica en la que el hígado está cicatrizado y 
    permanentemente dañado. A medida que la cirrosis empeora, el hígado empieza a fallar."
  })
  
  output$tabla_cap <- renderTable({
    data.frame(Observado = c("NO","SI","Total"),
               `Predicho NO` = c(96,33,129),
               `Predicho SI` = c(38,109,147),
               `Total` = c(134,142,276)
    )
    
  })
 
}

shinyApp(ui, server)

