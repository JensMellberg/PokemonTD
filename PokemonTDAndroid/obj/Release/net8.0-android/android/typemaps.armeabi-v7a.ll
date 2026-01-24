; ModuleID = 'typemaps.armeabi-v7a.ll'
source_filename = "typemaps.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.TypeMapJava = type {
	i32, ; uint32_t module_index
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_name_index
}

%struct.TypeMapModule = type {
	[16 x i8], ; uint8_t module_uuid[16]
	i32, ; uint32_t entry_count
	i32, ; uint32_t duplicate_count
	ptr, ; TypeMapModuleEntry map
	ptr, ; TypeMapModuleEntry duplicate_map
	ptr, ; char* assembly_name
	ptr, ; MonoImage image
	i32, ; uint32_t java_name_width
	ptr ; uint8_t java_map
}

%struct.TypeMapModuleEntry = type {
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_map_index
}

@map_module_count = dso_local local_unnamed_addr constant i32 3, align 4

@java_type_count = dso_local local_unnamed_addr constant i32 194, align 4

; Managed modules map
@map_modules = dso_local local_unnamed_addr global [3 x %struct.TypeMapModule] [
	%struct.TypeMapModule {
		[16 x i8] c"\06\84s\E5\E3\CD\81I\8B<\03\01)a\C0g", ; module_uuid: e5738406-cde3-4981-8b3c-03012961c067
		i32 2, ; uint32_t entry_count (0x2)
		i32 0, ; uint32_t duplicate_count (0x0)
		ptr @module0_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.0_assembly_name, ; assembly_name: PokemonTDAndroid
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 0
	%struct.TypeMapModule {
		[16 x i8] c"\08\F2\AB\EC\EB\AD@I\9CR\99\F4\0D\82\CB\07", ; module_uuid: ecabf208-adeb-4940-9c52-99f40d82cb07
		i32 6, ; uint32_t entry_count (0x6)
		i32 0, ; uint32_t duplicate_count (0x0)
		ptr @module1_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.1_assembly_name, ; assembly_name: MonoGame.Framework
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 1
	%struct.TypeMapModule {
		[16 x i8] c"\CD2\12G\F7\A6\E8I\BF\C1\D4\CFg\B8x\DF", ; module_uuid: 471232cd-a6f7-49e8-bfc1-d4cf67b878df
		i32 186, ; uint32_t entry_count (0xba)
		i32 67, ; uint32_t duplicate_count (0x43)
		ptr @module2_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module2_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.2_assembly_name, ; assembly_name: Mono.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	} ; 2
], align 4

; Java types name hashes
@map_java_hashes = dso_local local_unnamed_addr constant [194 x i32] [
	i32 12341354, ; 0: 0xbc506a => java/lang/Object
	i32 32078366, ; 1: 0x1e97a1e => java/security/cert/Certificate
	i32 34115578, ; 2: 0x2088ffa => android/content/pm/PackageItemInfo
	i32 74282880, ; 3: 0x46d7780 => android/view/ViewGroup
	i32 118977103, ; 4: 0x717724f => android/util/DisplayMetrics
	i32 138171443, ; 5: 0x83c5433 => javax/net/ssl/SSLSessionContext
	i32 139280357, ; 6: 0x84d3fe5 => android/view/KeyEvent
	i32 176697843, ; 7: 0xa8831f3 => java/lang/IllegalArgumentException
	i32 183151336, ; 8: 0xaeaaae8 => android/view/OrientationEventListener
	i32 262602588, ; 9: 0xfa6ff5c => android/provider/MediaStore
	i32 269199815, ; 10: 0x100ba9c7 => javax/security/cert/X509Certificate
	i32 366534601, ; 11: 0x15d8dfc9 => android/view/ViewGroup$LayoutParams
	i32 393371378, ; 12: 0x17725ef2 => mono/java/lang/RunnableImplementor
	i32 412771173, ; 13: 0x189a6365 => java/lang/Long
	i32 419359493, ; 14: 0x18feeb05 => java/util/Iterator
	i32 420482824, ; 15: 0x19100f08 => java/net/ConnectException
	i32 445764737, ; 16: 0x1a91d481 => android/provider/Settings$SettingNotFoundException
	i32 531198748, ; 17: 0x1fa9731c => mono/android/runtime/OutputStreamAdapter
	i32 559360414, ; 18: 0x2157299e => crc64493ac3851fab1842/AndroidGameActivity
	i32 581097368, ; 19: 0x22a2d798 => java/nio/channels/FileChannel
	i32 584231583, ; 20: 0x22d2aa9f => java/lang/IllegalStateException
	i32 591810476, ; 21: 0x23464fac => android/os/Bundle
	i32 619060219, ; 22: 0x24e61bfb => java/net/URL
	i32 692920175, ; 23: 0x294d1f6f => java/util/ArrayList
	i32 699867921, ; 24: 0x29b72311 => android/content/res/AssetFileDescriptor
	i32 780408360, ; 25: 0x2e841628 => java/lang/CharSequence
	i32 780987551, ; 26: 0x2e8cec9f => java/io/PrintWriter
	i32 793918146, ; 27: 0x2f523ac2 => java/lang/Integer
	i32 806800039, ; 28: 0x3016caa7 => java/lang/Thread
	i32 827461610, ; 29: 0x31520fea => android/provider/MediaStore$Images
	i32 838682992, ; 30: 0x31fd4970 => java/lang/NullPointerException
	i32 857458217, ; 31: 0x331bc629 => android/content/res/AssetManager
	i32 864882745, ; 32: 0x338d1039 => android/graphics/Bitmap$Config
	i32 876646173, ; 33: 0x34408f1d => javax/net/ssl/TrustManager
	i32 883855573, ; 34: 0x34ae90d5 => android/provider/MediaStore$Images$Media
	i32 885223365, ; 35: 0x34c36fc5 => android/content/ContentResolver
	i32 893363610, ; 36: 0x353fa59a => java/lang/Short
	i32 906034180, ; 37: 0x3600fc04 => android/database/Cursor
	i32 928674904, ; 38: 0x375a7458 => android/graphics/BitmapFactory
	i32 996699600, ; 39: 0x3b686dd0 => java/io/FileDescriptor
	i32 1018791985, ; 40: 0x3cb98831 => android/widget/EditText
	i32 1026417919, ; 41: 0x3d2de4ff => android/view/WindowMetrics
	i32 1026507328, ; 42: 0x3d2f4240 => java/net/SocketAddress
	i32 1030707578, ; 43: 0x3d6f597a => android/database/DataSetObserver
	i32 1035992969, ; 44: 0x3dbfff89 => android/content/res/Resources
	i32 1070459310, ; 45: 0x3fcde9ae => android/database/ContentObserver
	i32 1077629184, ; 46: 0x403b5100 => java/util/function/Consumer
	i32 1084296731, ; 47: 0x40a10e1b => android/hardware/Sensor
	i32 1090939588, ; 48: 0x41066ac4 => javax/net/ssl/KeyManagerFactory
	i32 1097102249, ; 49: 0x416473a9 => android/hardware/SensorManager
	i32 1102556300, ; 50: 0x41b7ac8c => android/provider/Settings$NameValueTable
	i32 1142011573, ; 51: 0x4411b6b5 => java/util/Enumeration
	i32 1196093578, ; 52: 0x474af08a => android/provider/Settings$System
	i32 1227075600, ; 53: 0x4923b010 => javax/security/cert/Certificate
	i32 1267415633, ; 54: 0x4b8b3a51 => android/os/Vibrator
	i32 1270561450, ; 55: 0x4bbb3aaa => java/net/SocketTimeoutException
	i32 1298454265, ; 56: 0x4d64d6f9 => java/lang/Throwable
	i32 1323697755, ; 57: 0x4ee6065b => javax/net/ssl/SSLContext
	i32 1335098580, ; 58: 0x4f93fcd4 => java/util/Collection
	i32 1340347874, ; 59: 0x4fe415e2 => android/graphics/Paint
	i32 1340834341, ; 60: 0x4feb8225 => android/media/MediaPlayer$OnCompletionListener
	i32 1358802632, ; 61: 0x50fdaec8 => crc64493ac3851fab1842/OrientationListener
	i32 1368421702, ; 62: 0x51907546 => java/lang/ClassCastException
	i32 1373631042, ; 63: 0x51dff242 => javax/net/ssl/KeyManager
	i32 1415978247, ; 64: 0x54661d07 => android/content/pm/ApplicationInfo
	i32 1424548067, ; 65: 0x54e8e0e3 => android/graphics/BitmapFactory$Options
	i32 1425790689, ; 66: 0x54fbd6e1 => java/lang/SecurityException
	i32 1428048664, ; 67: 0x551e4b18 => java/net/HttpURLConnection
	i32 1433059198, ; 68: 0x556abf7e => android/view/ViewManager
	i32 1457311873, ; 69: 0x56dcd081 => mono/android/content/DialogInterface_OnCancelListenerImplementor
	i32 1475682991, ; 70: 0x57f522af => java/util/HashMap
	i32 1476293262, ; 71: 0x57fe728e => javax/security/auth/Subject
	i32 1489594546, ; 72: 0x58c968b2 => java/nio/channels/spi/AbstractInterruptibleChannel
	i32 1492815417, ; 73: 0x58fa8e39 => java/util/concurrent/Executor
	i32 1506774891, ; 74: 0x59cf8f6b => android/widget/Button
	i32 1518406749, ; 75: 0x5a810c5d => android/provider/MediaStore$Audio$Media
	i32 1536774344, ; 76: 0x5b9950c8 => android/provider/MediaStore$Audio
	i32 1544613420, ; 77: 0x5c10ee2c => java/io/File
	i32 1553648812, ; 78: 0x5c9accac => android/app/KeyguardManager
	i32 1573833883, ; 79: 0x5dcecc9b => android/app/AlertDialog
	i32 1584672329, ; 80: 0x5e742e49 => android/view/Display
	i32 1586851388, ; 81: 0x5e956e3c => android/os/Handler
	i32 1637959351, ; 82: 0x61a146b7 => java/security/Principal
	i32 1638234847, ; 83: 0x61a57adf => crc64493ac3851fab1842/ScreenReceiver
	i32 1646348278, ; 84: 0x622147f6 => android/view/View
	i32 1649695927, ; 85: 0x62545cb7 => java/lang/RuntimeException
	i32 1657134862, ; 86: 0x62c5df0e => java/lang/IndexOutOfBoundsException
	i32 1661912031, ; 87: 0x630ec3df => android/view/View$OnTouchListener
	i32 1680835779, ; 88: 0x642f84c3 => java/lang/Byte
	i32 1718265030, ; 89: 0x666aa4c6 => java/lang/Character
	i32 1755285137, ; 90: 0x689f8691 => java/util/Random
	i32 1758490869, ; 91: 0x68d070f5 => android/os/BaseBundle
	i32 1772705556, ; 92: 0x69a95714 => android/graphics/Point
	i32 1807220671, ; 93: 0x6bb7ffbf => android/view/View$OnClickListener
	i32 1851730788, ; 94: 0x6e5f2b64 => java/lang/Runnable
	i32 1872777977, ; 95: 0x6fa052f9 => javax/microedition/khronos/egl/EGLConfig
	i32 1944129628, ; 96: 0x73e1105c => java/io/OutputStream
	i32 1962126435, ; 97: 0x74f3ac63 => android/content/BroadcastReceiver
	i32 1985929388, ; 98: 0x765ee0ac => android/app/Activity
	i32 1987841337, ; 99: 0x767c0d39 => java/lang/Boolean
	i32 2008064836, ; 100: 0x77b0a344 => android/content/Intent
	i32 2027782872, ; 101: 0x78dd82d8 => android/view/ContextThemeWrapper
	i32 2036556174, ; 102: 0x7963618e => android/content/DialogInterface
	i32 2044755471, ; 103: 0x79e07e0f => crc6472dcb918d50f9b12/Activity1
	i32 2061721420, ; 104: 0x7ae35f4c => android/database/CharArrayBuffer
	i32 2073337312, ; 105: 0x7b949de0 => android/app/AlertDialog$Builder
	i32 2080685156, ; 106: 0x7c04bc64 => java/security/SecureRandom
	i32 2114237978, ; 107: 0x7e04b61a => android/content/res/Configuration
	i32 2194570250, ; 108: 0x82ce7c0a => javax/microedition/khronos/egl/EGL10
	i32 2269094561, ; 109: 0x873fa2a1 => java/net/UnknownServiceException
	i32 2270923754, ; 110: 0x875b8bea => java/net/Proxy$Type
	i32 2284656609, ; 111: 0x882d17e1 => android/app/Application
	i32 2296411383, ; 112: 0x88e074f7 => android/content/IntentFilter
	i32 2333838264, ; 113: 0x8b1b8bb8 => javax/microedition/khronos/egl/EGLSurface
	i32 2363729366, ; 114: 0x8ce3a5d6 => java/lang/Enum
	i32 2411404453, ; 115: 0x8fbb1ca5 => java/lang/UnsupportedOperationException
	i32 2442189280, ; 116: 0x9190d9e0 => android/util/AndroidException
	i32 2443438835, ; 117: 0x91a3eaf3 => java/net/SocketException
	i32 2558143838, ; 118: 0x987a2d5e => java/io/FileInputStream
	i32 2603371956, ; 119: 0x9b2c4db4 => android/media/AudioManager
	i32 2628279754, ; 120: 0x9ca85dca => android/content/DialogInterface$OnCancelListener
	i32 2637159311, ; 121: 0x9d2fdb8f => android/content/pm/PackageManager
	i32 2654672461, ; 122: 0x9e3b164d => java/io/InterruptedIOException
	i32 2663462016, ; 123: 0x9ec13480 => mono/android/media/MediaPlayer_OnCompletionListenerImplementor
	i32 2664928003, ; 124: 0x9ed79303 => javax/net/ssl/HostnameVerifier
	i32 2681988174, ; 125: 0x9fdbe44e => android/view/MotionEvent
	i32 2687778660, ; 126: 0xa0343f64 => android/widget/TextView
	i32 2692535938, ; 127: 0xa07cd682 => android/util/Log
	i32 2762684487, ; 128: 0xa4ab3847 => java/lang/Float
	i32 2789289167, ; 129: 0xa6412ccf => javax/microedition/khronos/egl/EGLDisplay
	i32 2815615939, ; 130: 0xa7d2e3c3 => android/os/Build
	i32 2874673969, ; 131: 0xab580b31 => java/lang/StackTraceElement
	i32 2887387454, ; 132: 0xac1a093e => javax/microedition/khronos/egl/EGLContext
	i32 2898734456, ; 133: 0xacc72d78 => javax/microedition/khronos/egl/EGL
	i32 2917163057, ; 134: 0xade06031 => android/view/SurfaceHolder
	i32 2918613155, ; 135: 0xadf680a3 => android/content/DialogInterface$OnClickListener
	i32 2928676880, ; 136: 0xae901010 => android/view/InputDevice
	i32 2932874700, ; 137: 0xaed01dcc => android/view/InputEvent
	i32 2933762856, ; 138: 0xaeddab28 => android/util/AttributeSet
	i32 2942792700, ; 139: 0xaf6773fc => java/lang/Exception
	i32 2980510762, ; 140: 0xb1a6fc2a => mono/android/runtime/JavaArray
	i32 2983720033, ; 141: 0xb1d7f461 => mono/android/TypeManager
	i32 3011322120, ; 142: 0xb37d2108 => android/view/Surface
	i32 3014164775, ; 143: 0xb3a88127 => crc64f0e061189adeef62/Accelerometer_SensorListener
	i32 3032808825, ; 144: 0xb4c4fd79 => java/io/StringWriter
	i32 3214744068, ; 145: 0xbf9d1a04 => android/view/WindowManager
	i32 3284821309, ; 146: 0xc3ca653d => android/view/KeyCharacterMap
	i32 3300906352, ; 147: 0xc4bfd570 => javax/net/ssl/SSLSession
	i32 3308113222, ; 148: 0xc52dcd46 => crc6472dcb918d50f9b12/LoginActivity
	i32 3319735188, ; 149: 0xc5df2394 => java/net/Proxy
	i32 3409419575, ; 150: 0xcb379d37 => javax/net/ssl/HttpsURLConnection
	i32 3423467887, ; 151: 0xcc0df96f => java/lang/Number
	i32 3515974447, ; 152: 0xd191832f => java/util/function/IntConsumer
	i32 3519931621, ; 153: 0xd1cde4e5 => java/net/URLConnection
	i32 3549151004, ; 154: 0xd38bbf1c => android/provider/Settings
	i32 3576242387, ; 155: 0xd52920d3 => android/runtime/JavaProxyThrowable
	i32 3630284820, ; 156: 0xd861c014 => android/media/MediaPlayer
	i32 3666243682, ; 157: 0xda867062 => java/lang/String
	i32 3669061717, ; 158: 0xdab17055 => java/net/InetSocketAddress
	i32 3683323802, ; 159: 0xdb8b0f9a => mono/android/runtime/JavaObject
	i32 3702230909, ; 160: 0xdcab8f7d => java/lang/Double
	i32 3715861037, ; 161: 0xdd7b8a2d => android/os/Build$VERSION
	i32 3722843854, ; 162: 0xdde616ce => javax/net/SocketFactory
	i32 3726680736, ; 163: 0xde20a2a0 => java/net/ProtocolException
	i32 3759929762, ; 164: 0xe01bf9a2 => android/graphics/Bitmap
	i32 3763853270, ; 165: 0xe057d7d6 => android/view/Window
	i32 3823421666, ; 166: 0xe3e4c8e2 => android/net/Uri
	i32 3882570516, ; 167: 0xe76b5314 => java/lang/Class
	i32 3900581163, ; 168: 0xe87e252b => java/io/InputStream
	i32 3912451735, ; 169: 0xe9334697 => java/security/KeyStore
	i32 3931120197, ; 170: 0xea502245 => mono/android/content/DialogInterface_OnClickListenerImplementor
	i32 3933245259, ; 171: 0xea708f4b => android/graphics/Rect
	i32 3960999444, ; 172: 0xec180e14 => android/widget/Toast
	i32 3969984744, ; 173: 0xeca128e8 => mono/android/runtime/InputStreamAdapter
	i32 3975001277, ; 174: 0xecedb4bd => javax/net/ssl/SSLSocketFactory
	i32 3993327007, ; 175: 0xee05559f => android/content/ContextWrapper
	i32 3995406185, ; 176: 0xee250f69 => android/graphics/Canvas
	i32 4020308495, ; 177: 0xefa10a0f => java/lang/Error
	i32 4030673356, ; 178: 0xf03f31cc => android/app/Dialog
	i32 4051772911, ; 179: 0xf18125ef => android/content/Context
	i32 4085114189, ; 180: 0xf37de54d => android/view/SurfaceView
	i32 4092334250, ; 181: 0xf3ec10aa => crc64f0e061189adeef62/Compass_SensorListener
	i32 4098107575, ; 182: 0xf44428b7 => mono/android/view/View_OnClickListenerImplementor
	i32 4101363546, ; 183: 0xf475d75a => java/io/Writer
	i32 4117799665, ; 184: 0xf570a2f1 => android/view/SurfaceHolder$Callback
	i32 4118878202, ; 185: 0xf58117fa => android/os/Looper
	i32 4148593869, ; 186: 0xf74684cd => javax/net/ssl/TrustManagerFactory
	i32 4157808693, ; 187: 0xf7d32035 => java/io/IOException
	i32 4175389061, ; 188: 0xf8df6185 => android/content/ContentUris
	i32 4181143849, ; 189: 0xf9373129 => crc64493ac3851fab1842/MonoGameAndroidGameView
	i32 4232707919, ; 190: 0xfc49ff4f => java/util/HashSet
	i32 4246685161, ; 191: 0xfd1f45e9 => android/hardware/SensorEventListener
	i32 4260664886, ; 192: 0xfdf49636 => android/hardware/SensorEvent
	i32 4277523103 ; 193: 0xfef5d29f => java/io/Closeable
], align 4

@module0_managed_to_java = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554434, ; uint32_t type_token_id (0x2000002)
		i32 103; uint32_t java_map_index (0x67)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554436, ; uint32_t type_token_id (0x2000004)
		i32 148; uint32_t java_map_index (0x94)
	} ; 1
], align 4

