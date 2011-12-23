#ifndef __glextplatform_h_
#define __glextplatform_h_

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

#define	GL_OES_blend_equation_separate
#define	GL_OES_blend_func_separate
#define	GL_OES_blend_subtract
#define	GL_OES_compressed_ETC1_RGB8_texture
#define	GL_OES_depth24
#define	GL_OES_depth32
#define	GL_OES_draw_texture
#define	GL_OES_EGL_image
#define	GL_OES_fixed_point
#define	GL_OES_framebuffer_object
#define	GL_OES_mapbuffer
#define	GL_OES_matrix_get
#define	GL_OES_matrix_palette
#define	GL_OES_packed_depth_stencil
#define	GL_OES_rgb8_rgba8
#define	GL_OES_stencil1
#define	GL_OES_stencil4
#define	GL_OES_stencil8
#define	GL_OES_stencil_wrap
#define	GL_OES_texture_cube_map
#define	GL_OES_texture_mirrored_repeat
#define	GL_AMD_compressed_3DC_texture
#define	GL_AMD_compressed_ATC_texture
#define	GL_EXT_blend_minmax
#define	GL_EXT_discard_framebuffer
#define	GL_EXT_read_format_bgra
#define	GL_EXT_texture_filter_anisotropic
#define	GL_EXT_texture_format_BGRA8888
#define	GL_EXT_texture_lod_bias
#define	GL_IMG_read_format
#define	GL_IMG_texture_compression_pvrtc
#define	GL_IMG_texture_env_enhanced_fixed_function
#define	GL_IMG_user_clip_plane
#define	GL_IMG_texture_stream
#define	GL_IMG_vertex_program
#define	GL_NV_fence
#define	GL_QCOM_extended_get
#define	GL_QCOM_perfmon_global_mode
#define	GL_QCOM_writeonly_rendering


/* GLES 1.1 Platform-specific enables. 
 * Anything that is undef-ed is enabled.
 */
#if defined(PRE)

#undef GL_OES_framebuffer_object
#undef GL_OES_compressed_ETC1_RGB8_texture
#undef GL_OES_EGL_image
#undef GL_OES_depth24
#undef GL_OES_mapbuffer
#undef GL_OES_element_index_uint

#undef GL_EXT_multi_draw_arrays

#undef GL_IMG_read_format
#undef GL_IMG_texture_compression_pvrtc
#undef GL_IMG_texture_format_BGRA8888

#elif defined(PIXI)

#undef GL_OES_framebuffer_object
#undef GL_OES_compressed_ETC1_RGB8_texture
#undef GL_OES_EGL_image
#undef GL_OES_depth24
#undef GL_OES_element_index_uint
#undef GL_OES_fbo_render_mipmap
#undef GL_OES_packed_depth_stencil

#undef GL_EXT_texture_filter_anisotropic
#undef GL_EXT_texture_format_BGRA8888

#undef GL_QCOM_driver_control
#undef GL_QCOM_extended_get
#undef GL_QCOM_extended_get2
#undef GL_QCOM_perfmon_global_mode
#undef GL_QCOM_writeonly_rendering

#undef GL_AMD_compressed_3DC_texture
#undef GL_AMD_compressed_ATC_texture

#undef GL_NV_fence

#elif defined(WIN32) || defined(__linux__) || defined(__MACOSX__) || defined(__APPLE__)

#undef GL_OES_framebuffer_object
#undef GL_IMG_texture_compression_pvrtc

#else

#undef GL_OES_framebuffer_object

#endif

#ifdef __cplusplus
}
#endif

#endif /* __glextplatform_h_ */
