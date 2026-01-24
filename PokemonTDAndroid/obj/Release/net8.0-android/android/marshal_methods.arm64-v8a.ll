; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [42 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [84 x i64] [
	i64 120698629574877762, ; 0: Mono.Android => 0x1accec39cafe242 => 41
	i64 750875890346172408, ; 1: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 35
	i64 799765834175365804, ; 2: System.ComponentModel.dll => 0xb1956c9f18442ac => 11
	i64 1268860745194512059, ; 3: System.Drawing.dll => 0x119be62002c19ebb => 15
	i64 1476839205573959279, ; 4: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 22
	i64 1513467482682125403, ; 5: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 40
	i64 1537168428375924959, ; 6: System.Threading.Thread.dll => 0x15551e8a954ae0df => 35
	i64 1743969030606105336, ; 7: System.Memory.dll => 0x1833d297e88f2af8 => 19
	i64 1767386781656293639, ; 8: System.Private.Uri.dll => 0x188704e9f5582107 => 26
	i64 1874279219811211883, ; 9: PokemonTDAndroid.dll => 0x1a02c70522be5a6b => 4
	i64 1875417405349196092, ; 10: System.Drawing.Primitives => 0x1a06d2319b6c713c => 14
	i64 2102659300918482391, ; 11: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 14
	i64 2287834202362508563, ; 12: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 5
	i64 2335503487726329082, ; 13: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 32
	i64 2497223385847772520, ; 14: System.Runtime => 0x22a7eb7046413568 => 29
	i64 3311221304742556517, ; 15: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 24
	i64 3551103847008531295, ; 16: System.Private.CoreLib.dll => 0x31480e226177735f => 38
	i64 3571415421602489686, ; 17: System.Runtime.dll => 0x319037675df7e556 => 29
	i64 3933965368022646939, ; 18: System.Net.Requests => 0x369840a8bfadc09b => 23
	i64 3966267475168208030, ; 19: System.Memory => 0x370b03412596249e => 19
	i64 4009997192427317104, ; 20: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 28
	i64 4154383907710350974, ; 21: System.ComponentModel => 0x39a7562737acb67e => 11
	i64 4205801962323029395, ; 22: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 10
	i64 4783864354832935512, ; 23: MonoGame.Framework => 0x4263b348e3786a58 => 1
	i64 4809057822547766521, ; 24: System.Drawing => 0x42bd349c3145ecf9 => 15
	i64 5103417709280584325, ; 25: System.Collections.Specialized => 0x46d2fb5e161b6285 => 7
	i64 5182934613077526976, ; 26: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 7
	i64 5570799893513421663, ; 27: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 16
	i64 5573260873512690141, ; 28: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 30
	i64 6222399776351216807, ; 29: System.Text.Json.dll => 0x565a67a0ffe264a7 => 33
	i64 6357457916754632952, ; 30: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 0
	i64 6894844156784520562, ; 31: System.Numerics.Vectors => 0x5faf683aead1ad72 => 24
	i64 7270811800166795866, ; 32: System.Linq => 0x64e71ccf51a90a5a => 18
	i64 7377312882064240630, ; 33: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 10
	i64 7489048572193775167, ; 34: System.ObjectModel => 0x67ee71ff6b419e3f => 25
	i64 7654504624184590948, ; 35: System.Net.Http => 0x6a3a4366801b8264 => 21
	i64 7714652370974252055, ; 36: System.Private.CoreLib => 0x6b0ff375198b9c17 => 38
	i64 8064050204834738623, ; 37: System.Collections.dll => 0x6fe942efa61731bf => 8
	i64 8085230611270010360, ; 38: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 20
	i64 8087206902342787202, ; 39: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 13
	i64 8167236081217502503, ; 40: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 39
	i64 8185542183669246576, ; 41: System.Collections => 0x7198e33f4794aa70 => 8
	i64 8368701292315763008, ; 42: System.Security.Cryptography => 0x7423997c6fd56140 => 30
	i64 8563666267364444763, ; 43: System.Private.Uri => 0x76d841191140ca5b => 26
	i64 8626175481042262068, ; 44: Java.Interop => 0x77b654e585b55834 => 39
	i64 8725526185868997716, ; 45: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 13
	i64 9649400414182181815, ; 46: PokemonTDAndroid => 0x85e98e8d4ed60bb7 => 4
	i64 9659729154652888475, ; 47: System.Text.RegularExpressions => 0x860e407c9991dd9b => 34
	i64 9702891218465930390, ; 48: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 6
	i64 9808709177481450983, ; 49: Mono.Android.dll => 0x881f890734e555e7 => 41
	i64 10038780035334861115, ; 50: System.Net.Http.dll => 0x8b50e941206af13b => 21
	i64 10785150219063592792, ; 51: System.Net.Primitives => 0x95ac8cfb68830758 => 22
	i64 11485890710487134646, ; 52: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 27
	i64 12145679461940342714, ; 53: System.Text.Json => 0xa88e1f1ebcb62fba => 33
	i64 12201331334810686224, ; 54: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 28
	i64 12475113361194491050, ; 55: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 0
	i64 12550732019250633519, ; 56: System.IO.Compression => 0xae2d28465e8e1b2f => 17
	i64 12708922737231849740, ; 57: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 31
	i64 13343850469010654401, ; 58: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 40
	i64 13717397318615465333, ; 59: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 9
	i64 13881769479078963060, ; 60: System.Console.dll => 0xc0a5f3cade5c6774 => 12
	i64 14125464355221830302, ; 61: System.Threading.dll => 0xc407bafdbc707a9e => 36
	i64 14254574811015963973, ; 62: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 31
	i64 14461014870687870182, ; 63: System.Net.Requests.dll => 0xc8afd8683afdece6 => 23
	i64 14551742072151931844, ; 64: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 32
	i64 14843517874685189901, ; 65: MonoGame.Framework.dll => 0xcdfec4dcd9c59f0d => 1
	i64 14987728460634540364, ; 66: System.IO.Compression.dll => 0xcfff1ba06622494c => 17
	i64 15024878362326791334, ; 67: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 20
	i64 15063292390029510785, ; 68: PokemonTDCore.dll => 0xd10b909eb78dc881 => 2
	i64 15076659072870671916, ; 69: System.ObjectModel.dll => 0xd13b0d8c1620662c => 25
	i64 15115185479366240210, ; 70: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 16
	i64 15133485256822086103, ; 71: System.Linq.dll => 0xd204f0a9127dd9d7 => 18
	i64 15527772828719725935, ; 72: System.Console => 0xd77dbb1e38cd3d6f => 12
	i64 15609085926864131306, ; 73: System.dll => 0xd89e9cf3334914ea => 37
	i64 16154507427712707110, ; 74: System => 0xe03056ea4e39aa26 => 37
	i64 16235471614012038139, ; 75: PokemonTDEngine => 0xe14ffb69ea201bfb => 3
	i64 16402286938723533703, ; 76: PokemonTDCore => 0xe3a0a11156a54387 => 2
	i64 16656471637491101562, ; 77: PokemonTDEngine.dll => 0xe727acb45c06af7a => 3
	i64 16890310621557459193, ; 78: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 34
	i64 17008137082415910100, ; 79: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 6
	i64 17062143951396181894, ; 80: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 9
	i64 17712670374920797664, ; 81: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 27
	i64 18025913125965088385, ; 82: System.Threading => 0xfa28e87b91334681 => 36
	i64 18245806341561545090 ; 83: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 5
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [84 x i32] [
	i32 41, ; 0
	i32 35, ; 1
	i32 11, ; 2
	i32 15, ; 3
	i32 22, ; 4
	i32 40, ; 5
	i32 35, ; 6
	i32 19, ; 7
	i32 26, ; 8
	i32 4, ; 9
	i32 14, ; 10
	i32 14, ; 11
	i32 5, ; 12
	i32 32, ; 13
	i32 29, ; 14
	i32 24, ; 15
	i32 38, ; 16
	i32 29, ; 17
	i32 23, ; 18
	i32 19, ; 19
	i32 28, ; 20
	i32 11, ; 21
	i32 10, ; 22
	i32 1, ; 23
	i32 15, ; 24
	i32 7, ; 25
	i32 7, ; 26
	i32 16, ; 27
	i32 30, ; 28
	i32 33, ; 29
	i32 0, ; 30
	i32 24, ; 31
	i32 18, ; 32
	i32 10, ; 33
	i32 25, ; 34
	i32 21, ; 35
	i32 38, ; 36
	i32 8, ; 37
	i32 20, ; 38
	i32 13, ; 39
	i32 39, ; 40
	i32 8, ; 41
	i32 30, ; 42
	i32 26, ; 43
	i32 39, ; 44
	i32 13, ; 45
	i32 4, ; 46
	i32 34, ; 47
	i32 6, ; 48
	i32 41, ; 49
	i32 21, ; 50
	i32 22, ; 51
	i32 27, ; 52
	i32 33, ; 53
	i32 28, ; 54
	i32 0, ; 55
	i32 17, ; 56
	i32 31, ; 57
	i32 40, ; 58
	i32 9, ; 59
	i32 12, ; 60
	i32 36, ; 61
	i32 31, ; 62
	i32 23, ; 63
	i32 32, ; 64
	i32 1, ; 65
	i32 17, ; 66
	i32 20, ; 67
	i32 2, ; 68
	i32 25, ; 69
	i32 16, ; 70
	i32 18, ; 71
	i32 12, ; 72
	i32 37, ; 73
	i32 37, ; 74
	i32 3, ; 75
	i32 2, ; 76
	i32 3, ; 77
	i32 34, ; 78
	i32 6, ; 79
	i32 9, ; 80
	i32 27, ; 81
	i32 36, ; 82
	i32 5 ; 83
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