@module1_managed_to_java = internal dso_local constant [6 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554608, ; uint32_t type_token_id (0x20000b0)
		i32 18; uint32_t java_map_index (0x12)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554613, ; uint32_t type_token_id (0x20000b5)
		i32 189; uint32_t java_map_index (0xbd)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554614, ; uint32_t type_token_id (0x20000b6)
		i32 61; uint32_t java_map_index (0x3d)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554616, ; uint32_t type_token_id (0x20000b8)
		i32 83; uint32_t java_map_index (0x53)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33555141, ; uint32_t type_token_id (0x20002c5)
		i32 143; uint32_t java_map_index (0x8f)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33555142, ; uint32_t type_token_id (0x20002c6)
		i32 181; uint32_t java_map_index (0xb5)
	} ; 5
], align 4

@module2_managed_to_java = internal dso_local constant [186 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554534, ; uint32_t type_token_id (0x2000066)
		i32 53; uint32_t java_map_index (0x35)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554536, ; uint32_t type_token_id (0x2000068)
		i32 10; uint32_t java_map_index (0xa)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554538, ; uint32_t type_token_id (0x200006a)
		i32 71; uint32_t java_map_index (0x47)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554539, ; uint32_t type_token_id (0x200006b)
		i32 162; uint32_t java_map_index (0xa2)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554541, ; uint32_t type_token_id (0x200006d)
		i32 150; uint32_t java_map_index (0x96)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554543, ; uint32_t type_token_id (0x200006f)
		i32 124; uint32_t java_map_index (0x7c)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554545, ; uint32_t type_token_id (0x2000071)
		i32 63; uint32_t java_map_index (0x3f)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554547, ; uint32_t type_token_id (0x2000073)
		i32 147; uint32_t java_map_index (0x93)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554549, ; uint32_t type_token_id (0x2000075)
		i32 5; uint32_t java_map_index (0x5)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554551, ; uint32_t type_token_id (0x2000077)
		i32 33; uint32_t java_map_index (0x21)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554553, ; uint32_t type_token_id (0x2000079)
		i32 48; uint32_t java_map_index (0x30)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554554, ; uint32_t type_token_id (0x200007a)
		i32 57; uint32_t java_map_index (0x39)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554555, ; uint32_t type_token_id (0x200007b)
		i32 174; uint32_t java_map_index (0xae)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554557, ; uint32_t type_token_id (0x200007d)
		i32 186; uint32_t java_map_index (0xba)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554558, ; uint32_t type_token_id (0x200007e)
		i32 95; uint32_t java_map_index (0x5f)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554560, ; uint32_t type_token_id (0x2000080)
		i32 132; uint32_t java_map_index (0x84)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554562, ; uint32_t type_token_id (0x2000082)
		i32 129; uint32_t java_map_index (0x81)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554564, ; uint32_t type_token_id (0x2000084)
		i32 113; uint32_t java_map_index (0x71)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554566, ; uint32_t type_token_id (0x2000086)
		i32 133; uint32_t java_map_index (0x85)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554568, ; uint32_t type_token_id (0x2000088)
		i32 108; uint32_t java_map_index (0x6c)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554571, ; uint32_t type_token_id (0x200008b)
		i32 74; uint32_t java_map_index (0x4a)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554572, ; uint32_t type_token_id (0x200008c)
		i32 40; uint32_t java_map_index (0x28)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554573, ; uint32_t type_token_id (0x200008d)
		i32 126; uint32_t java_map_index (0x7e)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554574, ; uint32_t type_token_id (0x200008e)
		i32 172; uint32_t java_map_index (0xac)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554576, ; uint32_t type_token_id (0x2000090)
		i32 116; uint32_t java_map_index (0x74)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554577, ; uint32_t type_token_id (0x2000091)
		i32 4; uint32_t java_map_index (0x4)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554578, ; uint32_t type_token_id (0x2000092)
		i32 138; uint32_t java_map_index (0x8a)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554580, ; uint32_t type_token_id (0x2000094)
		i32 127; uint32_t java_map_index (0x7f)
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 33554582, ; uint32_t type_token_id (0x2000096)
		i32 9; uint32_t java_map_index (0x9)
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 33554583, ; uint32_t type_token_id (0x2000097)
		i32 76; uint32_t java_map_index (0x4c)
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 33554584, ; uint32_t type_token_id (0x2000098)
		i32 75; uint32_t java_map_index (0x4b)
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 33554585, ; uint32_t type_token_id (0x2000099)
		i32 29; uint32_t java_map_index (0x1d)
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 33554586, ; uint32_t type_token_id (0x200009a)
		i32 34; uint32_t java_map_index (0x22)
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 33554587, ; uint32_t type_token_id (0x200009b)
		i32 154; uint32_t java_map_index (0x9a)
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 33554588, ; uint32_t type_token_id (0x200009c)
		i32 50; uint32_t java_map_index (0x32)
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 33554589, ; uint32_t type_token_id (0x200009d)
		i32 16; uint32_t java_map_index (0x10)
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 33554590, ; uint32_t type_token_id (0x200009e)
		i32 52; uint32_t java_map_index (0x34)
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 33554591, ; uint32_t type_token_id (0x200009f)
		i32 91; uint32_t java_map_index (0x5b)
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 33554592, ; uint32_t type_token_id (0x20000a0)
		i32 130; uint32_t java_map_index (0x82)
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 33554593, ; uint32_t type_token_id (0x20000a1)
		i32 161; uint32_t java_map_index (0xa1)
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 33554594, ; uint32_t type_token_id (0x20000a2)
		i32 21; uint32_t java_map_index (0x15)
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 33554595, ; uint32_t type_token_id (0x20000a3)
		i32 81; uint32_t java_map_index (0x51)
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 33554596, ; uint32_t type_token_id (0x20000a4)
		i32 185; uint32_t java_map_index (0xb9)
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 33554597, ; uint32_t type_token_id (0x20000a5)
		i32 54; uint32_t java_map_index (0x36)
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 33554600, ; uint32_t type_token_id (0x20000a8)
		i32 166; uint32_t java_map_index (0xa6)
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 33554602, ; uint32_t type_token_id (0x20000aa)
		i32 119; uint32_t java_map_index (0x77)
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 33554603, ; uint32_t type_token_id (0x20000ab)
		i32 156; uint32_t java_map_index (0x9c)
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 33554604, ; uint32_t type_token_id (0x20000ac)
		i32 60; uint32_t java_map_index (0x3c)
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 33554606, ; uint32_t type_token_id (0x20000ae)
		i32 123; uint32_t java_map_index (0x7b)
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 33554613, ; uint32_t type_token_id (0x20000b5)
		i32 191; uint32_t java_map_index (0xbf)
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 33554615, ; uint32_t type_token_id (0x20000b7)
		i32 47; uint32_t java_map_index (0x2f)
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 33554616, ; uint32_t type_token_id (0x20000b8)
		i32 192; uint32_t java_map_index (0xc0)
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 33554617, ; uint32_t type_token_id (0x20000b9)
		i32 49; uint32_t java_map_index (0x31)
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 33554622, ; uint32_t type_token_id (0x20000be)
		i32 104; uint32_t java_map_index (0x68)
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 33554623, ; uint32_t type_token_id (0x20000bf)
		i32 45; uint32_t java_map_index (0x2d)
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 33554625, ; uint32_t type_token_id (0x20000c1)
		i32 43; uint32_t java_map_index (0x2b)
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 33554627, ; uint32_t type_token_id (0x20000c3)
		i32 37; uint32_t java_map_index (0x25)
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 33554631, ; uint32_t type_token_id (0x20000c7)
		i32 98; uint32_t java_map_index (0x62)
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 33554632, ; uint32_t type_token_id (0x20000c8)
		i32 79; uint32_t java_map_index (0x4f)
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 33554633, ; uint32_t type_token_id (0x20000c9)
		i32 105; uint32_t java_map_index (0x69)
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 33554634, ; uint32_t type_token_id (0x20000ca)
		i32 111; uint32_t java_map_index (0x6f)
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 33554635, ; uint32_t type_token_id (0x20000cb)
		i32 178; uint32_t java_map_index (0xb2)
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 33554639, ; uint32_t type_token_id (0x20000cf)
		i32 78; uint32_t java_map_index (0x4e)
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 33554643, ; uint32_t type_token_id (0x20000d3)
		i32 101; uint32_t java_map_index (0x65)
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 33554644, ; uint32_t type_token_id (0x20000d4)
		i32 80; uint32_t java_map_index (0x50)
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 33554645, ; uint32_t type_token_id (0x20000d5)
		i32 136; uint32_t java_map_index (0x88)
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 33554646, ; uint32_t type_token_id (0x20000d6)
		i32 137; uint32_t java_map_index (0x89)
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 33554648, ; uint32_t type_token_id (0x20000d8)
		i32 184; uint32_t java_map_index (0xb8)
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 33554650, ; uint32_t type_token_id (0x20000da)
		i32 134; uint32_t java_map_index (0x86)
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 33554652, ; uint32_t type_token_id (0x20000dc)
		i32 68; uint32_t java_map_index (0x44)
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 33554654, ; uint32_t type_token_id (0x20000de)
		i32 145; uint32_t java_map_index (0x91)
	}, ; 70
	%struct.TypeMapModuleEntry {
		i32 33554656, ; uint32_t type_token_id (0x20000e0)
		i32 146; uint32_t java_map_index (0x92)
	}, ; 71
	%struct.TypeMapModuleEntry {
		i32 33554657, ; uint32_t type_token_id (0x20000e1)
		i32 6; uint32_t java_map_index (0x6)
	}, ; 72
	%struct.TypeMapModuleEntry {
		i32 33554658, ; uint32_t type_token_id (0x20000e2)
		i32 125; uint32_t java_map_index (0x7d)
	}, ; 73
	%struct.TypeMapModuleEntry {
		i32 33554659, ; uint32_t type_token_id (0x20000e3)
		i32 8; uint32_t java_map_index (0x8)
	}, ; 74
	%struct.TypeMapModuleEntry {
		i32 33554661, ; uint32_t type_token_id (0x20000e5)
		i32 142; uint32_t java_map_index (0x8e)
	}, ; 75
	%struct.TypeMapModuleEntry {
		i32 33554662, ; uint32_t type_token_id (0x20000e6)
		i32 180; uint32_t java_map_index (0xb4)
	}, ; 76
	%struct.TypeMapModuleEntry {
		i32 33554663, ; uint32_t type_token_id (0x20000e7)
		i32 84; uint32_t java_map_index (0x54)
	}, ; 77
	%struct.TypeMapModuleEntry {
		i32 33554664, ; uint32_t type_token_id (0x20000e8)
		i32 93; uint32_t java_map_index (0x5d)
	}, ; 78
	%struct.TypeMapModuleEntry {
		i32 33554666, ; uint32_t type_token_id (0x20000ea)
		i32 182; uint32_t java_map_index (0xb6)
	}, ; 79
	%struct.TypeMapModuleEntry {
		i32 33554667, ; uint32_t type_token_id (0x20000eb)
		i32 87; uint32_t java_map_index (0x57)
	}, ; 80
	%struct.TypeMapModuleEntry {
		i32 33554672, ; uint32_t type_token_id (0x20000f0)
		i32 3; uint32_t java_map_index (0x3)
	}, ; 81
	%struct.TypeMapModuleEntry {
		i32 33554673, ; uint32_t type_token_id (0x20000f1)
		i32 11; uint32_t java_map_index (0xb)
	}, ; 82
	%struct.TypeMapModuleEntry {
		i32 33554675, ; uint32_t type_token_id (0x20000f3)
		i32 165; uint32_t java_map_index (0xa5)
	}, ; 83
	%struct.TypeMapModuleEntry {
		i32 33554677, ; uint32_t type_token_id (0x20000f5)
		i32 41; uint32_t java_map_index (0x29)
	}, ; 84
	%struct.TypeMapModuleEntry {
		i32 33554706, ; uint32_t type_token_id (0x2000112)
		i32 173; uint32_t java_map_index (0xad)
	}, ; 85
	%struct.TypeMapModuleEntry {
		i32 33554708, ; uint32_t type_token_id (0x2000114)
		i32 140; uint32_t java_map_index (0x8c)
	}, ; 86
	%struct.TypeMapModuleEntry {
		i32 33554710, ; uint32_t type_token_id (0x2000116)
		i32 58; uint32_t java_map_index (0x3a)
	}, ; 87
	%struct.TypeMapModuleEntry {
		i32 33554712, ; uint32_t type_token_id (0x2000118)
		i32 70; uint32_t java_map_index (0x46)
	}, ; 88
	%struct.TypeMapModuleEntry {
		i32 33554721, ; uint32_t type_token_id (0x2000121)
		i32 23; uint32_t java_map_index (0x17)
	}, ; 89
	%struct.TypeMapModuleEntry {
		i32 33554723, ; uint32_t type_token_id (0x2000123)
		i32 159; uint32_t java_map_index (0x9f)
	}, ; 90
	%struct.TypeMapModuleEntry {
		i32 33554724, ; uint32_t type_token_id (0x2000124)
		i32 155; uint32_t java_map_index (0x9b)
	}, ; 91
	%struct.TypeMapModuleEntry {
		i32 33554725, ; uint32_t type_token_id (0x2000125)
		i32 190; uint32_t java_map_index (0xbe)
	}, ; 92
	%struct.TypeMapModuleEntry {
		i32 33554737, ; uint32_t type_token_id (0x2000131)
		i32 17; uint32_t java_map_index (0x11)
	}, ; 93
	%struct.TypeMapModuleEntry {
		i32 33554745, ; uint32_t type_token_id (0x2000139)
		i32 164; uint32_t java_map_index (0xa4)
	}, ; 94
	%struct.TypeMapModuleEntry {
		i32 33554746, ; uint32_t type_token_id (0x200013a)
		i32 32; uint32_t java_map_index (0x20)
	}, ; 95
	%struct.TypeMapModuleEntry {
		i32 33554747, ; uint32_t type_token_id (0x200013b)
		i32 38; uint32_t java_map_index (0x26)
	}, ; 96
	%struct.TypeMapModuleEntry {
		i32 33554748, ; uint32_t type_token_id (0x200013c)
		i32 65; uint32_t java_map_index (0x41)
	}, ; 97
	%struct.TypeMapModuleEntry {
		i32 33554749, ; uint32_t type_token_id (0x200013d)
		i32 176; uint32_t java_map_index (0xb0)
	}, ; 98
	%struct.TypeMapModuleEntry {
		i32 33554750, ; uint32_t type_token_id (0x200013e)
		i32 59; uint32_t java_map_index (0x3b)
	}, ; 99
	%struct.TypeMapModuleEntry {
		i32 33554751, ; uint32_t type_token_id (0x200013f)
		i32 92; uint32_t java_map_index (0x5c)
	}, ; 100
	%struct.TypeMapModuleEntry {
		i32 33554752, ; uint32_t type_token_id (0x2000140)
		i32 171; uint32_t java_map_index (0xab)
	}, ; 101
	%struct.TypeMapModuleEntry {
		i32 33554754, ; uint32_t type_token_id (0x2000142)
		i32 97; uint32_t java_map_index (0x61)
	}, ; 102
	%struct.TypeMapModuleEntry {
		i32 33554756, ; uint32_t type_token_id (0x2000144)
		i32 35; uint32_t java_map_index (0x23)
	}, ; 103
	%struct.TypeMapModuleEntry {
		i32 33554758, ; uint32_t type_token_id (0x2000146)
		i32 188; uint32_t java_map_index (0xbc)
	}, ; 104
	%struct.TypeMapModuleEntry {
		i32 33554759, ; uint32_t type_token_id (0x2000147)
		i32 179; uint32_t java_map_index (0xb3)
	}, ; 105
	%struct.TypeMapModuleEntry {
		i32 33554761, ; uint32_t type_token_id (0x2000149)
		i32 175; uint32_t java_map_index (0xaf)
	}, ; 106
	%struct.TypeMapModuleEntry {
		i32 33554762, ; uint32_t type_token_id (0x200014a)
		i32 120; uint32_t java_map_index (0x78)
	}, ; 107
	%struct.TypeMapModuleEntry {
		i32 33554764, ; uint32_t type_token_id (0x200014c)
		i32 69; uint32_t java_map_index (0x45)
	}, ; 108
	%struct.TypeMapModuleEntry {
		i32 33554765, ; uint32_t type_token_id (0x200014d)
		i32 135; uint32_t java_map_index (0x87)
	}, ; 109
	%struct.TypeMapModuleEntry {
		i32 33554768, ; uint32_t type_token_id (0x2000150)
		i32 170; uint32_t java_map_index (0xaa)
	}, ; 110
	%struct.TypeMapModuleEntry {
		i32 33554769, ; uint32_t type_token_id (0x2000151)
		i32 102; uint32_t java_map_index (0x66)
	}, ; 111
	%struct.TypeMapModuleEntry {
		i32 33554771, ; uint32_t type_token_id (0x2000153)
		i32 100; uint32_t java_map_index (0x64)
	}, ; 112
	%struct.TypeMapModuleEntry {
		i32 33554772, ; uint32_t type_token_id (0x2000154)
		i32 112; uint32_t java_map_index (0x70)
	}, ; 113
	%struct.TypeMapModuleEntry {
		i32 33554773, ; uint32_t type_token_id (0x2000155)
		i32 24; uint32_t java_map_index (0x18)
	}, ; 114
	%struct.TypeMapModuleEntry {
		i32 33554774, ; uint32_t type_token_id (0x2000156)
		i32 31; uint32_t java_map_index (0x1f)
	}, ; 115
	%struct.TypeMapModuleEntry {
		i32 33554775, ; uint32_t type_token_id (0x2000157)
		i32 107; uint32_t java_map_index (0x6b)
	}, ; 116
	%struct.TypeMapModuleEntry {
		i32 33554776, ; uint32_t type_token_id (0x2000158)
		i32 44; uint32_t java_map_index (0x2c)
	}, ; 117
	%struct.TypeMapModuleEntry {
		i32 33554778, ; uint32_t type_token_id (0x200015a)
		i32 121; uint32_t java_map_index (0x79)
	}, ; 118
	%struct.TypeMapModuleEntry {
		i32 33554779, ; uint32_t type_token_id (0x200015b)
		i32 64; uint32_t java_map_index (0x40)
	}, ; 119
	%struct.TypeMapModuleEntry {
		i32 33554780, ; uint32_t type_token_id (0x200015c)
		i32 2; uint32_t java_map_index (0x2)
	}, ; 120
	%struct.TypeMapModuleEntry {
		i32 33554785, ; uint32_t type_token_id (0x2000161)
		i32 51; uint32_t java_map_index (0x33)
	}, ; 121
	%struct.TypeMapModuleEntry {
		i32 33554787, ; uint32_t type_token_id (0x2000163)
		i32 14; uint32_t java_map_index (0xe)
	}, ; 122
	%struct.TypeMapModuleEntry {
		i32 33554789, ; uint32_t type_token_id (0x2000165)
		i32 90; uint32_t java_map_index (0x5a)
	}, ; 123
	%struct.TypeMapModuleEntry {
		i32 33554790, ; uint32_t type_token_id (0x2000166)
		i32 46; uint32_t java_map_index (0x2e)
	}, ; 124
	%struct.TypeMapModuleEntry {
		i32 33554792, ; uint32_t type_token_id (0x2000168)
		i32 152; uint32_t java_map_index (0x98)
	}, ; 125
	%struct.TypeMapModuleEntry {
		i32 33554794, ; uint32_t type_token_id (0x200016a)
		i32 73; uint32_t java_map_index (0x49)
	}, ; 126
	%struct.TypeMapModuleEntry {
		i32 33554796, ; uint32_t type_token_id (0x200016c)
		i32 82; uint32_t java_map_index (0x52)
	}, ; 127
	%struct.TypeMapModuleEntry {
		i32 33554798, ; uint32_t type_token_id (0x200016e)
		i32 169; uint32_t java_map_index (0xa9)
	}, ; 128
	%struct.TypeMapModuleEntry {
		i32 33554799, ; uint32_t type_token_id (0x200016f)
		i32 106; uint32_t java_map_index (0x6a)
	}, ; 129
	%struct.TypeMapModuleEntry {
		i32 33554800, ; uint32_t type_token_id (0x2000170)
		i32 1; uint32_t java_map_index (0x1)
	}, ; 130
	%struct.TypeMapModuleEntry {
		i32 33554802, ; uint32_t type_token_id (0x2000172)
		i32 19; uint32_t java_map_index (0x13)
	}, ; 131
	%struct.TypeMapModuleEntry {
		i32 33554804, ; uint32_t type_token_id (0x2000174)
		i32 72; uint32_t java_map_index (0x48)
	}, ; 132
	%struct.TypeMapModuleEntry {
		i32 33554806, ; uint32_t type_token_id (0x2000176)
		i32 15; uint32_t java_map_index (0xf)
	}, ; 133
	%struct.TypeMapModuleEntry {
		i32 33554807, ; uint32_t type_token_id (0x2000177)
		i32 67; uint32_t java_map_index (0x43)
	}, ; 134
	%struct.TypeMapModuleEntry {
		i32 33554809, ; uint32_t type_token_id (0x2000179)
		i32 158; uint32_t java_map_index (0x9e)
	}, ; 135
	%struct.TypeMapModuleEntry {
		i32 33554810, ; uint32_t type_token_id (0x200017a)
		i32 163; uint32_t java_map_index (0xa3)
	}, ; 136
	%struct.TypeMapModuleEntry {
		i32 33554811, ; uint32_t type_token_id (0x200017b)
		i32 149; uint32_t java_map_index (0x95)
	}, ; 137
	%struct.TypeMapModuleEntry {
		i32 33554812, ; uint32_t type_token_id (0x200017c)
		i32 110; uint32_t java_map_index (0x6e)
	}, ; 138
	%struct.TypeMapModuleEntry {
		i32 33554813, ; uint32_t type_token_id (0x200017d)
		i32 42; uint32_t java_map_index (0x2a)
	}, ; 139
	%struct.TypeMapModuleEntry {
		i32 33554815, ; uint32_t type_token_id (0x200017f)
		i32 117; uint32_t java_map_index (0x75)
	}, ; 140
	%struct.TypeMapModuleEntry {
		i32 33554816, ; uint32_t type_token_id (0x2000180)
		i32 55; uint32_t java_map_index (0x37)
	}, ; 141
	%struct.TypeMapModuleEntry {
		i32 33554817, ; uint32_t type_token_id (0x2000181)
		i32 109; uint32_t java_map_index (0x6d)
	}, ; 142
	%struct.TypeMapModuleEntry {
		i32 33554818, ; uint32_t type_token_id (0x2000182)
		i32 22; uint32_t java_map_index (0x16)
	}, ; 143
	%struct.TypeMapModuleEntry {
		i32 33554819, ; uint32_t type_token_id (0x2000183)
		i32 153; uint32_t java_map_index (0x99)
	}, ; 144
	%struct.TypeMapModuleEntry {
		i32 33554822, ; uint32_t type_token_id (0x2000186)
		i32 77; uint32_t java_map_index (0x4d)
	}, ; 145
	%struct.TypeMapModuleEntry {
		i32 33554823, ; uint32_t type_token_id (0x2000187)
		i32 39; uint32_t java_map_index (0x27)
	}, ; 146
	%struct.TypeMapModuleEntry {
		i32 33554824, ; uint32_t type_token_id (0x2000188)
		i32 118; uint32_t java_map_index (0x76)
	}, ; 147
	%struct.TypeMapModuleEntry {
		i32 33554825, ; uint32_t type_token_id (0x2000189)
		i32 193; uint32_t java_map_index (0xc1)
	}, ; 148
	%struct.TypeMapModuleEntry {
		i32 33554827, ; uint32_t type_token_id (0x200018b)
		i32 168; uint32_t java_map_index (0xa8)
	}, ; 149
	%struct.TypeMapModuleEntry {
		i32 33554829, ; uint32_t type_token_id (0x200018d)
		i32 122; uint32_t java_map_index (0x7a)
	}, ; 150
	%struct.TypeMapModuleEntry {
		i32 33554830, ; uint32_t type_token_id (0x200018e)
		i32 187; uint32_t java_map_index (0xbb)
	}, ; 151
	%struct.TypeMapModuleEntry {
		i32 33554831, ; uint32_t type_token_id (0x200018f)
		i32 96; uint32_t java_map_index (0x60)
	}, ; 152
	%struct.TypeMapModuleEntry {
		i32 33554833, ; uint32_t type_token_id (0x2000191)
		i32 26; uint32_t java_map_index (0x1a)
	}, ; 153
	%struct.TypeMapModuleEntry {
		i32 33554834, ; uint32_t type_token_id (0x2000192)
		i32 144; uint32_t java_map_index (0x90)
	}, ; 154
	%struct.TypeMapModuleEntry {
		i32 33554835, ; uint32_t type_token_id (0x2000193)
		i32 183; uint32_t java_map_index (0xb7)
	}, ; 155
	%struct.TypeMapModuleEntry {
		i32 33554837, ; uint32_t type_token_id (0x2000195)
		i32 99; uint32_t java_map_index (0x63)
	}, ; 156
	%struct.TypeMapModuleEntry {
		i32 33554838, ; uint32_t type_token_id (0x2000196)
		i32 88; uint32_t java_map_index (0x58)
	}, ; 157
	%struct.TypeMapModuleEntry {
		i32 33554839, ; uint32_t type_token_id (0x2000197)
		i32 89; uint32_t java_map_index (0x59)
	}, ; 158
	%struct.TypeMapModuleEntry {
		i32 33554840, ; uint32_t type_token_id (0x2000198)
		i32 167; uint32_t java_map_index (0xa7)
	}, ; 159
	%struct.TypeMapModuleEntry {
		i32 33554841, ; uint32_t type_token_id (0x2000199)
		i32 62; uint32_t java_map_index (0x3e)
	}, ; 160
	%struct.TypeMapModuleEntry {
		i32 33554842, ; uint32_t type_token_id (0x200019a)
		i32 160; uint32_t java_map_index (0xa0)
	}, ; 161
	%struct.TypeMapModuleEntry {
		i32 33554843, ; uint32_t type_token_id (0x200019b)
		i32 114; uint32_t java_map_index (0x72)
	}, ; 162
	%struct.TypeMapModuleEntry {
		i32 33554845, ; uint32_t type_token_id (0x200019d)
		i32 177; uint32_t java_map_index (0xb1)
	}, ; 163
	%struct.TypeMapModuleEntry {
		i32 33554846, ; uint32_t type_token_id (0x200019e)
		i32 139; uint32_t java_map_index (0x8b)
	}, ; 164
	%struct.TypeMapModuleEntry {
		i32 33554847, ; uint32_t type_token_id (0x200019f)
		i32 128; uint32_t java_map_index (0x80)
	}, ; 165
	%struct.TypeMapModuleEntry {
		i32 33554848, ; uint32_t type_token_id (0x20001a0)
		i32 25; uint32_t java_map_index (0x19)
	}, ; 166
	%struct.TypeMapModuleEntry {
		i32 33554851, ; uint32_t type_token_id (0x20001a3)
		i32 7; uint32_t java_map_index (0x7)
	}, ; 167
	%struct.TypeMapModuleEntry {
		i32 33554852, ; uint32_t type_token_id (0x20001a4)
		i32 20; uint32_t java_map_index (0x14)
	}, ; 168
	%struct.TypeMapModuleEntry {
		i32 33554853, ; uint32_t type_token_id (0x20001a5)
		i32 86; uint32_t java_map_index (0x56)
	}, ; 169
	%struct.TypeMapModuleEntry {
		i32 33554854, ; uint32_t type_token_id (0x20001a6)
		i32 27; uint32_t java_map_index (0x1b)
	}, ; 170
	%struct.TypeMapModuleEntry {
		i32 33554855, ; uint32_t type_token_id (0x20001a7)
		i32 94; uint32_t java_map_index (0x5e)
	}, ; 171
	%struct.TypeMapModuleEntry {
		i32 33554857, ; uint32_t type_token_id (0x20001a9)
		i32 13; uint32_t java_map_index (0xd)
	}, ; 172
	%struct.TypeMapModuleEntry {
		i32 33554858, ; uint32_t type_token_id (0x20001aa)
		i32 30; uint32_t java_map_index (0x1e)
	}, ; 173
	%struct.TypeMapModuleEntry {
		i32 33554859, ; uint32_t type_token_id (0x20001ab)
		i32 151; uint32_t java_map_index (0x97)
	}, ; 174
	%struct.TypeMapModuleEntry {
		i32 33554861, ; uint32_t type_token_id (0x20001ad)
		i32 0; uint32_t java_map_index (0x0)
	}, ; 175
	%struct.TypeMapModuleEntry {
		i32 33554862, ; uint32_t type_token_id (0x20001ae)
		i32 85; uint32_t java_map_index (0x55)
	}, ; 176
	%struct.TypeMapModuleEntry {
		i32 33554863, ; uint32_t type_token_id (0x20001af)
		i32 66; uint32_t java_map_index (0x42)
	}, ; 177
	%struct.TypeMapModuleEntry {
		i32 33554864, ; uint32_t type_token_id (0x20001b0)
		i32 36; uint32_t java_map_index (0x24)
	}, ; 178
	%struct.TypeMapModuleEntry {
		i32 33554865, ; uint32_t type_token_id (0x20001b1)
		i32 131; uint32_t java_map_index (0x83)
	}, ; 179
	%struct.TypeMapModuleEntry {
		i32 33554866, ; uint32_t type_token_id (0x20001b2)
		i32 157; uint32_t java_map_index (0x9d)
	}, ; 180
	%struct.TypeMapModuleEntry {
		i32 33554868, ; uint32_t type_token_id (0x20001b4)
		i32 28; uint32_t java_map_index (0x1c)
	}, ; 181
	%struct.TypeMapModuleEntry {
		i32 33554869, ; uint32_t type_token_id (0x20001b5)
		i32 12; uint32_t java_map_index (0xc)
	}, ; 182
	%struct.TypeMapModuleEntry {
		i32 33554870, ; uint32_t type_token_id (0x20001b6)
		i32 56; uint32_t java_map_index (0x38)
	}, ; 183
	%struct.TypeMapModuleEntry {
		i32 33554871, ; uint32_t type_token_id (0x20001b7)
		i32 115; uint32_t java_map_index (0x73)
	}, ; 184
	%struct.TypeMapModuleEntry {
		i32 33554886, ; uint32_t type_token_id (0x20001c6)
		i32 141; uint32_t java_map_index (0x8d)
	} ; 185
], align 4

