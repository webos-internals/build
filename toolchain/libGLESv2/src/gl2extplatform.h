#ifndef __gl2extplatform_h_
#define __gl2extplatform_h_

#ifdef __cplusplus
extern "C" {
#endif

/* Platform Specific Extenaions
 *
 * Defining extensions here disables them.
 * Everything is disabled by default. See the
 * platform-specific sections below that will
 * undef (enable) the appropriate extensions.
 */

#define	GL_OES_compressed_ETC1_RGB8_texture
#define	GL_OES_compressed_paletted_texture
#define	GL_OES_depth24
#define	GL_OES_depth32
#define	GL_OES_EGL_image
#define	GL_OES_get_program_binary
#define	GL_OES_mapbuffer
#define	GL_OES_packed_depth_stencil
#define	GL_OES_rgb8_rgba8
#define	GL_OES_standard_derivatives
#define	GL_OES_stencil1
#define	GL_OES_stencil4
#define	GL_OES_texture3D
#define	GL_OES_texture_half_float
#define	GL_OES_vertex_array_object
#define	GL_OES_vertex_type_10_10_10_2
#define	GL_AMD_compressed_3DC_texture
#define	GL_AMD_compressed_ATC_texture
#define	GL_AMD_performance_monitor
#define	GL_AMD_program_binary_Z400
#define	GL_EXT_blend_minmax
#define	GL_EXT_discard_framebuffer
#define	GL_EXT_read_format_bgra
#define	GL_EXT_texture_filter_anisotropic
#define	GL_EXT_texture_compression_dxt1
#define	GL_EXT_texture_compression_s3tc
#define	GL_EXT_texture_format_BGRA8888
#define	GL_EXT_texture_type_2_10_10_10_REV
#define	GL_IMG_program_binary
#define	GL_IMG_read_format
#define	GL_IMG_shader_binary
#define	GL_IMG_texture_compression_pvrtc
#define	GL_IMG_texture_stream
#define	GL_IMG_vertex_array_object
#define	GL_NV_fence
#define	GL_QCOM_extended_get
#define	GL_QCOM_perfmon_global_mode
#define	GL_QCOM_writeonly_rendering
#define	GL_QCOM_tiled_rendering
#define	GL_OES_compressed_ETC1_RGB8_texture
#define	GL_OES_compressed_paletted_texture
#define	GL_OES_depth24
#define	GL_OES_depth32
#define	GL_OES_depth_texture
#define	GL_OES_EGL_image
#define	GL_OES_element_index_uint
#define	GL_OES_fbo_render_mipmap
#define	GL_OES_fragment_precision_high
#define	GL_OES_get_program_binary
#define	GL_OES_mapbuffer
#define	GL_OES_packed_depth_stencil
#define	GL_OES_rgb8_rgba8
#define	GL_OES_standard_derivatives
#define	GL_OES_stencil1
#define	GL_OES_stencil4
#define	GL_OES_texture_3D
#define	GL_OES_texture_float
#define	GL_OES_texture_float_linear
#define	GL_OES_texture_half_float
#define	GL_OES_texture_half_float_linear
#define	GL_OES_texture_npot
#define	GL_OES_vertex_array_object
#define	GL_OES_vertex_half_float
#define	GL_OES_vertex_type_10_10_10_2
#define	GL_AMD_compressed_3DC_texture
#define	GL_AMD_compressed_ATC_texture
#define	GL_AMD_performance_monitor
#define	GL_AMD_program_binary_Z400
#define	GL_EXT_blend_minmax
#define	GL_EXT_discard_framebuffer
#define	GL_EXT_multi_draw_arrays
#define	GL_EXT_read_format_bgra
#define	GL_EXT_texture_filter_anisotropic
#define	GL_EXT_texture_format_BGRA8888
#define	GL_EXT_texture_type_2_10_10_10_REV
#define	GL_IMG_program_binary
#define	GL_IMG_read_format
#define	GL_IMG_shader_binary
#define	GL_IMG_texture_compression_pvrtc
#define	GL_IMG_texture_stream2
#define	GL_IMG_vertex_array_object
#define	GL_NV_fence
#define	GL_QCOM_driver_control
#define	GL_QCOM_extended_get
#define	GL_QCOM_extended_get2
#define	GL_QCOM_perfmon_global_mode
#define	GL_QCOM_writeonly_rendering
#define	GL_QCOM_tiled_rendering

/* GLES 2.0 Platform-specific enables. 
 * Anything that is undef-ed is enabled.
 */
#if defined(PRE)

#undef GL_OES_compressed_ETC1_RGB8_texture
#undef GL_OES_EGL_image
#undef GL_OES_rgb8_rgba8
#undef GL_OES_texture_float
#undef GL_OES_texture_half_float
#undef GL_OES_vertex_half_float
#undef GL_OES_depth24
#undef GL_OES_depth_texture
#undef GL_OES_mapbuffer
#undef GL_OES_element_index_uint
#undef GL_OES_fragment_precision_high
#undef GL_OES_get_program_binary
#undef GL_OES_standard_derivatives
#undef GL_OES_texture_npot

#undef GL_EXT_multi_draw_arrays

#undef GL_IMG_program_binary
#undef GL_IMG_read_format
#undef GL_IMG_shader_binary
#undef GL_IMG_texture_compression_pvrtc
#undef GL_IMG_texture_format_BGRA8888
#undef GL_IMG_texture_stream2

#elif defined(PIXI)

#undef GL_OES_compressed_ETC1_RGB8_texture
#undef GL_OES_EGL_image
#undef GL_OES_rgb8_rgba8
#undef GL_OES_texture_float
#undef GL_OES_texture_half_float
#undef GL_OES_vertex_half_float
#undef GL_OES_depth24
#undef GL_OES_depth_texture
#undef GL_OES_element_index_uint
#undef GL_OES_fragment_precision_high
#undef GL_OES_get_program_binary
#undef GL_OES_standard_derivatives

#undef GL_OES_fbo_render_mipmap
#undef GL_OES_packed_depth_stencil
#undef GL_OES_texture_3D
#undef GL_OES_texture_half_float_linear
#undef GL_OES_texture_npot
#undef GL_OES_vertex_type_10_10_10_2

#undef GL_EXT_texture_filter_anisotropic
#undef GL_EXT_texture_format_BGRA8888
#undef GL_EXT_texture_type_2_10_10_10_REV

#undef GL_QCOM_driver_control
#undef GL_QCOM_extended_get
#undef GL_QCOM_extended_get2
#undef GL_QCOM_perfmon_global_mode
#undef GL_QCOM_tiled_rendering
#undef GL_QCOM_writeonly_rendering

#undef GL_AMD_compressed_3DC_texture
#undef GL_AMD_compressed_ATC_texture
#undef GL_AMD_performance_monitor
#undef GL_AMD_program_binary_Z400

#undef GL_NV_fence

#elif defined(WIN32) || defined(__linux__) || defined(__MACOSX__) || defined(__APPLE__)

#undef GL_OES_framebuffer_object
#undef GL_IMG_texture_compression_pvrtc

#else

#endif

#ifdef __cplusplus
}
#endif

#endif /* __gl2extplatform_h_ */

