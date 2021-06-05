par(mfrow = c(1, 2))
c_dend_reord <- reorder.hclust(lista_cl$cl_complete, mi_fam_norm_d)
plot(c_dend_reord, hang = -1)
rect.hclust(
  tree = c_dend_reord,
  k = anch_sil_complete$n_grupos_optimo)
plot(c_dend_reord, hang = -1)
rect.hclust(
  tree = c_dend_reord,
  k = anch_sil_complete$n_grupos_optimo)


w_dend_reord <- reorder.hclust(lista_cl$cl_ward, mi_fam_norm_d)
plot(w_dend_reord, hang = -1)
rect.hclust(
  tree = w_dend_reord,
  k = anch_sil_ward$n_grupos_optimo)
plot(w_dend_reord, hang = -1)
rect.hclust(
  tree = w_dend_reord,
  k = anch_sil_ward$n_grupos_optimo)
par(mfrow = c(1, 1))