@module2_managed_to_java_duplicates = internal dso_local constant [67 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554535, ; uint32_t type_token_id (0x2000067)
		i32 53; uint32_t java_map_index (0x35)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554537, ; uint32_t type_token_id (0x2000069)
		i32 10; uint32_t java_map_index (0xa)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554540, ; uint32_t type_token_id (0x200006c)
		i32 162; uint32_t java_map_index (0xa2)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554542, ; uint32_t type_token_id (0x200006e)
		i32 150; uint32_t java_map_index (0x96)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554544, ; uint32_t type_token_id (0x2000070)
		i32 124; uint32_t java_map_index (0x7c)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554546, ; uint32_t type_token_id (0x2000072)
		i32 63; uint32_t java_map_index (0x3f)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554548, ; uint32_t type_token_id (0x2000074)
		i32 147; uint32_t java_map_index (0x93)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554550, ; uint32_t type_token_id (0x2000076)
		i32 5; uint32_t java_map_index (0x5)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554552, ; uint32_t type_token_id (0x2000078)
		i32 33; uint32_t java_map_index (0x21)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554556, ; uint32_t type_token_id (0x200007c)
		i32 174; uint32_t java_map_index (0xae)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554559, ; uint32_t type_token_id (0x200007f)
		i32 95; uint32_t java_map_index (0x5f)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554561, ; uint32_t type_token_id (0x2000081)
		i32 132; uint32_t java_map_index (0x84)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554563, ; uint32_t type_token_id (0x2000083)
		i32 129; uint32_t java_map_index (0x81)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554565, ; uint32_t type_token_id (0x2000085)
		i32 113; uint32_t java_map_index (0x71)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554567, ; uint32_t type_token_id (0x2000087)
		i32 133; uint32_t java_map_index (0x85)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554569, ; uint32_t type_token_id (0x2000089)
		i32 108; uint32_t java_map_index (0x6c)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554570, ; uint32_t type_token_id (0x200008a)
		i32 108; uint32_t java_map_index (0x6c)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554579, ; uint32_t type_token_id (0x2000093)
		i32 138; uint32_t java_map_index (0x8a)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554598, ; uint32_t type_token_id (0x20000a6)
		i32 54; uint32_t java_map_index (0x36)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554601, ; uint32_t type_token_id (0x20000a9)
		i32 166; uint32_t java_map_index (0xa6)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554605, ; uint32_t type_token_id (0x20000ad)
		i32 60; uint32_t java_map_index (0x3c)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554614, ; uint32_t type_token_id (0x20000b6)
		i32 191; uint32_t java_map_index (0xbf)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554618, ; uint32_t type_token_id (0x20000ba)
		i32 49; uint32_t java_map_index (0x31)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554624, ; uint32_t type_token_id (0x20000c0)
		i32 45; uint32_t java_map_index (0x2d)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554626, ; uint32_t type_token_id (0x20000c2)
		i32 43; uint32_t java_map_index (0x2b)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554628, ; uint32_t type_token_id (0x20000c4)
		i32 37; uint32_t java_map_index (0x25)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554647, ; uint32_t type_token_id (0x20000d7)
		i32 137; uint32_t java_map_index (0x89)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554649, ; uint32_t type_token_id (0x20000d9)
		i32 184; uint32_t java_map_index (0xb8)
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 33554651, ; uint32_t type_token_id (0x20000db)
		i32 134; uint32_t java_map_index (0x86)
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 33554653, ; uint32_t type_token_id (0x20000dd)
		i32 68; uint32_t java_map_index (0x44)
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 33554655, ; uint32_t type_token_id (0x20000df)
		i32 145; uint32_t java_map_index (0x91)
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 33554660, ; uint32_t type_token_id (0x20000e4)
		i32 8; uint32_t java_map_index (0x8)
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 33554665, ; uint32_t type_token_id (0x20000e9)
		i32 93; uint32_t java_map_index (0x5d)
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 33554668, ; uint32_t type_token_id (0x20000ec)
		i32 87; uint32_t java_map_index (0x57)
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 33554674, ; uint32_t type_token_id (0x20000f2)
		i32 3; uint32_t java_map_index (0x3)
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 33554676, ; uint32_t type_token_id (0x20000f4)
		i32 165; uint32_t java_map_index (0xa5)
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 33554711, ; uint32_t type_token_id (0x2000117)
		i32 58; uint32_t java_map_index (0x3a)
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 33554717, ; uint32_t type_token_id (0x200011d)
		i32 70; uint32_t java_map_index (0x46)
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 33554722, ; uint32_t type_token_id (0x2000122)
		i32 23; uint32_t java_map_index (0x17)
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 33554726, ; uint32_t type_token_id (0x2000126)
		i32 190; uint32_t java_map_index (0xbe)
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 33554755, ; uint32_t type_token_id (0x2000143)
		i32 97; uint32_t java_map_index (0x61)
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 33554757, ; uint32_t type_token_id (0x2000145)
		i32 35; uint32_t java_map_index (0x23)
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 33554760, ; uint32_t type_token_id (0x2000148)
		i32 179; uint32_t java_map_index (0xb3)
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 33554763, ; uint32_t type_token_id (0x200014b)
		i32 120; uint32_t java_map_index (0x78)
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 33554766, ; uint32_t type_token_id (0x200014e)
		i32 135; uint32_t java_map_index (0x87)
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 33554770, ; uint32_t type_token_id (0x2000152)
		i32 102; uint32_t java_map_index (0x66)
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 33554781, ; uint32_t type_token_id (0x200015d)
		i32 121; uint32_t java_map_index (0x79)
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 33554786, ; uint32_t type_token_id (0x2000162)
		i32 51; uint32_t java_map_index (0x33)
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 33554788, ; uint32_t type_token_id (0x2000164)
		i32 14; uint32_t java_map_index (0xe)
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 33554791, ; uint32_t type_token_id (0x2000167)
		i32 46; uint32_t java_map_index (0x2e)
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 33554793, ; uint32_t type_token_id (0x2000169)
		i32 152; uint32_t java_map_index (0x98)
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 33554795, ; uint32_t type_token_id (0x200016b)
		i32 73; uint32_t java_map_index (0x49)
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 33554797, ; uint32_t type_token_id (0x200016d)
		i32 82; uint32_t java_map_index (0x52)
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 33554801, ; uint32_t type_token_id (0x2000171)
		i32 1; uint32_t java_map_index (0x1)
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 33554803, ; uint32_t type_token_id (0x2000173)
		i32 19; uint32_t java_map_index (0x13)
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 33554805, ; uint32_t type_token_id (0x2000175)
		i32 72; uint32_t java_map_index (0x48)
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 33554808, ; uint32_t type_token_id (0x2000178)
		i32 67; uint32_t java_map_index (0x43)
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 33554814, ; uint32_t type_token_id (0x200017e)
		i32 42; uint32_t java_map_index (0x2a)
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 33554820, ; uint32_t type_token_id (0x2000184)
		i32 153; uint32_t java_map_index (0x99)
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 33554826, ; uint32_t type_token_id (0x200018a)
		i32 193; uint32_t java_map_index (0xc1)
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 33554828, ; uint32_t type_token_id (0x200018c)
		i32 168; uint32_t java_map_index (0xa8)
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 33554832, ; uint32_t type_token_id (0x2000190)
		i32 96; uint32_t java_map_index (0x60)
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 33554836, ; uint32_t type_token_id (0x2000194)
		i32 183; uint32_t java_map_index (0xb7)
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 33554844, ; uint32_t type_token_id (0x200019c)
		i32 114; uint32_t java_map_index (0x72)
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 33554849, ; uint32_t type_token_id (0x20001a1)
		i32 25; uint32_t java_map_index (0x19)
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 33554856, ; uint32_t type_token_id (0x20001a8)
		i32 94; uint32_t java_map_index (0x5e)
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 33554860, ; uint32_t type_token_id (0x20001ac)
		i32 151; uint32_t java_map_index (0x97)
	} ; 66
], align 4

