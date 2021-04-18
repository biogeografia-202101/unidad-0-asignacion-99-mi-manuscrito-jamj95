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
p_cor_envnum_density_suelo <- env_num_density %>% 
  dplyr::select(matches('^[A-T,Z]|abundancia|densidad|riqueza|^pH$', ignore.case = F)) %>% 
  ezCor(r_size_lims = c(4,8), label_size = 3)
p_cor_envnum_density_suelo
##dplyr::select_if(is.numeric) %>% 