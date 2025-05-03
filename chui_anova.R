pacman::p_load(readxl, tidyverse, lme4, lmerTest, BSDA, kableExtra, car, agricolae, sjstats, jtools)
library(readxl)
data=read_excel("Data_chuijhal.xlsx", sheet = "data_mineral", range = "d3:o33")
data


modca=aov(Ca~Plant_parts+Replication, data=data)
modca=aov(Ca~Plant_parts, data=data)
summary(modca)

data %>% group_by(Plant_parts) %>% summarise(mean=mean(Ca), sd=sd(Ca), n=n())

# post hoc using tukey
post_plant_parts = agricolae::HSD.test(modca, 'Plant_parts',  console=TRUE)

library(ggplot2)

modmg=aov(Mg~Plant_parts+Replication, data=data)
modmg=aov(Mg~Plant_parts, data=data)
summary(modmg)

data %>% group_by(Plant_parts) %>% summarise(mean=mean(Mg), sd=sd(Mg), n=n())

# post hoc using tukey
post_plant_parts = agricolae::HSD.test(modmg, 'Plant_parts',  console=TRUE)

modfe=aov(Fe~Plant_parts+Replication, data=data)
modfe=aov(Fe~Plant_parts, data=data)
summary(modfe)

data %>% group_by(Plant_parts) %>% summarise(mean=mean(Fe), sd=sd(Fe), n=n())

# post hoc using tukey
post_plant_parts = agricolae::HSD.test(modfe, 'Plant_parts',  console=TRUE)


modcu=aov(Cu~Plant_parts+Replication, data=data)
modcu=aov(Cu~Plant_parts, data=data)
summary(modcu)

data %>% group_by(Plant_parts) %>% summarise(mean=mean(Cu), sd=sd(Cu), n=n())

# post hoc using tukey
post_plant_parts = agricolae::HSD.test(modcu, 'Plant_parts',  console=TRUE)

modzn=aov(Zn~Plant_parts+Replication, data=data)
modzn=aov(Zn~Plant_parts, data=data)
summary(modzn)

data %>% group_by(Plant_parts) %>% summarise(mean=mean(Zn), sd=sd(Zn), n=n())

# post hoc using tukey
post_plant_parts = agricolae::HSD.test(modzn, 'Plant_parts',  console=TRUE)

modna=aov(Na~Plant_parts+Replication, data=data)
modna=aov(Na~Plant_parts, data=data)
summary(modna)

data %>% group_by(Plant_parts) %>% summarise(mean=mean(Na), sd=sd(Na), n=n())

# post hoc using tukey
post_plant_parts = agricolae::HSD.test(modna, 'Plant_parts',  console=TRUE)

#Visualizing K
modk=aov(K~Plant_parts+Replication, data=data)
modk=aov(K~Plant_parts, data=data)
summary(modk)

data %>% group_by(Plant_parts) %>% summarise(mean=mean(K), sd=sd(K), n=n())

# post hoc using tukey
post_plant_parts = agricolae::HSD.test(modk, 'Plant_parts',  console=TRUE)

group1= post_plant_parts$means[ , c(2:3)] %>%rownames_to_column('Plant_parts')
group1
group2= post_plant_parts$groups %>% rownames_to_column('Plant_parts')
group2
group= left_join(group1, group2, by ='Plant_parts'); group
plot_data= group %>%mutate(
  ll = K - 1.96*(std/sqrt(r)),
  ul= K + 1.96*(std/sqrt(r)))
plot_data

ggplot(plot_data)+
  aes(x=Plant_parts, y= K, fill = Plant_parts, width= .5) + 
  geom_col()+
  geom_text(aes(label=round(K,2),y=K-50))+
  geom_text(aes(label=groups,y=K+20), color='blue')+
  geom_errorbar(aes(ymin=ll,ymax=ul), width= 0.2, alpha= 0.05)+
  theme_test()+
  theme(legend.position = 'none')+
  labs(x='Plant_parts', y='Potassium (mg/100g)')+
  theme(axis.text.x = element_text(angle=90, vjust=.4,hjust = 1))
ggsave('Vitamin-C.Anova.png', dpi=600, height=6, width = 8, units = 'in')






#Visualizing Vit-c
modvc=aov(vit_c~Plant_parts+Replication, data=data)
modvc=aov(vit_c~Plant_parts, data=data)
summary(modvc)

data %>% group_by(Plant_parts) %>% summarise(mean=mean(vit_c), sd=sd(vit_c), n=n())

# post hoc using tukey
post_plant_parts = agricolae::HSD.test(modvc, 'Plant_parts',  console=TRUE)

group1= post_plant_parts$means[ , c(2:3)] %>%rownames_to_column('Plant_parts')
group1
group2= post_plant_parts$groups %>% rownames_to_column('Plant_parts')
group2
group= left_join(group1, group2, by ='Plant_parts'); group
plot_data= group %>%mutate(
  ll = vit_c - 1.96*(std/sqrt(r)),
  ul= vit_c + 1.96*(std/sqrt(r)))
plot_data

ggplot(plot_data)+
  aes(x=Plant_parts, y= vit_c, fill = Plant_parts, width= .5) + 
  geom_col()+
  geom_text(aes(label=round(vit_c,2),y=vit_c-.5))+
  geom_text(aes(label=groups,y=vit_c+.2), color='blue')+
  geom_errorbar(aes(ymin=ll,ymax=ul), width= 0.2, alpha= 0.7)+
  theme_test()+
  theme(legend.position = 'none')+
  labs(x='Plant_parts', y='Vitamin-C (mg/100g)')+
  theme(axis.text.x = element_text(angle=90, vjust=.4,hjust = 1))