; Java to managed map
@map_java = dso_local local_unnamed_addr constant [194 x %struct.TypeMapJava] [
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554861, ; uint32_t type_token_id (0x20001ad)
		i32 183; uint32_t java_name_index (0xb7)
	}, ; 0
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554800, ; uint32_t type_token_id (0x2000170)
		i32 138; uint32_t java_name_index (0x8a)
	}, ; 1
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554780, ; uint32_t type_token_id (0x200015c)
		i32 128; uint32_t java_name_index (0x80)
	}, ; 2
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554672, ; uint32_t type_token_id (0x20000f0)
		i32 89; uint32_t java_name_index (0x59)
	}, ; 3
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554577, ; uint32_t type_token_id (0x2000091)
		i32 33; uint32_t java_name_index (0x21)
	}, ; 4
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 16; uint32_t java_name_index (0x10)
	}, ; 5
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554657, ; uint32_t type_token_id (0x20000e1)
		i32 80; uint32_t java_name_index (0x50)
	}, ; 6
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554851, ; uint32_t type_token_id (0x20001a3)
		i32 175; uint32_t java_name_index (0xaf)
	}, ; 7
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554659, ; uint32_t type_token_id (0x20000e3)
		i32 82; uint32_t java_name_index (0x52)
	}, ; 8
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554582, ; uint32_t type_token_id (0x2000096)
		i32 36; uint32_t java_name_index (0x24)
	}, ; 9
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554536, ; uint32_t type_token_id (0x2000068)
		i32 9; uint32_t java_name_index (0x9)
	}, ; 10
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554673, ; uint32_t type_token_id (0x20000f1)
		i32 90; uint32_t java_name_index (0x5a)
	}, ; 11
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554869, ; uint32_t type_token_id (0x20001b5)
		i32 190; uint32_t java_name_index (0xbe)
	}, ; 12
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554857, ; uint32_t type_token_id (0x20001a9)
		i32 180; uint32_t java_name_index (0xb4)
	}, ; 13
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 130; uint32_t java_name_index (0x82)
	}, ; 14
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554806, ; uint32_t type_token_id (0x2000176)
		i32 141; uint32_t java_name_index (0x8d)
	}, ; 15
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554589, ; uint32_t type_token_id (0x200009d)
		i32 43; uint32_t java_name_index (0x2b)
	}, ; 16
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554737, ; uint32_t type_token_id (0x2000131)
		i32 101; uint32_t java_name_index (0x65)
	}, ; 17
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554608, ; uint32_t type_token_id (0x20000b0)
		i32 4; uint32_t java_name_index (0x4)
	}, ; 18
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554802, ; uint32_t type_token_id (0x2000172)
		i32 139; uint32_t java_name_index (0x8b)
	}, ; 19
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554852, ; uint32_t type_token_id (0x20001a4)
		i32 176; uint32_t java_name_index (0xb0)
	}, ; 20
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554594, ; uint32_t type_token_id (0x20000a2)
		i32 48; uint32_t java_name_index (0x30)
	}, ; 21
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554818, ; uint32_t type_token_id (0x2000182)
		i32 151; uint32_t java_name_index (0x97)
	}, ; 22
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554721, ; uint32_t type_token_id (0x2000121)
		i32 97; uint32_t java_name_index (0x61)
	}, ; 23
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554773, ; uint32_t type_token_id (0x2000155)
		i32 122; uint32_t java_name_index (0x7a)
	}, ; 24
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 174; uint32_t java_name_index (0xae)
	}, ; 25
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554833, ; uint32_t type_token_id (0x2000191)
		i32 161; uint32_t java_name_index (0xa1)
	}, ; 26
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554854, ; uint32_t type_token_id (0x20001a6)
		i32 178; uint32_t java_name_index (0xb2)
	}, ; 27
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554868, ; uint32_t type_token_id (0x20001b4)
		i32 189; uint32_t java_name_index (0xbd)
	}, ; 28
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554585, ; uint32_t type_token_id (0x2000099)
		i32 39; uint32_t java_name_index (0x27)
	}, ; 29
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554858, ; uint32_t type_token_id (0x20001aa)
		i32 181; uint32_t java_name_index (0xb5)
	}, ; 30
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554774, ; uint32_t type_token_id (0x2000156)
		i32 123; uint32_t java_name_index (0x7b)
	}, ; 31
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554746, ; uint32_t type_token_id (0x200013a)
		i32 103; uint32_t java_name_index (0x67)
	}, ; 32
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 17; uint32_t java_name_index (0x11)
	}, ; 33
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554586, ; uint32_t type_token_id (0x200009a)
		i32 40; uint32_t java_name_index (0x28)
	}, ; 34
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554756, ; uint32_t type_token_id (0x2000144)
		i32 111; uint32_t java_name_index (0x6f)
	}, ; 35
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554864, ; uint32_t type_token_id (0x20001b0)
		i32 186; uint32_t java_name_index (0xba)
	}, ; 36
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 64; uint32_t java_name_index (0x40)
	}, ; 37
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554747, ; uint32_t type_token_id (0x200013b)
		i32 104; uint32_t java_name_index (0x68)
	}, ; 38
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554823, ; uint32_t type_token_id (0x2000187)
		i32 154; uint32_t java_name_index (0x9a)
	}, ; 39
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554572, ; uint32_t type_token_id (0x200008c)
		i32 29; uint32_t java_name_index (0x1d)
	}, ; 40
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554677, ; uint32_t type_token_id (0x20000f5)
		i32 92; uint32_t java_name_index (0x5c)
	}, ; 41
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554813, ; uint32_t type_token_id (0x200017d)
		i32 147; uint32_t java_name_index (0x93)
	}, ; 42
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554625, ; uint32_t type_token_id (0x20000c1)
		i32 63; uint32_t java_name_index (0x3f)
	}, ; 43
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554776, ; uint32_t type_token_id (0x2000158)
		i32 125; uint32_t java_name_index (0x7d)
	}, ; 44
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554623, ; uint32_t type_token_id (0x20000bf)
		i32 62; uint32_t java_name_index (0x3e)
	}, ; 45
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 132; uint32_t java_name_index (0x84)
	}, ; 46
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554615, ; uint32_t type_token_id (0x20000b7)
		i32 58; uint32_t java_name_index (0x3a)
	}, ; 47
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554553, ; uint32_t type_token_id (0x2000079)
		i32 18; uint32_t java_name_index (0x12)
	}, ; 48
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554617, ; uint32_t type_token_id (0x20000b9)
		i32 60; uint32_t java_name_index (0x3c)
	}, ; 49
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554588, ; uint32_t type_token_id (0x200009c)
		i32 42; uint32_t java_name_index (0x2a)
	}, ; 50
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 129; uint32_t java_name_index (0x81)
	}, ; 51
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554590, ; uint32_t type_token_id (0x200009e)
		i32 44; uint32_t java_name_index (0x2c)
	}, ; 52
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554534, ; uint32_t type_token_id (0x2000066)
		i32 8; uint32_t java_name_index (0x8)
	}, ; 53
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554597, ; uint32_t type_token_id (0x20000a5)
		i32 51; uint32_t java_name_index (0x33)
	}, ; 54
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554816, ; uint32_t type_token_id (0x2000180)
		i32 149; uint32_t java_name_index (0x95)
	}, ; 55
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554870, ; uint32_t type_token_id (0x20001b6)
		i32 191; uint32_t java_name_index (0xbf)
	}, ; 56
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554554, ; uint32_t type_token_id (0x200007a)
		i32 19; uint32_t java_name_index (0x13)
	}, ; 57
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554710, ; uint32_t type_token_id (0x2000116)
		i32 95; uint32_t java_name_index (0x5f)
	}, ; 58
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554750, ; uint32_t type_token_id (0x200013e)
		i32 107; uint32_t java_name_index (0x6b)
	}, ; 59
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 55; uint32_t java_name_index (0x37)
	}, ; 60
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554614, ; uint32_t type_token_id (0x20000b6)
		i32 6; uint32_t java_name_index (0x6)
	}, ; 61
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554841, ; uint32_t type_token_id (0x2000199)
		i32 168; uint32_t java_name_index (0xa8)
	}, ; 62
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 14; uint32_t java_name_index (0xe)
	}, ; 63
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554779, ; uint32_t type_token_id (0x200015b)
		i32 127; uint32_t java_name_index (0x7f)
	}, ; 64
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554748, ; uint32_t type_token_id (0x200013c)
		i32 105; uint32_t java_name_index (0x69)
	}, ; 65
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554863, ; uint32_t type_token_id (0x20001af)
		i32 185; uint32_t java_name_index (0xb9)
	}, ; 66
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554807, ; uint32_t type_token_id (0x2000177)
		i32 142; uint32_t java_name_index (0x8e)
	}, ; 67
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 77; uint32_t java_name_index (0x4d)
	}, ; 68
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554764, ; uint32_t type_token_id (0x200014c)
		i32 116; uint32_t java_name_index (0x74)
	}, ; 69
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554712, ; uint32_t type_token_id (0x2000118)
		i32 96; uint32_t java_name_index (0x60)
	}, ; 70
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554538, ; uint32_t type_token_id (0x200006a)
		i32 10; uint32_t java_name_index (0xa)
	}, ; 71
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554804, ; uint32_t type_token_id (0x2000174)
		i32 140; uint32_t java_name_index (0x8c)
	}, ; 72
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 134; uint32_t java_name_index (0x86)
	}, ; 73
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554571, ; uint32_t type_token_id (0x200008b)
		i32 28; uint32_t java_name_index (0x1c)
	}, ; 74
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554584, ; uint32_t type_token_id (0x2000098)
		i32 38; uint32_t java_name_index (0x26)
	}, ; 75
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554583, ; uint32_t type_token_id (0x2000097)
		i32 37; uint32_t java_name_index (0x25)
	}, ; 76
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554822, ; uint32_t type_token_id (0x2000186)
		i32 153; uint32_t java_name_index (0x99)
	}, ; 77
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554639, ; uint32_t type_token_id (0x20000cf)
		i32 70; uint32_t java_name_index (0x46)
	}, ; 78
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554632, ; uint32_t type_token_id (0x20000c8)
		i32 66; uint32_t java_name_index (0x42)
	}, ; 79
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554644, ; uint32_t type_token_id (0x20000d4)
		i32 72; uint32_t java_name_index (0x48)
	}, ; 80
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554595, ; uint32_t type_token_id (0x20000a3)
		i32 49; uint32_t java_name_index (0x31)
	}, ; 81
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 135; uint32_t java_name_index (0x87)
	}, ; 82
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554616, ; uint32_t type_token_id (0x20000b8)
		i32 7; uint32_t java_name_index (0x7)
	}, ; 83
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554663, ; uint32_t type_token_id (0x20000e7)
		i32 85; uint32_t java_name_index (0x55)
	}, ; 84
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554862, ; uint32_t type_token_id (0x20001ae)
		i32 184; uint32_t java_name_index (0xb8)
	}, ; 85
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554853, ; uint32_t type_token_id (0x20001a5)
		i32 177; uint32_t java_name_index (0xb1)
	}, ; 86
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 88; uint32_t java_name_index (0x58)
	}, ; 87
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554838, ; uint32_t type_token_id (0x2000196)
		i32 165; uint32_t java_name_index (0xa5)
	}, ; 88
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554839, ; uint32_t type_token_id (0x2000197)
		i32 166; uint32_t java_name_index (0xa6)
	}, ; 89
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554789, ; uint32_t type_token_id (0x2000165)
		i32 131; uint32_t java_name_index (0x83)
	}, ; 90
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554591, ; uint32_t type_token_id (0x200009f)
		i32 45; uint32_t java_name_index (0x2d)
	}, ; 91
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554751, ; uint32_t type_token_id (0x200013f)
		i32 108; uint32_t java_name_index (0x6c)
	}, ; 92
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 86; uint32_t java_name_index (0x56)
	}, ; 93
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 179; uint32_t java_name_index (0xb3)
	}, ; 94
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554558, ; uint32_t type_token_id (0x200007e)
		i32 22; uint32_t java_name_index (0x16)
	}, ; 95
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554831, ; uint32_t type_token_id (0x200018f)
		i32 160; uint32_t java_name_index (0xa0)
	}, ; 96
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554754, ; uint32_t type_token_id (0x2000142)
		i32 110; uint32_t java_name_index (0x6e)
	}, ; 97
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554631, ; uint32_t type_token_id (0x20000c7)
		i32 65; uint32_t java_name_index (0x41)
	}, ; 98
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554837, ; uint32_t type_token_id (0x2000195)
		i32 164; uint32_t java_name_index (0xa4)
	}, ; 99
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554771, ; uint32_t type_token_id (0x2000153)
		i32 120; uint32_t java_name_index (0x78)
	}, ; 100
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554643, ; uint32_t type_token_id (0x20000d3)
		i32 71; uint32_t java_name_index (0x47)
	}, ; 101
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 119; uint32_t java_name_index (0x77)
	}, ; 102
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554434, ; uint32_t type_token_id (0x2000002)
		i32 0; uint32_t java_name_index (0x0)
	}, ; 103
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554622, ; uint32_t type_token_id (0x20000be)
		i32 61; uint32_t java_name_index (0x3d)
	}, ; 104
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554633, ; uint32_t type_token_id (0x20000c9)
		i32 67; uint32_t java_name_index (0x43)
	}, ; 105
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554799, ; uint32_t type_token_id (0x200016f)
		i32 137; uint32_t java_name_index (0x89)
	}, ; 106
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554775, ; uint32_t type_token_id (0x2000157)
		i32 124; uint32_t java_name_index (0x7c)
	}, ; 107
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554568, ; uint32_t type_token_id (0x2000088)
		i32 27; uint32_t java_name_index (0x1b)
	}, ; 108
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554817, ; uint32_t type_token_id (0x2000181)
		i32 150; uint32_t java_name_index (0x96)
	}, ; 109
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554812, ; uint32_t type_token_id (0x200017c)
		i32 146; uint32_t java_name_index (0x92)
	}, ; 110
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554634, ; uint32_t type_token_id (0x20000ca)
		i32 68; uint32_t java_name_index (0x44)
	}, ; 111
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554772, ; uint32_t type_token_id (0x2000154)
		i32 121; uint32_t java_name_index (0x79)
	}, ; 112
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554564, ; uint32_t type_token_id (0x2000084)
		i32 25; uint32_t java_name_index (0x19)
	}, ; 113
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554843, ; uint32_t type_token_id (0x200019b)
		i32 170; uint32_t java_name_index (0xaa)
	}, ; 114
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554871, ; uint32_t type_token_id (0x20001b7)
		i32 192; uint32_t java_name_index (0xc0)
	}, ; 115
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554576, ; uint32_t type_token_id (0x2000090)
		i32 32; uint32_t java_name_index (0x20)
	}, ; 116
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554815, ; uint32_t type_token_id (0x200017f)
		i32 148; uint32_t java_name_index (0x94)
	}, ; 117
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554824, ; uint32_t type_token_id (0x2000188)
		i32 155; uint32_t java_name_index (0x9b)
	}, ; 118
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554602, ; uint32_t type_token_id (0x20000aa)
		i32 53; uint32_t java_name_index (0x35)
	}, ; 119
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 115; uint32_t java_name_index (0x73)
	}, ; 120
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554778, ; uint32_t type_token_id (0x200015a)
		i32 126; uint32_t java_name_index (0x7e)
	}, ; 121
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554829, ; uint32_t type_token_id (0x200018d)
		i32 158; uint32_t java_name_index (0x9e)
	}, ; 122
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554606, ; uint32_t type_token_id (0x20000ae)
		i32 56; uint32_t java_name_index (0x38)
	}, ; 123
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 13; uint32_t java_name_index (0xd)
	}, ; 124
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554658, ; uint32_t type_token_id (0x20000e2)
		i32 81; uint32_t java_name_index (0x51)
	}, ; 125
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554573, ; uint32_t type_token_id (0x200008d)
		i32 30; uint32_t java_name_index (0x1e)
	}, ; 126
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554580, ; uint32_t type_token_id (0x2000094)
		i32 35; uint32_t java_name_index (0x23)
	}, ; 127
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554847, ; uint32_t type_token_id (0x200019f)
		i32 173; uint32_t java_name_index (0xad)
	}, ; 128
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554562, ; uint32_t type_token_id (0x2000082)
		i32 24; uint32_t java_name_index (0x18)
	}, ; 129
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554592, ; uint32_t type_token_id (0x20000a0)
		i32 46; uint32_t java_name_index (0x2e)
	}, ; 130
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554865, ; uint32_t type_token_id (0x20001b1)
		i32 187; uint32_t java_name_index (0xbb)
	}, ; 131
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554560, ; uint32_t type_token_id (0x2000080)
		i32 23; uint32_t java_name_index (0x17)
	}, ; 132
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 26; uint32_t java_name_index (0x1a)
	}, ; 133
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 76; uint32_t java_name_index (0x4c)
	}, ; 134
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 117; uint32_t java_name_index (0x75)
	}, ; 135
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554645, ; uint32_t type_token_id (0x20000d5)
		i32 73; uint32_t java_name_index (0x49)
	}, ; 136
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554646, ; uint32_t type_token_id (0x20000d6)
		i32 74; uint32_t java_name_index (0x4a)
	}, ; 137
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 34; uint32_t java_name_index (0x22)
	}, ; 138
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554846, ; uint32_t type_token_id (0x200019e)
		i32 172; uint32_t java_name_index (0xac)
	}, ; 139
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 94; uint32_t java_name_index (0x5e)
	}, ; 140
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554886, ; uint32_t type_token_id (0x20001c6)
		i32 193; uint32_t java_name_index (0xc1)
	}, ; 141
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554661, ; uint32_t type_token_id (0x20000e5)
		i32 83; uint32_t java_name_index (0x53)
	}, ; 142
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555141, ; uint32_t type_token_id (0x20002c5)
		i32 2; uint32_t java_name_index (0x2)
	}, ; 143
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554834, ; uint32_t type_token_id (0x2000192)
		i32 162; uint32_t java_name_index (0xa2)
	}, ; 144
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 78; uint32_t java_name_index (0x4e)
	}, ; 145
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554656, ; uint32_t type_token_id (0x20000e0)
		i32 79; uint32_t java_name_index (0x4f)
	}, ; 146
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 15; uint32_t java_name_index (0xf)
	}, ; 147
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554436, ; uint32_t type_token_id (0x2000004)
		i32 1; uint32_t java_name_index (0x1)
	}, ; 148
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554811, ; uint32_t type_token_id (0x200017b)
		i32 145; uint32_t java_name_index (0x91)
	}, ; 149
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554541, ; uint32_t type_token_id (0x200006d)
		i32 12; uint32_t java_name_index (0xc)
	}, ; 150
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554859, ; uint32_t type_token_id (0x20001ab)
		i32 182; uint32_t java_name_index (0xb6)
	}, ; 151
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 133; uint32_t java_name_index (0x85)
	}, ; 152
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554819, ; uint32_t type_token_id (0x2000183)
		i32 152; uint32_t java_name_index (0x98)
	}, ; 153
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554587, ; uint32_t type_token_id (0x200009b)
		i32 41; uint32_t java_name_index (0x29)
	}, ; 154
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554724, ; uint32_t type_token_id (0x2000124)
		i32 99; uint32_t java_name_index (0x63)
	}, ; 155
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554603, ; uint32_t type_token_id (0x20000ab)
		i32 54; uint32_t java_name_index (0x36)
	}, ; 156
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554866, ; uint32_t type_token_id (0x20001b2)
		i32 188; uint32_t java_name_index (0xbc)
	}, ; 157
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554809, ; uint32_t type_token_id (0x2000179)
		i32 143; uint32_t java_name_index (0x8f)
	}, ; 158
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554723, ; uint32_t type_token_id (0x2000123)
		i32 98; uint32_t java_name_index (0x62)
	}, ; 159
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554842, ; uint32_t type_token_id (0x200019a)
		i32 169; uint32_t java_name_index (0xa9)
	}, ; 160
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554593, ; uint32_t type_token_id (0x20000a1)
		i32 47; uint32_t java_name_index (0x2f)
	}, ; 161
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554539, ; uint32_t type_token_id (0x200006b)
		i32 11; uint32_t java_name_index (0xb)
	}, ; 162
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554810, ; uint32_t type_token_id (0x200017a)
		i32 144; uint32_t java_name_index (0x90)
	}, ; 163
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554745, ; uint32_t type_token_id (0x2000139)
		i32 102; uint32_t java_name_index (0x66)
	}, ; 164
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554675, ; uint32_t type_token_id (0x20000f3)
		i32 91; uint32_t java_name_index (0x5b)
	}, ; 165
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554600, ; uint32_t type_token_id (0x20000a8)
		i32 52; uint32_t java_name_index (0x34)
	}, ; 166
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554840, ; uint32_t type_token_id (0x2000198)
		i32 167; uint32_t java_name_index (0xa7)
	}, ; 167
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554827, ; uint32_t type_token_id (0x200018b)
		i32 157; uint32_t java_name_index (0x9d)
	}, ; 168
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554798, ; uint32_t type_token_id (0x200016e)
		i32 136; uint32_t java_name_index (0x88)
	}, ; 169
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554768, ; uint32_t type_token_id (0x2000150)
		i32 118; uint32_t java_name_index (0x76)
	}, ; 170
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554752, ; uint32_t type_token_id (0x2000140)
		i32 109; uint32_t java_name_index (0x6d)
	}, ; 171
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554574, ; uint32_t type_token_id (0x200008e)
		i32 31; uint32_t java_name_index (0x1f)
	}, ; 172
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554706, ; uint32_t type_token_id (0x2000112)
		i32 93; uint32_t java_name_index (0x5d)
	}, ; 173
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554555, ; uint32_t type_token_id (0x200007b)
		i32 20; uint32_t java_name_index (0x14)
	}, ; 174
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554761, ; uint32_t type_token_id (0x2000149)
		i32 114; uint32_t java_name_index (0x72)
	}, ; 175
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554749, ; uint32_t type_token_id (0x200013d)
		i32 106; uint32_t java_name_index (0x6a)
	}, ; 176
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554845, ; uint32_t type_token_id (0x200019d)
		i32 171; uint32_t java_name_index (0xab)
	}, ; 177
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554635, ; uint32_t type_token_id (0x20000cb)
		i32 69; uint32_t java_name_index (0x45)
	}, ; 178
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554759, ; uint32_t type_token_id (0x2000147)
		i32 113; uint32_t java_name_index (0x71)
	}, ; 179
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554662, ; uint32_t type_token_id (0x20000e6)
		i32 84; uint32_t java_name_index (0x54)
	}, ; 180
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555142, ; uint32_t type_token_id (0x20002c6)
		i32 3; uint32_t java_name_index (0x3)
	}, ; 181
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554666, ; uint32_t type_token_id (0x20000ea)
		i32 87; uint32_t java_name_index (0x57)
	}, ; 182
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554835, ; uint32_t type_token_id (0x2000193)
		i32 163; uint32_t java_name_index (0xa3)
	}, ; 183
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 75; uint32_t java_name_index (0x4b)
	}, ; 184
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554596, ; uint32_t type_token_id (0x20000a4)
		i32 50; uint32_t java_name_index (0x32)
	}, ; 185
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554557, ; uint32_t type_token_id (0x200007d)
		i32 21; uint32_t java_name_index (0x15)
	}, ; 186
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554830, ; uint32_t type_token_id (0x200018e)
		i32 159; uint32_t java_name_index (0x9f)
	}, ; 187
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554758, ; uint32_t type_token_id (0x2000146)
		i32 112; uint32_t java_name_index (0x70)
	}, ; 188
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554613, ; uint32_t type_token_id (0x20000b5)
		i32 5; uint32_t java_name_index (0x5)
	}, ; 189
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554725, ; uint32_t type_token_id (0x2000125)
		i32 100; uint32_t java_name_index (0x64)
	}, ; 190
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 57; uint32_t java_name_index (0x39)
	}, ; 191
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554616, ; uint32_t type_token_id (0x20000b8)
		i32 59; uint32_t java_name_index (0x3b)
	}, ; 192
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 156; uint32_t java_name_index (0x9c)
	} ; 193
], align 4

