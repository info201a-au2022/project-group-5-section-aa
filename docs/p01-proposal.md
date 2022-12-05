# _Code Name: MIFMR_
# Maternal, Infant, and Fetal Mortality Rate
## Jonathan H. Ortiz-Candelaria (jhoc@uw.edu), JP Lopez (jlopez19@uw.edu), Aronia McLean (aroniam@uw.edu)  
## INFO-201: Technical Foundations of Informatics - The Information School - University of Washington
## Autumn 2022

### Abstract
Our main question is _how do maternal, infant, and fetal mortality rates differ among different geographic regions across the US and across the world_. To address the question, we will obtain data revealing maternal, infant, and fetal mortality trends relating to the rates at which they occur and which populations/geographic regions they primarily affect. We are concerned with the issue of these mortality trends because data relating to the issue has the potential to highlight health inequities that must be addressed.

### Keywords
_maternal mortality; infant mortality; fetal mortality; childbirth; healthcare_

### Introduction
The CDC defines maternal mortality as the death of a woman during pregnancy, at delivery, or shortly following delivery, infant mortality as the death of an infant before his or her first birthday, and fetal mortality as the spontaneous death of a fetus at any time during pregnancy. The corresponding trends for all three of these categories have varied a lot through time and while they have for the most part improved, it is still a big issue within underdeveloped countries, low-income communities, and places where there is lack of access to important resources such as food and water. This pattern of lower-income communities experiencing higher maternal, infant, and fetal rates is one our project seeks to explore. Our goal is to further understand what ares are more likely to experience significantly higher mortality rates. Additionally, in doing so, we will be able to explore to what extent geographical location impacts these different mortality rates. With these explorations in mind, our project will look at different patterns of discrimination occurring across geographical locations. 

### Problem Domain
- Project Framing: In 2017, the World Health Organization (WHO) reported that the United States was one of only two countries to report a significant increase in maternal mortality ratio since 2000. Since the WHO report was released, U.S. maternal mortality rates have leveled in recent years, but the ratio remains significantly higher than in other “developed” countries. Through this project, we will highlight and analyze data similar to what has been highlighted by the WHO report on maternal mortality and the prevalence at which it occurs. More specifically, our project will focus on how the pervelance of maternal mortality directly correlates with social determinants such as race, ethnicity, and geographic location. Several studies indicate that social factors, specifically race, play a detrimental role in maternal mortality. Black women in the U.S. have a significantly higher risk of experiencing maternal mortality. Therefore, the aim of the project is to highlight and address the health inequity of maternal mortality and its disproportionate impacts.  

- Human Values: Equity, Health, Accountability, Responsibility, Integrity

- Direct and Indirect Stakeholders: Direct stakeholders for this project could include researchers collecting data on the prevalence of maternal, infant, and fetal mortality and how it correlates with social factors such as race and geographic location. Once our project is completed, the data and information we collect will become accessible to anyone seeking information on the research topic. Indirect stakeholders of the project will include women who have been or will be impacted by maternal, infant, or fetal mortality, more specifically Black women as this population is most impacted by the issue. Since maternal mortality can affect almost any woman during childbirth, more often Black women, the data we collect has the potential to highlight the issue and impact decision making on various levels such as on a policy level.

- Possible Harms: A possible harm that could arise from the project could be the invasion of privacy through the utilization of potentially sensitive data and information. Much of the data that will be collected for our project will be related to death, specifically in the context of maternal mortality. The topic and data collected may be sensitive to populations that these mortality rates primarily affect. Even more, it is possible that hospitals store and collect data pertaining to these mortalities without the full consent of patients or their families. Therefore, the information also becomes a sensitive topic for the families of those who have passed from maternal, infant, and fetal mortality as it is possible that the information and data of their family member is being used.  

- Possible Benefits: The project will highlight an important issue relating to health equity. By gathering data pertaining to maternal mortality, infant mortality, fetal mortality, and the disparities they create, our project has the potential to push for action that addresses and seeks solutions for maternal mortality.  

- Citations:
  - Declercq, E., &amp; Zephyrin, L. (n.d.). Maternal in the United States - Commonwealth Fund. Retrieved October 31, 2022, from https://www.commonwealthfund.org/sites/default/files/2020-12/Declercq_maternal_mortality_primer_db.pdf
  - Wang, E., Glazer, K. B., Howell, E. A., &amp; Janevic, T. M. (2020, April). Social determinants of pregnancy-related mortality and morbidity in the United States: A systematic review. Obstetrics and gynecology. Retrieved October 31, 2022, from https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7104722/
  - Douthard, R., Martin, I., Chapple-Mcgrudder, T., Langer, A., &amp; Chang, S. (2022, February 2). U.S. maternal mortality within a global context: Historical trends ... Mary Anne Liebert, Inc Publishers. Retrieved October 31, 2022, from https://www.liebertpub.com/doi/full/10.1089/jwh.2020.8863

### Research Questions
- How do maternal mortality rates differ across the world?  

 - This question is important because it is the backbone of our research exploration. There is a fair amount of variation across country lines from system of governance to population density that may potentially impact how we understand the issue of maternal mortality. When trying to understand the severity of maternal mortality, it's important to understand the concentration of maternal mortality across different geographical locations.  


