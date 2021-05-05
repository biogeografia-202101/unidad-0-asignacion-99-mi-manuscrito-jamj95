bci_env_grid_density <- bci_env_grid %>% 
  mutate(area= st_area(geometry), densidad_indiv = abundancia_global/area)
env_num_density <- bci_env_grid_density %>%
  dplyr::select(-id, -matches('^U.*')) %>% 
  st_drop_geometry %>% 
  mutate(
    riqueza_rubic = specnumber(mc_rubic),
  abundancia_rubic = rowSums(mc_rubic)) %>% 
  rename_all(gsub, pattern = '_pct$', replacement = '') %>% 
  rename_all(gsub, pattern = '_| ', replacement = '\n')
##
p_cor_env_num_density_suelo_spear <- env_num_density %>% 
  dplyr::select(matches('^[A-T,Z]|abundancia|densidad|riqueza|^pH$', ignore.case = F)) %>% 
  ezCorM(r_size_lims = c(4,8), label_size = 3, method = 'spearman')
p_cor_env_num_density_suelo_spear

png(
  filename = 'p_cor_env_density_suelo_spear.png',
  width = 1920, height = 1080, res = 125
)
p_cor_env_num_density_suelo_spear
dev.off()
##dplyr::select_if(is.numeric) %>% 