; Java type names
@java_type_names = dso_local local_unnamed_addr constant [194 x ptr] [
	ptr @.str.0, ; 0
	ptr @.str.1, ; 1
	ptr @.str.2, ; 2
	ptr @.str.3, ; 3
	ptr @.str.4, ; 4
	ptr @.str.5, ; 5
	ptr @.str.6, ; 6
	ptr @.str.7, ; 7
	ptr @.str.8, ; 8
	ptr @.str.9, ; 9
	ptr @.str.10, ; 10
	ptr @.str.11, ; 11
	ptr @.str.12, ; 12
	ptr @.str.13, ; 13
	ptr @.str.14, ; 14
	ptr @.str.15, ; 15
	ptr @.str.16, ; 16
	ptr @.str.17, ; 17
	ptr @.str.18, ; 18
	ptr @.str.19, ; 19
	ptr @.str.20, ; 20
	ptr @.str.21, ; 21
	ptr @.str.22, ; 22
	ptr @.str.23, ; 23
	ptr @.str.24, ; 24
	ptr @.str.25, ; 25
	ptr @.str.26, ; 26
	ptr @.str.27, ; 27
	ptr @.str.28, ; 28
	ptr @.str.29, ; 29
	ptr @.str.30, ; 30
	ptr @.str.31, ; 31
	ptr @.str.32, ; 32
	ptr @.str.33, ; 33
	ptr @.str.34, ; 34
	ptr @.str.35, ; 35
	ptr @.str.36, ; 36
	ptr @.str.37, ; 37
	ptr @.str.38, ; 38
	ptr @.str.39, ; 39
	ptr @.str.40, ; 40
	ptr @.str.41, ; 41
	ptr @.str.42, ; 42
	ptr @.str.43, ; 43
	ptr @.str.44, ; 44
	ptr @.str.45, ; 45
	ptr @.str.46, ; 46
	ptr @.str.47, ; 47
	ptr @.str.48, ; 48
	ptr @.str.49, ; 49
	ptr @.str.50, ; 50
	ptr @.str.51, ; 51
	ptr @.str.52, ; 52
	ptr @.str.53, ; 53
	ptr @.str.54, ; 54
	ptr @.str.55, ; 55
	ptr @.str.56, ; 56
	ptr @.str.57, ; 57
	ptr @.str.58, ; 58
	ptr @.str.59, ; 59
	ptr @.str.60, ; 60
	ptr @.str.61, ; 61
	ptr @.str.62, ; 62
	ptr @.str.63, ; 63
	ptr @.str.64, ; 64
	ptr @.str.65, ; 65
	ptr @.str.66, ; 66
	ptr @.str.67, ; 67
	ptr @.str.68, ; 68
	ptr @.str.69, ; 69
	ptr @.str.70, ; 70
	ptr @.str.71, ; 71
	ptr @.str.72, ; 72
	ptr @.str.73, ; 73
	ptr @.str.74, ; 74
	ptr @.str.75, ; 75
	ptr @.str.76, ; 76
	ptr @.str.77, ; 77
	ptr @.str.78, ; 78
	ptr @.str.79, ; 79
	ptr @.str.80, ; 80
	ptr @.str.81, ; 81
	ptr @.str.82, ; 82
	ptr @.str.83, ; 83
	ptr @.str.84, ; 84
	ptr @.str.85, ; 85
	ptr @.str.86, ; 86
	ptr @.str.87, ; 87
	ptr @.str.88, ; 88
	ptr @.str.89, ; 89
	ptr @.str.90, ; 90
	ptr @.str.91, ; 91
	ptr @.str.92, ; 92
	ptr @.str.93, ; 93
	ptr @.str.94, ; 94
	ptr @.str.95, ; 95
	ptr @.str.96, ; 96
	ptr @.str.97, ; 97
	ptr @.str.98, ; 98
	ptr @.str.99, ; 99
	ptr @.str.100, ; 100
	ptr @.str.101, ; 101
	ptr @.str.102, ; 102
	ptr @.str.103, ; 103
	ptr @.str.104, ; 104
	ptr @.str.105, ; 105
	ptr @.str.106, ; 106
	ptr @.str.107, ; 107
	ptr @.str.108, ; 108
	ptr @.str.109, ; 109
	ptr @.str.110, ; 110
	ptr @.str.111, ; 111
	ptr @.str.112, ; 112
	ptr @.str.113, ; 113
	ptr @.str.114, ; 114
	ptr @.str.115, ; 115
	ptr @.str.116, ; 116
	ptr @.str.117, ; 117
	ptr @.str.118, ; 118
	ptr @.str.119, ; 119
	ptr @.str.120, ; 120
	ptr @.str.121, ; 121
	ptr @.str.122, ; 122
	ptr @.str.123, ; 123
	ptr @.str.124, ; 124
	ptr @.str.125, ; 125
	ptr @.str.126, ; 126
	ptr @.str.127, ; 127
	ptr @.str.128, ; 128
	ptr @.str.129, ; 129
	ptr @.str.130, ; 130
	ptr @.str.131, ; 131
	ptr @.str.132, ; 132
	ptr @.str.133, ; 133
	ptr @.str.134, ; 134
	ptr @.str.135, ; 135
	ptr @.str.136, ; 136
	ptr @.str.137, ; 137
	ptr @.str.138, ; 138
	ptr @.str.139, ; 139
	ptr @.str.140, ; 140
	ptr @.str.141, ; 141
	ptr @.str.142, ; 142
	ptr @.str.143, ; 143
	ptr @.str.144, ; 144
	ptr @.str.145, ; 145
	ptr @.str.146, ; 146
	ptr @.str.147, ; 147
	ptr @.str.148, ; 148
	ptr @.str.149, ; 149
	ptr @.str.150, ; 150
	ptr @.str.151, ; 151
	ptr @.str.152, ; 152
	ptr @.str.153, ; 153
	ptr @.str.154, ; 154
	ptr @.str.155, ; 155
	ptr @.str.156, ; 156
	ptr @.str.157, ; 157
	ptr @.str.158, ; 158
	ptr @.str.159, ; 159
	ptr @.str.160, ; 160
	ptr @.str.161, ; 161
	ptr @.str.162, ; 162
	ptr @.str.163, ; 163
	ptr @.str.164, ; 164
	ptr @.str.165, ; 165
	ptr @.str.166, ; 166
	ptr @.str.167, ; 167
	ptr @.str.168, ; 168
	ptr @.str.169, ; 169
	ptr @.str.170, ; 170
	ptr @.str.171, ; 171
	ptr @.str.172, ; 172
	ptr @.str.173, ; 173
	ptr @.str.174, ; 174
	ptr @.str.175, ; 175
	ptr @.str.176, ; 176
	ptr @.str.177, ; 177
	ptr @.str.178, ; 178
	ptr @.str.179, ; 179
	ptr @.str.180, ; 180
	ptr @.str.181, ; 181
	ptr @.str.182, ; 182
	ptr @.str.183, ; 183
	ptr @.str.184, ; 184
	ptr @.str.185, ; 185
	ptr @.str.186, ; 186
	ptr @.str.187, ; 187
	ptr @.str.188, ; 188
	ptr @.str.189, ; 189
	ptr @.str.190, ; 190
	ptr @.str.191, ; 191
	ptr @.str.192, ; 192
	ptr @.str.193 ; 193
], align 4

