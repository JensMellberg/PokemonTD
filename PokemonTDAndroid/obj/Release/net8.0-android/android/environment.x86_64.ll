; ModuleID = 'environment.x86_64.ll'
source_filename = "environment.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.ApplicationConfig = type {
	i8, ; bool uses_mono_llvm
	i8, ; bool uses_mono_aot
	i8, ; bool aot_lazy_load
	i8, ; bool uses_assembly_preload
	i8, ; bool broken_exception_transitions
	i8, ; bool instant_run_enabled
	i8, ; bool jni_add_native_method_registration_attribute_present
	i8, ; bool have_runtime_config_blob
	i8, ; bool have_assemblies_blob
	i8, ; bool marshal_methods_enabled
	i8, ; uint8_t bound_stream_io_exception_type
	i32, ; uint32_t package_naming_policy
	i32, ; uint32_t environment_variable_count
	i32, ; uint32_t system_property_count
	i32, ; uint32_t number_of_assemblies_in_apk
	i32, ; uint32_t bundled_assembly_name_width
	i32, ; uint32_t number_of_assembly_store_files
	i32, ; uint32_t number_of_dso_cache_entries
	i32, ; uint32_t android_runtime_jnienv_class_token
	i32, ; uint32_t jnienv_initialize_method_token
	i32, ; uint32_t jnienv_registerjninatives_method_token
	i32, ; uint32_t jni_remapping_replacement_type_count
	i32, ; uint32_t jni_remapping_replacement_method_index_entry_count
	i32, ; uint32_t mono_components_mask
	ptr ; char* android_package_name
}

%struct.AssemblyStoreAssemblyDescriptor = type {
	i32, ; uint32_t data_offset
	i32, ; uint32_t data_size
	i32, ; uint32_t debug_data_offset
	i32, ; uint32_t debug_data_size
	i32, ; uint32_t config_data_offset
	i32 ; uint32_t config_data_size
}

%struct.AssemblyStoreRuntimeData = type {
	ptr, ; uint8_t data_start
	i32, ; uint32_t assembly_count
	ptr ; AssemblyStoreAssemblyDescriptor assemblies
}

%struct.AssemblyStoreSingleAssemblyRuntimeData = type {
	ptr, ; uint8_t image_data
	ptr, ; uint8_t debug_info_data
	ptr, ; uint8_t config_data
	ptr ; AssemblyStoreAssemblyDescriptor descriptor
}

%struct.DSOCacheEntry = type {
	i64, ; uint64_t hash
	i8, ; bool ignore
	ptr, ; char* name
	ptr ; void* handle
}

%struct.XamarinAndroidBundledAssembly = type {
	i32, ; int32_t apk_fd
	i32, ; uint32_t data_offset
	i32, ; uint32_t data_size
	ptr, ; uint8_t data
	i32, ; uint32_t name_length
	ptr ; char* name
}

; 0x15e6972616d58
@format_tag = dso_local local_unnamed_addr constant i64 385281960275288, align 8

@mono_aot_mode_name = dso_local local_unnamed_addr constant ptr @.str.0, align 8

; Application environment variables array, name:value
@app_environment_variables = dso_local local_unnamed_addr constant [8 x ptr] [
	ptr @.env.0, ; 0
	ptr @.env.1, ; 1
	ptr @.env.2, ; 2
	ptr @.env.3, ; 3
	ptr @.env.4, ; 4
	ptr @.env.5, ; 5
	ptr @.env.6, ; 6
	ptr @.env.7 ; 7
], align 16

; System properties defined by the application
@app_system_properties = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@application_config = dso_local local_unnamed_addr constant %struct.ApplicationConfig {
	i8 0, ; bool uses_mono_llvm
	i8 1, ; bool uses_mono_aot
	i8 1, ; bool aot_lazy_load
	i8 0, ; bool uses_assembly_preload
	i8 0, ; bool broken_exception_transitions
	i8 0, ; bool instant_run_enabled
	i8 0, ; bool jni_add_native_method_registration_attribute_present
	i8 1, ; bool have_runtime_config_blob
	i8 1, ; bool have_assemblies_blob
	i8 0, ; bool marshal_methods_enabled
	i8 0, ; uint8_t bound_stream_io_exception_type (0x0)
	i32 3, ; uint32_t package_naming_policy (0x3)
	i32 8, ; uint32_t environment_variable_count (0x8)
	i32 0, ; uint32_t system_property_count (0x0)
	i32 42, ; uint32_t number_of_assemblies_in_apk (0x2a)
	i32 0, ; uint32_t bundled_assembly_name_width (0x0)
	i32 2, ; uint32_t number_of_assembly_store_files (0x2)
	i32 280, ; uint32_t number_of_dso_cache_entries (0x118)
	i32 33554729, ; uint32_t android_runtime_jnienv_class_token (0x2000129)
	i32 100665671, ; uint32_t jnienv_initialize_method_token (0x6000947)
	i32 100665670, ; uint32_t jnienv_registerjninatives_method_token (0x6000946)
	i32 0, ; uint32_t jni_remapping_replacement_type_count (0x0)
	i32 0, ; uint32_t jni_remapping_replacement_method_index_entry_count (0x0)
	i32 0, ; uint32_t mono_components_mask (0x0)
	ptr @.ApplicationConfig.0_android_package_name; char* android_package_name
}, align 16

