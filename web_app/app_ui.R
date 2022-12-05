# ui for P3

# Loading libraries
library(shiny)
library(tidyverse)
library(ggplot2)

# Page 1: Introductory page
first_page <- tabPanel(
  "Home",
  h1("US Maternal, Fetal, and Infant Mortality", align = "center"),
  img(src = "mother.png", height = 350, width = 780),
  h4("Aronia Mclean, Jonathan H. Ortiz-Candelaria, and JP Lopez"),
  h5("12/8/2022"),
  p("The World Health Organization (WHO) reported in 2017 that the U.S. was one of the only
  two countries to report a signifcant increase in maternal mortality ratio since 2000.
  Since this report's release, U.S. maternal mortality rates have leveled off but the ratio
  still remains significantly higher than in other “developed” countries. 
  The health of women and children are a reflection of our healthcare system and systematic inequalities.
  The content on this site explore maternal, fetal, and infant mortality in America.
    Data regarding these mortatlity rates has the potential to shed light on health
    inequities faced nationwide and more specifically, across county lines (as you 
    will be able to explore on Page 2). "),
  mainPanel(
    tabsetPanel(
      tabPanel("Research Questions", p("1. How do maternal mortality rates differ worldwide?"), 
               p("2. How do infant and fetal mortality rates differ across county lines?"),
               p("3. What do geographical patterns reveal about maternal, fetal, and infant mortality inequity?")),
      tabPanel("Data Used", p("On Page 2, you will find an interactive visualiation on infant and fetal deaths in Washington state.
                              The data used for this visualization was collected from the Washington State Department of Health. The link to the original dataset can be found on this site's About page."),
               p("On Page 3, you will find an interactive visualization on maternal deaths across the United states. The data used for this
              visualization was collected from blank. The link to the original dataset can be found on this site's About page.")),
      tabPanel("Problem Domain", "Through this project, we will highlight and analyze data similar
               to what has been highlighted by the WHO report on maternal mortality and the prevlance
               at which the patterns we highlight occur. Our project focuses on how the prevelance of
               maternal, fetal, and infant mortality directly correlates with social determinants such
               as race and geographic location. Several studies indicate that social factors such as race 
               play a detrimental role in maternal mortality. It is not suprising to see Black women experiencing
               maternal mortality especially in states with notoriously high concentrations of Black indivduals.
               Therefore, the aim of this project is to highlight and address the health inequity of
               maternal, fetal, and infant mortality and its disproportionate impacts."),
      tabPanel("Key Findings", p("1. Lower income areas have lower reports regarding infant and fetal deaths."))
    )
  )
)
# Link to including image: https://shiny.rstudio.com/tutorial/written-tutorial/lesson2/

# Page 2: Interactive page
second_page <-tabPanel(
  "Deaths Temp Page",
  h1("viz", align = "center"),
  mainPanel(
    tabsetPanel(
      tabPanel("Infants", plotlyOutput("infantPlot"),
               uiOutput("infantwidget"), uiOutput("newinfantwidget"),
               fluidRow(
                 column(12,
                        p("The purpose of these two charts is to provide insight on how the rate of infant and fetal deaths 
               differs across county lines. Counties ranked with among the lowest per capita personal income have little to no data regarding
                          infant deaths to draw conclusions from. Trends we can see throughout this data is that overall, there is fluctuation in the rate of 
                          infant and fetal deaths across counties. Notably, in recent years, Pierce has seen a decline in both infant and fetal deaths. 
                          Washington's Office of Finanical Management depicts that in both 2010 and 2020, King County was ranked one of the top two counties with the highest 
                          per capita personal income hence why it was deemed important to include this county in the visualization. Ultimately, these charts and the information
                          from the Washington's Office of Finanical Management both reflect the same story of how financial disparities play a large role in healthcare. 
                          Counties with low per capita personal income often had little to no data regarding infant and fetal death while counties with high per capita 
                          perosnal income had robust data. These finanical disparities impact those living in low income areas and the lack of representation they recieve.")
                 ))),
      tabPanel("Fetal", plotlyOutput("fetalPlot"))
    ))
)

# Page 7: About 
seventh_page <- tabPanel(
  "About",
  h1("Data Collection and Authors", align = "center"),
  #textOutput("value"),
  p("The data used for this site was cleaned by the authors. Links to the original datasets are below."),
  p("Page 2- WA State Fetal Deaths: https://doh.wa.gov/data-and-statistical-reports/washington-tracking-network-wtn/fetal-and-infant-death-data/fetal-infant-deaths-county"),
  p("Additionally, the link the to image used on the Home page is: https://www.healthline.com/health/pregnancy/left-occiput-anterior")
)

# Putting the pages together
ui <- fluidPage(
  theme = bslib::bs_theme(bootswatch = "flatly"),
  navbarPage(
    "INFO 201 P3 Practice",
    first_page,
    second_page,
    seventh_page
  )
)
