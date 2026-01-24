; ModuleID = 'compressed_assemblies.arm64-v8a.ll'
source_filename = "compressed_assemblies.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.CompressedAssemblies = type {
	i32, ; uint32_t count
	ptr ; CompressedAssemblyDescriptor descriptors
}

%struct.CompressedAssemblyDescriptor = type {
	i32, ; uint32_t uncompressed_file_size
	i8, ; bool loaded
	ptr ; uint8_t data
}

@compressed_assemblies = dso_local local_unnamed_addr global %struct.CompressedAssemblies {
	i32 57, ; uint32_t count (0x39)
	ptr @compressed_assembly_descriptors; CompressedAssemblyDescriptor* descriptors
}, align 8

@compressed_assembly_descriptors = internal dso_local global [57 x %struct.CompressedAssemblyDescriptor] [
	%struct.CompressedAssemblyDescriptor {
		i32 147456, ; uint32_t uncompressed_file_size (0x24000)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_0; uint8_t* data (0x0)
	}, ; 0
	%struct.CompressedAssemblyDescriptor {
		i32 19016, ; uint32_t uncompressed_file_size (0x4a48)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_1; uint8_t* data (0x0)
	}, ; 1
	%struct.CompressedAssemblyDescriptor {
		i32 611840, ; uint32_t uncompressed_file_size (0x95600)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_2; uint8_t* data (0x0)
	}, ; 2
	%struct.CompressedAssemblyDescriptor {
		i32 983040, ; uint32_t uncompressed_file_size (0xf0000)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_3; uint8_t* data (0x0)
	}, ; 3
	%struct.CompressedAssemblyDescriptor {
		i32 11264, ; uint32_t uncompressed_file_size (0x2c00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_4; uint8_t* data (0x0)
	}, ; 4
	%struct.CompressedAssemblyDescriptor {
		i32 80896, ; uint32_t uncompressed_file_size (0x13c00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_5; uint8_t* data (0x0)
	}, ; 5
	%struct.CompressedAssemblyDescriptor {
		i32 60928, ; uint32_t uncompressed_file_size (0xee00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_6; uint8_t* data (0x0)
	}, ; 6
	%struct.CompressedAssemblyDescriptor {
		i32 11776, ; uint32_t uncompressed_file_size (0x2e00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_7; uint8_t* data (0x0)
	}, ; 7
	%struct.CompressedAssemblyDescriptor {
		i32 9728, ; uint32_t uncompressed_file_size (0x2600)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_8; uint8_t* data (0x0)
	}, ; 8
	%struct.CompressedAssemblyDescriptor {
		i32 7680, ; uint32_t uncompressed_file_size (0x1e00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_9; uint8_t* data (0x0)
	}, ; 9
	%struct.CompressedAssemblyDescriptor {
		i32 83968, ; uint32_t uncompressed_file_size (0x14800)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_10; uint8_t* data (0x0)
	}, ; 10
	%struct.CompressedAssemblyDescriptor {
		i32 4096, ; uint32_t uncompressed_file_size (0x1000)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_11; uint8_t* data (0x0)
	}, ; 11
	%struct.CompressedAssemblyDescriptor {
		i32 10752, ; uint32_t uncompressed_file_size (0x2a00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_12; uint8_t* data (0x0)
	}, ; 12
	%struct.CompressedAssemblyDescriptor {
		i32 14848, ; uint32_t uncompressed_file_size (0x3a00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_13; uint8_t* data (0x0)
	}, ; 13
	%struct.CompressedAssemblyDescriptor {
		i32 30720, ; uint32_t uncompressed_file_size (0x7800)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_14; uint8_t* data (0x0)
	}, ; 14
	%struct.CompressedAssemblyDescriptor {
		i32 4096, ; uint32_t uncompressed_file_size (0x1000)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_15; uint8_t* data (0x0)
	}, ; 15
	%struct.CompressedAssemblyDescriptor {
		i32 19968, ; uint32_t uncompressed_file_size (0x4e00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_16; uint8_t* data (0x0)
	}, ; 16
	%struct.CompressedAssemblyDescriptor {
		i32 29696, ; uint32_t uncompressed_file_size (0x7400)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_17; uint8_t* data (0x0)
	}, ; 17
	%struct.CompressedAssemblyDescriptor {
		i32 30208, ; uint32_t uncompressed_file_size (0x7600)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_18; uint8_t* data (0x0)
	}, ; 18
	%struct.CompressedAssemblyDescriptor {
		i32 12800, ; uint32_t uncompressed_file_size (0x3200)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_19; uint8_t* data (0x0)
	}, ; 19
	%struct.CompressedAssemblyDescriptor {
		i32 12288, ; uint32_t uncompressed_file_size (0x3000)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_20; uint8_t* data (0x0)
	}, ; 20
	%struct.CompressedAssemblyDescriptor {
		i32 116736, ; uint32_t uncompressed_file_size (0x1c800)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_21; uint8_t* data (0x0)
	}, ; 21
	%struct.CompressedAssemblyDescriptor {
		i32 33792, ; uint32_t uncompressed_file_size (0x8400)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_22; uint8_t* data (0x0)
	}, ; 22
	%struct.CompressedAssemblyDescriptor {
		i32 6144, ; uint32_t uncompressed_file_size (0x1800)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_23; uint8_t* data (0x0)
	}, ; 23
	%struct.CompressedAssemblyDescriptor {
		i32 4608, ; uint32_t uncompressed_file_size (0x1200)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_24; uint8_t* data (0x0)
	}, ; 24
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size (0x1400)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_25; uint8_t* data (0x0)
	}, ; 25
	%struct.CompressedAssemblyDescriptor {
		i32 66048, ; uint32_t uncompressed_file_size (0x10200)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_26; uint8_t* data (0x0)
	}, ; 26
	%struct.CompressedAssemblyDescriptor {
		i32 8192, ; uint32_t uncompressed_file_size (0x2000)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_27; uint8_t* data (0x0)
	}, ; 27
	%struct.CompressedAssemblyDescriptor {
		i32 4608, ; uint32_t uncompressed_file_size (0x1200)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_28; uint8_t* data (0x0)
	}, ; 28
	%struct.CompressedAssemblyDescriptor {
		i32 10240, ; uint32_t uncompressed_file_size (0x2800)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_29; uint8_t* data (0x0)
	}, ; 29
	%struct.CompressedAssemblyDescriptor {
		i32 13312, ; uint32_t uncompressed_file_size (0x3400)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_30; uint8_t* data (0x0)
	}, ; 30
	%struct.CompressedAssemblyDescriptor {
		i32 4096, ; uint32_t uncompressed_file_size (0x1000)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_31; uint8_t* data (0x0)
	}, ; 31
	%struct.CompressedAssemblyDescriptor {
		i32 135680, ; uint32_t uncompressed_file_size (0x21200)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_32; uint8_t* data (0x0)
	}, ; 32
	%struct.CompressedAssemblyDescriptor {
		i32 4096, ; uint32_t uncompressed_file_size (0x1000)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_33; uint8_t* data (0x0)
	}, ; 33
	%struct.CompressedAssemblyDescriptor {
		i32 11264, ; uint32_t uncompressed_file_size (0x2c00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_34; uint8_t* data (0x0)
	}, ; 34
	%struct.CompressedAssemblyDescriptor {
		i32 4096, ; uint32_t uncompressed_file_size (0x1000)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_35; uint8_t* data (0x0)
	}, ; 35
	%struct.CompressedAssemblyDescriptor {
		i32 2560, ; uint32_t uncompressed_file_size (0xa00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_36; uint8_t* data (0x0)
	}, ; 36
	%struct.CompressedAssemblyDescriptor {
		i32 19968, ; uint32_t uncompressed_file_size (0x4e00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_37; uint8_t* data (0x0)
	}, ; 37
	%struct.CompressedAssemblyDescriptor {
		i32 12288, ; uint32_t uncompressed_file_size (0x3000)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_38; uint8_t* data (0x0)
	}, ; 38
	%struct.CompressedAssemblyDescriptor {
		i32 1722368, ; uint32_t uncompressed_file_size (0x1a4800)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_39; uint8_t* data (0x0)
	}, ; 39
	%struct.CompressedAssemblyDescriptor {
		i32 31232, ; uint32_t uncompressed_file_size (0x7a00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_40; uint8_t* data (0x0)
	}, ; 40
	%struct.CompressedAssemblyDescriptor {
		i32 336384, ; uint32_t uncompressed_file_size (0x52200)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_41; uint8_t* data (0x0)
	}, ; 41
	%struct.CompressedAssemblyDescriptor {
		i32 19968, ; uint32_t uncompressed_file_size (0x4e00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_42; uint8_t* data (0x0)
	}, ; 42
	%struct.CompressedAssemblyDescriptor {
		i32 11776, ; uint32_t uncompressed_file_size (0x2e00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_43; uint8_t* data (0x0)
	}, ; 43
	%struct.CompressedAssemblyDescriptor {
		i32 1705984, ; uint32_t uncompressed_file_size (0x1a0800)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_44; uint8_t* data (0x0)
	}, ; 44
	%struct.CompressedAssemblyDescriptor {
		i32 28160, ; uint32_t uncompressed_file_size (0x6e00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_45; uint8_t* data (0x0)
	}, ; 45
	%struct.CompressedAssemblyDescriptor {
		i32 336896, ; uint32_t uncompressed_file_size (0x52400)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_46; uint8_t* data (0x0)
	}, ; 46
	%struct.CompressedAssemblyDescriptor {
		i32 19968, ; uint32_t uncompressed_file_size (0x4e00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_47; uint8_t* data (0x0)
	}, ; 47
	%struct.CompressedAssemblyDescriptor {
		i32 11776, ; uint32_t uncompressed_file_size (0x2e00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_48; uint8_t* data (0x0)
	}, ; 48
	%struct.CompressedAssemblyDescriptor {
		i32 1705984, ; uint32_t uncompressed_file_size (0x1a0800)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_49; uint8_t* data (0x0)
	}, ; 49
	%struct.CompressedAssemblyDescriptor {
		i32 28160, ; uint32_t uncompressed_file_size (0x6e00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_50; uint8_t* data (0x0)
	}, ; 50
	%struct.CompressedAssemblyDescriptor {
		i32 336896, ; uint32_t uncompressed_file_size (0x52400)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_51; uint8_t* data (0x0)
	}, ; 51
	%struct.CompressedAssemblyDescriptor {
		i32 19968, ; uint32_t uncompressed_file_size (0x4e00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_52; uint8_t* data (0x0)
	}, ; 52
	%struct.CompressedAssemblyDescriptor {
		i32 12800, ; uint32_t uncompressed_file_size (0x3200)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_53; uint8_t* data (0x0)
	}, ; 53
	%struct.CompressedAssemblyDescriptor {
		i32 1768960, ; uint32_t uncompressed_file_size (0x1afe00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_54; uint8_t* data (0x0)
	}, ; 54
	%struct.CompressedAssemblyDescriptor {
		i32 30208, ; uint32_t uncompressed_file_size (0x7600)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_55; uint8_t* data (0x0)
	}, ; 55
	%struct.CompressedAssemblyDescriptor {
		i32 336384, ; uint32_t uncompressed_file_size (0x52200)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_56; uint8_t* data (0x0)
	} ; 56
], align 8

@__compressedAssemblyData_0 = internal dso_local global [147456 x i8] zeroinitializer, align 1
@__compressedAssemblyData_1 = internal dso_local global [19016 x i8] zeroinitializer, align 1
@__compressedAssemblyData_2 = internal dso_local global [611840 x i8] zeroinitializer, align 1
@__compressedAssemblyData_3 = internal dso_local global [983040 x i8] zeroinitializer, align 1
@__compressedAssemblyData_4 = internal dso_local global [11264 x i8] zeroinitializer, align 1
@__compressedAssemblyData_5 = internal dso_local global [80896 x i8] zeroinitializer, align 1
@__compressedAssemblyData_6 = internal dso_local global [60928 x i8] zeroinitializer, align 1
@__compressedAssemblyData_7 = internal dso_local global [11776 x i8] zeroinitializer, align 1
@__compressedAssemblyData_8 = internal dso_local global [9728 x i8] zeroinitializer, align 1
@__compressedAssemblyData_9 = internal dso_local global [7680 x i8] zeroinitializer, align 1
@__compressedAssemblyData_10 = internal dso_local global [83968 x i8] zeroinitializer, align 1
@__compressedAssemblyData_11 = internal dso_local global [4096 x i8] zeroinitializer, align 1
@__compressedAssemblyData_12 = internal dso_local global [10752 x i8] zeroinitializer, align 1
@__compressedAssemblyData_13 = internal dso_local global [14848 x i8] zeroinitializer, align 1
@__compressedAssemblyData_14 = internal dso_local global [30720 x i8] zeroinitializer, align 1
@__compressedAssemblyData_15 = internal dso_local global [4096 x i8] zeroinitializer, align 1
@__compressedAssemblyData_16 = internal dso_local global [19968 x i8] zeroinitializer, align 1
@__compressedAssemblyData_17 = internal dso_local global [29696 x i8] zeroinitializer, align 1
@__compressedAssemblyData_18 = internal dso_local global [30208 x i8] zeroinitializer, align 1
@__compressedAssemblyData_19 = internal dso_local global [12800 x i8] zeroinitializer, align 1
@__compressedAssemblyData_20 = internal dso_local global [12288 x i8] zeroinitializer, align 1
@__compressedAssemblyData_21 = internal dso_local global [116736 x i8] zeroinitializer, align 1
@__compressedAssemblyData_22 = internal dso_local global [33792 x i8] zeroinitializer, align 1
@__compressedAssemblyData_23 = internal dso_local global [6144 x i8] zeroinitializer, align 1
@__compressedAssemblyData_24 = internal dso_local global [4608 x i8] zeroinitializer, align 1
@__compressedAssemblyData_25 = internal dso_local global [5120 x i8] zeroinitializer, align 1
@__compressedAssemblyData_26 = internal dso_local global [66048 x i8] zeroinitializer, align 1
@__compressedAssemblyData_27 = internal dso_local global [8192 x i8] zeroinitializer, align 1
@__compressedAssemblyData_28 = internal dso_local global [4608 x i8] zeroinitializer, align 1
@__compressedAssemblyData_29 = internal dso_local global [10240 x i8] zeroinitializer, align 1
@__compressedAssemblyData_30 = internal dso_local global [13312 x i8] zeroinitializer, align 1
@__compressedAssemblyData_31 = internal dso_local global [4096 x i8] zeroinitializer, align 1
@__compressedAssemblyData_32 = internal dso_local global [135680 x i8] zeroinitializer, align 1
@__compressedAssemblyData_33 = internal dso_local global [4096 x i8] zeroinitializer, align 1
@__compressedAssemblyData_34 = internal dso_local global [11264 x i8] zeroinitializer, align 1
@__compressedAssemblyData_35 = internal dso_local global [4096 x i8] zeroinitializer, align 1
@__compressedAssemblyData_36 = internal dso_local global [2560 x i8] zeroinitializer, align 1
@__compressedAssemblyData_37 = internal dso_local global [19968 x i8] zeroinitializer, align 1
@__compressedAssemblyData_38 = internal dso_local global [12288 x i8] zeroinitializer, align 1
@__compressedAssemblyData_39 = internal dso_local global [1722368 x i8] zeroinitializer, align 1
@__compressedAssemblyData_40 = internal dso_local global [31232 x i8] zeroinitializer, align 1
@__compressedAssemblyData_41 = internal dso_local global [336384 x i8] zeroinitializer, align 1
@__compressedAssemblyData_42 = internal dso_local global [19968 x i8] zeroinitializer, align 1
@__compressedAssemblyData_43 = internal dso_local global [11776 x i8] zeroinitializer, align 1
@__compressedAssemblyData_44 = internal dso_local global [1705984 x i8] zeroinitializer, align 1
@__compressedAssemblyData_45 = internal dso_local global [28160 x i8] zeroinitializer, align 1
@__compressedAssemblyData_46 = internal dso_local global [336896 x i8] zeroinitializer, align 1
@__compressedAssemblyData_47 = internal dso_local global [19968 x i8] zeroinitializer, align 1
@__compressedAssemblyData_48 = internal dso_local global [11776 x i8] zeroinitializer, align 1
@__compressedAssemblyData_49 = internal dso_local global [1705984 x i8] zeroinitializer, align 1
@__compressedAssemblyData_50 = internal dso_local global [28160 x i8] zeroinitializer, align 1
@__compressedAssemblyData_51 = internal dso_local global [336896 x i8] zeroinitializer, align 1
@__compressedAssemblyData_52 = internal dso_local global [19968 x i8] zeroinitializer, align 1
@__compressedAssemblyData_53 = internal dso_local global [12800 x i8] zeroinitializer, align 1
@__compressedAssemblyData_54 = internal dso_local global [1768960 x i8] zeroinitializer, align 1
@__compressedAssemblyData_55 = internal dso_local global [30208 x i8] zeroinitializer, align 1
@__compressedAssemblyData_56 = internal dso_local global [336384 x i8] zeroinitializer, align 1

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