; DSO cache entries
@dso_cache = dso_local local_unnamed_addr global [280 x %struct.DSOCacheEntry] [
	%struct.DSOCacheEntry {
		i64 120698629574877762, ; hash 0x1accec39cafe242, from name: Mono.Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 0
	%struct.DSOCacheEntry {
		i64 221057335580609593, ; hash 0x3115a79ba46cc39, from name: libaot-System.Threading.Thread.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.42_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle (0x0)
	}, ; 1
	%struct.DSOCacheEntry {
		i64 274660847975729299, ; hash 0x3cfca96054d0893, from name: System.Net.Http.Json.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.27_name, ; name: libaot-System.Net.Http.Json.dll.so
		ptr null; void* handle (0x0)
	}, ; 2
	%struct.DSOCacheEntry {
		i64 290628453294630638, ; hash 0x4088509d83f66ee, from name: libaot-System.Net.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.29_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 3
	%struct.DSOCacheEntry {
		i64 327393534088447553, ; hash 0x48b22af451a0641, from name: libaot-System.Console.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.19_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle (0x0)
	}, ; 4
	%struct.DSOCacheEntry {
		i64 472512565983034901, ; hash 0x68eb3acdf53be15, from name: libaot-System.ComponentModel.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.18_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 5
	%struct.DSOCacheEntry {
		i64 544465019603341966, ; hash 0x78e540cf615528e, from name: libaot-System.Text.Encoding.Extensions
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.38_name, ; name: libaot-System.Text.Encoding.Extensions.dll.so
		ptr null; void* handle (0x0)
	}, ; 6
	%struct.DSOCacheEntry {
		i64 626497116700919570, ; hash 0x8b1c3ceedc3c712, from name: aot-System.Text.RegularExpressions
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.41_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle (0x0)
	}, ; 7
	%struct.DSOCacheEntry {
		i64 628522906763308403, ; hash 0x8b8f640eed2ad73, from name: libaot-System.ObjectModel.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.32_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 8
	%struct.DSOCacheEntry {
		i64 680930311029487832, ; hash 0x973268299b578d8, from name: aot-System.IO.Compression.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.24_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle (0x0)
	}, ; 9
	%struct.DSOCacheEntry {
		i64 726879158616961668, ; hash 0xa1664be5bffb284, from name: aot-MonoGame.Framework.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.11_name, ; name: libaot-MonoGame.Framework.dll.so
		ptr null; void* handle (0x0)
	}, ; 10
	%struct.DSOCacheEntry {
		i64 750875890346172408, ; hash 0xa6ba5a4da7d1ff8, from name: System.Threading.Thread
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.42_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle (0x0)
	}, ; 11
	%struct.DSOCacheEntry {
		i64 756290313852954525, ; hash 0xa7ee2089046279d, from name: System.Security.Cryptography.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.37_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle (0x0)
	}, ; 12
	%struct.DSOCacheEntry {
		i64 926729488379472330, ; hash 0xcdc678f45bce9ca, from name: aot-Java.Interop.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle (0x0)
	}, ; 13
	%struct.DSOCacheEntry {
		i64 1097501675994448902, ; hash 0xf3b1bf5a20b8406, from name: libaot-System.Collections
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.15_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle (0x0)
	}, ; 14
	%struct.DSOCacheEntry {
		i64 1146928578970395727, ; hash 0xfeab5774446244f, from name: aot-System.ComponentModel.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.16_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 15
	%struct.DSOCacheEntry {
		i64 1288830572241085177, ; hash 0x11e2d893b217e2f9, from name: aot-_Microsoft.Android.Resource.Designer.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.7_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle (0x0)
	}, ; 16
	%struct.DSOCacheEntry {
		i64 1408308371658705060, ; hash 0x138b5100a2ed08a4, from name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.7_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle (0x0)
	}, ; 17
	%struct.DSOCacheEntry {
		i64 1499327756876432029, ; hash 0x14ceaea6ae80c29d, from name: libSystem.Security.Cryptography.Native.Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.3_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle (0x0)
	}, ; 18
	%struct.DSOCacheEntry {
		i64 1513467482682125403, ; hash 0x1500eaa8245f6c5b, from name: Mono.Android.Runtime
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 19
	%struct.DSOCacheEntry {
		i64 1560574748131067758, ; hash 0x15a8467713cc076e, from name: System.Collections.NonGeneric.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.13_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle (0x0)
	}, ; 20
	%struct.DSOCacheEntry {
		i64 1875417405349196092, ; hash 0x1a06d2319b6c713c, from name: System.Drawing.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.21_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 21
	%struct.DSOCacheEntry {
		i64 2010011812825262371, ; hash 0x1be4ff1821c9e923, from name: System.ComponentModel.TypeConverter.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.17_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle (0x0)
	}, ; 22
	%struct.DSOCacheEntry {
		i64 2024202821639637893, ; hash 0x1c1769bdd92c8b85, from name: aot-System.IO.Compression
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.24_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle (0x0)
	}, ; 23
	%struct.DSOCacheEntry {
		i64 2169143264332568652, ; hash 0x1e1a584e6979584c, from name: aot-System.Collections.Concurrent.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.12_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle (0x0)
	}, ; 24
	%struct.DSOCacheEntry {
		i64 2178726392135891111, ; hash 0x1e3c641c3a0738a7, from name: System.Diagnostics.DiagnosticSource.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.20_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle (0x0)
	}, ; 25
	%struct.DSOCacheEntry {
		i64 2204262165896919438, ; hash 0x1e971cc2de1e798e, from name: Mono.Android.Runtime.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 26
	%struct.DSOCacheEntry {
		i64 2278942814095671648, ; hash 0x1fa06e6a419a0160, from name: System.ObjectModel.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.32_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 27
	%struct.DSOCacheEntry {
		i64 2287834202362508563, ; hash 0x1fc00515e8ce7513, from name: System.Collections.Concurrent
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.12_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle (0x0)
	}, ; 28
	%struct.DSOCacheEntry {
		i64 2335503487726329082, ; hash 0x2069600c4d9d1cfa, from name: System.Text.Encodings.Web
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.39_name, ; name: libaot-System.Text.Encodings.Web.dll.so
		ptr null; void* handle (0x0)
	}, ; 29
	%struct.DSOCacheEntry {
		i64 2383056933276923752, ; hash 0x211251a7a380b768, from name: System.Memory.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.26_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle (0x0)
	}, ; 30
	%struct.DSOCacheEntry {
		i64 2476879673203463353, ; hash 0x225fa4f090ad94b9, from name: libaot-System.Runtime.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.36_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 31
	%struct.DSOCacheEntry {
		i64 2497223385847772520, ; hash 0x22a7eb7046413568, from name: System.Runtime
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.36_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 32
	%struct.DSOCacheEntry {
		i64 2516268783161295760, ; hash 0x22eb952063bbc390, from name: _Microsoft.Android.Resource.Designer.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.7_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle (0x0)
	}, ; 33
	%struct.DSOCacheEntry {
		i64 2543609594401387459, ; hash 0x234cb7731191f3c3, from name: aot-System.Threading.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.43_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle (0x0)
	}, ; 34
	%struct.DSOCacheEntry {
		i64 2556787638847292301, ; hash 0x237b88cfa39a438d, from name: libaot-Mono.Android.Runtime
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 35
	%struct.DSOCacheEntry {
		i64 2607857763146079109, ; hash 0x2430f8d18d111b85, from name: libaot-System.Runtime.Serialization.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.35_name, ; name: libaot-System.Runtime.Serialization.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 36
	%struct.DSOCacheEntry {
		i64 2680228656536905837, ; hash 0x253215c33db4686d, from name: libaot-System.Numerics.Vectors
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.31_name, ; name: libaot-System.Numerics.Vectors.dll.so
		ptr null; void* handle (0x0)
	}, ; 37
	%struct.DSOCacheEntry {
		i64 2837562181765940674, ; hash 0x27610bc5303dc5c2, from name: libaot-_Microsoft.Android.Resource.Designer
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.7_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle (0x0)
	}, ; 38
	%struct.DSOCacheEntry {
		i64 2865936624365190494, ; hash 0x27c5da2cec11bd5e, from name: aot-System.ComponentModel.TypeConverter.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.17_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle (0x0)
	}, ; 39
	%struct.DSOCacheEntry {
		i64 2895224535127013735, ; hash 0x282de760093db967, from name: libaot-System.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.44_name, ; name: libaot-System.dll.so
		ptr null; void* handle (0x0)
	}, ; 40
	%struct.DSOCacheEntry {
		i64 2978076563348721961, ; hash 0x295440db18511129, from name: libaot-System.Collections.Specialized
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.14_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle (0x0)
	}, ; 41
	%struct.DSOCacheEntry {
		i64 3188209531010000695, ; hash 0x2c3ecbad355da737, from name: System.Text.Encodings.Web.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.39_name, ; name: libaot-System.Text.Encodings.Web.dll.so
		ptr null; void* handle (0x0)
	}, ; 42
	%struct.DSOCacheEntry {
		i64 3260817401620729492, ; hash 0x2d40c02675040e94, from name: libaot-System.Memory
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.26_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle (0x0)
	}, ; 43
	%struct.DSOCacheEntry {
		i64 3413847582085635339, ; hash 0x2f606c49df8a5d0b, from name: aot-System.Text.Encoding.Extensions
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.38_name, ; name: libaot-System.Text.Encoding.Extensions.dll.so
		ptr null; void* handle (0x0)
	}, ; 44
	%struct.DSOCacheEntry {
		i64 3519863767463074839, ; hash 0x30d911728d679c17, from name: libaot-System.IO.Compression.Brotli
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.23_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle (0x0)
	}, ; 45
	%struct.DSOCacheEntry {
		i64 3657389980202273675, ; hash 0x32c1a8cf2f078b8b, from name: libaot-System.Private.CoreLib
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.48_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle (0x0)
	}, ; 46
	%struct.DSOCacheEntry {
		i64 3703096612151080118, ; hash 0x33640abfb837b4b6, from name: libaot-System.Net.Requests
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.30_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle (0x0)
	}, ; 47
	%struct.DSOCacheEntry {
		i64 3933965368022646939, ; hash 0x369840a8bfadc09b, from name: System.Net.Requests
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.30_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle (0x0)
	}, ; 48
	%struct.DSOCacheEntry {
		i64 3943677120668259164, ; hash 0x36bac1725e44535c, from name: aot-System.ObjectModel.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.32_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 49
	%struct.DSOCacheEntry {
		i64 3966267475168208030, ; hash 0x370b03412596249e, from name: System.Memory
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.26_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle (0x0)
	}, ; 50
	%struct.DSOCacheEntry {
		i64 4009997192427317104, ; hash 0x37a65f335cf1a770, from name: System.Runtime.Serialization.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.35_name, ; name: libaot-System.Runtime.Serialization.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 51
	%struct.DSOCacheEntry {
		i64 4017192615964119979, ; hash 0x37bfef6674dd13ab, from name: aot-System.Runtime.Serialization.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.35_name, ; name: libaot-System.Runtime.Serialization.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 52
	%struct.DSOCacheEntry {
		i64 4154383907710350974, ; hash 0x39a7562737acb67e, from name: System.ComponentModel
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.18_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 53
	%struct.DSOCacheEntry {
		i64 4197700302641184790, ; hash 0x3a413a2f547a4016, from name: libaot-MonoGame.Framework.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.11_name, ; name: libaot-MonoGame.Framework.dll.so
		ptr null; void* handle (0x0)
	}, ; 54
	%struct.DSOCacheEntry {
		i64 4205801962323029395, ; hash 0x3a5e0299f7e7ad93, from name: System.ComponentModel.TypeConverter
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.17_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle (0x0)
	}, ; 55
	%struct.DSOCacheEntry {
		i64 4485509010103122468, ; hash 0x3e3fbaadf002ba24, from name: aot-System.Memory.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.26_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle (0x0)
	}, ; 56
	%struct.DSOCacheEntry {
		i64 4533637005954432954, ; hash 0x3eeab6d6307abfba, from name: System.Text.RegularExpressions.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.41_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle (0x0)
	}, ; 57
	%struct.DSOCacheEntry {
		i64 4562889186705488620, ; hash 0x3f52a38a430d3aec, from name: libaot-System.Memory.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.26_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle (0x0)
	}, ; 58
	%struct.DSOCacheEntry {
		i64 4624036676708874426, ; hash 0x402be0dbb79c38ba, from name: aot-Mono.Android.Runtime.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 59
	%struct.DSOCacheEntry {
		i64 4649840642642325182, ; hash 0x40878d6db6deaebe, from name: aot-System.Net.Http.Json
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.27_name, ; name: libaot-System.Net.Http.Json.dll.so
		ptr null; void* handle (0x0)
	}, ; 60
	%struct.DSOCacheEntry {
		i64 4672542866980016362, ; hash 0x40d834fb382110ea, from name: libaot-PokemonTDCore.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.8_name, ; name: libaot-PokemonTDCore.dll.so
		ptr null; void* handle (0x0)
	}, ; 61
	%struct.DSOCacheEntry {
		i64 4676011426420077172, ; hash 0x40e4879e256fb274, from name: System.Drawing.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.22_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle (0x0)
	}, ; 62
	%struct.DSOCacheEntry {
		i64 4778132833905139113, ; hash 0x424f567f2e8bdda9, from name: libaot-System.Runtime.InteropServices.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.34_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle (0x0)
	}, ; 63
	%struct.DSOCacheEntry {
		i64 4783864354832935512, ; hash 0x4263b348e3786a58, from name: MonoGame.Framework
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.11_name, ; name: libaot-MonoGame.Framework.dll.so
		ptr null; void* handle (0x0)
	}, ; 64
	%struct.DSOCacheEntry {
		i64 4809057822547766521, ; hash 0x42bd349c3145ecf9, from name: System.Drawing
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.22_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle (0x0)
	}, ; 65
	%struct.DSOCacheEntry {
		i64 5103417709280584325, ; hash 0x46d2fb5e161b6285, from name: System.Collections.Specialized
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.14_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle (0x0)
	}, ; 66
	%struct.DSOCacheEntry {
		i64 5109692736403029004, ; hash 0x46e94678b0b23c0c, from name: libaot-System.Text.Encodings.Web
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.39_name, ; name: libaot-System.Text.Encodings.Web.dll.so
		ptr null; void* handle (0x0)
	}, ; 67
	%struct.DSOCacheEntry {
		i64 5232730255288553603, ; hash 0x489e647167e9d083, from name: aot-System.ComponentModel.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.18_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 68
	%struct.DSOCacheEntry {
		i64 5245831624004909525, ; hash 0x48ccf0118452b9d5, from name: libaot-System.Runtime.Serialization.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.35_name, ; name: libaot-System.Runtime.Serialization.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 69
	%struct.DSOCacheEntry {
		i64 5298867378900015606, ; hash 0x49895bce773d99f6, from name: libaot-PokemonTDAndroid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.10_name, ; name: libaot-PokemonTDAndroid.dll.so
		ptr null; void* handle (0x0)
	}, ; 70
	%struct.DSOCacheEntry {
		i64 5334205502128732672, ; hash 0x4a06e7a471513a00, from name: aot-System.Runtime
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.36_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 71
	%struct.DSOCacheEntry {
		i64 5440481460344582099, ; hash 0x4b80791032efefd3, from name: libaot-System.Numerics.Vectors.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.31_name, ; name: libaot-System.Numerics.Vectors.dll.so
		ptr null; void* handle (0x0)
	}, ; 72
	%struct.DSOCacheEntry {
		i64 5479418050698653789, ; hash 0x4c0acdaf97c1b05d, from name: libaot-System.ComponentModel.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.16_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 73
	%struct.DSOCacheEntry {
		i64 5570799893513421663, ; hash 0x4d4f74fcdfa6c35f, from name: System.IO.Compression.Brotli
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.23_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle (0x0)
	}, ; 74
	%struct.DSOCacheEntry {
		i64 5753633696766002394, ; hash 0x4fd9035cf77484da, from name: libaot-System.Drawing
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.22_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle (0x0)
	}, ; 75
	%struct.DSOCacheEntry {
		i64 5900900230463535802, ; hash 0x51e4357ecbccbaba, from name: System.Security.Cryptography.Native.Android.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.3_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle (0x0)
	}, ; 76
	%struct.DSOCacheEntry {
		i64 5948985717485083712, ; hash 0x528f0afdb0921c40, from name: libSystem.Native.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.2_name, ; name: libSystem.Native.so
		ptr null; void* handle (0x0)
	}, ; 77
	%struct.DSOCacheEntry {
		i64 5958220530006169673, ; hash 0x52afda0108751849, from name: System.Net.Requests.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.30_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle (0x0)
	}, ; 78
	%struct.DSOCacheEntry {
		i64 6108066421228264508, ; hash 0x54c4360c55cd5c3c, from name: aot-PokemonTDEngine
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.9_name, ; name: libaot-PokemonTDEngine.dll.so
		ptr null; void* handle (0x0)
	}, ; 79
	%struct.DSOCacheEntry {
		i64 6308061292769401015, ; hash 0x578abc5300e958b7, from name: libSystem.Native
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.2_name, ; name: libSystem.Native.so
		ptr null; void* handle (0x0)
	}, ; 80
	%struct.DSOCacheEntry {
		i64 6309031637591895059, ; hash 0x578e2ed9035dac13, from name: aot-System.ComponentModel.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.16_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 81
	%struct.DSOCacheEntry {
		i64 6357457916754632952, ; hash 0x583a3a4ac2a7a0f8, from name: _Microsoft.Android.Resource.Designer
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.7_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle (0x0)
	}, ; 82
	%struct.DSOCacheEntry {
		i64 6488258789742214262, ; hash 0x5a0aecfe3563fc76, from name: aot-System.Collections.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.15_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle (0x0)
	}, ; 83
	%struct.DSOCacheEntry {
		i64 6558713382764477133, ; hash 0x5b053b127346facd, from name: mono-component-marshal-ilgen.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.4_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle (0x0)
	}, ; 84
	%struct.DSOCacheEntry {
		i64 6700811815215665556, ; hash 0x5cfe10d7f0ab9194, from name: aot-System.Net.Http.Json.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.27_name, ; name: libaot-System.Net.Http.Json.dll.so
		ptr null; void* handle (0x0)
	}, ; 85
	%struct.DSOCacheEntry {
		i64 6894844156784520562, ; hash 0x5faf683aead1ad72, from name: System.Numerics.Vectors
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.31_name, ; name: libaot-System.Numerics.Vectors.dll.so
		ptr null; void* handle (0x0)
	}, ; 86
	%struct.DSOCacheEntry {
		i64 6913716284728566067, ; hash 0x5ff274549d146133, from name: System.IO.Compression.Native.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.1_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle (0x0)
	}, ; 87
	%struct.DSOCacheEntry {
		i64 7032820184502538532, ; hash 0x619998b242789124, from name: libaot-System.Net.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.29_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 88
	%struct.DSOCacheEntry {
		i64 7252784626773793767, ; hash 0x64a71130ef441be7, from name: System.Drawing.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.21_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 89
	%struct.DSOCacheEntry {
		i64 7270811800166795866, ; hash 0x64e71ccf51a90a5a, from name: System.Linq
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.25_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 90
	%struct.DSOCacheEntry {
		i64 7286834274487352090, ; hash 0x6520092a53f5bb1a, from name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.20_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle (0x0)
	}, ; 91
	%struct.DSOCacheEntry {
		i64 7338982286544642983, ; hash 0x65d94d818a60a3a7, from name: monodroid.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.6_name, ; name: libmonodroid.so
		ptr null; void* handle (0x0)
	}, ; 92
	%struct.DSOCacheEntry {
		i64 7357705307462257638, ; hash 0x661bd1fe8d4b4be6, from name: aot-Mono.Android.Runtime
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 93
	%struct.DSOCacheEntry {
		i64 7415347135721941512, ; hash 0x66e89aee86eaaa08, from name: libmono-component-marshal-ilgen
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.4_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle (0x0)
	}, ; 94
	%struct.DSOCacheEntry {
		i64 7465578309990517956, ; hash 0x679b0feb29d88cc4, from name: aot-System.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.44_name, ; name: libaot-System.dll.so
		ptr null; void* handle (0x0)
	}, ; 95
	%struct.DSOCacheEntry {
		i64 7489048572193775167, ; hash 0x67ee71ff6b419e3f, from name: System.ObjectModel
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.32_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 96
	%struct.DSOCacheEntry {
		i64 7515511324144895830, ; hash 0x684c75bafd150756, from name: System.Collections.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.15_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle (0x0)
	}, ; 97
	%struct.DSOCacheEntry {
		i64 7535601351437907993, ; hash 0x6893d580f968f819, from name: System.Net.Http.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.28_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle (0x0)
	}, ; 98
	%struct.DSOCacheEntry {
		i64 7540556024932143097, ; hash 0x68a56fc0cb030ff9, from name: aot-System.Drawing.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.21_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 99
	%struct.DSOCacheEntry {
		i64 7603299711682212348, ; hash 0x698458cdc3a5f1fc, from name: aot-System.Collections.NonGeneric.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.13_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle (0x0)
	}, ; 100
	%struct.DSOCacheEntry {
		i64 7639941140308737920, ; hash 0x6a0685fd2cfebf80, from name: libSystem.IO.Compression.Native.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.1_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle (0x0)
	}, ; 101
	%struct.DSOCacheEntry {
		i64 7654504624184590948, ; hash 0x6a3a4366801b8264, from name: System.Net.Http
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.28_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle (0x0)
	}, ; 102
	%struct.DSOCacheEntry {
		i64 7675303261932883976, ; hash 0x6a8427a6b6e81008, from name: aot-System.Runtime.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.36_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 103
	%struct.DSOCacheEntry {
		i64 7695876457946633523, ; hash 0x6acd3edd2f335533, from name: aot-System.Text.Json.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.40_name, ; name: libaot-System.Text.Json.dll.so
		ptr null; void* handle (0x0)
	}, ; 104
	%struct.DSOCacheEntry {
		i64 7714652370974252055, ; hash 0x6b0ff375198b9c17, from name: System.Private.CoreLib
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.48_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle (0x0)
	}, ; 105
	%struct.DSOCacheEntry {
		i64 7740286304433625072, ; hash 0x6b6b0562539657f0, from name: libmonosgen-2.0
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.5_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle (0x0)
	}, ; 106
	%struct.DSOCacheEntry {
		i64 7855888427540559711, ; hash 0x6d05b8e70ea8375f, from name: System.Console.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.19_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle (0x0)
	}, ; 107
	%struct.DSOCacheEntry {
		i64 7974095695751206426, ; hash 0x6ea9adc96638d61a, from name: libaot-System.Text.Json.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.40_name, ; name: libaot-System.Text.Json.dll.so
		ptr null; void* handle (0x0)
	}, ; 108
	%struct.DSOCacheEntry {
		i64 8069027220385562465, ; hash 0x6ffaf1816209ff61, from name: aot-System.Text.Encodings.Web
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.39_name, ; name: libaot-System.Text.Encodings.Web.dll.so
		ptr null; void* handle (0x0)
	}, ; 109
	%struct.DSOCacheEntry {
		i64 8087206902342787202, ; hash 0x703b87d46f3aa082, from name: System.Diagnostics.DiagnosticSource
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.20_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle (0x0)
	}, ; 110
	%struct.DSOCacheEntry {
		i64 8092331298404567383, ; hash 0x704dbc70de2e0957, from name: aot-_Microsoft.Android.Resource.Designer
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.7_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle (0x0)
	}, ; 111
	%struct.DSOCacheEntry {
		i64 8129154283138605531, ; hash 0x70d08ec01ad261db, from name: mono-component-marshal-ilgen
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.4_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle (0x0)
	}, ; 112
	%struct.DSOCacheEntry {
		i64 8136022511411893922, ; hash 0x70e8f55e1d4996a2, from name: libaot-PokemonTDEngine.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.9_name, ; name: libaot-PokemonTDEngine.dll.so
		ptr null; void* handle (0x0)
	}, ; 113
	%struct.DSOCacheEntry {
		i64 8185542183669246576, ; hash 0x7198e33f4794aa70, from name: System.Collections
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.15_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle (0x0)
	}, ; 114
	%struct.DSOCacheEntry {
		i64 8189823481260868218, ; hash 0x71a819108db5027a, from name: libaot-System.Collections.Concurrent
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.12_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle (0x0)
	}, ; 115
	%struct.DSOCacheEntry {
		i64 8230563966616155945, ; hash 0x7238d651fb493729, from name: aot-PokemonTDAndroid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.10_name, ; name: libaot-PokemonTDAndroid.dll.so
		ptr null; void* handle (0x0)
	}, ; 116
	%struct.DSOCacheEntry {
		i64 8298665547085841745, ; hash 0x732ac858cbd30551, from name: aot-System.Text.Encodings.Web.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.39_name, ; name: libaot-System.Text.Encodings.Web.dll.so
		ptr null; void* handle (0x0)
	}, ; 117
	%struct.DSOCacheEntry {
		i64 8368701292315763008, ; hash 0x7423997c6fd56140, from name: System.Security.Cryptography
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.37_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle (0x0)
	}, ; 118
	%struct.DSOCacheEntry {
		i64 8392333777418328833, ; hash 0x74778f1b27881b01, from name: libmonodroid.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.6_name, ; name: libmonodroid.so
		ptr null; void* handle (0x0)
	}, ; 119
	%struct.DSOCacheEntry {
		i64 8522025752637549819, ; hash 0x7644514538b12cfb, from name: aot-Mono.Android.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 120
	%struct.DSOCacheEntry {
		i64 8563666267364444763, ; hash 0x76d841191140ca5b, from name: System.Private.Uri
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.33_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle (0x0)
	}, ; 121
	%struct.DSOCacheEntry {
		i64 8612207396229290788, ; hash 0x7784b4ff583d1b24, from name: aot-System.Net.Http.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.28_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle (0x0)
	}, ; 122
	%struct.DSOCacheEntry {
		i64 8623099412595258045, ; hash 0x77ab673a869eb2bd, from name: libaot-System.Text.Encodings.Web.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.39_name, ; name: libaot-System.Text.Encodings.Web.dll.so
		ptr null; void* handle (0x0)
	}, ; 123
	%struct.DSOCacheEntry {
		i64 8626175481042262068, ; hash 0x77b654e585b55834, from name: Java.Interop
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle (0x0)
	}, ; 124
	%struct.DSOCacheEntry {
		i64 8626645781824515032, ; hash 0x77b800a1f4c5abd8, from name: System.Native
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.2_name, ; name: libSystem.Native.so
		ptr null; void* handle (0x0)
	}, ; 125
	%struct.DSOCacheEntry {
		i64 8659486139845940425, ; hash 0x782cacc3a6ef94c9, from name: System.Runtime.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.36_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 126
	%struct.DSOCacheEntry {
		i64 8747763348793017252, ; hash 0x79664c6b07fd43a4, from name: libaot-System.Private.CoreLib.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.48_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle (0x0)
	}, ; 127
	%struct.DSOCacheEntry {
		i64 8761982123773840073, ; hash 0x7998d0518fdccac9, from name: aot-System.Text.RegularExpressions.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.41_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle (0x0)
	}, ; 128
	%struct.DSOCacheEntry {
		i64 8772604801161716260, ; hash 0x79be8d9660216224, from name: aot-Mono.Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 129
	%struct.DSOCacheEntry {
		i64 8812786412666749070, ; hash 0x7a4d4e8cd864008e, from name: aot-System.Diagnostics.DiagnosticSource
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.20_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle (0x0)
	}, ; 130
	%struct.DSOCacheEntry {
		i64 8824907823227734965, ; hash 0x7a785ee8ab0e0bb5, from name: aot-System.Private.Uri
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.33_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle (0x0)
	}, ; 131
	%struct.DSOCacheEntry {
		i64 8967164847000689438, ; hash 0x7c71c4eb13d89b1e, from name: libaot-System.Private.Uri.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.33_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle (0x0)
	}, ; 132
	%struct.DSOCacheEntry {
		i64 9032777207089403703, ; hash 0x7d5adf031bcf1737, from name: libaot-System.ObjectModel
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.32_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 133
	%struct.DSOCacheEntry {
		i64 9049979032622352945, ; hash 0x7d97fbfb38304a31, from name: libaot-System.IO.Compression
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.24_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle (0x0)
	}, ; 134
	%struct.DSOCacheEntry {
		i64 9055317871244365271, ; hash 0x7daaf3a073c44dd7, from name: monodroid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.6_name, ; name: libmonodroid.so
		ptr null; void* handle (0x0)
	}, ; 135
	%struct.DSOCacheEntry {
		i64 9179158021138166472, ; hash 0x7f62eb96431e32c8, from name: PokemonTDAndroid.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.10_name, ; name: libaot-PokemonTDAndroid.dll.so
		ptr null; void* handle (0x0)
	}, ; 136
	%struct.DSOCacheEntry {
		i64 9311852581227159058, ; hash 0x813a589618d95e12, from name: openal32.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.0_name, ; name: libopenal32.so
		ptr null; void* handle (0x0)
	}, ; 137
	%struct.DSOCacheEntry {
		i64 9584802165301184279, ; hash 0x85040ec9712c0717, from name: System.Private.Uri.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.33_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle (0x0)
	}, ; 138
	%struct.DSOCacheEntry {
		i64 9641796949223436837, ; hash 0x85ce8b3daae87225, from name: libaot-Java.Interop.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle (0x0)
	}, ; 139
	%struct.DSOCacheEntry {
		i64 9649400414182181815, ; hash 0x85e98e8d4ed60bb7, from name: PokemonTDAndroid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.10_name, ; name: libaot-PokemonTDAndroid.dll.so
		ptr null; void* handle (0x0)
	}, ; 140
	%struct.DSOCacheEntry {
		i64 9659729154652888475, ; hash 0x860e407c9991dd9b, from name: System.Text.RegularExpressions
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.41_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle (0x0)
	}, ; 141
	%struct.DSOCacheEntry {
		i64 9700644217508604131, ; hash 0x869f9c85050c28e3, from name: System.Numerics.Vectors.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.31_name, ; name: libaot-System.Numerics.Vectors.dll.so
		ptr null; void* handle (0x0)
	}, ; 142
	%struct.DSOCacheEntry {
		i64 9783785228567974479, ; hash 0x87c6fcd42382124f, from name: libaot-System.Threading.Thread
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.42_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle (0x0)
	}, ; 143
	%struct.DSOCacheEntry {
		i64 9913902933339707943, ; hash 0x89954231176a9a27, from name: libopenal32.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.0_name, ; name: libopenal32.so
		ptr null; void* handle (0x0)
	}, ; 144
	%struct.DSOCacheEntry {
		i64 10036215306110403221, ; hash 0x8b47cca5920c8295, from name: System.Runtime.Serialization.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.35_name, ; name: libaot-System.Runtime.Serialization.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 145
	%struct.DSOCacheEntry {
		i64 10100633424984079765, ; hash 0x8c2ca895a69cfd95, from name: libaot-System.Runtime
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.36_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 146
	%struct.DSOCacheEntry {
		i64 10117538216423255955, ; hash 0x8c68b7671f58ef93, from name: System.Collections.Specialized.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.14_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle (0x0)
	}, ; 147
	%struct.DSOCacheEntry {
		i64 10202443004866537339, ; hash 0x8d965bdbaa3d277b, from name: aot-System.Security.Cryptography
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.37_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle (0x0)
	}, ; 148
	%struct.DSOCacheEntry {
		i64 10291981562957691400, ; hash 0x8ed476b3c6f67a08, from name: aot-System.ComponentModel.TypeConverter
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.17_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle (0x0)
	}, ; 149
	%struct.DSOCacheEntry {
		i64 10356807666685550219, ; hash 0x8fbac5b33bd59e8b, from name: libaot-System.Net.Http
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.28_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle (0x0)
	}, ; 150
	%struct.DSOCacheEntry {
		i64 10360315726388337145, ; hash 0x8fc73c43084519f9, from name: libaot-System.Drawing.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.22_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle (0x0)
	}, ; 151
	%struct.DSOCacheEntry {
		i64 10462325736163448418, ; hash 0x9131a5d344731662, from name: libaot-System.Text.Json
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.40_name, ; name: libaot-System.Text.Json.dll.so
		ptr null; void* handle (0x0)
	}, ; 152
	%struct.DSOCacheEntry {
		i64 10657322552275964462, ; hash 0x93e66a65792b122e, from name: aot-System.Runtime.InteropServices
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.34_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle (0x0)
	}, ; 153
	%struct.DSOCacheEntry {
		i64 10738576877450676954, ; hash 0x950716c64dabcada, from name: aot-System.Security.Cryptography.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.37_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle (0x0)
	}, ; 154
	%struct.DSOCacheEntry {
		i64 10785150219063592792, ; hash 0x95ac8cfb68830758, from name: System.Net.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.29_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 155
	%struct.DSOCacheEntry {
		i64 10822355261113017697, ; hash 0x9630bac54bb8a561, from name: libaot-PokemonTDAndroid.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.10_name, ; name: libaot-PokemonTDAndroid.dll.so
		ptr null; void* handle (0x0)
	}, ; 156
	%struct.DSOCacheEntry {
		i64 10994814943189846658, ; hash 0x98956df013fcca82, from name: libaot-PokemonTDEngine
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.9_name, ; name: libaot-PokemonTDEngine.dll.so
		ptr null; void* handle (0x0)
	}, ; 157
	%struct.DSOCacheEntry {
		i64 11031718967604308070, ; hash 0x991889f3d5fe6866, from name: libaot-System.Net.Http.Json.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.27_name, ; name: libaot-System.Net.Http.Json.dll.so
		ptr null; void* handle (0x0)
	}, ; 158
	%struct.DSOCacheEntry {
		i64 11164818937994912957, ; hash 0x9af167ab9cbda4bd, from name: System.Security.Cryptography.Native.Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.3_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle (0x0)
	}, ; 159
	%struct.DSOCacheEntry {
		i64 11171214345979581187, ; hash 0x9b08204291dc5303, from name: libaot-System.Text.RegularExpressions
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.41_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle (0x0)
	}, ; 160
	%struct.DSOCacheEntry {
		i64 11245267750673177240, ; hash 0x9c0f37707307da98, from name: aot-System.Numerics.Vectors.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.31_name, ; name: libaot-System.Numerics.Vectors.dll.so
		ptr null; void* handle (0x0)
	}, ; 161
	%struct.DSOCacheEntry {
		i64 11270596618290860596, ; hash 0x9c6933e8fff21234, from name: libaot-System.Net.Http.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.28_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle (0x0)
	}, ; 162
	%struct.DSOCacheEntry {
		i64 11297620656358036086, ; hash 0x9cc936212d561276, from name: libaot-System.Linq
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.25_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 163
	%struct.DSOCacheEntry {
		i64 11329407233932627207, ; hash 0x9d3a23da7e4b8d07, from name: aot-System.IO.Compression.Brotli
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.23_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle (0x0)
	}, ; 164
	%struct.DSOCacheEntry {
		i64 11459687736992758643, ; hash 0x9f08fd47e05a7b73, from name: libaot-System.Diagnostics.DiagnosticSource
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.20_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle (0x0)
	}, ; 165
	%struct.DSOCacheEntry {
		i64 11465353776621081442, ; hash 0x9f1d1e8387aed362, from name: aot-System.Collections.Concurrent
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.12_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle (0x0)
	}, ; 166
	%struct.DSOCacheEntry {
		i64 11485890710487134646, ; hash 0x9f6614bf0f8b71b6, from name: System.Runtime.InteropServices
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.34_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle (0x0)
	}, ; 167
	%struct.DSOCacheEntry {
		i64 11495032816624096970, ; hash 0x9f868f71845656ca, from name: aot-System.Collections.Specialized
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.14_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle (0x0)
	}, ; 168
	%struct.DSOCacheEntry {
		i64 11521729796983092563, ; hash 0x9fe56834a335f553, from name: libmonodroid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.6_name, ; name: libmonodroid.so
		ptr null; void* handle (0x0)
	}, ; 169
	%struct.DSOCacheEntry {
		i64 11543093801659331803, ; hash 0xa0314ea798eaf4db, from name: aot-System.Memory
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.26_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle (0x0)
	}, ; 170
	%struct.DSOCacheEntry {
		i64 11622665325505776179, ; hash 0xa14c0088b6058a33, from name: libaot-System.Runtime.InteropServices
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.34_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle (0x0)
	}, ; 171
	%struct.DSOCacheEntry {
		i64 11637972874768420528, ; hash 0xa18262ab42340eb0, from name: aot-System.Diagnostics.DiagnosticSource.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.20_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle (0x0)
	}, ; 172
	%struct.DSOCacheEntry {
		i64 11747547415520971499, ; hash 0xa307ac221c2f8aeb, from name: MonoGame.Framework.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.11_name, ; name: libaot-MonoGame.Framework.dll.so
		ptr null; void* handle (0x0)
	}, ; 173
	%struct.DSOCacheEntry {
		i64 11764213056097819061, ; hash 0xa342e171eeb919b5, from name: libaot-System.Collections.Specialized.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.14_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle (0x0)
	}, ; 174
	%struct.DSOCacheEntry {
		i64 11775896168281936811, ; hash 0xa36c632c765413ab, from name: aot-System.Private.CoreLib.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.48_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle (0x0)
	}, ; 175
	%struct.DSOCacheEntry {
		i64 11782443198922974530, ; hash 0xa383a5a9d2056542, from name: aot-System.Collections.NonGeneric
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.13_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle (0x0)
	}, ; 176
	%struct.DSOCacheEntry {
		i64 11799183892646765925, ; hash 0xa3bf1f3c50b8a565, from name: aot-System.Net.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.29_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 177
	%struct.DSOCacheEntry {
		i64 11878431249347270648, ; hash 0xa4d8aa49623e57f8, from name: libaot-System.Text.Encoding.Extensions.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.38_name, ; name: libaot-System.Text.Encoding.Extensions.dll.so
		ptr null; void* handle (0x0)
	}, ; 178
	%struct.DSOCacheEntry {
		i64 11949219802464515130, ; hash 0xa5d42819c4f5f43a, from name: aot-System
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.44_name, ; name: libaot-System.dll.so
		ptr null; void* handle (0x0)
	}, ; 179
	%struct.DSOCacheEntry {
		i64 12050631976567110376, ; hash 0xa73c71ef8a3efae8, from name: aot-System.Linq
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.25_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 180
	%struct.DSOCacheEntry {
		i64 12051765732457062039, ; hash 0xa7407914a7541e97, from name: aot-System.Linq.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.25_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 181
	%struct.DSOCacheEntry {
		i64 12052751833701477691, ; hash 0xa743f9ef3db6ed3b, from name: System.Net.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.29_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 182
	%struct.DSOCacheEntry {
		i64 12055562135052324048, ; hash 0xa74df5e383718cd0, from name: libaot-PokemonTDCore
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.8_name, ; name: libaot-PokemonTDCore.dll.so
		ptr null; void* handle (0x0)
	}, ; 183
	%struct.DSOCacheEntry {
		i64 12145679461940342714, ; hash 0xa88e1f1ebcb62fba, from name: System.Text.Json
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.40_name, ; name: libaot-System.Text.Json.dll.so
		ptr null; void* handle (0x0)
	}, ; 184
	%struct.DSOCacheEntry {
		i64 12278824155482493573, ; hash 0xaa6725836f051285, from name: libaot-System.Threading.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.43_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle (0x0)
	}, ; 185
	%struct.DSOCacheEntry {
		i64 12278928371408744993, ; hash 0xaa67844c1848b221, from name: System.Runtime.InteropServices.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.34_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle (0x0)
	}, ; 186
	%struct.DSOCacheEntry {
		i64 12319133490348723861, ; hash 0xaaf65aa3d0da8e95, from name: libaot-System.Drawing.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.21_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 187
	%struct.DSOCacheEntry {
		i64 12338163837237862793, ; hash 0xab39f6a3bb222189, from name: libaot-Mono.Android.Runtime.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle (0x0)
	}, ; 188
	%struct.DSOCacheEntry {
		i64 12362395135250488461, ; hash 0xab900ce0719f5c8d, from name: aot-System.Drawing
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.22_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle (0x0)
	}, ; 189
	%struct.DSOCacheEntry {
		i64 12378232765044449142, ; hash 0xabc8511dfb935f76, from name: PokemonTDCore.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.8_name, ; name: libaot-PokemonTDCore.dll.so
		ptr null; void* handle (0x0)
	}, ; 190
	%struct.DSOCacheEntry {
		i64 12439793764729580087, ; hash 0xaca3068529d36a37, from name: libaot-System.ComponentModel.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.16_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 191
	%struct.DSOCacheEntry {
		i64 12550732019250633519, ; hash 0xae2d28465e8e1b2f, from name: System.IO.Compression
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.24_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle (0x0)
	}, ; 192
	%struct.DSOCacheEntry {
		i64 12708922737231849740, ; hash 0xb05f29e50e96e90c, from name: System.Text.Encoding.Extensions
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.38_name, ; name: libaot-System.Text.Encoding.Extensions.dll.so
		ptr null; void* handle (0x0)
	}, ; 193
	%struct.DSOCacheEntry {
		i64 12895691319166646681, ; hash 0xb2f6b2ee34043999, from name: aot-System.Runtime.Serialization.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.35_name, ; name: libaot-System.Runtime.Serialization.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 194
	%struct.DSOCacheEntry {
		i64 12996638905122625135, ; hash 0xb45d56399ddb166f, from name: System.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.44_name, ; name: libaot-System.dll.so
		ptr null; void* handle (0x0)
	}, ; 195
	%struct.DSOCacheEntry {
		i64 13116315589229894972, ; hash 0xb606838901f75d3c, from name: aot-System.Net.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.29_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 196
	%struct.DSOCacheEntry {
		i64 13314286428381311703, ; hash 0xb8c5d8f6e978f2d7, from name: libaot-System.Console
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.19_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle (0x0)
	}, ; 197
	%struct.DSOCacheEntry {
		i64 13488491921086969402, ; hash 0xbb30bfefe81d763a, from name: aot-System.ComponentModel
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.18_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 198
	%struct.DSOCacheEntry {
		i64 13546874730744599821, ; hash 0xbc002acb0ebf550d, from name: System.Threading.Thread.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.42_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle (0x0)
	}, ; 199
	%struct.DSOCacheEntry {
		i64 13717233136797750441, ; hash 0xbe5d66dc640c14a9, from name: aot-System.Text.Json
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.40_name, ; name: libaot-System.Text.Json.dll.so
		ptr null; void* handle (0x0)
	}, ; 200
	%struct.DSOCacheEntry {
		i64 13768113933372556022, ; hash 0xbf122aad01c702f6, from name: libaot-System.Security.Cryptography
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.37_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle (0x0)
	}, ; 201
	%struct.DSOCacheEntry {
		i64 13780240838949801592, ; hash 0xbf3d40083cef0e78, from name: System.Text.Encoding.Extensions.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.38_name, ; name: libaot-System.Text.Encoding.Extensions.dll.so
		ptr null; void* handle (0x0)
	}, ; 202
	%struct.DSOCacheEntry {
		i64 13927427627500361954, ; hash 0xc14829a2f41ed8e2, from name: aot-System.Private.Uri.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.33_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle (0x0)
	}, ; 203
	%struct.DSOCacheEntry {
		i64 14024723203617446143, ; hash 0xc2a1d37290cbd8ff, from name: libaot-System.ComponentModel.TypeConverter
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.17_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle (0x0)
	}, ; 204
	%struct.DSOCacheEntry {
		i64 14037761671920318323, ; hash 0xc2d025dd88677773, from name: aot-System.Threading
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.43_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle (0x0)
	}, ; 205
	%struct.DSOCacheEntry {
		i64 14058709349301150578, ; hash 0xc31a91aabd8ee372, from name: System.IO.Compression.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.24_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle (0x0)
	}, ; 206
	%struct.DSOCacheEntry {
		i64 14143988164198918098, ; hash 0xc4498a4c1a67e7d2, from name: System.Threading.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.43_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle (0x0)
	}, ; 207
	%struct.DSOCacheEntry {
		i64 14152660198772281192, ; hash 0xc46859777ea18f68, from name: libaot-System.Collections.Concurrent.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.12_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle (0x0)
	}, ; 208
	%struct.DSOCacheEntry {
		i64 14159110086036678642, ; hash 0xc47f439ae5dde7f2, from name: aot-System.Text.Encoding.Extensions.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.38_name, ; name: libaot-System.Text.Encoding.Extensions.dll.so
		ptr null; void* handle (0x0)
	}, ; 209
	%struct.DSOCacheEntry {
		i64 14174671189317472550, ; hash 0xc4b68c58973b5126, from name: libaot-System.Text.RegularExpressions.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.41_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle (0x0)
	}, ; 210
	%struct.DSOCacheEntry {
		i64 14182888721008485466, ; hash 0xc4d3be25c89ae45a, from name: aot-System.Console
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.19_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle (0x0)
	}, ; 211
	%struct.DSOCacheEntry {
		i64 14230396410514008665, ; hash 0xc57c8623b5ae6a59, from name: aot-System.Collections
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.15_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle (0x0)
	}, ; 212
	%struct.DSOCacheEntry {
		i64 14317997431913345095, ; hash 0xc6b3becde8267047, from name: aot-System.Collections.Specialized.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.14_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle (0x0)
	}, ; 213
	%struct.DSOCacheEntry {
		i64 14319327830875434373, ; hash 0xc6b878cb8db1ed85, from name: System.Text.Json.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.40_name, ; name: libaot-System.Text.Json.dll.so
		ptr null; void* handle (0x0)
	}, ; 214
	%struct.DSOCacheEntry {
		i64 14351510784141839845, ; hash 0xc72acf0546f64de5, from name: aot-Java.Interop
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle (0x0)
	}, ; 215
	%struct.DSOCacheEntry {
		i64 14424844866220670826, ; hash 0xc82f57facf333f6a, from name: monosgen-2.0.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.5_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle (0x0)
	}, ; 216
	%struct.DSOCacheEntry {
		i64 14604015534980822382, ; hash 0xcaabe2c0f0d1756e, from name: aot-System.Net.Http
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.28_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle (0x0)
	}, ; 217
	%struct.DSOCacheEntry {
		i64 14713405421650509891, ; hash 0xcc308446a9c90043, from name: libaot-System.Collections.NonGeneric.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.13_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle (0x0)
	}, ; 218
	%struct.DSOCacheEntry {
		i64 14797884060996115029, ; hash 0xcd5ca526a3169a55, from name: aot-System.Net.Requests
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.30_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle (0x0)
	}, ; 219
	%struct.DSOCacheEntry {
		i64 14889842916543922703, ; hash 0xcea3593e29f7820f, from name: libopenal32
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.0_name, ; name: libopenal32.so
		ptr null; void* handle (0x0)
	}, ; 220
	%struct.DSOCacheEntry {
		i64 14913505193346745792, ; hash 0xcef769f54d6045c0, from name: aot-PokemonTDAndroid.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.10_name, ; name: libaot-PokemonTDAndroid.dll.so
		ptr null; void* handle (0x0)
	}, ; 221
	%struct.DSOCacheEntry {
		i64 14929951904236909252, ; hash 0xcf31d82795b532c4, from name: aot-System.Numerics.Vectors
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.31_name, ; name: libaot-System.Numerics.Vectors.dll.so
		ptr null; void* handle (0x0)
	}, ; 222
	%struct.DSOCacheEntry {
		i64 15024878362326791334, ; hash 0xd0831743ebf0f4a6, from name: System.Net.Http.Json
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.27_name, ; name: libaot-System.Net.Http.Json.dll.so
		ptr null; void* handle (0x0)
	}, ; 223
	%struct.DSOCacheEntry {
		i64 15169277521300507936, ; hash 0xd28419890c6f4d20, from name: aot-System.Threading.Thread.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.42_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle (0x0)
	}, ; 224
	%struct.DSOCacheEntry {
		i64 15287759098695794728, ; hash 0xd42907e6f9824028, from name: System.IO.Compression.Brotli.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.23_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle (0x0)
	}, ; 225
	%struct.DSOCacheEntry {
		i64 15361183609531804313, ; hash 0xd52de31b17b22a99, from name: System.Collections.Concurrent.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.12_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle (0x0)
	}, ; 226
	%struct.DSOCacheEntry {
		i64 15371816955219117674, ; hash 0xd553aa13d029866a, from name: libaot-System.ComponentModel
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.18_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 227
	%struct.DSOCacheEntry {
		i64 15394198501530322172, ; hash 0xd5a32df9a590c4fc, from name: libaot-Mono.Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 228
	%struct.DSOCacheEntry {
		i64 15400362296213333307, ; hash 0xd5b913e9ee1d653b, from name: aot-PokemonTDCore
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.8_name, ; name: libaot-PokemonTDCore.dll.so
		ptr null; void* handle (0x0)
	}, ; 229
	%struct.DSOCacheEntry {
		i64 15422501938551467493, ; hash 0xd607bbcd1b222de5, from name: System.ComponentModel.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.18_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 230
	%struct.DSOCacheEntry {
		i64 15503723175688157554, ; hash 0xd7284a1606e23972, from name: aot-System.Private.CoreLib
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.48_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle (0x0)
	}, ; 231
	%struct.DSOCacheEntry {
		i64 15508200808610002858, ; hash 0xd73832782e9ff7aa, from name: libaot-System.Net.Http.Json
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.27_name, ; name: libaot-System.Net.Http.Json.dll.so
		ptr null; void* handle (0x0)
	}, ; 232
	%struct.DSOCacheEntry {
		i64 15527772828719725935, ; hash 0xd77dbb1e38cd3d6f, from name: System.Console
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.19_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle (0x0)
	}, ; 233
	%struct.DSOCacheEntry {
		i64 15617887668700861200, ; hash 0xd8bde2166ade5310, from name: aot-System.Net.Requests.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.30_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle (0x0)
	}, ; 234
	%struct.DSOCacheEntry {
		i64 15742342285542832975, ; hash 0xda7808e6f6643b4f, from name: libaot-System.ComponentModel.TypeConverter.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.17_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle (0x0)
	}, ; 235
	%struct.DSOCacheEntry {
		i64 15869986477656553338, ; hash 0xdc3d849e5ef8b77a, from name: libaot-System.Collections.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.15_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle (0x0)
	}, ; 236
	%struct.DSOCacheEntry {
		i64 15920910109220503623, ; hash 0xdcf26f6449038047, from name: System.Private.CoreLib.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.48_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle (0x0)
	}, ; 237
	%struct.DSOCacheEntry {
		i64 16054895300671558137, ; hash 0xdece7236a69dd1f9, from name: openal32
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.0_name, ; name: libopenal32.so
		ptr null; void* handle (0x0)
	}, ; 238
	%struct.DSOCacheEntry {
		i64 16154507427712707110, ; hash 0xe03056ea4e39aa26, from name: System
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.44_name, ; name: libaot-System.dll.so
		ptr null; void* handle (0x0)
	}, ; 239
	%struct.DSOCacheEntry {
		i64 16217712076265891113, ; hash 0xe110e3354f642529, from name: libmono-component-marshal-ilgen.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.4_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle (0x0)
	}, ; 240
	%struct.DSOCacheEntry {
		i64 16235471614012038139, ; hash 0xe14ffb69ea201bfb, from name: PokemonTDEngine
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.9_name, ; name: libaot-PokemonTDEngine.dll.so
		ptr null; void* handle (0x0)
	}, ; 241
	%struct.DSOCacheEntry {
		i64 16253390427661688581, ; hash 0xe18fa47ad4825f05, from name: libaot-System.Linq.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.25_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 242
	%struct.DSOCacheEntry {
		i64 16273606707797624453, ; hash 0xe1d7771458b10685, from name: System.Native.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.2_name, ; name: libSystem.Native.so
		ptr null; void* handle (0x0)
	}, ; 243
	%struct.DSOCacheEntry {
		i64 16354813168604688526, ; hash 0xe2f7f7ece290308e, from name: aot-System.Drawing.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.21_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 244
	%struct.DSOCacheEntry {
		i64 16370340268830916137, ; hash 0xe32f21bd9ff07e29, from name: System.Linq.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.25_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle (0x0)
	}, ; 245
	%struct.DSOCacheEntry {
		i64 16402286938723533703, ; hash 0xe3a0a11156a54387, from name: PokemonTDCore
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.8_name, ; name: libaot-PokemonTDCore.dll.so
		ptr null; void* handle (0x0)
	}, ; 246
	%struct.DSOCacheEntry {
		i64 16411908373586787849, ; hash 0xe3c2cfb635e63e09, from name: libaot-System.Drawing.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.21_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 247
	%struct.DSOCacheEntry {
		i64 16413721059704043258, ; hash 0xe3c940571601f6fa, from name: aot-System.Console.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.19_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle (0x0)
	}, ; 248
	%struct.DSOCacheEntry {
		i64 16717189724135467099, ; hash 0xe7ff637b8de7a85b, from name: libmonosgen-2.0.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.5_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle (0x0)
	}, ; 249
	%struct.DSOCacheEntry {
		i64 16733100980842614628, ; hash 0xe837eaafb1dd4f64, from name: libaot-System.IO.Compression.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.24_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle (0x0)
	}, ; 250
	%struct.DSOCacheEntry {
		i64 16768067971893542065, ; hash 0xe8b424faba51bcb1, from name: libaot-Mono.Android.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 251
	%struct.DSOCacheEntry {
		i64 16804602679676381986, ; hash 0xe935f11a41b02b22, from name: monosgen-2.0
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.5_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle (0x0)
	}, ; 252
	%struct.DSOCacheEntry {
		i64 16848059375955115410, ; hash 0xe9d054bcd27e7d92, from name: libaot-MonoGame.Framework
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.11_name, ; name: libaot-MonoGame.Framework.dll.so
		ptr null; void* handle (0x0)
	}, ; 253
	%struct.DSOCacheEntry {
		i64 16924802110373038789, ; hash 0xeae0f9d912910ac5, from name: libaot-System.IO.Compression.Brotli.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.23_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle (0x0)
	}, ; 254
	%struct.DSOCacheEntry {
		i64 16948040093346346617, ; hash 0xeb3388ab9afcb679, from name: System.ComponentModel.Primitives.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.16_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 255
	%struct.DSOCacheEntry {
		i64 17008137082415910100, ; hash 0xec090a90408c8cd4, from name: System.Collections.NonGeneric
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.13_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle (0x0)
	}, ; 256
	%struct.DSOCacheEntry {
		i64 17062143951396181894, ; hash 0xecc8e986518c9786, from name: System.ComponentModel.Primitives
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.16_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle (0x0)
	}, ; 257
	%struct.DSOCacheEntry {
		i64 17272221322621298204, ; hash 0xefb341c7e0c5261c, from name: PokemonTDEngine.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.9_name, ; name: libaot-PokemonTDEngine.dll.so
		ptr null; void* handle (0x0)
	}, ; 258
	%struct.DSOCacheEntry {
		i64 17309541862275468045, ; hash 0xf037d89d25aecb0d, from name: Mono.Android.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle (0x0)
	}, ; 259
	%struct.DSOCacheEntry {
		i64 17313593693951578347, ; hash 0xf0463dbbb96d50eb, from name: aot-PokemonTDCore.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.8_name, ; name: libaot-PokemonTDCore.dll.so
		ptr null; void* handle (0x0)
	}, ; 260
	%struct.DSOCacheEntry {
		i64 17474527379847198219, ; hash 0xf281fe1165a1360b, from name: libaot-System
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.44_name, ; name: libaot-System.dll.so
		ptr null; void* handle (0x0)
	}, ; 261
	%struct.DSOCacheEntry {
		i64 17501557440705411739, ; hash 0xf2e205c3dd573a9b, from name: libaot-System.Net.Requests.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.30_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle (0x0)
	}, ; 262
	%struct.DSOCacheEntry {
		i64 17577202782581072989, ; hash 0xf3eec4cd80c0a45d, from name: System.IO.Compression.Native
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.1_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle (0x0)
	}, ; 263
	%struct.DSOCacheEntry {
		i64 17621652644066257425, ; hash 0xf48cafb75ce46a11, from name: libaot-System.Threading
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.43_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle (0x0)
	}, ; 264
	%struct.DSOCacheEntry {
		i64 17634962315631480230, ; hash 0xf4bbf8cac29d4da6, from name: aot-System.Drawing.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.22_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle (0x0)
	}, ; 265
	%struct.DSOCacheEntry {
		i64 17798155118191535816, ; hash 0xf6ffbfc8051b66c8, from name: Java.Interop.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle (0x0)
	}, ; 266
	%struct.DSOCacheEntry {
		i64 17935984482491575587, ; hash 0xf8e96adb9fd42d23, from name: aot-System.Threading.Thread
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.42_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle (0x0)
	}, ; 267
	%struct.DSOCacheEntry {
		i64 17966837238658391933, ; hash 0xf9570746b37e5f7d, from name: libaot-System.Collections.NonGeneric
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.13_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle (0x0)
	}, ; 268
	%struct.DSOCacheEntry {
		i64 18025913125965088385, ; hash 0xfa28e87b91334681, from name: System.Threading
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.43_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle (0x0)
	}, ; 269
	%struct.DSOCacheEntry {
		i64 18037663328941112084, ; hash 0xfa52a73ae39ffb14, from name: aot-MonoGame.Framework
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.11_name, ; name: libaot-MonoGame.Framework.dll.so
		ptr null; void* handle (0x0)
	}, ; 270
	%struct.DSOCacheEntry {
		i64 18086360900563295465, ; hash 0xfaffa969d596dce9, from name: aot-System.ObjectModel
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.32_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle (0x0)
	}, ; 271
	%struct.DSOCacheEntry {
		i64 18145848498878603418, ; hash 0xfbd30111a3b6e09a, from name: libSystem.IO.Compression.Native
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.1_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle (0x0)
	}, ; 272
	%struct.DSOCacheEntry {
		i64 18226465753896977720, ; hash 0xfcf16a0903da0538, from name: libaot-System.Private.Uri
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.33_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle (0x0)
	}, ; 273
	%struct.DSOCacheEntry {
		i64 18257096356770733190, ; hash 0xfd5e3c67ff65dc86, from name: libSystem.Security.Cryptography.Native.Android.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.3_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle (0x0)
	}, ; 274
	%struct.DSOCacheEntry {
		i64 18278657237992963751, ; hash 0xfdaad5e9d9b17ea7, from name: aot-PokemonTDEngine.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.9_name, ; name: libaot-PokemonTDEngine.dll.so
		ptr null; void* handle (0x0)
	}, ; 275
	%struct.DSOCacheEntry {
		i64 18292328407895211277, ; hash 0xfddb67c523617d0d, from name: aot-System.IO.Compression.Brotli.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.23_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle (0x0)
	}, ; 276
	%struct.DSOCacheEntry {
		i64 18309516218928916979, ; hash 0xfe1877fe3e82e9f3, from name: libaot-System.Security.Cryptography.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.37_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle (0x0)
	}, ; 277
	%struct.DSOCacheEntry {
		i64 18327710550568384473, ; hash 0xfe591ba430ceb7d9, from name: libaot-Java.Interop
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle (0x0)
	}, ; 278
	%struct.DSOCacheEntry {
		i64 18347920244245135731, ; hash 0xfea0e8402d6e0173, from name: aot-System.Runtime.InteropServices.dll.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.34_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle (0x0)
	} ; 279
], align 16

; Bundled assembly name buffers, all empty (unused when assembly stores are enabled)
@bundled_assemblies = dso_local local_unnamed_addr global [0 x %struct.XamarinAndroidBundledAssembly] zeroinitializer, align 8

@assembly_store_bundled_assemblies = dso_local local_unnamed_addr global [42 x %struct.AssemblyStoreSingleAssemblyRuntimeData] zeroinitializer, align 8

@assembly_stores = dso_local local_unnamed_addr global [2 x %struct.AssemblyStoreRuntimeData] zeroinitializer, align 8

; Strings
@.str.0 = private unnamed_addr constant [7 x i8] c"normal\00", align 1

; Application environment variables name:value pairs
@.env.0 = private unnamed_addr constant [15 x i8] c"MONO_GC_PARAMS\00", align 1
@.env.1 = private unnamed_addr constant [21 x i8] c"major=marksweep-conc\00", align 16
@.env.2 = private unnamed_addr constant [17 x i8] c"XAMARIN_BUILD_ID\00", align 16
@.env.3 = private unnamed_addr constant [37 x i8] c"97955e09-96e9-4449-89f7-e799b982e991\00", align 16
@.env.4 = private unnamed_addr constant [28 x i8] c"XA_HTTP_CLIENT_HANDLER_TYPE\00", align 16
@.env.5 = private unnamed_addr constant [42 x i8] c"Xamarin.Android.Net.AndroidMessageHandler\00", align 16
@.env.6 = private unnamed_addr constant [29 x i8] c"__XA_PACKAGE_NAMING_POLICY__\00", align 16
@.env.7 = private unnamed_addr constant [15 x i8] c"LowercaseCrc64\00", align 1

;ApplicationConfig
@.ApplicationConfig.0_android_package_name = private unnamed_addr constant [34 x i8] c"PokemonTDAndroid.PokemonTDAndroid\00", align 16

;DSOCacheEntry
@.DSOCacheEntry.0_name = private unnamed_addr constant [15 x i8] c"libopenal32.so\00", align 1
@.DSOCacheEntry.1_name = private unnamed_addr constant [35 x i8] c"libSystem.IO.Compression.Native.so\00", align 16
@.DSOCacheEntry.2_name = private unnamed_addr constant [20 x i8] c"libSystem.Native.so\00", align 16
@.DSOCacheEntry.3_name = private unnamed_addr constant [50 x i8] c"libSystem.Security.Cryptography.Native.Android.so\00", align 16
@.DSOCacheEntry.4_name = private unnamed_addr constant [35 x i8] c"libmono-component-marshal-ilgen.so\00", align 16
@.DSOCacheEntry.5_name = private unnamed_addr constant [19 x i8] c"libmonosgen-2.0.so\00", align 16
@.DSOCacheEntry.6_name = private unnamed_addr constant [16 x i8] c"libmonodroid.so\00", align 16
@.DSOCacheEntry.7_name = private unnamed_addr constant [51 x i8] c"libaot-_Microsoft.Android.Resource.Designer.dll.so\00", align 16
@.DSOCacheEntry.8_name = private unnamed_addr constant [28 x i8] c"libaot-PokemonTDCore.dll.so\00", align 16
@.DSOCacheEntry.9_name = private unnamed_addr constant [30 x i8] c"libaot-PokemonTDEngine.dll.so\00", align 16
@.DSOCacheEntry.10_name = private unnamed_addr constant [31 x i8] c"libaot-PokemonTDAndroid.dll.so\00", align 16
@.DSOCacheEntry.11_name = private unnamed_addr constant [33 x i8] c"libaot-MonoGame.Framework.dll.so\00", align 16
@.DSOCacheEntry.12_name = private unnamed_addr constant [44 x i8] c"libaot-System.Collections.Concurrent.dll.so\00", align 16
@.DSOCacheEntry.13_name = private unnamed_addr constant [44 x i8] c"libaot-System.Collections.NonGeneric.dll.so\00", align 16
@.DSOCacheEntry.14_name = private unnamed_addr constant [45 x i8] c"libaot-System.Collections.Specialized.dll.so\00", align 16
@.DSOCacheEntry.15_name = private unnamed_addr constant [33 x i8] c"libaot-System.Collections.dll.so\00", align 16
@.DSOCacheEntry.16_name = private unnamed_addr constant [47 x i8] c"libaot-System.ComponentModel.Primitives.dll.so\00", align 16
@.DSOCacheEntry.17_name = private unnamed_addr constant [50 x i8] c"libaot-System.ComponentModel.TypeConverter.dll.so\00", align 16
@.DSOCacheEntry.18_name = private unnamed_addr constant [36 x i8] c"libaot-System.ComponentModel.dll.so\00", align 16
@.DSOCacheEntry.19_name = private unnamed_addr constant [29 x i8] c"libaot-System.Console.dll.so\00", align 16
@.DSOCacheEntry.20_name = private unnamed_addr constant [50 x i8] c"libaot-System.Diagnostics.DiagnosticSource.dll.so\00", align 16
@.DSOCacheEntry.21_name = private unnamed_addr constant [40 x i8] c"libaot-System.Drawing.Primitives.dll.so\00", align 16
@.DSOCacheEntry.22_name = private unnamed_addr constant [29 x i8] c"libaot-System.Drawing.dll.so\00", align 16
@.DSOCacheEntry.23_name = private unnamed_addr constant [43 x i8] c"libaot-System.IO.Compression.Brotli.dll.so\00", align 16
@.DSOCacheEntry.24_name = private unnamed_addr constant [36 x i8] c"libaot-System.IO.Compression.dll.so\00", align 16
@.DSOCacheEntry.25_name = private unnamed_addr constant [26 x i8] c"libaot-System.Linq.dll.so\00", align 16
@.DSOCacheEntry.26_name = private unnamed_addr constant [28 x i8] c"libaot-System.Memory.dll.so\00", align 16
@.DSOCacheEntry.27_name = private unnamed_addr constant [35 x i8] c"libaot-System.Net.Http.Json.dll.so\00", align 16
@.DSOCacheEntry.28_name = private unnamed_addr constant [30 x i8] c"libaot-System.Net.Http.dll.so\00", align 16
@.DSOCacheEntry.29_name = private unnamed_addr constant [36 x i8] c"libaot-System.Net.Primitives.dll.so\00", align 16
@.DSOCacheEntry.30_name = private unnamed_addr constant [34 x i8] c"libaot-System.Net.Requests.dll.so\00", align 16
@.DSOCacheEntry.31_name = private unnamed_addr constant [38 x i8] c"libaot-System.Numerics.Vectors.dll.so\00", align 16
@.DSOCacheEntry.32_name = private unnamed_addr constant [33 x i8] c"libaot-System.ObjectModel.dll.so\00", align 16
@.DSOCacheEntry.33_name = private unnamed_addr constant [33 x i8] c"libaot-System.Private.Uri.dll.so\00", align 16
@.DSOCacheEntry.34_name = private unnamed_addr constant [45 x i8] c"libaot-System.Runtime.InteropServices.dll.so\00", align 16
@.DSOCacheEntry.35_name = private unnamed_addr constant [54 x i8] c"libaot-System.Runtime.Serialization.Primitives.dll.so\00", align 16
@.DSOCacheEntry.36_name = private unnamed_addr constant [29 x i8] c"libaot-System.Runtime.dll.so\00", align 16
@.DSOCacheEntry.37_name = private unnamed_addr constant [43 x i8] c"libaot-System.Security.Cryptography.dll.so\00", align 16
@.DSOCacheEntry.38_name = private unnamed_addr constant [46 x i8] c"libaot-System.Text.Encoding.Extensions.dll.so\00", align 16
@.DSOCacheEntry.39_name = private unnamed_addr constant [40 x i8] c"libaot-System.Text.Encodings.Web.dll.so\00", align 16
@.DSOCacheEntry.40_name = private unnamed_addr constant [31 x i8] c"libaot-System.Text.Json.dll.so\00", align 16
@.DSOCacheEntry.41_name = private unnamed_addr constant [45 x i8] c"libaot-System.Text.RegularExpressions.dll.so\00", align 16
@.DSOCacheEntry.42_name = private unnamed_addr constant [38 x i8] c"libaot-System.Threading.Thread.dll.so\00", align 16
@.DSOCacheEntry.43_name = private unnamed_addr constant [31 x i8] c"libaot-System.Threading.dll.so\00", align 16
@.DSOCacheEntry.44_name = private unnamed_addr constant [21 x i8] c"libaot-System.dll.so\00", align 16
@.DSOCacheEntry.45_name = private unnamed_addr constant [27 x i8] c"libaot-Java.Interop.dll.so\00", align 16
@.DSOCacheEntry.46_name = private unnamed_addr constant [35 x i8] c"libaot-Mono.Android.Runtime.dll.so\00", align 16
@.DSOCacheEntry.47_name = private unnamed_addr constant [27 x i8] c"libaot-Mono.Android.dll.so\00", align 16
@.DSOCacheEntry.48_name = private unnamed_addr constant [37 x i8] c"libaot-System.Private.CoreLib.dll.so\00", align 16

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
