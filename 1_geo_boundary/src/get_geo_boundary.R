
#' Grab the geographic boundary that you will model. The boundary is likely in the 'in' folder,
#' but should make a function that pulls HUC boundaries or something similar.
#'
#' @param ind_file indicator file for scipiper target
#' @param region geographic region which you want to model. This is set in the 'lib/cfg/model_settings.yml' file
#' @param boundary_file_loc location of geographic boundary, defaults to 'in' folder 1_geo_boundary
#' @param gd_config configuration file for pushing to Google Drive. Defaults to 'lib/cfg/gd_config.yml'

get_geo_boundary = function(ind_file,
                            region,
                            boundary_file_loc = '1_geo_boundary/in',
                            gd_config = 'lib/cfg/gd_config.yml'){


  geo_boundary = sf::read_sf(file.path(boundary_file_loc, region, paste0(region, '.shp')))

  geo_boundary_file = as_data_file(ind_file)
  saveRDS(geo_boundary, geo_boundary_file)
  gd_put(remote_ind = ind_file, local_source = geo_boundary_file, config_file = gd_config)
}

