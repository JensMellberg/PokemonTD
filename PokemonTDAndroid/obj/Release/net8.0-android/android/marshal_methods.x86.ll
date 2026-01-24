; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [42 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [84 x i32] [
	i32 42639949, ; 0: System.Threading.Thread => 0x28aa24d => 35
	i32 117431740, ; 1: System.Runtime.InteropServices => 0x6ffddbc => 27
	i32 205061960, ; 2: System.ComponentModel => 0xc38ff48 => 11
	i32 379916513, ; 3: System.Threading.Thread.dll => 0x16a510e1 => 35
	i32 385762202, ; 4: System.Memory.dll => 0x16fe439a => 19
	i32 395744057, ; 5: _Microsoft.Android.Resource.Designer => 0x17969339 => 0
	i32 399936294, ; 6: PokemonTDCore => 0x17d68b26 => 2
	i32 442565967, ; 7: System.Collections => 0x1a61054f => 8
	i32 459347974, ; 8: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 28
	i32 469710990, ; 9: System.dll => 0x1bff388e => 37
	i32 498788369, ; 10: System.ObjectModel => 0x1dbae811 => 25
	i32 507640256, ; 11: MonoGame.Framework => 0x1e41f9c0 => 1
	i32 662205335, ; 12: System.Text.Encodings.Web.dll => 0x27787397 => 32
	i32 672442732, ; 13: System.Collections.Concurrent => 0x2814a96c => 5
	i32 759454413, ; 14: System.Net.Requests => 0x2d445acd => 23
	i32 775507847, ; 15: System.IO.Compression => 0x2e394f87 => 17
	i32 823281589, ; 16: System.Private.Uri.dll => 0x311247b5 => 26
	i32 830298997, ; 17: System.IO.Compression.Brotli => 0x317d5b75 => 16
	i32 878954865, ; 18: System.Net.Http.Json => 0x3463c971 => 20
	i32 904024072, ; 19: System.ComponentModel.Primitives.dll => 0x35e25008 => 9
	i32 992768348, ; 20: System.Collections.dll => 0x3b2c715c => 8
	i32 1019214401, ; 21: System.Drawing => 0x3cbffa41 => 15
	i32 1036536393, ; 22: System.Drawing.Primitives.dll => 0x3dc84a49 => 14
	i32 1082857460, ; 23: System.ComponentModel.TypeConverter => 0x408b17f4 => 10
	i32 1098259244, ; 24: System => 0x41761b2c => 37
	i32 1324164729, ; 25: System.Linq => 0x4eed2679 => 18
	i32 1462112819, ; 26: System.IO.Compression.dll => 0x57261233 => 17
	i32 1480492111, ; 27: System.IO.Compression.Brotli.dll => 0x583e844f => 16
	i32 1543031311, ; 28: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 34
	i32 1639515021, ; 29: System.Net.Http.dll => 0x61b9038d => 21
	i32 1639986890, ; 30: System.Text.RegularExpressions => 0x61c036ca => 34
	i32 1657153582, ; 31: System.Runtime => 0x62c6282e => 29
	i32 1677501392, ; 32: System.Net.Primitives.dll => 0x63fca3d0 => 22
	i32 1679769178, ; 33: System.Security.Cryptography => 0x641f3e5a => 30
	i32 1780572499, ; 34: Mono.Android.Runtime.dll => 0x6a216153 => 40
	i32 1785362400, ; 35: PokemonTDAndroid.dll => 0x6a6a77e0 => 4
	i32 1824175904, ; 36: System.Text.Encoding.Extensions => 0x6cbab720 => 31
	i32 1910275211, ; 37: System.Collections.NonGeneric.dll => 0x71dc7c8b => 6
	i32 2079903147, ; 38: System.Runtime.dll => 0x7bf8cdab => 29
	i32 2090596640, ; 39: System.Numerics.Vectors => 0x7c9bf920 => 24
	i32 2127167465, ; 40: System.Console => 0x7ec9ffe9 => 12
	i32 2142473426, ; 41: System.Collections.Specialized => 0x7fb38cd2 => 7
	i32 2193016926, ; 42: System.ObjectModel.dll => 0x82b6c85e => 25
	i32 2201231467, ; 43: System.Net.Http => 0x8334206b => 21
	i32 2305521784, ; 44: System.Private.CoreLib.dll => 0x896b7878 => 38
	i32 2353062107, ; 45: System.Net.Primitives => 0x8c40e0db => 22
	i32 2435356389, ; 46: System.Console.dll => 0x912896e5 => 12
	i32 2475788418, ; 47: Java.Interop.dll => 0x93918882 => 39
	i32 2570120770, ; 48: System.Text.Encodings.Web => 0x9930ee42 => 32
	i32 2585220780, ; 49: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 31
	i32 2665622720, ; 50: System.Drawing.Primitives => 0x9ee22cc0 => 14
	i32 2745510835, ; 51: PokemonTDCore.dll => 0xa3a52bb3 => 2
	i32 2909740682, ; 52: System.Private.CoreLib => 0xad6f1e8a => 38
	i32 2919462931, ; 53: System.Numerics.Vectors.dll => 0xae037813 => 24
	i32 2959614098, ; 54: System.ComponentModel.dll => 0xb0682092 => 11
	i32 2975226868, ; 55: PokemonTDEngine => 0xb1565bf4 => 3
	i32 3038032645, ; 56: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 0
	i32 3059408633, ; 57: Mono.Android.Runtime => 0xb65adef9 => 40
	i32 3059793426, ; 58: System.ComponentModel.Primitives => 0xb660be12 => 9
	i32 3220365878, ; 59: System.Threading => 0xbff2e236 => 36
	i32 3316684772, ; 60: System.Net.Requests.dll => 0xc5b097e4 => 23
	i32 3358260929, ; 61: System.Text.Json => 0xc82afec1 => 33
	i32 3366347497, ; 62: Java.Interop => 0xc8a662e9 => 39
	i32 3471940407, ; 63: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 10
	i32 3476120550, ; 64: Mono.Android => 0xcf3163e6 => 41
	i32 3485117614, ; 65: System.Text.Json.dll => 0xcfbaacae => 33
	i32 3608519521, ; 66: System.Linq.dll => 0xd715a361 => 18
	i32 3672681054, ; 67: Mono.Android.dll => 0xdae8aa5e => 41
	i32 3737834244, ; 68: System.Net.Http.Json.dll => 0xdecad304 => 20
	i32 3738240415, ; 69: PokemonTDAndroid => 0xded1059f => 4
	i32 3748608112, ; 70: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 13
	i32 3792276235, ; 71: System.Collections.NonGeneric => 0xe2098b0b => 6
	i32 3802395368, ; 72: System.Collections.Specialized.dll => 0xe2a3f2e8 => 7
	i32 3823082795, ; 73: System.Security.Cryptography.dll => 0xe3df9d2b => 30
	i32 3831343120, ; 74: MonoGame.Framework.dll => 0xe45da810 => 1
	i32 3849253459, ; 75: System.Runtime.InteropServices.dll => 0xe56ef253 => 27
	i32 3896106733, ; 76: System.Collections.Concurrent.dll => 0xe839deed => 5
	i32 4025784931, ; 77: System.Memory => 0xeff49a63 => 19
	i32 4073602200, ; 78: System.Threading.dll => 0xf2ce3c98 => 36
	i32 4099507663, ; 79: System.Drawing.dll => 0xf45985cf => 15
	i32 4100113165, ; 80: System.Private.Uri => 0xf462c30d => 26
	i32 4181436372, ; 81: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 28
	i32 4213026141, ; 82: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 13
	i32 4251748225 ; 83: PokemonTDEngine.dll => 0xfd6c8781 => 3
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [84 x i32] [
	i32 35, ; 0
	i32 27, ; 1
	i32 11, ; 2
	i32 35, ; 3
	i32 19, ; 4
	i32 0, ; 5
	i32 2, ; 6
	i32 8, ; 7
	i32 28, ; 8
	i32 37, ; 9
	i32 25, ; 10
	i32 1, ; 11
	i32 32, ; 12
	i32 5, ; 13
	i32 23, ; 14
	i32 17, ; 15
	i32 26, ; 16
	i32 16, ; 17
	i32 20, ; 18
	i32 9, ; 19
	i32 8, ; 20
	i32 15, ; 21
	i32 14, ; 22
	i32 10, ; 23
	i32 37, ; 24
	i32 18, ; 25
	i32 17, ; 26
	i32 16, ; 27
	i32 34, ; 28
	i32 21, ; 29
	i32 34, ; 30
	i32 29, ; 31
	i32 22, ; 32
	i32 30, ; 33
	i32 40, ; 34
	i32 4, ; 35
	i32 31, ; 36
	i32 6, ; 37
	i32 29, ; 38
	i32 24, ; 39
	i32 12, ; 40
	i32 7, ; 41
	i32 25, ; 42
	i32 21, ; 43
	i32 38, ; 44
	i32 22, ; 45
	i32 12, ; 46
	i32 39, ; 47
	i32 32, ; 48
	i32 31, ; 49
	i32 14, ; 50
	i32 2, ; 51
	i32 38, ; 52
	i32 24, ; 53
	i32 11, ; 54
	i32 3, ; 55
	i32 0, ; 56
	i32 40, ; 57
	i32 9, ; 58
	i32 36, ; 59
	i32 23, ; 60
	i32 33, ; 61
	i32 39, ; 62
	i32 10, ; 63
	i32 41, ; 64
	i32 33, ; 65
	i32 18, ; 66
	i32 41, ; 67
	i32 20, ; 68
	i32 4, ; 69
	i32 13, ; 70
	i32 6, ; 71
	i32 7, ; 72
	i32 30, ; 73
	i32 1, ; 74
	i32 27, ; 75
	i32 5, ; 76
	i32 19, ; 77
	i32 36, ; 78
	i32 15, ; 79
	i32 26, ; 80
	i32 28, ; 81
	i32 13, ; 82
	i32 3 ; 83
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
