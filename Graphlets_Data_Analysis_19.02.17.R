dir<-("I:/Work Computer/PUBLICATIONS/FileFolder/Data") #set directory to path where data files and scripts are
setwd(dir)

#load relevant R packages
library(lme4)
library(lmerTest)
library(MuMIn)
library(Hmisc)
library(MASS)
library(psych)
library(stats)
library(corrgram)

Graphlets<-read.csv("FeatureSummary2.csv") #load data


#Extraversion

NULL.MODEL <-lmer(ExtChangeLL ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
EXT.MODEL <-lmer(ExtChangeLL ~ExtSingleL+ExtSingleH+ExtDyadHL+ExtDyadLL+ExtDyadHH+ExtClosedDyadHL+ExtClosedDyadLL+ExtClosedDyadHH+ExtThreeNoConnHLH+ExtThreeNoConnHLL+ExtThreeNoConnLLL+ExtThreeNoConnHHH+ExtThreeTwoConHLH+ExtThreeTwoConHLL+ExtThreeTwoConLLL+ExtThreeTwoConHHH+ExtThreeOneConnHLH+ExtThreeOneConnHLL+ExtThreeOneConnLLL+ExtThreeOneConnHHH+ExtThreeAllConnHLH+ExtThreeAllConnHLL+ExtThreeAllConnLLL+ExtThreeAllConnHHH +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(EXT.MODEL)
summary(EXT.MODEL)
anova(NULL.MODEL,EXT.MODEL)

NULL.MODEL <-lmer(ExtChangeLH ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
EXT.MODEL <-lmer(ExtChangeLH ~ExtSingleL+ExtSingleH+ExtDyadHL+ExtDyadLL+ExtDyadHH+ExtClosedDyadHL+ExtClosedDyadLL+ExtClosedDyadHH+ExtThreeNoConnHLH+ExtThreeNoConnHLL+ExtThreeNoConnLLL+ExtThreeNoConnHHH+ExtThreeTwoConHLH+ExtThreeTwoConHLL+ExtThreeTwoConLLL+ExtThreeTwoConHHH+ExtThreeOneConnHLH+ExtThreeOneConnHLL+ExtThreeOneConnLLL+ExtThreeOneConnHHH+ExtThreeAllConnHLH+ExtThreeAllConnHLL+ExtThreeAllConnLLL+ExtThreeAllConnHHH +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(EXT.MODEL)
summary(EXT.MODEL)
anova(NULL.MODEL,EXT.MODEL)

NULL.MODEL <-lmer(ExtChangeHL ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
EXT.MODEL <-lmer(ExtChangeHL ~ExtSingleL+ExtSingleH+ExtDyadHL+ExtDyadLL+ExtDyadHH+ExtClosedDyadHL+ExtClosedDyadLL+ExtClosedDyadHH+ExtThreeNoConnHLH+ExtThreeNoConnHLL+ExtThreeNoConnLLL+ExtThreeNoConnHHH+ExtThreeTwoConHLH+ExtThreeTwoConHLL+ExtThreeTwoConLLL+ExtThreeTwoConHHH+ExtThreeOneConnHLH+ExtThreeOneConnHLL+ExtThreeOneConnLLL+ExtThreeOneConnHHH+ExtThreeAllConnHLH+ExtThreeAllConnHLL+ExtThreeAllConnLLL+ExtThreeAllConnHHH +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(EXT.MODEL)
summary(EXT.MODEL)
anova(NULL.MODEL,EXT.MODEL)

NULL.MODEL <-lmer(ExtChangeHH ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
EXT.MODEL <-lmer(ExtChangeHH ~ExtSingleL+ExtSingleH+ExtDyadHL+ExtDyadLL+ExtDyadHH+ExtClosedDyadHL+ExtClosedDyadLL+ExtClosedDyadHH+ExtThreeNoConnHLH+ExtThreeNoConnHLL+ExtThreeNoConnLLL+ExtThreeNoConnHHH+ExtThreeTwoConHLH+ExtThreeTwoConHLL+ExtThreeTwoConLLL+ExtThreeTwoConHHH+ExtThreeOneConnHLH+ExtThreeOneConnHLL+ExtThreeOneConnLLL+ExtThreeOneConnHHH+ExtThreeAllConnHLH+ExtThreeAllConnHLL+ExtThreeAllConnLLL+ExtThreeAllConnHHH +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(EXT.MODEL)
summary(EXT.MODEL)
anova(NULL.MODEL,EXT.MODEL)


#Agreeabless

NULL.MODEL <-lmer(AgreeChangeLL ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
AGREE.MODEL <-lmer(AgreeChangeLL ~AgreeSingleL+AgreeSingleH+AgreeDyadHL+AgreeDyadLL+AgreeDyadHH+AgreeClosedDyadHL+AgreeClosedDyadLL+AgreeClosedDyadHH+AgreeThreeNoConnHLH+AgreeThreeNoConnHLL+AgreeThreeNoConnLLL+AgreeThreeNoConnHHH+AgreeThreeTwoConHLH+AgreeThreeTwoConHLL+AgreeThreeTwoConLLL+AgreeThreeTwoConHHH+AgreeThreeOneConnHLH+AgreeThreeOneConnHLL+AgreeThreeOneConnLLL+AgreeThreeOneConnHHH+AgreeThreeAllConnHLH+AgreeThreeAllConnHLL+AgreeThreeAllConnLLL+AgreeThreeAllConnHHH + (1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(AGREE.MODEL)
summary(AGREE.MODEL)
anova(NULL.MODEL,AGREE.MODEL)

NULL.MODEL <-lmer(AgreeChangeLH ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
AGREE.MODEL <-lmer(AgreeChangeLH ~AgreeSingleL+AgreeSingleH+AgreeDyadHL+AgreeDyadLL+AgreeDyadHH+AgreeClosedDyadHL+AgreeClosedDyadLL+AgreeClosedDyadHH+AgreeThreeNoConnHLH+AgreeThreeNoConnHLL+AgreeThreeNoConnLLL+AgreeThreeNoConnHHH+AgreeThreeTwoConHLH+AgreeThreeTwoConHLL+AgreeThreeTwoConLLL+AgreeThreeTwoConHHH+AgreeThreeOneConnHLH+AgreeThreeOneConnHLL+AgreeThreeOneConnLLL+AgreeThreeOneConnHHH+AgreeThreeAllConnHLH+AgreeThreeAllConnHLL+AgreeThreeAllConnLLL+AgreeThreeAllConnHHH + (1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(AGREE.MODEL)
summary(AGREE.MODEL)
anova(NULL.MODEL,AGREE.MODEL)

NULL.MODEL <-lmer(AgreeChangeHL ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
AGREE.MODEL <-lmer(AgreeChangeHL ~AgreeSingleL+AgreeSingleH+AgreeDyadHL+AgreeDyadLL+AgreeDyadHH+AgreeClosedDyadHL+AgreeClosedDyadLL+AgreeClosedDyadHH+AgreeThreeNoConnHLH+AgreeThreeNoConnHLL+AgreeThreeNoConnLLL+AgreeThreeNoConnHHH+AgreeThreeTwoConHLH+AgreeThreeTwoConHLL+AgreeThreeTwoConLLL+AgreeThreeTwoConHHH+AgreeThreeOneConnHLH+AgreeThreeOneConnHLL+AgreeThreeOneConnLLL+AgreeThreeOneConnHHH+AgreeThreeAllConnHLH+AgreeThreeAllConnHLL+AgreeThreeAllConnLLL+AgreeThreeAllConnHHH + (1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(AGREE.MODEL)
summary(AGREE.MODEL)
anova(NULL.MODEL,AGREE.MODEL)

NULL.MODEL <-lmer(AgreeChangeHH ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
AGREE.MODEL <-lmer(AgreeChangeHH ~AgreeSingleL+AgreeSingleH+AgreeDyadHL+AgreeDyadLL+AgreeDyadHH+AgreeClosedDyadHL+AgreeClosedDyadLL+AgreeClosedDyadHH+AgreeThreeNoConnHLH+AgreeThreeNoConnHLL+AgreeThreeNoConnLLL+AgreeThreeNoConnHHH+AgreeThreeTwoConHLH+AgreeThreeTwoConHLL+AgreeThreeTwoConLLL+AgreeThreeTwoConHHH+AgreeThreeOneConnHLH+AgreeThreeOneConnHLL+AgreeThreeOneConnLLL+AgreeThreeOneConnHHH+AgreeThreeAllConnHLH+AgreeThreeAllConnHLL+AgreeThreeAllConnLLL+AgreeThreeAllConnHHH + (1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(AGREE.MODEL)
summary(AGREE.MODEL)
anova(NULL.MODEL,AGREE.MODEL)


#Conscientiousness

NULL.MODEL <-lmer(ConChangeLL ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
CON.MODEL <-lmer(ConChangeLL ~ConSingleL+ConSingleH+ConDyadHL+ConDyadLL+ConDyadHH+ConClosedDyadHL+ConClosedDyadLL+ConClosedDyadHH+ConThreeNoConnHLH+ConThreeNoConnHLL+ConThreeNoConnLLL+ConThreeNoConnHHH+ConThreeTwoConHLH+ConThreeTwoConHLL+ConThreeTwoConLLL+ConThreeTwoConHHH+ConThreeOneConnHLH+ConThreeOneConnHLL+ConThreeOneConnLLL+ConThreeOneConnHHH+ConThreeAllConnHLH+ConThreeAllConnHLL+ConThreeAllConnLLL+ConThreeAllConnHHH + (1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(CON.MODEL)
summary(CON.MODEL)
anova(NULL.MODEL,CON.MODEL)

NULL.MODEL <-lmer(ConChangeLH ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
CON.MODEL <-lmer(ConChangeLH ~ConSingleL+ConSingleH+ConDyadHL+ConDyadLL+ConDyadHH+ConClosedDyadHL+ConClosedDyadLL+ConClosedDyadHH+ConThreeNoConnHLH+ConThreeNoConnHLL+ConThreeNoConnLLL+ConThreeNoConnHHH+ConThreeTwoConHLH+ConThreeTwoConHLL+ConThreeTwoConLLL+ConThreeTwoConHHH+ConThreeOneConnHLH+ConThreeOneConnHLL+ConThreeOneConnLLL+ConThreeOneConnHHH+ConThreeAllConnHLH+ConThreeAllConnHLL+ConThreeAllConnLLL+ConThreeAllConnHHH + (1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(CON.MODEL)
summary(CON.MODEL)
anova(NULL.MODEL,CON.MODEL)

NULL.MODEL <-lmer(ConChangeHL ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
CON.MODEL <-lmer(ConChangeHL ~ConSingleL+ConSingleH+ConDyadHL+ConDyadLL+ConDyadHH+ConClosedDyadHL+ConClosedDyadLL+ConClosedDyadHH+ConThreeNoConnHLH+ConThreeNoConnHLL+ConThreeNoConnLLL+ConThreeNoConnHHH+ConThreeTwoConHLH+ConThreeTwoConHLL+ConThreeTwoConLLL+ConThreeTwoConHHH+ConThreeOneConnHLH+ConThreeOneConnHLL+ConThreeOneConnLLL+ConThreeOneConnHHH+ConThreeAllConnHLH+ConThreeAllConnHLL+ConThreeAllConnLLL+ConThreeAllConnHHH + (1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(CON.MODEL)
summary(CON.MODEL)
anova(NULL.MODEL,CON.MODEL)

NULL.MODEL <-lmer(ConChangeHH ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
CON.MODEL <-lmer(ConChangeHH ~ConSingleL+ConSingleH+ConDyadHL+ConDyadLL+ConDyadHH+ConClosedDyadHL+ConClosedDyadLL+ConClosedDyadHH+ConThreeNoConnHLH+ConThreeNoConnHLL+ConThreeNoConnLLL+ConThreeNoConnHHH+ConThreeTwoConHLH+ConThreeTwoConHLL+ConThreeTwoConLLL+ConThreeTwoConHHH+ConThreeOneConnHLH+ConThreeOneConnHLL+ConThreeOneConnLLL+ConThreeOneConnHHH+ConThreeAllConnHLH+ConThreeAllConnHLL+ConThreeAllConnLLL+ConThreeAllConnHHH + (1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(CON.MODEL)
summary(CON.MODEL)
anova(NULL.MODEL,CON.MODEL)


#EmotionalStability

NULL.MODEL <-lmer(EmStaChangeLL ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
EMSTA.MODEL <-lmer(EmStaChangeLL ~EmStaSingleL+EmStaSingleH+EmStaDyadHL+EmStaDyadLL+EmStaDyadHH+EmStaClosedDyadHL+EmStaClosedDyadLL+EmStaClosedDyadHH+EmStaThreeNoConnHLH+EmStaThreeNoConnHLL+EmStaThreeNoConnLLL+EmStaThreeNoConnHHH+EmStaThreeTwoConHLH+EmStaThreeTwoConHLL+EmStaThreeTwoConLLL+EmStaThreeTwoConHHH+EmStaThreeOneConnHLH+EmStaThreeOneConnHLL+EmStaThreeOneConnLLL+EmStaThreeOneConnHHH+EmStaThreeAllConnHLH+EmStaThreeAllConnHLL+EmStaThreeAllConnLLL+EmStaThreeAllConnHHH  + (1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(EMSTA.MODEL)
summary(EMSTA.MODEL)
anova(NULL.MODEL,EMSTA.MODEL)

NULL.MODEL <-lmer(EmStaChangeLH ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
EMSTA.MODEL <-lmer(EmStaChangeLH ~EmStaSingleL+EmStaSingleH+EmStaDyadHL+EmStaDyadLL+EmStaDyadHH+EmStaClosedDyadHL+EmStaClosedDyadLL+EmStaClosedDyadHH+EmStaThreeNoConnHLH+EmStaThreeNoConnHLL+EmStaThreeNoConnLLL+EmStaThreeNoConnHHH+EmStaThreeTwoConHLH+EmStaThreeTwoConHLL+EmStaThreeTwoConLLL+EmStaThreeTwoConHHH+EmStaThreeOneConnHLH+EmStaThreeOneConnHLL+EmStaThreeOneConnLLL+EmStaThreeOneConnHHH+EmStaThreeAllConnHLH+EmStaThreeAllConnHLL+EmStaThreeAllConnLLL+EmStaThreeAllConnHHH  + (1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(EMSTA.MODEL)
summary(EMSTA.MODEL)
anova(NULL.MODEL,EMSTA.MODEL)

NULL.MODEL <-lmer(EmStaChangeHL ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
EMSTA.MODEL <-lmer(EmStaChangeHL ~EmStaSingleL+EmStaSingleH+EmStaDyadHL+EmStaDyadLL+EmStaDyadHH+EmStaClosedDyadHL+EmStaClosedDyadLL+EmStaClosedDyadHH+EmStaThreeNoConnHLH+EmStaThreeNoConnHLL+EmStaThreeNoConnLLL+EmStaThreeNoConnHHH+EmStaThreeTwoConHLH+EmStaThreeTwoConHLL+EmStaThreeTwoConLLL+EmStaThreeTwoConHHH+EmStaThreeOneConnHLH+EmStaThreeOneConnHLL+EmStaThreeOneConnLLL+EmStaThreeOneConnHHH+EmStaThreeAllConnHLH+EmStaThreeAllConnHLL+EmStaThreeAllConnLLL+EmStaThreeAllConnHHH  + (1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(EMSTA.MODEL)
summary(EMSTA.MODEL)
anova(NULL.MODEL,EMSTA.MODEL)

NULL.MODEL <-lmer(EmStaChangeHH ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
EMSTA.MODEL <-lmer(EmStaChangeHH ~EmStaSingleL+EmStaSingleH+EmStaDyadHL+EmStaDyadLL+EmStaDyadHH+EmStaClosedDyadHL+EmStaClosedDyadLL+EmStaClosedDyadHH+EmStaThreeNoConnHLH+EmStaThreeNoConnHLL+EmStaThreeNoConnLLL+EmStaThreeNoConnHHH+EmStaThreeTwoConHLH+EmStaThreeTwoConHLL+EmStaThreeTwoConLLL+EmStaThreeTwoConHHH+EmStaThreeOneConnHLH+EmStaThreeOneConnHLL+EmStaThreeOneConnLLL+EmStaThreeOneConnHHH+EmStaThreeAllConnHLH+EmStaThreeAllConnHLL+EmStaThreeAllConnLLL+EmStaThreeAllConnHHH  + (1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(EMSTA.MODEL)
summary(EMSTA.MODEL)
anova(NULL.MODEL,EMSTA.MODEL)


#Creativity

NULL.MODEL <-lmer(CreateChangeLL ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
CREATE.MODEL <-lmer(CreateChangeLL ~CreateSingleL+CreateSingleH+CreateDyadHL+CreateDyadLL+CreateDyadHH+CreateClosedDyadHL+CreateClosedDyadLL+CreateClosedDyadHH+CreateThreeNoConnHLH+CreateThreeNoConnHLL+CreateThreeNoConnLLL+CreateThreeNoConnHHH+CreateThreeTwoConHLH+CreateThreeTwoConHLL+CreateThreeTwoConLLL+CreateThreeTwoConHHH+CreateThreeOneConnHLH+CreateThreeOneConnHLL+CreateThreeOneConnLLL+CreateThreeOneConnHHH+CreateThreeAllConnHLH+CreateThreeAllConnHLL+CreateThreeAllConnLLL+CreateThreeAllConnHHH + (1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(CREATE.MODEL)
summary(CREATE.MODEL)
anova(NULL.MODEL,CREATE.MODEL)

NULL.MODEL <-lmer(CreateChangeLH ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
CREATE.MODEL <-lmer(CreateChangeLH ~CreateSingleL+CreateSingleH+CreateDyadHL+CreateDyadLL+CreateDyadHH+CreateClosedDyadHL+CreateClosedDyadLL+CreateClosedDyadHH+CreateThreeNoConnHLH+CreateThreeNoConnHLL+CreateThreeNoConnLLL+CreateThreeNoConnHHH+CreateThreeTwoConHLH+CreateThreeTwoConHLL+CreateThreeTwoConLLL+CreateThreeTwoConHHH+CreateThreeOneConnHLH+CreateThreeOneConnHLL+CreateThreeOneConnLLL+CreateThreeOneConnHHH+CreateThreeAllConnHLH+CreateThreeAllConnHLL+CreateThreeAllConnLLL+CreateThreeAllConnHHH + (1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(CREATE.MODEL)
summary(CREATE.MODEL)
anova(NULL.MODEL,CREATE.MODEL)

NULL.MODEL <-lmer(CreateChangeHL ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
CREATE.MODEL <-lmer(CreateChangeHL ~CreateSingleL+CreateSingleH+CreateDyadHL+CreateDyadLL+CreateDyadHH+CreateClosedDyadHL+CreateClosedDyadLL+CreateClosedDyadHH+CreateThreeNoConnHLH+CreateThreeNoConnHLL+CreateThreeNoConnLLL+CreateThreeNoConnHHH+CreateThreeTwoConHLH+CreateThreeTwoConHLL+CreateThreeTwoConLLL+CreateThreeTwoConHHH+CreateThreeOneConnHLH+CreateThreeOneConnHLL+CreateThreeOneConnLLL+CreateThreeOneConnHHH+CreateThreeAllConnHLH+CreateThreeAllConnHLL+CreateThreeAllConnLLL+CreateThreeAllConnHHH + (1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(CREATE.MODEL)
summary(CREATE.MODEL)
anova(NULL.MODEL,CREATE.MODEL)

NULL.MODEL <-lmer(CreateChangeHH ~1 +(1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(NULL.MODEL)
CREATE.MODEL <-lmer(CreateChangeHH ~CreateSingleL+CreateSingleH+CreateDyadHL+CreateDyadLL+CreateDyadHH+CreateClosedDyadHL+CreateClosedDyadLL+CreateClosedDyadHH+CreateThreeNoConnHLH+CreateThreeNoConnHLL+CreateThreeNoConnLLL+CreateThreeNoConnHHH+CreateThreeTwoConHLH+CreateThreeTwoConHLL+CreateThreeTwoConLLL+CreateThreeTwoConHHH+CreateThreeOneConnHLH+CreateThreeOneConnHLL+CreateThreeOneConnLLL+CreateThreeOneConnHHH+CreateThreeAllConnHLH+CreateThreeAllConnHLL+CreateThreeAllConnLLL+CreateThreeAllConnHHH + (1| UserID), Graphlets, REML = FALSE)
r.squaredGLMM(CREATE.MODEL)
summary(CREATE.MODEL)
anova(NULL.MODEL,CREATE.MODEL)
