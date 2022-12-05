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

# Page 2: Interactive page - Infant and Fetal Mortality(Washington State)
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

# Page 3: Interactive Page - Infant Mortality(US)
us_states_page <- tabPanel(
  "Infant Deaths",
  mainPanel(
    h1("Infant Deaths"),
    p("Infant mortality is the death of an infant before his or her first birthday.
      The map graph displays the total number of infant mortalities that have occured
      in each state from 2005 to 2020.")
  ),
  mainPanel(
    plotOutput("states_map")
  )
)

# Page 4: Interactive Page - Maternal Mortality(Global)
# Choices for dropdown menu
grouped_maternalMortalityRatio <- maternalMortalityRatio %>% 
  filter(Year == "2017")
countries <- grouped_maternalMortalityRatio$Country
numbers <- 1:183

# Maternal mortality visualization page
maternal_mortality_page <- tabPanel(
  "Maternal Mortality", 
  mainPanel(
    h1("Maternal Mortality"),
    p("Maternal mortality refers to a mother's death caused due to complications
      from pregnancy or childbirth. The maternal mortality rate that is used in 
      this data is calculated by finding the number of maternal deaths per 
      100,000 live births.")
  ),
  mainPanel(
    plotOutput("maternalRatioMap")
  ),
  sidebarPanel(
    sliderInput("yearSlider", label = h3("Year"), min = 2000,
                max = 2017, value = 2017)
  ),
  mainPanel(
    p("As we can see with this graph, ratios tend to differ from country to 
      country. More specifically, on their kind of development. Underdeveloped 
      countries that lack access to essential technology and resources tend to
      have higher ratios than those that are more developed."),
    plotOutput("maternalRatioGraph")
  ), 
  sidebarPanel(
    selectInput("countrySelecter", label = h3("Select country"), 
                choices = countries,
                selected = 1),
  ),
  mainPanel(
    p("As we can see with this graph, trends vary heavily from country to 
      country. Some countries have decreased their ratio greatly through the 
      years, while some have had slight increases. The reasoning behind these
      increases and decreases are mostly due to societal impacts such as poverty
      levels, access to healthcare, and access to food, water, and shelter.")
  )
)

# Page 5: Summary Takeaways
summary_page <- tabPanel(
  "Summary Takeaways",
    h1("The data collected for this projects and the data visualizations that make
      sense of the information demonstrate significant potential for revealing patterns
      of inequality. Fetal, infant, and maternal mortality and three issues that must be carefully
      and properly address to ensure the safety of **all** mothers and infants. Through data wrangling
      and manipulation, one might begin unveiling truths behind numbers. We belive our data visualizations
      and the broader project begins to do just that."),
  p("Our first form of data visualization starts small and local. We analyze data pertaining to both fetal
  and infant deaths in all 39 Washington state counties. Trends within the data highlighted stark differences
    between counties, alluding to potntial health ineqity within. The scatterplots display rich data from counties
    with the highest incomes but show little to no data from counties with the lowest-incomes. We believe such
    difference might infer portneial iequities within the healthcare system and data collection process in low-income
    counties within Washington State."),
  p("The second data visualzation created for a project is a map of all 50 U.S. states. The map specifically displays the
    total number ot infant mortalities in each state from the years 2005 to 2020. We belive such representation of data will
    allow viewers to conceptualize infant mortality through a geographic lens."),
  p("Finally, our last two data visualization models are a line graph and another map. We wanted to zoom out and provide a broader
    more diverse dataset. The data uses for these visualization displays informations pertaining on maternal mortality 
    througout the entire world.")
  )
)

# Page 6: Report
report_page <- tabPanel(
  "Report",
  mainPanel(
    includeMarkdown("../docs/p01-proposal.md")
  )
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
    "MIFMR",
    first_page,
    second_page,
    maternal_mortality_page, # fourth page
    report_page, # sixth page
    seventh_page
  )
)
