

set_sntemp_output = function(output_names, control_file = 'delaware.control'){

  ctrl = readLines(file.path('20191002_Delaware_streamtemp/control', control_file))

  # location of previous output variables
  output_loc_start = grep('aniOutVar_names', ctrl) + 3
  output_loc_end = grep('ani_output_file', ctrl) - 2

  if(ctrl[output_loc_start] == '####'){ # if no output variables previously
    new_ctrl = ctrl

    new_output_loc_start = grep('aniOutVar_names', new_ctrl) + 3

    new_ctrl[grep('aniOutVar_names', new_ctrl) + 1] = as.character(length(output_names$sntemp_output))

    new_ctrl[grep('naniOutVars', new_ctrl) + 3] = as.character(length(output_names$sntemp_output))

    new_ctrl = c(new_ctrl[1:(new_output_loc_start-1)], output_names$sntemp_output, new_ctrl[new_output_loc_start:length(new_ctrl)])
  }else{
    new_ctrl = ctrl[-c(output_loc_start:output_loc_end)] # get rid of old output variables

    new_output_loc_start = grep('aniOutVar_names', new_ctrl) + 3

    new_ctrl[grep('aniOutVar_names', new_ctrl) + 1] = as.character(length(output_names$sntemp_output))

    new_ctrl[grep('naniOutVars', new_ctrl) + 3] = as.character(length(output_names$sntemp_output))

    new_ctrl = c(new_ctrl[1:(new_output_loc_start-1)], output_names$sntemp_output, new_ctrl[new_output_loc_start:length(new_ctrl)])
  }

  writeLines(new_ctrl, file.path('20191002_Delaware_streamtemp/control', control_file))
}


