# CLEANING-UP PLOT FOR JOUNRAL A
library(tidyverse)
library(smoothHR)

surv <- whas500 %>%
  mutate(lenfoly = round(lenfol/365.25, 2), ## change follow-up days to years for better visualization
         afb_c = ifelse(afb==1, "Active", "Non-Active"),
         gender_c = ifelse(gender==1, "Male", "Female"),
         cvd_c = ifelse(cvd==1, "Yes", "No")) 

pubgraph1<-
  ggplot(data = surv, mapping = aes(x =diasbp , y =sysbp )) + 
  geom_point() +
  facet_grid(rows = vars(afb_c), cols = vars(gender_c)) +
  labs(title="Diastolic and Systolic Blood Pressure by Gender and Cardiovascular Disease Status",
       x="Systolic Blood Pressure",
       y="Diastolic Blood Pressure",
       caption="Data source: Survival 500 data")

ggplot2::ggsave(filename="images/pubgraph1-A-dot2.jpg",
                plot=pubgraph1,
                device="jpg",
                dpi = 72,
                width=450,
                height=400,
                units = "px")
