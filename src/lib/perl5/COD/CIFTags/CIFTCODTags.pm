#------------------------------------------------------------------------
#$Author$
#$Date$ 
#$Revision$
#$URL$
#------------------------------------------------------------------------
#* 
#  A list of TCOD CIF dictionary tags. Compiled from version 0.006 of
#  cif_tcod.dic:
#
#  URL: svn://www.crystallography.net/tcod/cif/dictionaries/cif_tcod.dic
#  Relative URL: ^/cif/dictionaries/cif_tcod.dic
#  Repository Root: svn://www.crystallography.net/tcod
#  Repository UUID: f3fa9230-7ed6-4b69-bb24-8fd292b8517b
#  Revision: 274
#**

package COD::CIFTags::CIFTCODTags;

use strict;

require Exporter;
@COD::CIFTags::CIFTCODTags::ISA = qw(Exporter);
@COD::CIFTags::CIFTCODTags::EXPORT_OK = qw( @tag_list );

@COD::CIFTags::CIFTCODTags::tag_list = qw (
_tcod_atom_site_initial_Cartn_x
_tcod_atom_site_initial_Cartn_y
_tcod_atom_site_initial_Cartn_z
_tcod_atom_site_initial_fract_x
_tcod_atom_site_initial_fract_y
_tcod_atom_site_initial_fract_z
_tcod_atom_site_residual_force
_tcod_atom_site_residual_force_magnitude
_tcod_atom_sites_sim_cell_tran_matrix_11
_tcod_atom_sites_sim_cell_tran_matrix_12
_tcod_atom_sites_sim_cell_tran_matrix_13
_tcod_atom_sites_sim_cell_tran_matrix_21
_tcod_atom_sites_sim_cell_tran_matrix_22
_tcod_atom_sites_sim_cell_tran_matrix_23
_tcod_atom_sites_sim_cell_tran_matrix_31
_tcod_atom_sites_sim_cell_tran_matrix_32
_tcod_atom_sites_sim_cell_tran_matrix_33
_tcod_atom_sites_sim_cell_tran_vector_1
_tcod_atom_sites_sim_cell_tran_vector_2
_tcod_atom_sites_sim_cell_tran_vector_3
_tcod_citation_linkage
_tcod_computation_command
_tcod_computation_CPU_time
_tcod_computation_database_name
_tcod_computation_database_URI
_tcod_computation_database_version
_tcod_computation_environment
_tcod_computation_input_file
_tcod_computation_log_file
_tcod_computation_reference_id
_tcod_computation_reference_URI
_tcod_computation_reference_uuid
_tcod_computation_stderr
_tcod_computation_stdout
_tcod_computation_step
_tcod_computation_wallclock_time
_tcod_content_encoding_id
_tcod_content_encoding_layer_id
_tcod_content_encoding_layer_type
_tcod_database_code
_tcod_ff_citation_id
_tcod_ff_id
_tcod_ff_name
_tcod_ff_type
_tcod_ff_version
_tcod_file_content_encoding
_tcod_file_contents
_tcod_file_contents_type
_tcod_file_format
_tcod_file_id
_tcod_file_interpreter
_tcod_file_md5sum
_tcod_file_name
_tcod_file_role
_tcod_file_sha1sum
_tcod_file_source_database_name
_tcod_file_source_database_URI
_tcod_file_source_database_version
_tcod_file_source_reference_id
_tcod_file_source_reference_uuid
_tcod_file_source_reference_version
_tcod_file_URI
_tcod_initial_cell_param_db_abbrev
_tcod_initial_cell_param_db_code
_tcod_initial_cell_param_db_name
_tcod_initial_cell_param_db_URI
_tcod_initial_cell_param_URI
_tcod_initial_coordinate_db_abbrev
_tcod_initial_coordinate_db_code
_tcod_initial_coordinate_db_name
_tcod_initial_coordinate_db_URI
_tcod_initial_coordinate_URI
_tcod_model
_tcod_software_compiler
_tcod_software_compiler_options
_tcod_software_compiler_version
_tcod_software_executable_path
_tcod_software_library
_tcod_software_library_binary_uri
_tcod_software_library_compilation_environment
_tcod_software_library_compilation_timestamp
_tcod_software_library_compiler_name
_tcod_software_library_compiler_options
_tcod_software_library_compiler_version
_tcod_software_library_id
_tcod_software_library_path
_tcod_software_library_source_uri
_tcod_software_library_version
_tcod_software_OS_compilation_timestamp
_tcod_software_package
_tcod_software_package_binary_uri
_tcod_software_package_compilation_environment
_tcod_software_package_compilation_timestamp
_tcod_software_package_source_uri
_tcod_software_package_version
_tcod_software_runtime_CPU
_tcod_software_runtime_CPU_version
_tcod_software_runtime_OS
_tcod_software_runtime_OS_binary_uri
_tcod_software_runtime_OS_source_uri
_tcod_software_runtime_OS_version
_tcod_source_database_name
_tcod_source_database_URI
_tcod_source_database_version
_tcod_source_structure_database_id
_tcod_source_structure_database_URI
_tcod_source_structure_database_uuid
_tcod_source_structure_database_version
_tcod_structure_type
_tcod_total_energy
_tcod_total_energy_details
_tcod_total_energy_formula
_tcod_total_energy_gradient
_tcod_total_energy_gradient_details
_tcod_total_energy_gradient_formula
);

1;