; Strings
@.str.0 = private unnamed_addr constant [32 x i8] c"crc6472dcb918d50f9b12/Activity1\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"crc6472dcb918d50f9b12/LoginActivity\00", align 1
@.str.2 = private unnamed_addr constant [51 x i8] c"crc64f0e061189adeef62/Accelerometer_SensorListener\00", align 1
@.str.3 = private unnamed_addr constant [45 x i8] c"crc64f0e061189adeef62/Compass_SensorListener\00", align 1
@.str.4 = private unnamed_addr constant [42 x i8] c"crc64493ac3851fab1842/AndroidGameActivity\00", align 1
@.str.5 = private unnamed_addr constant [46 x i8] c"crc64493ac3851fab1842/MonoGameAndroidGameView\00", align 1
@.str.6 = private unnamed_addr constant [42 x i8] c"crc64493ac3851fab1842/OrientationListener\00", align 1
@.str.7 = private unnamed_addr constant [37 x i8] c"crc64493ac3851fab1842/ScreenReceiver\00", align 1
@.str.8 = private unnamed_addr constant [32 x i8] c"javax/security/cert/Certificate\00", align 1
@.str.9 = private unnamed_addr constant [36 x i8] c"javax/security/cert/X509Certificate\00", align 1
@.str.10 = private unnamed_addr constant [28 x i8] c"javax/security/auth/Subject\00", align 1
@.str.11 = private unnamed_addr constant [24 x i8] c"javax/net/SocketFactory\00", align 1
@.str.12 = private unnamed_addr constant [33 x i8] c"javax/net/ssl/HttpsURLConnection\00", align 1
@.str.13 = private unnamed_addr constant [31 x i8] c"javax/net/ssl/HostnameVerifier\00", align 1
@.str.14 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/KeyManager\00", align 1
@.str.15 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/SSLSession\00", align 1
@.str.16 = private unnamed_addr constant [32 x i8] c"javax/net/ssl/SSLSessionContext\00", align 1
@.str.17 = private unnamed_addr constant [27 x i8] c"javax/net/ssl/TrustManager\00", align 1
@.str.18 = private unnamed_addr constant [32 x i8] c"javax/net/ssl/KeyManagerFactory\00", align 1
@.str.19 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/SSLContext\00", align 1
@.str.20 = private unnamed_addr constant [31 x i8] c"javax/net/ssl/SSLSocketFactory\00", align 1
@.str.21 = private unnamed_addr constant [34 x i8] c"javax/net/ssl/TrustManagerFactory\00", align 1
@.str.22 = private unnamed_addr constant [41 x i8] c"javax/microedition/khronos/egl/EGLConfig\00", align 1
@.str.23 = private unnamed_addr constant [42 x i8] c"javax/microedition/khronos/egl/EGLContext\00", align 1
@.str.24 = private unnamed_addr constant [42 x i8] c"javax/microedition/khronos/egl/EGLDisplay\00", align 1
@.str.25 = private unnamed_addr constant [42 x i8] c"javax/microedition/khronos/egl/EGLSurface\00", align 1
@.str.26 = private unnamed_addr constant [35 x i8] c"javax/microedition/khronos/egl/EGL\00", align 1
@.str.27 = private unnamed_addr constant [37 x i8] c"javax/microedition/khronos/egl/EGL10\00", align 1
@.str.28 = private unnamed_addr constant [22 x i8] c"android/widget/Button\00", align 1
@.str.29 = private unnamed_addr constant [24 x i8] c"android/widget/EditText\00", align 1
@.str.30 = private unnamed_addr constant [24 x i8] c"android/widget/TextView\00", align 1
@.str.31 = private unnamed_addr constant [21 x i8] c"android/widget/Toast\00", align 1
@.str.32 = private unnamed_addr constant [30 x i8] c"android/util/AndroidException\00", align 1
@.str.33 = private unnamed_addr constant [28 x i8] c"android/util/DisplayMetrics\00", align 1
@.str.34 = private unnamed_addr constant [26 x i8] c"android/util/AttributeSet\00", align 1
@.str.35 = private unnamed_addr constant [17 x i8] c"android/util/Log\00", align 1
@.str.36 = private unnamed_addr constant [28 x i8] c"android/provider/MediaStore\00", align 1
@.str.37 = private unnamed_addr constant [34 x i8] c"android/provider/MediaStore$Audio\00", align 1
@.str.38 = private unnamed_addr constant [40 x i8] c"android/provider/MediaStore$Audio$Media\00", align 1
@.str.39 = private unnamed_addr constant [35 x i8] c"android/provider/MediaStore$Images\00", align 1
@.str.40 = private unnamed_addr constant [41 x i8] c"android/provider/MediaStore$Images$Media\00", align 1
@.str.41 = private unnamed_addr constant [26 x i8] c"android/provider/Settings\00", align 1
@.str.42 = private unnamed_addr constant [41 x i8] c"android/provider/Settings$NameValueTable\00", align 1
@.str.43 = private unnamed_addr constant [51 x i8] c"android/provider/Settings$SettingNotFoundException\00", align 1
@.str.44 = private unnamed_addr constant [33 x i8] c"android/provider/Settings$System\00", align 1
@.str.45 = private unnamed_addr constant [22 x i8] c"android/os/BaseBundle\00", align 1
@.str.46 = private unnamed_addr constant [17 x i8] c"android/os/Build\00", align 1
@.str.47 = private unnamed_addr constant [25 x i8] c"android/os/Build$VERSION\00", align 1
@.str.48 = private unnamed_addr constant [18 x i8] c"android/os/Bundle\00", align 1
@.str.49 = private unnamed_addr constant [19 x i8] c"android/os/Handler\00", align 1
@.str.50 = private unnamed_addr constant [18 x i8] c"android/os/Looper\00", align 1
@.str.51 = private unnamed_addr constant [20 x i8] c"android/os/Vibrator\00", align 1
@.str.52 = private unnamed_addr constant [16 x i8] c"android/net/Uri\00", align 1
@.str.53 = private unnamed_addr constant [27 x i8] c"android/media/AudioManager\00", align 1
@.str.54 = private unnamed_addr constant [26 x i8] c"android/media/MediaPlayer\00", align 1
@.str.55 = private unnamed_addr constant [47 x i8] c"android/media/MediaPlayer$OnCompletionListener\00", align 1
@.str.56 = private unnamed_addr constant [63 x i8] c"mono/android/media/MediaPlayer_OnCompletionListenerImplementor\00", align 1
@.str.57 = private unnamed_addr constant [37 x i8] c"android/hardware/SensorEventListener\00", align 1
@.str.58 = private unnamed_addr constant [24 x i8] c"android/hardware/Sensor\00", align 1
@.str.59 = private unnamed_addr constant [29 x i8] c"android/hardware/SensorEvent\00", align 1
@.str.60 = private unnamed_addr constant [31 x i8] c"android/hardware/SensorManager\00", align 1
@.str.61 = private unnamed_addr constant [33 x i8] c"android/database/CharArrayBuffer\00", align 1
@.str.62 = private unnamed_addr constant [33 x i8] c"android/database/ContentObserver\00", align 1
@.str.63 = private unnamed_addr constant [33 x i8] c"android/database/DataSetObserver\00", align 1
@.str.64 = private unnamed_addr constant [24 x i8] c"android/database/Cursor\00", align 1
@.str.65 = private unnamed_addr constant [21 x i8] c"android/app/Activity\00", align 1
@.str.66 = private unnamed_addr constant [24 x i8] c"android/app/AlertDialog\00", align 1
@.str.67 = private unnamed_addr constant [32 x i8] c"android/app/AlertDialog$Builder\00", align 1
@.str.68 = private unnamed_addr constant [24 x i8] c"android/app/Application\00", align 1
@.str.69 = private unnamed_addr constant [19 x i8] c"android/app/Dialog\00", align 1
@.str.70 = private unnamed_addr constant [28 x i8] c"android/app/KeyguardManager\00", align 1
@.str.71 = private unnamed_addr constant [33 x i8] c"android/view/ContextThemeWrapper\00", align 1
@.str.72 = private unnamed_addr constant [21 x i8] c"android/view/Display\00", align 1
@.str.73 = private unnamed_addr constant [25 x i8] c"android/view/InputDevice\00", align 1
@.str.74 = private unnamed_addr constant [24 x i8] c"android/view/InputEvent\00", align 1
@.str.75 = private unnamed_addr constant [36 x i8] c"android/view/SurfaceHolder$Callback\00", align 1
@.str.76 = private unnamed_addr constant [27 x i8] c"android/view/SurfaceHolder\00", align 1
@.str.77 = private unnamed_addr constant [25 x i8] c"android/view/ViewManager\00", align 1
@.str.78 = private unnamed_addr constant [27 x i8] c"android/view/WindowManager\00", align 1
@.str.79 = private unnamed_addr constant [29 x i8] c"android/view/KeyCharacterMap\00", align 1
@.str.80 = private unnamed_addr constant [22 x i8] c"android/view/KeyEvent\00", align 1
@.str.81 = private unnamed_addr constant [25 x i8] c"android/view/MotionEvent\00", align 1
@.str.82 = private unnamed_addr constant [38 x i8] c"android/view/OrientationEventListener\00", align 1
@.str.83 = private unnamed_addr constant [21 x i8] c"android/view/Surface\00", align 1
@.str.84 = private unnamed_addr constant [25 x i8] c"android/view/SurfaceView\00", align 1
@.str.85 = private unnamed_addr constant [18 x i8] c"android/view/View\00", align 1
@.str.86 = private unnamed_addr constant [34 x i8] c"android/view/View$OnClickListener\00", align 1
@.str.87 = private unnamed_addr constant [50 x i8] c"mono/android/view/View_OnClickListenerImplementor\00", align 1
@.str.88 = private unnamed_addr constant [34 x i8] c"android/view/View$OnTouchListener\00", align 1
@.str.89 = private unnamed_addr constant [23 x i8] c"android/view/ViewGroup\00", align 1
@.str.90 = private unnamed_addr constant [36 x i8] c"android/view/ViewGroup$LayoutParams\00", align 1
@.str.91 = private unnamed_addr constant [20 x i8] c"android/view/Window\00", align 1
@.str.92 = private unnamed_addr constant [27 x i8] c"android/view/WindowMetrics\00", align 1
@.str.93 = private unnamed_addr constant [40 x i8] c"mono/android/runtime/InputStreamAdapter\00", align 1
@.str.94 = private unnamed_addr constant [31 x i8] c"mono/android/runtime/JavaArray\00", align 1
@.str.95 = private unnamed_addr constant [21 x i8] c"java/util/Collection\00", align 1
@.str.96 = private unnamed_addr constant [18 x i8] c"java/util/HashMap\00", align 1
@.str.97 = private unnamed_addr constant [20 x i8] c"java/util/ArrayList\00", align 1
@.str.98 = private unnamed_addr constant [32 x i8] c"mono/android/runtime/JavaObject\00", align 1
@.str.99 = private unnamed_addr constant [35 x i8] c"android/runtime/JavaProxyThrowable\00", align 1
@.str.100 = private unnamed_addr constant [18 x i8] c"java/util/HashSet\00", align 1
@.str.101 = private unnamed_addr constant [41 x i8] c"mono/android/runtime/OutputStreamAdapter\00", align 1
@.str.102 = private unnamed_addr constant [24 x i8] c"android/graphics/Bitmap\00", align 1
@.str.103 = private unnamed_addr constant [31 x i8] c"android/graphics/Bitmap$Config\00", align 1
@.str.104 = private unnamed_addr constant [31 x i8] c"android/graphics/BitmapFactory\00", align 1
@.str.105 = private unnamed_addr constant [39 x i8] c"android/graphics/BitmapFactory$Options\00", align 1
@.str.106 = private unnamed_addr constant [24 x i8] c"android/graphics/Canvas\00", align 1
@.str.107 = private unnamed_addr constant [23 x i8] c"android/graphics/Paint\00", align 1
@.str.108 = private unnamed_addr constant [23 x i8] c"android/graphics/Point\00", align 1
@.str.109 = private unnamed_addr constant [22 x i8] c"android/graphics/Rect\00", align 1
@.str.110 = private unnamed_addr constant [34 x i8] c"android/content/BroadcastReceiver\00", align 1
@.str.111 = private unnamed_addr constant [32 x i8] c"android/content/ContentResolver\00", align 1
@.str.112 = private unnamed_addr constant [28 x i8] c"android/content/ContentUris\00", align 1
@.str.113 = private unnamed_addr constant [24 x i8] c"android/content/Context\00", align 1
@.str.114 = private unnamed_addr constant [31 x i8] c"android/content/ContextWrapper\00", align 1
@.str.115 = private unnamed_addr constant [49 x i8] c"android/content/DialogInterface$OnCancelListener\00", align 1
@.str.116 = private unnamed_addr constant [65 x i8] c"mono/android/content/DialogInterface_OnCancelListenerImplementor\00", align 1
@.str.117 = private unnamed_addr constant [48 x i8] c"android/content/DialogInterface$OnClickListener\00", align 1
@.str.118 = private unnamed_addr constant [64 x i8] c"mono/android/content/DialogInterface_OnClickListenerImplementor\00", align 1
@.str.119 = private unnamed_addr constant [32 x i8] c"android/content/DialogInterface\00", align 1
@.str.120 = private unnamed_addr constant [23 x i8] c"android/content/Intent\00", align 1
@.str.121 = private unnamed_addr constant [29 x i8] c"android/content/IntentFilter\00", align 1
@.str.122 = private unnamed_addr constant [40 x i8] c"android/content/res/AssetFileDescriptor\00", align 1
@.str.123 = private unnamed_addr constant [33 x i8] c"android/content/res/AssetManager\00", align 1
@.str.124 = private unnamed_addr constant [34 x i8] c"android/content/res/Configuration\00", align 1
@.str.125 = private unnamed_addr constant [30 x i8] c"android/content/res/Resources\00", align 1
@.str.126 = private unnamed_addr constant [34 x i8] c"android/content/pm/PackageManager\00", align 1
@.str.127 = private unnamed_addr constant [35 x i8] c"android/content/pm/ApplicationInfo\00", align 1
@.str.128 = private unnamed_addr constant [35 x i8] c"android/content/pm/PackageItemInfo\00", align 1
@.str.129 = private unnamed_addr constant [22 x i8] c"java/util/Enumeration\00", align 1
@.str.130 = private unnamed_addr constant [19 x i8] c"java/util/Iterator\00", align 1
@.str.131 = private unnamed_addr constant [17 x i8] c"java/util/Random\00", align 1
@.str.132 = private unnamed_addr constant [28 x i8] c"java/util/function/Consumer\00", align 1
@.str.133 = private unnamed_addr constant [31 x i8] c"java/util/function/IntConsumer\00", align 1
@.str.134 = private unnamed_addr constant [30 x i8] c"java/util/concurrent/Executor\00", align 1
@.str.135 = private unnamed_addr constant [24 x i8] c"java/security/Principal\00", align 1
@.str.136 = private unnamed_addr constant [23 x i8] c"java/security/KeyStore\00", align 1
@.str.137 = private unnamed_addr constant [27 x i8] c"java/security/SecureRandom\00", align 1
@.str.138 = private unnamed_addr constant [31 x i8] c"java/security/cert/Certificate\00", align 1
@.str.139 = private unnamed_addr constant [30 x i8] c"java/nio/channels/FileChannel\00", align 1
@.str.140 = private unnamed_addr constant [51 x i8] c"java/nio/channels/spi/AbstractInterruptibleChannel\00", align 1
@.str.141 = private unnamed_addr constant [26 x i8] c"java/net/ConnectException\00", align 1
@.str.142 = private unnamed_addr constant [27 x i8] c"java/net/HttpURLConnection\00", align 1
@.str.143 = private unnamed_addr constant [27 x i8] c"java/net/InetSocketAddress\00", align 1
@.str.144 = private unnamed_addr constant [27 x i8] c"java/net/ProtocolException\00", align 1
@.str.145 = private unnamed_addr constant [15 x i8] c"java/net/Proxy\00", align 1
@.str.146 = private unnamed_addr constant [20 x i8] c"java/net/Proxy$Type\00", align 1
@.str.147 = private unnamed_addr constant [23 x i8] c"java/net/SocketAddress\00", align 1
@.str.148 = private unnamed_addr constant [25 x i8] c"java/net/SocketException\00", align 1
@.str.149 = private unnamed_addr constant [32 x i8] c"java/net/SocketTimeoutException\00", align 1
@.str.150 = private unnamed_addr constant [33 x i8] c"java/net/UnknownServiceException\00", align 1
@.str.151 = private unnamed_addr constant [13 x i8] c"java/net/URL\00", align 1
@.str.152 = private unnamed_addr constant [23 x i8] c"java/net/URLConnection\00", align 1
@.str.153 = private unnamed_addr constant [13 x i8] c"java/io/File\00", align 1
@.str.154 = private unnamed_addr constant [23 x i8] c"java/io/FileDescriptor\00", align 1
@.str.155 = private unnamed_addr constant [24 x i8] c"java/io/FileInputStream\00", align 1
@.str.156 = private unnamed_addr constant [18 x i8] c"java/io/Closeable\00", align 1
@.str.157 = private unnamed_addr constant [20 x i8] c"java/io/InputStream\00", align 1
@.str.158 = private unnamed_addr constant [31 x i8] c"java/io/InterruptedIOException\00", align 1
@.str.159 = private unnamed_addr constant [20 x i8] c"java/io/IOException\00", align 1
@.str.160 = private unnamed_addr constant [21 x i8] c"java/io/OutputStream\00", align 1
@.str.161 = private unnamed_addr constant [20 x i8] c"java/io/PrintWriter\00", align 1
@.str.162 = private unnamed_addr constant [21 x i8] c"java/io/StringWriter\00", align 1
@.str.163 = private unnamed_addr constant [15 x i8] c"java/io/Writer\00", align 1
@.str.164 = private unnamed_addr constant [18 x i8] c"java/lang/Boolean\00", align 1
@.str.165 = private unnamed_addr constant [15 x i8] c"java/lang/Byte\00", align 1
@.str.166 = private unnamed_addr constant [20 x i8] c"java/lang/Character\00", align 1
@.str.167 = private unnamed_addr constant [16 x i8] c"java/lang/Class\00", align 1
@.str.168 = private unnamed_addr constant [29 x i8] c"java/lang/ClassCastException\00", align 1
@.str.169 = private unnamed_addr constant [17 x i8] c"java/lang/Double\00", align 1
@.str.170 = private unnamed_addr constant [15 x i8] c"java/lang/Enum\00", align 1
@.str.171 = private unnamed_addr constant [16 x i8] c"java/lang/Error\00", align 1
@.str.172 = private unnamed_addr constant [20 x i8] c"java/lang/Exception\00", align 1
@.str.173 = private unnamed_addr constant [16 x i8] c"java/lang/Float\00", align 1
@.str.174 = private unnamed_addr constant [23 x i8] c"java/lang/CharSequence\00", align 1
@.str.175 = private unnamed_addr constant [35 x i8] c"java/lang/IllegalArgumentException\00", align 1
@.str.176 = private unnamed_addr constant [32 x i8] c"java/lang/IllegalStateException\00", align 1
@.str.177 = private unnamed_addr constant [36 x i8] c"java/lang/IndexOutOfBoundsException\00", align 1
@.str.178 = private unnamed_addr constant [18 x i8] c"java/lang/Integer\00", align 1
@.str.179 = private unnamed_addr constant [19 x i8] c"java/lang/Runnable\00", align 1
@.str.180 = private unnamed_addr constant [15 x i8] c"java/lang/Long\00", align 1
@.str.181 = private unnamed_addr constant [31 x i8] c"java/lang/NullPointerException\00", align 1
@.str.182 = private unnamed_addr constant [17 x i8] c"java/lang/Number\00", align 1
@.str.183 = private unnamed_addr constant [17 x i8] c"java/lang/Object\00", align 1
@.str.184 = private unnamed_addr constant [27 x i8] c"java/lang/RuntimeException\00", align 1
@.str.185 = private unnamed_addr constant [28 x i8] c"java/lang/SecurityException\00", align 1
@.str.186 = private unnamed_addr constant [16 x i8] c"java/lang/Short\00", align 1
@.str.187 = private unnamed_addr constant [28 x i8] c"java/lang/StackTraceElement\00", align 1
@.str.188 = private unnamed_addr constant [17 x i8] c"java/lang/String\00", align 1
@.str.189 = private unnamed_addr constant [17 x i8] c"java/lang/Thread\00", align 1
@.str.190 = private unnamed_addr constant [35 x i8] c"mono/java/lang/RunnableImplementor\00", align 1
@.str.191 = private unnamed_addr constant [20 x i8] c"java/lang/Throwable\00", align 1
@.str.192 = private unnamed_addr constant [40 x i8] c"java/lang/UnsupportedOperationException\00", align 1
@.str.193 = private unnamed_addr constant [25 x i8] c"mono/android/TypeManager\00", align 1

;TypeMapModule
@.TypeMapModule.0_assembly_name = private unnamed_addr constant [17 x i8] c"PokemonTDAndroid\00", align 1
@.TypeMapModule.1_assembly_name = private unnamed_addr constant [19 x i8] c"MonoGame.Framework\00", align 1
@.TypeMapModule.2_assembly_name = private unnamed_addr constant [13 x i8] c"Mono.Android\00", align 1

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
!7 = !{i32 1, !"min_enum_size", i32 4}