ggsave('Vitamin-C.Anova.png', dpi=600, height=6, width = 8, units = 'in')





#Proximate composition analysis
pacman::p_load(readxl, tidyverse, lme4, lmerTest, BSDA, kableExtra, car, agricolae, sjstats, jtools)
library(readxl)
data=read_excel("Data_chuijhal.xlsx", sheet = "data_prox", range = "c4:k19")
data

#Crude Protein
modcp=aov(Crude_p~plant_p+replication, data=data)
modcp
modcp=aov(Crude_p~plant_p, data=data)
summary(modcp)

data %>% group_by(plant_p) %>% summarise(mean=mean(Crude_p), sd=sd(Crude_p), n=n())

# post hoc using tukey
post_plant_parts = agricolae::HSD.test(modcp, 'plant_p',  console=TRUE)

group1= post_plant_parts$means[ , c(2:3)] %>%rownames_to_column('plant_p')
group1
group2= post_plant_parts$groups %>% rownames_to_column('plant_p')
group2
group= left_join(group1, group2, by ='plant_p'); group

plot_data= group %>%mutate(
  ll = Crude_p - 1.96*(std/sqrt(r)),
  ul= Crude_p + 1.96*(std/sqrt(r)))
plot_data

#Fat

modfat=aov(Fat~plant_p+replication, data=data)
modfat
modfat=aov(Fat~plant_p, data=data)
summary(modfat)

data %>% group_by(plant_p) %>% summarise(mean=mean(Fat), sd=sd(Fat), n=n())

# post hoc using tukey
post_plant_parts = agricolae::HSD.test(modfat, 'plant_p',  console=TRUE)

group1= post_plant_parts$means[ , c(2:3)] %>%rownames_to_column('plant_p')
group1
group2= post_plant_parts$groups %>% rownames_to_column('plant_p')
group2
group= left_join(group1, group2, by ='plant_p'); group

#Moisture

modmos=aov(Moisture~plant_p+replication, data=data)
modmos
modmos=aov(Moisture~plant_p, data=data)
summary(modmos)

data %>% group_by(plant_p) %>% summarise(mean=mean(Moisture), sd=sd(Moisture), n=n())

# post hoc using tukey
post_plant_parts = agricolae::HSD.test(modmos, 'plant_p',  console=TRUE)

group1= post_plant_parts$means[ , c(2:3)] %>%rownames_to_column('plant_p')
group1
group2= post_plant_parts$groups %>% rownames_to_column('plant_p')
group2
group= left_join(group1, group2, by ='plant_p'); group


#Ash

modash=aov(Ash~plant_p+replication, data=data)
modash
modash=aov(Ash~plant_p, data=data)
summary(modash)

data %>% group_by(plant_p) %>% summarise(mean=mean(Ash), sd=sd(Ash), n=n())

# post hoc using tukey
post_plant_parts = agricolae::HSD.test(modash, 'plant_p',  console=TRUE)

group1= post_plant_parts$means[ , c(2:3)] %>%rownames_to_column('plant_p')
group1
group2= post_plant_parts$groups %>% rownames_to_column('plant_p')
group2
group= left_join(group1, group2, by ='plant_p'); group


#Cromium

modcr=aov(Cr~plant_p+replication, data=data)
modcr
modcr=aov(Cr~plant_p, data=data)
summary(modcr)

data %>% group_by(plant_p) %>% summarise(mean=mean(Cr), sd=sd(Cr), n=n())

# post hoc using tukey
post_plant_parts = agricolae::HSD.test(modcr, 'plant_p',  console=TRUE)

group1= post_plant_parts$means[ , c(2:3)] %>%rownames_to_column('plant_p')
group1
group2= post_plant_parts$groups %>% rownames_to_column('plant_p')
group2
group= left_join(group1, group2, by ='plant_p'); group


#Cadmium

modcd=aov(Cd~plant_p+replication, data=data)
modcd
modcd=aov(Cd~plant_p, data=data)
summary(modcd)

data %>% group_by(plant_p) %>% summarise(mean=mean(Cd), sd=sd(Cd), n=n())

# post hoc using tukey
post_plant_parts = agricolae::HSD.test(modcd, 'plant_p',  console=TRUE)

group1= post_plant_parts$means[ , c(2:3)] %>%rownames_to_column('plant_p')
group1
group2= post_plant_parts$groups %>% rownames_to_column('plant_p')
group2
group= left_join(group1, group2, by ='plant_p'); group

#nICKEL

modni=aov(Ni~plant_p+replication, data=data)
modni
modni=aov(Ni~plant_p, data=data)
summary(modni)
data %>% group_by(plant_p) %>% summarise(mean=mean(Ni), sd=sd(Ni), n=n())
# post hoc using tukey
post_plant_parts = agricolae::HSD.test(modni, 'plant_p',  console=TRUE)

group1= post_plant_parts$means[ , c(2:3)] %>%rownames_to_column('plant_p')
group1
group2= post_plant_parts$groups %>% rownames_to_column('plant_p')
group2
group= left_join(group1, group2, by ='plant_p'); group