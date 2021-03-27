
# "main" pseudo-component makefile.

# (Uses default behaviour of compiling all source files in directory, adding 'include' to include path.)

COMPONENT_ADD_INCLUDEDIRS :=    esp_audio/include \
                                esp_codec/include/codec \
                                esp_codec/include/processing \
                                recorder_engine/include \
                                esp_ssdp/include \
                                esp_upnp/include \
                                esp_sip/include  \
                                audio_misc/include

COMPONENT_SRCDIRS := . esp_codec audio_misc

LIBS := esp_processing esp_audio esp-amr esp-amrwbenc esp-aac esp-ogg-container esp-opus esp-tremor esp-flac esp_ssdp esp_upnp esp_sip esp-mp3 codec-utils

ifdef CONFIG_REC_ENG_ENABLE_VAD_ONLY
 LIBS += recorder_engine_vad
endif

ifdef CONFIG_REC_ENG_ENABLE_VAD_WWE
 LIBS += recorder_engine_vad_wwe
endif

ifdef CONFIG_REC_ENG_ENABLE_VAD_WWE_AMR
 LIBS += recorder_engine
endif

COMPONENT_ADD_LDFLAGS +=  -L$(COMPONENT_PATH)/esp_audio/lib \
                          -L$(COMPONENT_PATH)/esp_codec/lib \
                          -L$(COMPONENT_PATH)/recorder_engine/lib \
                          -L$(COMPONENT_PATH)/esp_ssdp/lib \
                          -L$(COMPONENT_PATH)/esp_upnp/lib \
                          -L$(COMPONENT_PATH)/esp_sip/lib \
                           $(addprefix -l,$(LIBS)) \

ALL_LIB_FILES += $(patsubst %,$(COMPONENT_PATH)/%/lib/lib%.a,$(LIBS))
