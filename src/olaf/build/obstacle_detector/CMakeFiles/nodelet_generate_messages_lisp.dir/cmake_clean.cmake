file(REMOVE_RECURSE
  "obstacle_detector_gui_automoc.cpp"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/nodelet_generate_messages_lisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()