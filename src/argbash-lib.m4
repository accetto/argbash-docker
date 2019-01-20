m4_define([INCLUDE_ACCORDING_TO_OUTPUT_TYPE],
	[m4_include([output-$1.m4])])

m4_ifndef([_OUTPUT_TYPE],
	[m4_define([_OUTPUT_TYPE], [bash-script])])


m4_include([list.m4])
m4_include([constants.m4])
m4_include([utilities.m4])
m4_include([collectors.m4])
m4_include([stuff.m4])
m4_include([default_settings.m4])
INCLUDE_ACCORDING_TO_OUTPUT_TYPE(_OUTPUT_TYPE)

dnl These macros that are being undefined are not needed and they present a security threat when exposed during Argbash run
m4_undefine([m4_esyscmd])
m4_undefine([m4_esyscmd_s])
m4_undefine([m4_syscmd])
