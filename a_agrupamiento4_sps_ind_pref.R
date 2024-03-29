#' ---
#' title: "Análisis de agrupamiento (cluster analysis). <br> Parte 4: Especies indicadoras, especies con preferencia por hábitats"
#' author: "JR"
#' date: "15 de noviembre, 2020"
#' output: github_document
#' ---

knitr::opts_chunk$set(fig.width=12, fig.height=8)

#' ## Preámbulo
#' 
#' ### Cargar paquetes
#' 
library(indicspecies)
source('biodata/funciones.R')
#' 
#' ### Cargar datos
#' 
load('biodata/Rubiaceae.Rdata')
mi_fam <- mc_rubic
grupos_complete_k2 <- readRDS('grupos_complete_k2.RDS')
table(grupos_complete_k2)
grupos_ward_k2 <- readRDS('grupos_ward_k2.RDS')
table(grupos_ward_k2)
#' 
#' ## Análisis de especies indicadoras mediante IndVal
#' 
#' ### Complete*
#' 
iva_complete_k2 <- multipatt(
  x = mi_fam,
  cluster = grupos_complete_k2,
  func = 'IndVal.g',
  max.order = 1,
  control = how(nperm = 999))
summary(iva_complete_k2, indvalcomp = TRUE)
sort(colSums(mi_fam))
(p_complete_adj <- p.adjust(iva_complete_k2$sign$p.value))
(iva_complete_boot <- strassoc(
  X = mi_fam,
  cluster = grupos_complete_k2,
  func = "IndVal.g",
  nboot = 1000))
#' 
#' Ward*
#' 
iva_ward_k2 <- multipatt(
  x = mi_fam,
  cluster = grupos_ward_k2,
  func = 'IndVal.g',
  max.order = 1,
  control = how(nperm = 999))
summary(iva_ward_k2, indvalcomp = TRUE, alpha = 0.01)
colSums(mi_fam)
(p_ward_adj <- p.adjust(iva_ward_k2$sign$p.value))
(iva_ward_boot <- strassoc(
  X = mi_fam,
  cluster = grupos_ward_k2,
  func = "IndVal.g",
  nboot = 1000))
#'
#' ## Análisis de especies con preferencia por hábitat mediante el coeficiente de correlación biserial puntual
#' 
#' ### UPGMA
#' 
phi_complete_k2 <- multipatt(
  mi_fam,
  grupos_complete_k2,
  func = "r.g",
  max.order = 1,
  control = how(nperm = 999))
summary(phi_complete_k2)
colSums(mi_fam)
(phi_complete_boot <- strassoc(
  X = mi_fam,
  cluster = grupos_complete_k2,
  func = "r.g",
  nboot = 1000))
#'
#' Ward
#' 
phi_ward_k2 <- multipatt(
  mi_fam,
  grupos_ward_k2,
  func = "r.g",
  max.order = 1,
  control = how(nperm = 999))
summary(phi_ward_k2)
colSums(mi_fam)
(phi_ward_boot <- strassoc(
  X = mi_fam,
  cluster = grupos_ward_k2,
  func = "r.g",
  nboot = 1000))