- How do infant and fetal mortality rates differ across county and state lines?

 - Healthcare is an area that often under serves minorities, exposing them to unsafe or neglectful healthcare conditions. Similar to the question above, understanding how geographical location plays a role in maternal, infant, and fetal mortality provides a more complete picture. It allows us to understand the varying prevalence of the issue amongst different women. 


- What do geographical patterns reveal about maternal, infant, and fetal mortality inequity?

 - It’s important to consider the components of a given location in terms of population, political leaning, etc. To understand why we’re seeing higher levels of these mortalities in certain areas, it may help to consider these other variables. This will potentially further strengthen our argument of racial and class issues as the explanatory variable behind these high mortality rates.  

### The Dataset
- These datasets will help us with the goal of answering all three research questions and addressing certain aspects presented in the problem domain. For the first research question, the second dataset will be used since this is its primary function. For the second question, the second and third datasets will be used. They provide statistics on infant and fetal deaths across the US and more specifically in Washington State. For the third question, we will infer from everything we do in the project. This third question will specifically be answered with the help of visualizations we create and our interpretations of them.

|Dataset                      |Number of Observations (Rows)|Number of Variables (Columns)|
|-----------------------------|-----------------------------|-----------------------------|
|maternalMortalityRatio.csv   |3295                         |3                            |
|wastate_fetaldeaths.csv      |1241                         |16                           |
|im_state_table.csv           |400                          |5                            |    

- URL:
  - maternalMortalityRatio.csv _(Global)_ - https://www.kaggle.com/datasets/utkarshxy/who-worldhealth-statistics-2020-complete
  - wastate_fetaldeaths.csv _(Washington only)_ - https://doh.wa.gov/data-and-statistical-reports/washington-tracking-network-wtn/fetal-and-infant-death-data/fetal-infant-deaths-county 
  - im_state_table.csv _(US only)_ - https://www.cdc.gov/nchs/pressroom/sosmap/infant_mortality_rates/infant_mortality.htm

- The first dataset is taken from Kaggle by a user who had sourced it originally from the World Health Organization. This includes data from the year 2000 to 2017 for the purpose of making a plan to reduce the amount of preventable maternal mortalities. This project was funded by the World Health Organization for the benefit of research and countries all around the world. Due to this, we can determine that the source is credible and is updated on a fairly frequent term. The second dataset is taken from the Washington State Department of Health. The goal of this agency is to both protect and improve the health of people living in Washington State. This agency provides reliable information regarding health issues such as health statistics, environmental health, diseases, etc. The third dataset is taken from the CDC’s National Center for Health Statistics website. It is sourced from the WONDER Online Database for the purpose of studying infant mortality rates and making them easily accessible to others. Its mission being to make information resources from the CDC publicly available. This dataset is funded by the CDC and in turn the US government for this purpose; meaning that they are the ones who benefit the most from it and are trustworthy.

### Expected Implications
The ultimate goal of this project is to highlight maternal mortality as an issue that is exacerbated by social factors such as race. Therefore, the expected implication of the project will be an overall better understanding of how maternal mortality rates differ among populations in different geographic regions. This will hopefully highlight health inequity and educate people on the pressing issue that is maternal mortality. Ideally, we also hope that the data we collect pushes professionals that that are bettered positioned to properly address the issue. This will include policy makers that make decisions regarding factors that influence maternal mortality and physicians that perform birthing surgical procedures.  

### Limitations
Potential limitations we may need to address would be differing reporting inconsistencies across state lines. Different states may have stronger or weaker reports of maternal mortality based on the strength of their healthcare services. Additionally, if a state does strengthen their reporting of healthcare, it is possible that it is not necessarily the case that that state is now experiencing higher rates of maternal mortality but rather that their actual accounting of the instances of maternal mortality has improved. This would make it seem that they’re experiencing more maternal mortality but in reality, their reporting has just improved. Another potential limitation is looking at age and how that potentially plays a factor in maternal mortality rates. Currently, our research questions do not address age but as women get older, there are increased risks associated with pregnancy. If the data we collect shows a correlation between older women representing most maternal mortality rates, that will also be something we need to address to have a comprehensive understanding of our data.   

### Findings

### Discussion

### Conclusion

### Acknowledgements
Thank you to our professor Thomas Winegarden and our Teacher Assistant Lillia Chebbi for the help throughout the project.

### References
- Centers for Disease Control and Prevention. (2022, September 16). Maternal mortality. Centers for Disease Control and Prevention. Retrieved October 30, 2022, from https://www.cdc.gov/reproductivehealth/maternal-mortality/index.html

- Hoyert, D. L. (2020). Maternal mortality rates in the United States, 2020. Maternal Mortality Rates in the United States, 2020. Retrieved October 30, 2022, from https://stacks.cdc.gov/view/cdc/113967

- Centers for Disease Control and Prevention. (2022, June 22). Infant mortality. Centers for Disease Control and Prevention. Retrieved December 4, 2022, from https://www.cdc.gov/reproductivehealth/maternalinfanthealth/infantmortality.htm#:~:text=Infant%20mortality%20is%20the%20death,for%20every%201%2C000%20live%20births. 

- Centers for Disease Control and Prevention. (2022, October 18). NVSS - fetal deaths. Centers for Disease Control and Prevention. Retrieved December 4, 2022, from https://www.cdc.gov/nchs/nvss/fetal_death.htm#:~:text=Fetal%20death%20refers%20to%20the,sometimes%20referred%20to%20as%20stillbirths

#### Appendix A: Questions
