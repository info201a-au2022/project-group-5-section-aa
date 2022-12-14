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
                          Any changes you make using the widgets will be also be displayed on the fetal tab."),
                        p("Chart summary: The CDC defines infant mortality as the death of an infant before his or her first birthday and fetal mortality as the spontaneuous death of a fetus at any time during pregnancy.
                        The purpose of these two charts is to provide insight into how the rate of infant and fetal deaths differs across county lines in the state of Washington. 
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
  "U.S. Infant Mortality",
  mainPanel(
    h1("Infant Deaths"),
    p("The Center for Disease Control Defines Infant Mortality as the death of 
      an infant before his or her first birthday. Almost 20,000 infants died in 
      the United States in 2020. Infant Mortality remains significantly high in 
      the United States. The charts below display total infant deaths by state
      between the years 2014 to 2020.")
  ),
  mainPanel(
    plotOutput("states_map"),
  ),
  sidebarPanel(
    numericInput("YEAR", "Choose a Year:", value = 2020, min = 2014, max = 2020, step = 1)
  ),
  mainPanel(
    p("The map above demonstrates contrasting numbers of total infant deaths from state
      to state. Some states such as California, Texas, and Florida have a significantly higher
      number of infant deaths. Other states such as Maine and Wyoming have much lower
      levels.")
  ),
  mainPanel(
    plotOutput("state_bargraph"),
    p("Since the year 2014, annual infant deaths have slowly fallen within the
      United States. Significantly less infant deaths occured in the year 2020
      compared to the first year of data collection for the graph. Such data
      demonstrates major improvements within American systems and shows that the
      country is taking initiatives to alleviate infant mortality.")
  ),
  mainPanel(
    plotOutput("states_linegraph"),
    p("Similar to the bar graph above, the line graph demonstrates an overall falling
      infant mortality trend among states. Although some states display a constant trend,
      the states with the highest rates of infant mortality show a falling trend. Ultimately,
      the data from individuals states alligns with data above, showing that infant
      mortality is falling in the U.S.")
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
    plotlyOutput("maternalRatioMap")
  ),
  sidebarPanel(
    numericInput("yearSlider", label = h3("Year: 2000-2017"), min = 2000,
                 max = 2017, value = 2017)
  ),
  mainPanel(
    p("As we can see with this graph, ratios tend to differ from country to 
      country. More specifically, on their kind of development. Underdeveloped 
      countries that lack access to essential technology and resources tend to
      have higher ratios than those that are more developed."),
    plotlyOutput("maternalRatioGraph")
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
  h2("Data Takeaways"),
  p("The data collected for the MIFMR project and the data visualizations that make sense of the information demonstrate significant potential for revealing patterns of inequality within the United States. The United States has experienced significantly higher rates of fetal, infant, and maternal mortality compared to other high-income countries in recent years. Such an issue places a strain on all people, specifically mothers and children. Fetal, infant, and maternal mortality must be carefully and properly addressed to ensure the safety of all mothers, infants, and unborn children. Through the data wrangling and visualization conducted for the project, we begin to unveil truths behind the numbers and figures of the datasets used for the project. The content and data presented in this project are only the first steps in addressing the importance of maternal, infant, and fetal mortality within the United States."),
  p("In the “WA State: Infant & Fetal Mortality page,” we analyze fetal and infant mortality data in all 39 Washington state counties. To properly understand the issue of infant and fetal mortality, we began by analyzing the data locally. Trends within the datasets highlight stark differences between county lines. The main difference is the contrasting amount of data readily available from county to county. The scatterplot on this page displays rich data from counties with high incomes but shows little to no data from counties with low incomes. Such difference alludes to potential health inequity within Washington State. More specifically, the differences might infer potential inequities within the data collection process and healthcare systems in Washington state."),
  p("The second page, “U.S. Infant Mortality,” displays three data visualizations. The first is a map of U.S. states that shows the total number of infant mortalities in each state from the years 2014 to 2020. The map demonstrates stark differences from state to state, allowing us to better understand the geographic distribution of infant mortality throughout the United States.  Some states show much higher rates of infant mortality, including California and Texas. Other states, such as Maine, have much lower rates of infant mortality. Similarly, the line graph shows the distribution of infant mortality by state but through the years provided by the dataset. The majority of states demonstrate constant rates of infant mortality but the states with the highest rates have experienced a decrease in the amount of infant mortality. The bar graph shows a similar trend, except by year and within the U.S. as a whole. Since 2014, annual infant mortality has fallen, and as of 2020, the number stands at a much lower rate. Ultimately, the data shows that infant mortality within the U.S. is falling. This allows us to make the conclusion that the nation is making significant advancements to alleviate the burden of infant mortality on the American people. Although, there is still a lot more work to be done as the rate continues to stand at over 20,000 infant deaths as of 2020."),
  p("Finally, the last page, “Maternal Mortality,” shows the distribution of maternal mortality ratios on a global scale. The first data visualization is a map displaying the maternal mortality ratio across the globe. The main findings from the data shown by the map indicate that “underdeveloped” countries experience significantly higher ratios of maternal mortality. This is likely due to the lack of services and resources needed to properly address maternal mortality. The second data visualization presented on the page is a line graph displaying the maternal mortality rate of each country from the years 2000 to 2017. The maternal mortality trend differs from country to country but the same trend as above is seen in this graph, showing that “underdeveloped” countries experience higher rates of maternal mortality. The major takeaway from this page is that “underdeveloped” countries experience significantly higher rates of maternal mortality due to societal impacts such as decreased access to healthcare and high poverty rates.")
  #)
)


# Page 6: Report
report_page <- tabPanel(
  "Report",
  mainPanel(
    includeMarkdown("./p03-report.md")
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
    summary_page,
    report_page # sixth page
  )
)
