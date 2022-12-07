# ui for P3

# Loading libraries
library(shiny)
library(tidyverse)
library(ggplot2)
library(markdown)
# Page 1: Introductory page
first_page <- tabPanel(
  "Home",
  h1("US Maternal, Fetal, and Infant Mortality", align = "center"),
  img(src = "mother.png", height = 350, width = 780),
  tags$div(
    tags$a(href = " https://www.healthline.com/health/pregnancy/left-occiput-anterior", "Image citation")),
  h4("Aronia Mclean, Jonathan H. Ortiz-Candelaria, and JP Lopez"),
  h5("12/8/2022"),
  p("The World Health Organization (WHO) reported in 2017 that the U.S. was one of the only
  two countries to report a significant increase in maternal mortality ratio since 2000.
  Since this report's release, U.S. maternal mortality rates have leveled off but the ratio
  still remains significantly higher than in other “developed” countries. 
  The health of women and children is a reflection of our healthcare system and systematic inequalities.
  The content on this site explores maternal, fetal, and infant mortality in America.
    Data regarding these mortality rates have the potential to shed light on health
    inequities faced nationwide and across county lines. As you explore the page, you will find 
    that some of our key findings are that lower-income areas have lower reports regarding infant and fetal deaths 
    and that more underdeveloped areas have higher rates of maternal mortality."),
  mainPanel(
    tabsetPanel(
      tabPanel("Research Questions", p("1. How do maternal mortality rates differ worldwide?"), 
               p("2. How do infant and fetal mortality rates differ across county lines?"),
               p("3. What do geographical patterns reveal about maternal, fetal, and infant mortality inequity?")),
      tabPanel("Definitions", p("Maternal mortality: The CDC defines maternal mortality as the death of a woman during preganacy, at delivery,
                                or shortly following delivery."),
               p("Infant mortality: The CDC defines infant mortality as the death of an infant before his or her first birthday."),
               p("Fetal mortality: The CDC defines fetal mortality as the spontaneuous death of a fetus at any time during pregnancy.")),
      tabPanel("Problem Domain", "Our project focuses on how the prevalence of
               maternal, fetal, and infant mortality directly correlates with social determinants such
               as race and geographic location. Several studies indicate that social factors such as race 
               play a detrimental role in maternal mortality. It is not surprising to see Black women experiencing
               maternal mortality, especially in states with notoriously high concentrations of Black individuals.
               Therefore, the aim of this project is to highlight and address the health inequity of
               maternal, fetal, and infant mortality and its disproportionate impacts."),
      tabPanel("Data Used", p("The data used for this site was cleaned by the authors. On Page 2, you will find an interactive visualization of infant and fetal deaths in Washington state.
                              The data used for this visualization was collected from the Washington State Department of Health. The links to all the 
                              original datasets are below."),
               p("On page 3, you will find an interactive visualization of infant
                              mortality in America. The data used for this visualization was collected from the CDC."),
               p("Lastly, on Page 4, you will find two interactive visualizations of maternal deaths across the world. 
                              The data used for this visualization was collected from WHO World Health."),
               tags$div(
                 tags$a(href = " https://doh.wa.gov/data-and-statistical-reports/washington-tracking-network-wtn/fetal-and-infant-death-data/fetal-infant-deaths-county", "Infant and Fetal Deaths in Washington State")),
               tags$div(
                 tags$a(href = " https://www.kaggle.com/datasets/utkarshxy/who-worldhealth-statistics-2020-complete", "Maternal Mortality Worldwide")),
               tags$div(
                 tags$a(href = " https://www.cdc.gov/nchs/pressroom/sosmap/infant_mortality_rates/infant_mortality.htm", "Infant Mortality in America"))
      )
    )
  ))
# Link to including image: https://shiny.rstudio.com/tutorial/written-tutorial/lesson2/

# Page 2: Interactive page - Infant and Fetal Mortality(Washington State)
second_page <-tabPanel(
  "WA State: Infant & Fetal Mortality",
  h2("Washington State Counties' Infant and Fetal Mortality", align = "center"),
  mainPanel(
    tabsetPanel(
      tabPanel("Infants", plotlyOutput("infantPlot"),
               uiOutput("infantwidget"), uiOutput("newinfantwidget"),
               fluidRow(
                 column(12,
                        p("How to use chart: You can add or remove which counties you would like to visualize alongside changing which years you would like to visualize. 
                          Any changes you make using the widgets will be also be displayed on the fetal tab"),
                        p("Chart summary: Infant mortality: The CDC defines infant mortality as the death of an infant before his or her first birthday and fetal mortality is the spontaneuous death of a fetus at any time during pregnancy.
                        The purpose of these two charts is to provide insight into how the rate of infant and fetal deaths differs across county lines. 
                        Counties ranked among the lowest per capita personal income have little to no data regarding
                          infant deaths to draw conclusions from. Trends we can see throughout this data is that overall, there is fluctuation in the rate of 
                          infant and fetal deaths across counties. Notably, in recent years, Pierce has seen a decline in both infant and fetal deaths. 
                          Washington's Office of Financial Management depicts that in both 2010 and 2020, King County was ranked one of the top two counties with the highest 
                          per capita personal income hence why it was deemed important to include this county in the visualization. Ultimately, these charts and the information
                          from Washington's Office of Financial Management both reflect the same story of how financial disparities play a large role in healthcare. 
                          Counties with low per capita personal income often had little to no data regarding infant and fetal death while counties with high per capita 
                          personal income had robust data. These financial disparities impact those living in low-income areas and the lack of representation they receive."))
               )),
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
  #)
)

# Page 6: Report
report_page <- tabPanel(
  "Report",
  mainPanel(
    includeMarkdown("./p01-proposal.md")
  )
)

# Putting the pages together
ui <- fluidPage(
  theme = bslib::bs_theme(bootswatch = "flatly"),
  navbarPage(
    "MIFMR",
    first_page,
    second_page,
    us_states_page, # third page
    maternal_mortality_page, # fourth page
    report_page # sixth page
  )
)
