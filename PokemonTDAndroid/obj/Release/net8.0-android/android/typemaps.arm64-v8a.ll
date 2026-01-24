; ModuleID = 'typemaps.arm64-v8a.ll'
source_filename = "typemaps.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

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
], align 8

; Java types name hashes
@map_java_hashes = dso_local local_unnamed_addr constant [194 x i64] [
	i64 128182020419974451, ; 0: 0x1c764de51b97533 => java/lang/String
	i64 146042335049966109, ; 1: 0x206d8baded2621d => java/util/concurrent/Executor
	i64 191318127108177865, ; 2: 0x2a7b2d2ad603fc9 => android/provider/Settings$NameValueTable
	i64 318564728890166633, ; 3: 0x46bc4eedf778d69 => android/widget/Button
	i64 361870449891484378, ; 4: 0x5059f41c47e22da => android/os/Bundle
	i64 363417747702605178, ; 5: 0x50b1e841ce2e57a => android/widget/TextView
	i64 420183352050048797, ; 6: 0x5d4ca884f79df1d => android/media/MediaPlayer
	i64 698692053645229055, ; 7: 0x9b240b890e97bff => javax/net/ssl/HttpsURLConnection
	i64 698738878519169148, ; 8: 0x9b26b4ed4e3d07c => mono/android/content/DialogInterface_OnClickListenerImplementor
	i64 705175846315662030, ; 9: 0x9c949b22fd49ace => android/view/MotionEvent
	i64 870874870088288028, ; 10: 0xc15f8148b6d471c => java/lang/Exception
	i64 1027042189323199138, ; 11: 0xe40c96dfff2e2a2 => crc64493ac3851fab1842/OrientationListener
	i64 1078373297160254773, ; 12: 0xef726cce080f535 => android/app/KeyguardManager
	i64 1079586186822872943, ; 13: 0xefb75eac1feef6f => java/util/function/Consumer
	i64 1118658323616363018, ; 14: 0xf8645d1842ff20a => mono/android/media/MediaPlayer_OnCompletionListenerImplementor
	i64 1217044833273073796, ; 15: 0x10e3cfd3e2f75084 => java/util/HashSet
	i64 1264118133047759527, ; 16: 0x118b0cbe927112a7 => android/provider/Settings
	i64 1283121375857603354, ; 17: 0x11ce9017d3b3f31a => java/net/ConnectException
	i64 1317579852464953526, ; 18: 0x1248fbe51d6298b6 => java/io/FileInputStream
	i64 1320822650197077237, ; 19: 0x12548133cc496cf5 => android/runtime/JavaProxyThrowable
	i64 1362770524300979611, ; 20: 0x12e9889253552d9b => java/util/Iterator
	i64 1550860884384862055, ; 21: 0x1585c3c1edcecf67 => java/net/ProtocolException
	i64 1579421067141938651, ; 22: 0x15eb3b17a9c37ddb => javax/microedition/khronos/egl/EGL
	i64 1747499027921055994, ; 23: 0x18405d1b749330fa => android/os/BaseBundle
	i64 1831728799718484971, ; 24: 0x196b9ba37012abeb => java/io/IOException
	i64 1877272793125324469, ; 25: 0x1a0d69a8bcbd86b5 => java/net/Proxy
	i64 1885389416169908981, ; 26: 0x1a2a3faf4e16aaf5 => android/provider/MediaStore$Images$Media
	i64 1891509142727870308, ; 27: 0x1a3ffd8b2db2c764 => android/database/Cursor
	i64 2111352555338672611, ; 28: 0x1d4d07f6709329e3 => android/view/InputEvent
	i64 2164140653916027403, ; 29: 0x1e08927568a57a0b => java/io/InputStream
	i64 2266689907793747123, ; 30: 0x1f74e67632025cb3 => java/net/HttpURLConnection
	i64 2270205244544766606, ; 31: 0x1f8163a45051d28e => android/view/SurfaceHolder
	i64 2319268360137032813, ; 32: 0x202fb24918c5446d => java/security/SecureRandom
	i64 2357387754135176159, ; 33: 0x20b71fac231543df => java/io/File
	i64 2542726837267699812, ; 34: 0x2349949628319864 => android/view/Window
	i64 2885364006830175112, ; 35: 0x280adf46e2cf7388 => android/content/IntentFilter
	i64 2972252214977986258, ; 36: 0x293f8fa450a17ed2 => android/content/Intent
	i64 3071747017624329461, ; 37: 0x2aa109a3415d1cf5 => android/os/Build
	i64 3312753486604898190, ; 38: 0x2df943be8d858f8e => android/app/Dialog
	i64 3476617847597562063, ; 39: 0x303f6d8331d5f8cf => java/io/PrintWriter
	i64 3530631042196079534, ; 40: 0x30ff523a0f1083ae => android/content/DialogInterface
	i64 3648679180818523925, ; 41: 0x32a2b662280d2715 => android/content/pm/PackageManager
	i64 3656396631051491790, ; 42: 0x32be215d0fc259ce => java/net/InetSocketAddress
	i64 3852049679258842853, ; 43: 0x35753ac6356176e5 => android/view/SurfaceHolder$Callback
	i64 3904020371636272704, ; 44: 0x362dddd7f744be40 => android/hardware/SensorEventListener
	i64 3936478700004404583, ; 45: 0x36a12e8573a76d67 => java/net/SocketAddress
	i64 3940353796168302121, ; 46: 0x36aef2e695f93e29 => android/graphics/Canvas
	i64 3957166361670620563, ; 47: 0x36eaadd708809593 => javax/security/cert/Certificate
	i64 4159151334517947946, ; 48: 0x39b8461a4508be2a => android/hardware/Sensor
	i64 4305371449952891808, ; 49: 0x3bbfc085dc8cf3a0 => java/lang/Class
	i64 4325151021872010138, ; 50: 0x3c0605f05299539a => javax/microedition/khronos/egl/EGL10
	i64 4328468547648071486, ; 51: 0x3c11cf35fc03a73e => android/net/Uri
	i64 4406641945990788791, ; 52: 0x3d278980a31df6b7 => android/content/BroadcastReceiver
	i64 4413535772071861656, ; 53: 0x3d40076699d29d98 => android/provider/MediaStore
	i64 4515736889328482736, ; 54: 0x3eab1ec6838d39b0 => android/hardware/SensorEvent
	i64 4590799101254748484, ; 55: 0x3fb5cb75a178c944 => javax/net/ssl/TrustManagerFactory
	i64 4756101769800025001, ; 56: 0x4201115c588983a9 => javax/net/SocketFactory
	i64 4982359867582679768, ; 57: 0x4524e5e6e26d8ad8 => javax/microedition/khronos/egl/EGLContext
	i64 5214467817578676657, ; 58: 0x485d82da477bc1b1 => java/lang/Error
	i64 5407512276612009785, ; 59: 0x4b0b57c3ee05cf39 => android/view/SurfaceView
	i64 5721622378707311992, ; 60: 0x4f67493d2dc65d78 => crc6472dcb918d50f9b12/LoginActivity
	i64 5793982059409158284, ; 61: 0x50685bfc3611b08c => java/net/URLConnection
	i64 5808851769133758690, ; 62: 0x509d2fe84c1df8e2 => crc64493ac3851fab1842/ScreenReceiver
	i64 5866051512250042973, ; 63: 0x516866c54dce8a5d => android/database/ContentObserver
	i64 5991054489085362647, ; 64: 0x53248050dbf141d7 => javax/security/cert/X509Certificate
	i64 6000768439507874839, ; 65: 0x5347031a303df417 => java/lang/Enum
	i64 6194639450693030133, ; 66: 0x55f7c7c2822dd0f5 => crc64f0e061189adeef62/Accelerometer_SensorListener
	i64 6740334783866200195, ; 67: 0x5d8a7ac62b8de083 => javax/net/ssl/SSLSession
	i64 6875961628645093091, ; 68: 0x5f6c52abbc9b6ee3 => android/content/ContentResolver
	i64 6885700444039377452, ; 69: 0x5f8eec1264b7722c => android/view/InputDevice
	i64 6887549445287282166, ; 70: 0x5f957dba8b4985f6 => android/view/Surface
	i64 7234103110495206036, ; 71: 0x6464b273799d7a94 => android/graphics/Bitmap$Config
	i64 7291810569935423650, ; 72: 0x6531b714667088a2 => android/os/Build$VERSION
	i64 7359209775714103835, ; 73: 0x66212a4cdd05721b => android/content/pm/PackageItemInfo
	i64 7437796681088239247, ; 74: 0x67385cac9fd8068f => java/io/FileDescriptor
	i64 7620119821450638162, ; 75: 0x69c01a9abf7a7352 => java/io/InterruptedIOException
	i64 7658195837123306865, ; 76: 0x6a476089fc1c2571 => java/lang/Character
	i64 7933543037734065265, ; 77: 0x6e199b5bee699471 => java/util/HashMap
	i64 8190305621607579207, ; 78: 0x71a9cf9199cdfe47 => java/nio/channels/spi/AbstractInterruptibleChannel
	i64 8322972551956625025, ; 79: 0x7381237062b37681 => crc64f0e061189adeef62/Compass_SensorListener
	i64 8362058396472415889, ; 80: 0x740bffceb8cf9691 => mono/android/content/DialogInterface_OnCancelListenerImplementor
	i64 8416619862292774857, ; 81: 0x74cdd72bed753fc9 => java/lang/IllegalArgumentException
	i64 8487642170263250902, ; 82: 0x75ca29959b2aa7d6 => android/content/ContextWrapper
	i64 8587172038193766563, ; 83: 0x772bc378d1b4e0a3 => java/lang/Runnable
	i64 8625055343724598723, ; 84: 0x77b25a233aca15c3 => android/provider/MediaStore$Audio$Media
	i64 8719122993390795943, ; 85: 0x79008c2aa5ffbca7 => android/view/OrientationEventListener
	i64 8784751650103882924, ; 86: 0x79e9b5150877f4ac => android/content/res/Configuration
	i64 8950391188589719199, ; 87: 0x7c362d5d64ad2e9f => java/lang/Boolean
	i64 9052904945156302472, ; 88: 0x7da26115516b2688 => android/graphics/Paint
	i64 9154019302997878316, ; 89: 0x7f099c0e5641e62c => javax/net/ssl/KeyManager
	i64 9217569019755338609, ; 90: 0x7feb622fcb299b71 => java/security/Principal
	i64 9286063777946211584, ; 91: 0x80deb9ce6e1b1500 => android/content/res/AssetFileDescriptor
	i64 9360306727378170850, ; 92: 0x81e67d60221333e2 => android/hardware/SensorManager
	i64 9478593896738967145, ; 93: 0x838abaede94fce69 => android/widget/Toast
	i64 9650117721466985813, ; 94: 0x85ec1af06cbddd55 => android/view/KeyCharacterMap
	i64 9667515047141612341, ; 95: 0x8629e9b6f59e9b35 => java/lang/Thread
	i64 9785570804745343508, ; 96: 0x87cd54ccfd479214 => java/net/URL
	i64 9866983915955550238, ; 97: 0x88ee91981305f81e => java/lang/SecurityException
	i64 9869939015140501507, ; 98: 0x88f9113db837e803 => android/app/Activity
	i64 9977296435420958008, ; 99: 0x8a767a3efc098d38 => java/lang/NullPointerException
	i64 10006390178266264615, ; 100: 0x8addd6d9db84b427 => android/media/AudioManager
	i64 10266059374509936169, ; 101: 0x8e785e9bf4bbce29 => java/lang/Long
	i64 10330027021200976477, ; 102: 0x8f5ba0d84edeea5d => android/content/ContentUris
	i64 10341525521370885639, ; 103: 0x8f847aab80f2ae07 => javax/microedition/khronos/egl/EGLSurface
	i64 10499957734077086001, ; 104: 0x91b757ed9047b931 => android/view/ViewGroup$LayoutParams
	i64 10556732314164660806, ; 105: 0x92810c1b96ac0a46 => android/view/WindowManager
	i64 10589642565195629679, ; 106: 0x92f5f7ce84d7846f => java/lang/UnsupportedOperationException
	i64 10722894652849872693, ; 107: 0x94cf5fdfdb0d5f35 => java/lang/Short
	i64 10735120544654490755, ; 108: 0x94facf421d20fc83 => javax/microedition/khronos/egl/EGLDisplay
	i64 10808978037618020601, ; 109: 0x96013441bd3890f9 => android/database/DataSetObserver
	i64 11005920483369566278, ; 110: 0x98bce25e25704046 => java/util/Random
	i64 11112718717483603117, ; 111: 0x9a384ecbbc71d4ad => android/os/Handler
	i64 11280841333105678042, ; 112: 0x9c8d996c8b4ed6da => java/util/function/IntConsumer
	i64 11393831178655295976, ; 113: 0x9e1f05170284e9e8 => javax/net/ssl/SSLContext
	i64 11573301743732151818, ; 114: 0xa09ca09e3190560a => mono/java/lang/RunnableImplementor
	i64 11585998938245262039, ; 115: 0xa0c9bca62a296ad7 => mono/android/runtime/JavaArray
	i64 11712899692065226922, ; 116: 0xa28c94365b5480aa => java/util/ArrayList
	i64 11763058807128842702, ; 117: 0xa33ec7a966f1e1ce => java/security/cert/Certificate
	i64 11954228872253987625, ; 118: 0xa5e5f3d2b66adb29 => android/view/View
	i64 12010988764752805573, ; 119: 0xa6af9aa5044c7ec5 => android/provider/MediaStore$Images
	i64 12016049636675011370, ; 120: 0xa6c1957b1579c32a => android/widget/EditText
	i64 12228984007958404582, ; 121: 0xa9b61429ce4b1de6 => android/content/Context
	i64 12255524138452416756, ; 122: 0xaa145e4578ae78f4 => crc64493ac3851fab1842/MonoGameAndroidGameView
	i64 12426529965699990912, ; 123: 0xac73e72a4c4b8580 => java/lang/IndexOutOfBoundsException
	i64 12458575303368155603, ; 124: 0xace5c03ae4b6a1d3 => android/content/res/Resources
	i64 12476375190645835422, ; 125: 0xad24fd221af1069e => android/os/Looper
	i64 12488842103917764438, ; 126: 0xad5147b98bf5df56 => java/lang/IllegalStateException
	i64 12532121860257401396, ; 127: 0xadeb0a6f128cca34 => java/lang/Number
	i64 12658804585597598720, ; 128: 0xafad1bb38da17c00 => javax/microedition/khronos/egl/EGLConfig
	i64 12751697412850589334, ; 129: 0xb0f7213c503a1e96 => android/provider/Settings$System
	i64 12806567541869262104, ; 130: 0xb1ba1153c52a3518 => java/lang/Integer
	i64 12882710959019299141, ; 131: 0xb2c8955c98609145 => java/net/SocketTimeoutException
	i64 13191394589072141775, ; 132: 0xb7113f7cdda7adcf => android/app/AlertDialog$Builder
	i64 13335777145830317192, ; 133: 0xb91232a87cfd1c88 => android/graphics/Point
	i64 13402681668680117407, ; 134: 0xb9ffe3f79b516c9f => android/view/ViewManager
	i64 13402779434266666368, ; 135: 0xba003ce26e602580 => mono/android/TypeManager
	i64 13491848569179882038, ; 136: 0xbb3cacca71544236 => android/app/AlertDialog
	i64 13493236796125990997, ; 137: 0xbb419b603751d055 => android/graphics/Rect
	i64 13502560151794130917, ; 138: 0xbb62baeb1e089fe5 => javax/security/auth/Subject
	i64 13556576098032765635, ; 139: 0xbc22a222a5cb4ac3 => android/util/DisplayMetrics
	i64 13667817128403725814, ; 140: 0xbdadd7435980edf6 => android/content/DialogInterface$OnCancelListener
	i64 13770727111868296170, ; 141: 0xbf1b735909c02bea => java/io/StringWriter
	i64 13789203013919682202, ; 142: 0xbf5d1715346dae9a => java/lang/RuntimeException
	i64 13805562342397192842, ; 143: 0xbf9735ce2f182a8a => android/util/AttributeSet
	i64 13877554026709814142, ; 144: 0xc096f9dc61548b7e => android/view/View$OnClickListener
	i64 13959986462581077347, ; 145: 0xc1bbd5b97b683563 => java/net/UnknownServiceException
	i64 14031640676547298208, ; 146: 0xc2ba66da3d8603a0 => java/nio/channels/FileChannel
	i64 14122621771724408359, ; 147: 0xc3fda1ad30d4c627 => android/util/AndroidException
	i64 14130685465173083664, ; 148: 0xc41a4790206ac610 => android/provider/Settings$SettingNotFoundException
	i64 14160925941038085484, ; 149: 0xc485b71d9630756c => javax/net/ssl/KeyManagerFactory
	i64 14167891754637755728, ; 150: 0xc49e767c735e8550 => java/lang/Object
	i64 14180814796703042768, ; 151: 0xc4cc5feca7168cd0 => java/lang/ClassCastException
	i64 14206023932851353817, ; 152: 0xc525ef800c4d78d9 => mono/android/runtime/OutputStreamAdapter
	i64 14246866163714017024, ; 153: 0xc5b7094af2b4c700 => crc64493ac3851fab1842/AndroidGameActivity
	i64 14279287371309537477, ; 154: 0xc62a383594a058c5 => android/view/View$OnTouchListener
	i64 14501341618205132561, ; 155: 0xc93f1d5ecfb48711 => java/lang/Byte
	i64 14574847037663328426, ; 156: 0xca444228ef93b8aa => android/graphics/BitmapFactory$Options
	i64 14641895586450310855, ; 157: 0xcb327675b4bb06c7 => crc6472dcb918d50f9b12/Activity1
	i64 14649586819325063784, ; 158: 0xcb4dc998681d7268 => mono/android/view/View_OnClickListenerImplementor
	i64 14684559126920293129, ; 159: 0xcbca08b94b4deb09 => java/lang/CharSequence
	i64 14830759644181035942, ; 160: 0xcdd17151d49bfba6 => android/content/res/AssetManager
	i64 14940408132235664607, ; 161: 0xcf56fe09e1439cdf => java/lang/Throwable
	i64 14940704599466395126, ; 162: 0xcf580bac893d45f6 => android/util/Log
	i64 15142650489578038267, ; 163: 0xd22580641d31a3fb => java/lang/StackTraceElement
	i64 15178898666151156562, ; 164: 0xd2a647ea65971b52 => javax/net/ssl/HostnameVerifier
	i64 15633873768898914415, ; 165: 0xd8f6ad5c6a84686f => java/io/Writer
	i64 15699556301161391558, ; 166: 0xd9e00746adf865c6 => android/view/WindowMetrics
	i64 15767615218119146656, ; 167: 0xdad1d2801f08fca0 => javax/net/ssl/SSLSessionContext
	i64 15888603495552893685, ; 168: 0xdc7fa8b2a175c2f5 => javax/net/ssl/TrustManager
	i64 15896143924811176167, ; 169: 0xdc9a72ada0da98e7 => java/net/SocketException
	i64 16003229482241506982, ; 170: 0xde16e46ce4103ea6 => android/graphics/Bitmap
	i64 16218544741485660249, ; 171: 0xe113d8834a084859 => android/os/Vibrator
	i64 16314168557433322311, ; 172: 0xe26791dde7a8fb47 => android/view/ContextThemeWrapper
	i64 16413651262945443612, ; 173: 0xe3c900dc43013f1c => android/content/DialogInterface$OnClickListener
	i64 16510466397656947047, ; 174: 0xe520f5b6645d9967 => android/provider/MediaStore$Audio
	i64 16542847110558016359, ; 175: 0xe593ffcc9e686367 => android/app/Application
	i64 16603717322881265010, ; 176: 0xe66c40ef55566d72 => mono/android/runtime/JavaObject
	i64 16684630517664605545, ; 177: 0xe78bb70e8e0a6569 => android/media/MediaPlayer$OnCompletionListener
	i64 16723123314454325679, ; 178: 0xe814780d351a69af => mono/android/runtime/InputStreamAdapter
	i64 16832017439803262409, ; 179: 0xe99756ae80a745c9 => android/view/ViewGroup
	i64 17125416866214736517, ; 180: 0xeda9b3e7cd367285 => java/io/OutputStream
	i64 17296586735193580360, ; 181: 0xf009d1fe91f26348 => android/content/pm/ApplicationInfo
	i64 17312589003384955623, ; 182: 0xf042abf8f91822e7 => android/view/KeyEvent
	i64 17485531046532206351, ; 183: 0xf2a915d8319dcf0f => android/database/CharArrayBuffer
	i64 17490083481060646178, ; 184: 0xf2b94242748c1d22 => java/util/Enumeration
	i64 17498018958444438720, ; 185: 0xf2d57388c321a4c0 => java/lang/Double
	i64 17519581955836770800, ; 186: 0xf3220ef752fe79f0 => java/security/KeyStore
	i64 17542023464739623563, ; 187: 0xf371c966495f528b => android/view/Display
	i64 17605619666541934257, ; 188: 0xf453b9cee2dcf6b1 => java/net/Proxy$Type
	i64 17645817129531856090, ; 189: 0xf4e28930113fd4da => java/io/Closeable
	i64 17786854109604896016, ; 190: 0xf6d79992eab25d10 => android/graphics/BitmapFactory
	i64 18216578448169670053, ; 191: 0xfcce4995423095a5 => javax/net/ssl/SSLSocketFactory
	i64 18401512074820890716, ; 192: 0xff5f4dbc95c2b05c => java/lang/Float
	i64 18401692079723824300 ; 193: 0xff5ff1733e0ec4ac => java/util/Collection
], align 8

@module0_managed_to_java = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554434, ; uint32_t type_token_id (0x2000002)
		i32 157; uint32_t java_map_index (0x9d)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554436, ; uint32_t type_token_id (0x2000004)
		i32 60; uint32_t java_map_index (0x3c)
	} ; 1
], align 4

@module1_managed_to_java = internal dso_local constant [6 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554608, ; uint32_t type_token_id (0x20000b0)
		i32 153; uint32_t java_map_index (0x99)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554613, ; uint32_t type_token_id (0x20000b5)
		i32 122; uint32_t java_map_index (0x7a)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554614, ; uint32_t type_token_id (0x20000b6)
		i32 11; uint32_t java_map_index (0xb)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554616, ; uint32_t type_token_id (0x20000b8)
		i32 62; uint32_t java_map_index (0x3e)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33555141, ; uint32_t type_token_id (0x20002c5)
		i32 66; uint32_t java_map_index (0x42)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33555142, ; uint32_t type_token_id (0x20002c6)
		i32 79; uint32_t java_map_index (0x4f)
	} ; 5
], align 4

@module2_managed_to_java = internal dso_local constant [186 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554534, ; uint32_t type_token_id (0x2000066)
		i32 47; uint32_t java_map_index (0x2f)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554536, ; uint32_t type_token_id (0x2000068)
		i32 64; uint32_t java_map_index (0x40)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554538, ; uint32_t type_token_id (0x200006a)
		i32 138; uint32_t java_map_index (0x8a)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554539, ; uint32_t type_token_id (0x200006b)
		i32 56; uint32_t java_map_index (0x38)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554541, ; uint32_t type_token_id (0x200006d)
		i32 7; uint32_t java_map_index (0x7)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554543, ; uint32_t type_token_id (0x200006f)
		i32 164; uint32_t java_map_index (0xa4)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554545, ; uint32_t type_token_id (0x2000071)
		i32 89; uint32_t java_map_index (0x59)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554547, ; uint32_t type_token_id (0x2000073)
		i32 67; uint32_t java_map_index (0x43)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554549, ; uint32_t type_token_id (0x2000075)
		i32 167; uint32_t java_map_index (0xa7)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554551, ; uint32_t type_token_id (0x2000077)
		i32 168; uint32_t java_map_index (0xa8)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554553, ; uint32_t type_token_id (0x2000079)
		i32 149; uint32_t java_map_index (0x95)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554554, ; uint32_t type_token_id (0x200007a)
		i32 113; uint32_t java_map_index (0x71)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554555, ; uint32_t type_token_id (0x200007b)
		i32 191; uint32_t java_map_index (0xbf)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554557, ; uint32_t type_token_id (0x200007d)
		i32 55; uint32_t java_map_index (0x37)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554558, ; uint32_t type_token_id (0x200007e)
		i32 128; uint32_t java_map_index (0x80)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554560, ; uint32_t type_token_id (0x2000080)
		i32 57; uint32_t java_map_index (0x39)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554562, ; uint32_t type_token_id (0x2000082)
		i32 108; uint32_t java_map_index (0x6c)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554564, ; uint32_t type_token_id (0x2000084)
		i32 103; uint32_t java_map_index (0x67)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554566, ; uint32_t type_token_id (0x2000086)
		i32 22; uint32_t java_map_index (0x16)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554568, ; uint32_t type_token_id (0x2000088)
		i32 50; uint32_t java_map_index (0x32)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554571, ; uint32_t type_token_id (0x200008b)
		i32 3; uint32_t java_map_index (0x3)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554572, ; uint32_t type_token_id (0x200008c)
		i32 120; uint32_t java_map_index (0x78)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554573, ; uint32_t type_token_id (0x200008d)
		i32 5; uint32_t java_map_index (0x5)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554574, ; uint32_t type_token_id (0x200008e)
		i32 93; uint32_t java_map_index (0x5d)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554576, ; uint32_t type_token_id (0x2000090)
		i32 147; uint32_t java_map_index (0x93)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554577, ; uint32_t type_token_id (0x2000091)
		i32 139; uint32_t java_map_index (0x8b)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554578, ; uint32_t type_token_id (0x2000092)
		i32 143; uint32_t java_map_index (0x8f)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554580, ; uint32_t type_token_id (0x2000094)
		i32 162; uint32_t java_map_index (0xa2)
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 33554582, ; uint32_t type_token_id (0x2000096)
		i32 53; uint32_t java_map_index (0x35)
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 33554583, ; uint32_t type_token_id (0x2000097)
		i32 174; uint32_t java_map_index (0xae)
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 33554584, ; uint32_t type_token_id (0x2000098)
		i32 84; uint32_t java_map_index (0x54)
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 33554585, ; uint32_t type_token_id (0x2000099)
		i32 119; uint32_t java_map_index (0x77)
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 33554586, ; uint32_t type_token_id (0x200009a)
		i32 26; uint32_t java_map_index (0x1a)
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 33554587, ; uint32_t type_token_id (0x200009b)
		i32 16; uint32_t java_map_index (0x10)
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 33554588, ; uint32_t type_token_id (0x200009c)
		i32 2; uint32_t java_map_index (0x2)
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 33554589, ; uint32_t type_token_id (0x200009d)
		i32 148; uint32_t java_map_index (0x94)
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 33554590, ; uint32_t type_token_id (0x200009e)
		i32 129; uint32_t java_map_index (0x81)
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 33554591, ; uint32_t type_token_id (0x200009f)
		i32 23; uint32_t java_map_index (0x17)
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 33554592, ; uint32_t type_token_id (0x20000a0)
		i32 37; uint32_t java_map_index (0x25)
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 33554593, ; uint32_t type_token_id (0x20000a1)
		i32 72; uint32_t java_map_index (0x48)
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 33554594, ; uint32_t type_token_id (0x20000a2)
		i32 4; uint32_t java_map_index (0x4)
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 33554595, ; uint32_t type_token_id (0x20000a3)
		i32 111; uint32_t java_map_index (0x6f)
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 33554596, ; uint32_t type_token_id (0x20000a4)
		i32 125; uint32_t java_map_index (0x7d)
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 33554597, ; uint32_t type_token_id (0x20000a5)
		i32 171; uint32_t java_map_index (0xab)
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 33554600, ; uint32_t type_token_id (0x20000a8)
		i32 51; uint32_t java_map_index (0x33)
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 33554602, ; uint32_t type_token_id (0x20000aa)
		i32 100; uint32_t java_map_index (0x64)
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 33554603, ; uint32_t type_token_id (0x20000ab)
		i32 6; uint32_t java_map_index (0x6)
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 33554604, ; uint32_t type_token_id (0x20000ac)
		i32 177; uint32_t java_map_index (0xb1)
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 33554606, ; uint32_t type_token_id (0x20000ae)
		i32 14; uint32_t java_map_index (0xe)
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 33554613, ; uint32_t type_token_id (0x20000b5)
		i32 44; uint32_t java_map_index (0x2c)
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 33554615, ; uint32_t type_token_id (0x20000b7)
		i32 48; uint32_t java_map_index (0x30)
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 33554616, ; uint32_t type_token_id (0x20000b8)
		i32 54; uint32_t java_map_index (0x36)
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 33554617, ; uint32_t type_token_id (0x20000b9)
		i32 92; uint32_t java_map_index (0x5c)
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 33554622, ; uint32_t type_token_id (0x20000be)
		i32 183; uint32_t java_map_index (0xb7)
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 33554623, ; uint32_t type_token_id (0x20000bf)
		i32 63; uint32_t java_map_index (0x3f)
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 33554625, ; uint32_t type_token_id (0x20000c1)
		i32 109; uint32_t java_map_index (0x6d)
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 33554627, ; uint32_t type_token_id (0x20000c3)
		i32 27; uint32_t java_map_index (0x1b)
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 33554631, ; uint32_t type_token_id (0x20000c7)
		i32 98; uint32_t java_map_index (0x62)
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 33554632, ; uint32_t type_token_id (0x20000c8)
		i32 136; uint32_t java_map_index (0x88)
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 33554633, ; uint32_t type_token_id (0x20000c9)
		i32 132; uint32_t java_map_index (0x84)
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 33554634, ; uint32_t type_token_id (0x20000ca)
		i32 175; uint32_t java_map_index (0xaf)
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 33554635, ; uint32_t type_token_id (0x20000cb)
		i32 38; uint32_t java_map_index (0x26)
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 33554639, ; uint32_t type_token_id (0x20000cf)
		i32 12; uint32_t java_map_index (0xc)
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 33554643, ; uint32_t type_token_id (0x20000d3)
		i32 172; uint32_t java_map_index (0xac)
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 33554644, ; uint32_t type_token_id (0x20000d4)
		i32 187; uint32_t java_map_index (0xbb)
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 33554645, ; uint32_t type_token_id (0x20000d5)
		i32 69; uint32_t java_map_index (0x45)
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 33554646, ; uint32_t type_token_id (0x20000d6)
		i32 28; uint32_t java_map_index (0x1c)
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 33554648, ; uint32_t type_token_id (0x20000d8)
		i32 43; uint32_t java_map_index (0x2b)
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 33554650, ; uint32_t type_token_id (0x20000da)
		i32 31; uint32_t java_map_index (0x1f)
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 33554652, ; uint32_t type_token_id (0x20000dc)
		i32 134; uint32_t java_map_index (0x86)
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 33554654, ; uint32_t type_token_id (0x20000de)
		i32 105; uint32_t java_map_index (0x69)
	}, ; 70
	%struct.TypeMapModuleEntry {
		i32 33554656, ; uint32_t type_token_id (0x20000e0)
		i32 94; uint32_t java_map_index (0x5e)
	}, ; 71
	%struct.TypeMapModuleEntry {
		i32 33554657, ; uint32_t type_token_id (0x20000e1)
		i32 182; uint32_t java_map_index (0xb6)
	}, ; 72
	%struct.TypeMapModuleEntry {
		i32 33554658, ; uint32_t type_token_id (0x20000e2)
		i32 9; uint32_t java_map_index (0x9)
	}, ; 73
	%struct.TypeMapModuleEntry {
		i32 33554659, ; uint32_t type_token_id (0x20000e3)
		i32 85; uint32_t java_map_index (0x55)
	}, ; 74
	%struct.TypeMapModuleEntry {
		i32 33554661, ; uint32_t type_token_id (0x20000e5)
		i32 70; uint32_t java_map_index (0x46)
	}, ; 75
	%struct.TypeMapModuleEntry {
		i32 33554662, ; uint32_t type_token_id (0x20000e6)
		i32 59; uint32_t java_map_index (0x3b)
	}, ; 76
	%struct.TypeMapModuleEntry {
		i32 33554663, ; uint32_t type_token_id (0x20000e7)
		i32 118; uint32_t java_map_index (0x76)
	}, ; 77
	%struct.TypeMapModuleEntry {
		i32 33554664, ; uint32_t type_token_id (0x20000e8)
		i32 144; uint32_t java_map_index (0x90)
	}, ; 78
	%struct.TypeMapModuleEntry {
		i32 33554666, ; uint32_t type_token_id (0x20000ea)
		i32 158; uint32_t java_map_index (0x9e)
	}, ; 79
	%struct.TypeMapModuleEntry {
		i32 33554667, ; uint32_t type_token_id (0x20000eb)
		i32 154; uint32_t java_map_index (0x9a)
	}, ; 80
	%struct.TypeMapModuleEntry {
		i32 33554672, ; uint32_t type_token_id (0x20000f0)
		i32 179; uint32_t java_map_index (0xb3)
	}, ; 81
	%struct.TypeMapModuleEntry {
		i32 33554673, ; uint32_t type_token_id (0x20000f1)
		i32 104; uint32_t java_map_index (0x68)
	}, ; 82
	%struct.TypeMapModuleEntry {
		i32 33554675, ; uint32_t type_token_id (0x20000f3)
		i32 34; uint32_t java_map_index (0x22)
	}, ; 83
	%struct.TypeMapModuleEntry {
		i32 33554677, ; uint32_t type_token_id (0x20000f5)
		i32 166; uint32_t java_map_index (0xa6)
	}, ; 84
	%struct.TypeMapModuleEntry {
		i32 33554706, ; uint32_t type_token_id (0x2000112)
		i32 178; uint32_t java_map_index (0xb2)
	}, ; 85
	%struct.TypeMapModuleEntry {
		i32 33554708, ; uint32_t type_token_id (0x2000114)
		i32 115; uint32_t java_map_index (0x73)
	}, ; 86
	%struct.TypeMapModuleEntry {
		i32 33554710, ; uint32_t type_token_id (0x2000116)
		i32 193; uint32_t java_map_index (0xc1)
	}, ; 87
	%struct.TypeMapModuleEntry {
		i32 33554712, ; uint32_t type_token_id (0x2000118)
		i32 77; uint32_t java_map_index (0x4d)
	}, ; 88
	%struct.TypeMapModuleEntry {
		i32 33554721, ; uint32_t type_token_id (0x2000121)
		i32 116; uint32_t java_map_index (0x74)
	}, ; 89
	%struct.TypeMapModuleEntry {
		i32 33554723, ; uint32_t type_token_id (0x2000123)
		i32 176; uint32_t java_map_index (0xb0)
	}, ; 90
	%struct.TypeMapModuleEntry {
		i32 33554724, ; uint32_t type_token_id (0x2000124)
		i32 19; uint32_t java_map_index (0x13)
	}, ; 91
	%struct.TypeMapModuleEntry {
		i32 33554725, ; uint32_t type_token_id (0x2000125)
		i32 15; uint32_t java_map_index (0xf)
	}, ; 92
	%struct.TypeMapModuleEntry {
		i32 33554737, ; uint32_t type_token_id (0x2000131)
		i32 152; uint32_t java_map_index (0x98)
	}, ; 93
	%struct.TypeMapModuleEntry {
		i32 33554745, ; uint32_t type_token_id (0x2000139)
		i32 170; uint32_t java_map_index (0xaa)
	}, ; 94
	%struct.TypeMapModuleEntry {
		i32 33554746, ; uint32_t type_token_id (0x200013a)
		i32 71; uint32_t java_map_index (0x47)
	}, ; 95
	%struct.TypeMapModuleEntry {
		i32 33554747, ; uint32_t type_token_id (0x200013b)
		i32 190; uint32_t java_map_index (0xbe)
	}, ; 96
	%struct.TypeMapModuleEntry {
		i32 33554748, ; uint32_t type_token_id (0x200013c)
		i32 156; uint32_t java_map_index (0x9c)
	}, ; 97
	%struct.TypeMapModuleEntry {
		i32 33554749, ; uint32_t type_token_id (0x200013d)
		i32 46; uint32_t java_map_index (0x2e)
	}, ; 98
	%struct.TypeMapModuleEntry {
		i32 33554750, ; uint32_t type_token_id (0x200013e)
		i32 88; uint32_t java_map_index (0x58)
	}, ; 99
	%struct.TypeMapModuleEntry {
		i32 33554751, ; uint32_t type_token_id (0x200013f)
		i32 133; uint32_t java_map_index (0x85)
	}, ; 100
	%struct.TypeMapModuleEntry {
		i32 33554752, ; uint32_t type_token_id (0x2000140)
		i32 137; uint32_t java_map_index (0x89)
	}, ; 101
	%struct.TypeMapModuleEntry {
		i32 33554754, ; uint32_t type_token_id (0x2000142)
		i32 52; uint32_t java_map_index (0x34)
	}, ; 102
	%struct.TypeMapModuleEntry {
		i32 33554756, ; uint32_t type_token_id (0x2000144)
		i32 68; uint32_t java_map_index (0x44)
	}, ; 103
	%struct.TypeMapModuleEntry {
		i32 33554758, ; uint32_t type_token_id (0x2000146)
		i32 102; uint32_t java_map_index (0x66)
	}, ; 104
	%struct.TypeMapModuleEntry {
		i32 33554759, ; uint32_t type_token_id (0x2000147)
		i32 121; uint32_t java_map_index (0x79)
	}, ; 105
	%struct.TypeMapModuleEntry {
		i32 33554761, ; uint32_t type_token_id (0x2000149)
		i32 82; uint32_t java_map_index (0x52)
	}, ; 106
	%struct.TypeMapModuleEntry {
		i32 33554762, ; uint32_t type_token_id (0x200014a)
		i32 140; uint32_t java_map_index (0x8c)
	}, ; 107
	%struct.TypeMapModuleEntry {
		i32 33554764, ; uint32_t type_token_id (0x200014c)
		i32 80; uint32_t java_map_index (0x50)
	}, ; 108
	%struct.TypeMapModuleEntry {
		i32 33554765, ; uint32_t type_token_id (0x200014d)
		i32 173; uint32_t java_map_index (0xad)
	}, ; 109
	%struct.TypeMapModuleEntry {
		i32 33554768, ; uint32_t type_token_id (0x2000150)
		i32 8; uint32_t java_map_index (0x8)
	}, ; 110
	%struct.TypeMapModuleEntry {
		i32 33554769, ; uint32_t type_token_id (0x2000151)
		i32 40; uint32_t java_map_index (0x28)
	}, ; 111
	%struct.TypeMapModuleEntry {
		i32 33554771, ; uint32_t type_token_id (0x2000153)
		i32 36; uint32_t java_map_index (0x24)
	}, ; 112
	%struct.TypeMapModuleEntry {
		i32 33554772, ; uint32_t type_token_id (0x2000154)
		i32 35; uint32_t java_map_index (0x23)
	}, ; 113
	%struct.TypeMapModuleEntry {
		i32 33554773, ; uint32_t type_token_id (0x2000155)
		i32 91; uint32_t java_map_index (0x5b)
	}, ; 114
	%struct.TypeMapModuleEntry {
		i32 33554774, ; uint32_t type_token_id (0x2000156)
		i32 160; uint32_t java_map_index (0xa0)
	}, ; 115
	%struct.TypeMapModuleEntry {
		i32 33554775, ; uint32_t type_token_id (0x2000157)
		i32 86; uint32_t java_map_index (0x56)
	}, ; 116
	%struct.TypeMapModuleEntry {
		i32 33554776, ; uint32_t type_token_id (0x2000158)
		i32 124; uint32_t java_map_index (0x7c)
	}, ; 117
	%struct.TypeMapModuleEntry {
		i32 33554778, ; uint32_t type_token_id (0x200015a)
		i32 41; uint32_t java_map_index (0x29)
	}, ; 118
	%struct.TypeMapModuleEntry {
		i32 33554779, ; uint32_t type_token_id (0x200015b)
		i32 181; uint32_t java_map_index (0xb5)
	}, ; 119
	%struct.TypeMapModuleEntry {
		i32 33554780, ; uint32_t type_token_id (0x200015c)
		i32 73; uint32_t java_map_index (0x49)
	}, ; 120
	%struct.TypeMapModuleEntry {
		i32 33554785, ; uint32_t type_token_id (0x2000161)
		i32 184; uint32_t java_map_index (0xb8)
	}, ; 121
	%struct.TypeMapModuleEntry {
		i32 33554787, ; uint32_t type_token_id (0x2000163)
		i32 20; uint32_t java_map_index (0x14)
	}, ; 122
	%struct.TypeMapModuleEntry {
		i32 33554789, ; uint32_t type_token_id (0x2000165)
		i32 110; uint32_t java_map_index (0x6e)
	}, ; 123
	%struct.TypeMapModuleEntry {
		i32 33554790, ; uint32_t type_token_id (0x2000166)
		i32 13; uint32_t java_map_index (0xd)
	}, ; 124
	%struct.TypeMapModuleEntry {
		i32 33554792, ; uint32_t type_token_id (0x2000168)
		i32 112; uint32_t java_map_index (0x70)
	}, ; 125
	%struct.TypeMapModuleEntry {
		i32 33554794, ; uint32_t type_token_id (0x200016a)
		i32 1; uint32_t java_map_index (0x1)
	}, ; 126
	%struct.TypeMapModuleEntry {
		i32 33554796, ; uint32_t type_token_id (0x200016c)
		i32 90; uint32_t java_map_index (0x5a)
	}, ; 127
	%struct.TypeMapModuleEntry {
		i32 33554798, ; uint32_t type_token_id (0x200016e)
		i32 186; uint32_t java_map_index (0xba)
	}, ; 128
	%struct.TypeMapModuleEntry {
		i32 33554799, ; uint32_t type_token_id (0x200016f)
		i32 32; uint32_t java_map_index (0x20)
	}, ; 129
	%struct.TypeMapModuleEntry {
		i32 33554800, ; uint32_t type_token_id (0x2000170)
		i32 117; uint32_t java_map_index (0x75)
	}, ; 130
	%struct.TypeMapModuleEntry {
		i32 33554802, ; uint32_t type_token_id (0x2000172)
		i32 146; uint32_t java_map_index (0x92)
	}, ; 131
	%struct.TypeMapModuleEntry {
		i32 33554804, ; uint32_t type_token_id (0x2000174)
		i32 78; uint32_t java_map_index (0x4e)
	}, ; 132
	%struct.TypeMapModuleEntry {
		i32 33554806, ; uint32_t type_token_id (0x2000176)
		i32 17; uint32_t java_map_index (0x11)
	}, ; 133
	%struct.TypeMapModuleEntry {
		i32 33554807, ; uint32_t type_token_id (0x2000177)
		i32 30; uint32_t java_map_index (0x1e)
	}, ; 134
	%struct.TypeMapModuleEntry {
		i32 33554809, ; uint32_t type_token_id (0x2000179)
		i32 42; uint32_t java_map_index (0x2a)
	}, ; 135
	%struct.TypeMapModuleEntry {
		i32 33554810, ; uint32_t type_token_id (0x200017a)
		i32 21; uint32_t java_map_index (0x15)
	}, ; 136
	%struct.TypeMapModuleEntry {
		i32 33554811, ; uint32_t type_token_id (0x200017b)
		i32 25; uint32_t java_map_index (0x19)
	}, ; 137
	%struct.TypeMapModuleEntry {
		i32 33554812, ; uint32_t type_token_id (0x200017c)
		i32 188; uint32_t java_map_index (0xbc)
	}, ; 138
	%struct.TypeMapModuleEntry {
		i32 33554813, ; uint32_t type_token_id (0x200017d)
		i32 45; uint32_t java_map_index (0x2d)
	}, ; 139
	%struct.TypeMapModuleEntry {
		i32 33554815, ; uint32_t type_token_id (0x200017f)
		i32 169; uint32_t java_map_index (0xa9)
	}, ; 140
	%struct.TypeMapModuleEntry {
		i32 33554816, ; uint32_t type_token_id (0x2000180)
		i32 131; uint32_t java_map_index (0x83)
	}, ; 141
	%struct.TypeMapModuleEntry {
		i32 33554817, ; uint32_t type_token_id (0x2000181)
		i32 145; uint32_t java_map_index (0x91)
	}, ; 142
	%struct.TypeMapModuleEntry {
		i32 33554818, ; uint32_t type_token_id (0x2000182)
		i32 96; uint32_t java_map_index (0x60)
	}, ; 143
	%struct.TypeMapModuleEntry {
		i32 33554819, ; uint32_t type_token_id (0x2000183)
		i32 61; uint32_t java_map_index (0x3d)
	}, ; 144
	%struct.TypeMapModuleEntry {
		i32 33554822, ; uint32_t type_token_id (0x2000186)
		i32 33; uint32_t java_map_index (0x21)
	}, ; 145
	%struct.TypeMapModuleEntry {
		i32 33554823, ; uint32_t type_token_id (0x2000187)
		i32 74; uint32_t java_map_index (0x4a)
	}, ; 146
	%struct.TypeMapModuleEntry {
		i32 33554824, ; uint32_t type_token_id (0x2000188)
		i32 18; uint32_t java_map_index (0x12)
	}, ; 147
	%struct.TypeMapModuleEntry {
		i32 33554825, ; uint32_t type_token_id (0x2000189)
		i32 189; uint32_t java_map_index (0xbd)
	}, ; 148
	%struct.TypeMapModuleEntry {
		i32 33554827, ; uint32_t type_token_id (0x200018b)
		i32 29; uint32_t java_map_index (0x1d)
	}, ; 149
	%struct.TypeMapModuleEntry {
		i32 33554829, ; uint32_t type_token_id (0x200018d)
		i32 75; uint32_t java_map_index (0x4b)
	}, ; 150
	%struct.TypeMapModuleEntry {
		i32 33554830, ; uint32_t type_token_id (0x200018e)
		i32 24; uint32_t java_map_index (0x18)
	}, ; 151
	%struct.TypeMapModuleEntry {
		i32 33554831, ; uint32_t type_token_id (0x200018f)
		i32 180; uint32_t java_map_index (0xb4)
	}, ; 152
	%struct.TypeMapModuleEntry {
		i32 33554833, ; uint32_t type_token_id (0x2000191)
		i32 39; uint32_t java_map_index (0x27)
	}, ; 153
	%struct.TypeMapModuleEntry {
		i32 33554834, ; uint32_t type_token_id (0x2000192)
		i32 141; uint32_t java_map_index (0x8d)
	}, ; 154
	%struct.TypeMapModuleEntry {
		i32 33554835, ; uint32_t type_token_id (0x2000193)
		i32 165; uint32_t java_map_index (0xa5)
	}, ; 155
	%struct.TypeMapModuleEntry {
		i32 33554837, ; uint32_t type_token_id (0x2000195)
		i32 87; uint32_t java_map_index (0x57)
	}, ; 156
	%struct.TypeMapModuleEntry {
		i32 33554838, ; uint32_t type_token_id (0x2000196)
		i32 155; uint32_t java_map_index (0x9b)
	}, ; 157
	%struct.TypeMapModuleEntry {
		i32 33554839, ; uint32_t type_token_id (0x2000197)
		i32 76; uint32_t java_map_index (0x4c)
	}, ; 158
	%struct.TypeMapModuleEntry {
		i32 33554840, ; uint32_t type_token_id (0x2000198)
		i32 49; uint32_t java_map_index (0x31)
	}, ; 159
	%struct.TypeMapModuleEntry {
		i32 33554841, ; uint32_t type_token_id (0x2000199)
		i32 151; uint32_t java_map_index (0x97)
	}, ; 160
	%struct.TypeMapModuleEntry {
		i32 33554842, ; uint32_t type_token_id (0x200019a)
		i32 185; uint32_t java_map_index (0xb9)
	}, ; 161
	%struct.TypeMapModuleEntry {
		i32 33554843, ; uint32_t type_token_id (0x200019b)
		i32 65; uint32_t java_map_index (0x41)
	}, ; 162
	%struct.TypeMapModuleEntry {
		i32 33554845, ; uint32_t type_token_id (0x200019d)
		i32 58; uint32_t java_map_index (0x3a)
	}, ; 163
	%struct.TypeMapModuleEntry {
		i32 33554846, ; uint32_t type_token_id (0x200019e)
		i32 10; uint32_t java_map_index (0xa)
	}, ; 164
	%struct.TypeMapModuleEntry {
		i32 33554847, ; uint32_t type_token_id (0x200019f)
		i32 192; uint32_t java_map_index (0xc0)
	}, ; 165
	%struct.TypeMapModuleEntry {
		i32 33554848, ; uint32_t type_token_id (0x20001a0)
		i32 159; uint32_t java_map_index (0x9f)
	}, ; 166
	%struct.TypeMapModuleEntry {
		i32 33554851, ; uint32_t type_token_id (0x20001a3)
		i32 81; uint32_t java_map_index (0x51)
	}, ; 167
	%struct.TypeMapModuleEntry {
		i32 33554852, ; uint32_t type_token_id (0x20001a4)
		i32 126; uint32_t java_map_index (0x7e)
	}, ; 168
	%struct.TypeMapModuleEntry {
		i32 33554853, ; uint32_t type_token_id (0x20001a5)
		i32 123; uint32_t java_map_index (0x7b)
	}, ; 169
	%struct.TypeMapModuleEntry {
		i32 33554854, ; uint32_t type_token_id (0x20001a6)
		i32 130; uint32_t java_map_index (0x82)
	}, ; 170
	%struct.TypeMapModuleEntry {
		i32 33554855, ; uint32_t type_token_id (0x20001a7)
		i32 83; uint32_t java_map_index (0x53)
	}, ; 171
	%struct.TypeMapModuleEntry {
		i32 33554857, ; uint32_t type_token_id (0x20001a9)
		i32 101; uint32_t java_map_index (0x65)
	}, ; 172
	%struct.TypeMapModuleEntry {
		i32 33554858, ; uint32_t type_token_id (0x20001aa)
		i32 99; uint32_t java_map_index (0x63)
	}, ; 173
	%struct.TypeMapModuleEntry {
		i32 33554859, ; uint32_t type_token_id (0x20001ab)
		i32 127; uint32_t java_map_index (0x7f)
	}, ; 174
	%struct.TypeMapModuleEntry {
		i32 33554861, ; uint32_t type_token_id (0x20001ad)
		i32 150; uint32_t java_map_index (0x96)
	}, ; 175
	%struct.TypeMapModuleEntry {
		i32 33554862, ; uint32_t type_token_id (0x20001ae)
		i32 142; uint32_t java_map_index (0x8e)
	}, ; 176
	%struct.TypeMapModuleEntry {
		i32 33554863, ; uint32_t type_token_id (0x20001af)
		i32 97; uint32_t java_map_index (0x61)
	}, ; 177
	%struct.TypeMapModuleEntry {
		i32 33554864, ; uint32_t type_token_id (0x20001b0)
		i32 107; uint32_t java_map_index (0x6b)
	}, ; 178
	%struct.TypeMapModuleEntry {
		i32 33554865, ; uint32_t type_token_id (0x20001b1)
		i32 163; uint32_t java_map_index (0xa3)
	}, ; 179
	%struct.TypeMapModuleEntry {
		i32 33554866, ; uint32_t type_token_id (0x20001b2)
		i32 0; uint32_t java_map_index (0x0)
	}, ; 180
	%struct.TypeMapModuleEntry {
		i32 33554868, ; uint32_t type_token_id (0x20001b4)
		i32 95; uint32_t java_map_index (0x5f)
	}, ; 181
	%struct.TypeMapModuleEntry {
		i32 33554869, ; uint32_t type_token_id (0x20001b5)
		i32 114; uint32_t java_map_index (0x72)
	}, ; 182
	%struct.TypeMapModuleEntry {
		i32 33554870, ; uint32_t type_token_id (0x20001b6)
		i32 161; uint32_t java_map_index (0xa1)
	}, ; 183
	%struct.TypeMapModuleEntry {
		i32 33554871, ; uint32_t type_token_id (0x20001b7)
		i32 106; uint32_t java_map_index (0x6a)
	}, ; 184
	%struct.TypeMapModuleEntry {
		i32 33554886, ; uint32_t type_token_id (0x20001c6)
		i32 135; uint32_t java_map_index (0x87)
	} ; 185
], align 4

@module2_managed_to_java_duplicates = internal dso_local constant [67 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554535, ; uint32_t type_token_id (0x2000067)
		i32 47; uint32_t java_map_index (0x2f)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554537, ; uint32_t type_token_id (0x2000069)
		i32 64; uint32_t java_map_index (0x40)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554540, ; uint32_t type_token_id (0x200006c)
		i32 56; uint32_t java_map_index (0x38)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554542, ; uint32_t type_token_id (0x200006e)
		i32 7; uint32_t java_map_index (0x7)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554544, ; uint32_t type_token_id (0x2000070)
		i32 164; uint32_t java_map_index (0xa4)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554546, ; uint32_t type_token_id (0x2000072)
		i32 89; uint32_t java_map_index (0x59)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554548, ; uint32_t type_token_id (0x2000074)
		i32 67; uint32_t java_map_index (0x43)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554550, ; uint32_t type_token_id (0x2000076)
		i32 167; uint32_t java_map_index (0xa7)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554552, ; uint32_t type_token_id (0x2000078)
		i32 168; uint32_t java_map_index (0xa8)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554556, ; uint32_t type_token_id (0x200007c)
		i32 191; uint32_t java_map_index (0xbf)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554559, ; uint32_t type_token_id (0x200007f)
		i32 128; uint32_t java_map_index (0x80)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554561, ; uint32_t type_token_id (0x2000081)
		i32 57; uint32_t java_map_index (0x39)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554563, ; uint32_t type_token_id (0x2000083)
		i32 108; uint32_t java_map_index (0x6c)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554565, ; uint32_t type_token_id (0x2000085)
		i32 103; uint32_t java_map_index (0x67)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554567, ; uint32_t type_token_id (0x2000087)
		i32 22; uint32_t java_map_index (0x16)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554569, ; uint32_t type_token_id (0x2000089)
		i32 50; uint32_t java_map_index (0x32)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554570, ; uint32_t type_token_id (0x200008a)
		i32 50; uint32_t java_map_index (0x32)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554579, ; uint32_t type_token_id (0x2000093)
		i32 143; uint32_t java_map_index (0x8f)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554598, ; uint32_t type_token_id (0x20000a6)
		i32 171; uint32_t java_map_index (0xab)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554601, ; uint32_t type_token_id (0x20000a9)
		i32 51; uint32_t java_map_index (0x33)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554605, ; uint32_t type_token_id (0x20000ad)
		i32 177; uint32_t java_map_index (0xb1)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554614, ; uint32_t type_token_id (0x20000b6)
		i32 44; uint32_t java_map_index (0x2c)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554618, ; uint32_t type_token_id (0x20000ba)
		i32 92; uint32_t java_map_index (0x5c)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554624, ; uint32_t type_token_id (0x20000c0)
		i32 63; uint32_t java_map_index (0x3f)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554626, ; uint32_t type_token_id (0x20000c2)
		i32 109; uint32_t java_map_index (0x6d)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554628, ; uint32_t type_token_id (0x20000c4)
		i32 27; uint32_t java_map_index (0x1b)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554647, ; uint32_t type_token_id (0x20000d7)
		i32 28; uint32_t java_map_index (0x1c)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554649, ; uint32_t type_token_id (0x20000d9)
		i32 43; uint32_t java_map_index (0x2b)
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 33554651, ; uint32_t type_token_id (0x20000db)
		i32 31; uint32_t java_map_index (0x1f)
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 33554653, ; uint32_t type_token_id (0x20000dd)
		i32 134; uint32_t java_map_index (0x86)
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 33554655, ; uint32_t type_token_id (0x20000df)
		i32 105; uint32_t java_map_index (0x69)
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 33554660, ; uint32_t type_token_id (0x20000e4)
		i32 85; uint32_t java_map_index (0x55)
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 33554665, ; uint32_t type_token_id (0x20000e9)
		i32 144; uint32_t java_map_index (0x90)
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 33554668, ; uint32_t type_token_id (0x20000ec)
		i32 154; uint32_t java_map_index (0x9a)
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 33554674, ; uint32_t type_token_id (0x20000f2)
		i32 179; uint32_t java_map_index (0xb3)
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 33554676, ; uint32_t type_token_id (0x20000f4)
		i32 34; uint32_t java_map_index (0x22)
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 33554711, ; uint32_t type_token_id (0x2000117)
		i32 193; uint32_t java_map_index (0xc1)
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 33554717, ; uint32_t type_token_id (0x200011d)
		i32 77; uint32_t java_map_index (0x4d)
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 33554722, ; uint32_t type_token_id (0x2000122)
		i32 116; uint32_t java_map_index (0x74)
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 33554726, ; uint32_t type_token_id (0x2000126)
		i32 15; uint32_t java_map_index (0xf)
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 33554755, ; uint32_t type_token_id (0x2000143)
		i32 52; uint32_t java_map_index (0x34)
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 33554757, ; uint32_t type_token_id (0x2000145)
		i32 68; uint32_t java_map_index (0x44)
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 33554760, ; uint32_t type_token_id (0x2000148)
		i32 121; uint32_t java_map_index (0x79)
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 33554763, ; uint32_t type_token_id (0x200014b)
		i32 140; uint32_t java_map_index (0x8c)
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 33554766, ; uint32_t type_token_id (0x200014e)
		i32 173; uint32_t java_map_index (0xad)
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 33554770, ; uint32_t type_token_id (0x2000152)
		i32 40; uint32_t java_map_index (0x28)
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 33554781, ; uint32_t type_token_id (0x200015d)
		i32 41; uint32_t java_map_index (0x29)
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 33554786, ; uint32_t type_token_id (0x2000162)
		i32 184; uint32_t java_map_index (0xb8)
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 33554788, ; uint32_t type_token_id (0x2000164)
		i32 20; uint32_t java_map_index (0x14)
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 33554791, ; uint32_t type_token_id (0x2000167)
		i32 13; uint32_t java_map_index (0xd)
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 33554793, ; uint32_t type_token_id (0x2000169)
		i32 112; uint32_t java_map_index (0x70)
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 33554795, ; uint32_t type_token_id (0x200016b)
		i32 1; uint32_t java_map_index (0x1)
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 33554797, ; uint32_t type_token_id (0x200016d)
		i32 90; uint32_t java_map_index (0x5a)
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 33554801, ; uint32_t type_token_id (0x2000171)
		i32 117; uint32_t java_map_index (0x75)
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 33554803, ; uint32_t type_token_id (0x2000173)
		i32 146; uint32_t java_map_index (0x92)
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 33554805, ; uint32_t type_token_id (0x2000175)
		i32 78; uint32_t java_map_index (0x4e)
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 33554808, ; uint32_t type_token_id (0x2000178)
		i32 30; uint32_t java_map_index (0x1e)
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 33554814, ; uint32_t type_token_id (0x200017e)
		i32 45; uint32_t java_map_index (0x2d)
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 33554820, ; uint32_t type_token_id (0x2000184)
		i32 61; uint32_t java_map_index (0x3d)
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 33554826, ; uint32_t type_token_id (0x200018a)
		i32 189; uint32_t java_map_index (0xbd)
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 33554828, ; uint32_t type_token_id (0x200018c)
		i32 29; uint32_t java_map_index (0x1d)
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 33554832, ; uint32_t type_token_id (0x2000190)
		i32 180; uint32_t java_map_index (0xb4)
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 33554836, ; uint32_t type_token_id (0x2000194)
		i32 165; uint32_t java_map_index (0xa5)
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 33554844, ; uint32_t type_token_id (0x200019c)
		i32 65; uint32_t java_map_index (0x41)
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 33554849, ; uint32_t type_token_id (0x20001a1)
		i32 159; uint32_t java_map_index (0x9f)
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 33554856, ; uint32_t type_token_id (0x20001a8)
		i32 83; uint32_t java_map_index (0x53)
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 33554860, ; uint32_t type_token_id (0x20001ac)
		i32 127; uint32_t java_map_index (0x7f)
	} ; 66
], align 4

; Java to managed map
@map_java = dso_local local_unnamed_addr constant [194 x %struct.TypeMapJava] [
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554866, ; uint32_t type_token_id (0x20001b2)
		i32 188; uint32_t java_name_index (0xbc)
	}, ; 0
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 134; uint32_t java_name_index (0x86)
	}, ; 1
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554588, ; uint32_t type_token_id (0x200009c)
		i32 42; uint32_t java_name_index (0x2a)
	}, ; 2
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554571, ; uint32_t type_token_id (0x200008b)
		i32 28; uint32_t java_name_index (0x1c)
	}, ; 3
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554594, ; uint32_t type_token_id (0x20000a2)
		i32 48; uint32_t java_name_index (0x30)
	}, ; 4
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554573, ; uint32_t type_token_id (0x200008d)
		i32 30; uint32_t java_name_index (0x1e)
	}, ; 5
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554603, ; uint32_t type_token_id (0x20000ab)
		i32 54; uint32_t java_name_index (0x36)
	}, ; 6
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554541, ; uint32_t type_token_id (0x200006d)
		i32 12; uint32_t java_name_index (0xc)
	}, ; 7
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554768, ; uint32_t type_token_id (0x2000150)
		i32 118; uint32_t java_name_index (0x76)
	}, ; 8
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554658, ; uint32_t type_token_id (0x20000e2)
		i32 81; uint32_t java_name_index (0x51)
	}, ; 9
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554846, ; uint32_t type_token_id (0x200019e)
		i32 172; uint32_t java_name_index (0xac)
	}, ; 10
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554614, ; uint32_t type_token_id (0x20000b6)
		i32 6; uint32_t java_name_index (0x6)
	}, ; 11
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554639, ; uint32_t type_token_id (0x20000cf)
		i32 70; uint32_t java_name_index (0x46)
	}, ; 12
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 132; uint32_t java_name_index (0x84)
	}, ; 13
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554606, ; uint32_t type_token_id (0x20000ae)
		i32 56; uint32_t java_name_index (0x38)
	}, ; 14
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554725, ; uint32_t type_token_id (0x2000125)
		i32 100; uint32_t java_name_index (0x64)
	}, ; 15
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554587, ; uint32_t type_token_id (0x200009b)
		i32 41; uint32_t java_name_index (0x29)
	}, ; 16
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554806, ; uint32_t type_token_id (0x2000176)
		i32 141; uint32_t java_name_index (0x8d)
	}, ; 17
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554824, ; uint32_t type_token_id (0x2000188)
		i32 155; uint32_t java_name_index (0x9b)
	}, ; 18
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554724, ; uint32_t type_token_id (0x2000124)
		i32 99; uint32_t java_name_index (0x63)
	}, ; 19
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 130; uint32_t java_name_index (0x82)
	}, ; 20
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554810, ; uint32_t type_token_id (0x200017a)
		i32 144; uint32_t java_name_index (0x90)
	}, ; 21
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 26; uint32_t java_name_index (0x1a)
	}, ; 22
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554591, ; uint32_t type_token_id (0x200009f)
		i32 45; uint32_t java_name_index (0x2d)
	}, ; 23
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554830, ; uint32_t type_token_id (0x200018e)
		i32 159; uint32_t java_name_index (0x9f)
	}, ; 24
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554811, ; uint32_t type_token_id (0x200017b)
		i32 145; uint32_t java_name_index (0x91)
	}, ; 25
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554586, ; uint32_t type_token_id (0x200009a)
		i32 40; uint32_t java_name_index (0x28)
	}, ; 26
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 64; uint32_t java_name_index (0x40)
	}, ; 27
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554646, ; uint32_t type_token_id (0x20000d6)
		i32 74; uint32_t java_name_index (0x4a)
	}, ; 28
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554827, ; uint32_t type_token_id (0x200018b)
		i32 157; uint32_t java_name_index (0x9d)
	}, ; 29
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554807, ; uint32_t type_token_id (0x2000177)
		i32 142; uint32_t java_name_index (0x8e)
	}, ; 30
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 76; uint32_t java_name_index (0x4c)
	}, ; 31
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554799, ; uint32_t type_token_id (0x200016f)
		i32 137; uint32_t java_name_index (0x89)
	}, ; 32
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554822, ; uint32_t type_token_id (0x2000186)
		i32 153; uint32_t java_name_index (0x99)
	}, ; 33
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554675, ; uint32_t type_token_id (0x20000f3)
		i32 91; uint32_t java_name_index (0x5b)
	}, ; 34
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554772, ; uint32_t type_token_id (0x2000154)
		i32 121; uint32_t java_name_index (0x79)
	}, ; 35
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554771, ; uint32_t type_token_id (0x2000153)
		i32 120; uint32_t java_name_index (0x78)
	}, ; 36
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554592, ; uint32_t type_token_id (0x20000a0)
		i32 46; uint32_t java_name_index (0x2e)
	}, ; 37
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554635, ; uint32_t type_token_id (0x20000cb)
		i32 69; uint32_t java_name_index (0x45)
	}, ; 38
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554833, ; uint32_t type_token_id (0x2000191)
		i32 161; uint32_t java_name_index (0xa1)
	}, ; 39
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 119; uint32_t java_name_index (0x77)
	}, ; 40
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554778, ; uint32_t type_token_id (0x200015a)
		i32 126; uint32_t java_name_index (0x7e)
	}, ; 41
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554809, ; uint32_t type_token_id (0x2000179)
		i32 143; uint32_t java_name_index (0x8f)
	}, ; 42
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 75; uint32_t java_name_index (0x4b)
	}, ; 43
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 57; uint32_t java_name_index (0x39)
	}, ; 44
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554813, ; uint32_t type_token_id (0x200017d)
		i32 147; uint32_t java_name_index (0x93)
	}, ; 45
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554749, ; uint32_t type_token_id (0x200013d)
		i32 106; uint32_t java_name_index (0x6a)
	}, ; 46
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554534, ; uint32_t type_token_id (0x2000066)
		i32 8; uint32_t java_name_index (0x8)
	}, ; 47
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554615, ; uint32_t type_token_id (0x20000b7)
		i32 58; uint32_t java_name_index (0x3a)
	}, ; 48
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554840, ; uint32_t type_token_id (0x2000198)
		i32 167; uint32_t java_name_index (0xa7)
	}, ; 49
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554568, ; uint32_t type_token_id (0x2000088)
		i32 27; uint32_t java_name_index (0x1b)
	}, ; 50
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554600, ; uint32_t type_token_id (0x20000a8)
		i32 52; uint32_t java_name_index (0x34)
	}, ; 51
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554754, ; uint32_t type_token_id (0x2000142)
		i32 110; uint32_t java_name_index (0x6e)
	}, ; 52
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554582, ; uint32_t type_token_id (0x2000096)
		i32 36; uint32_t java_name_index (0x24)
	}, ; 53
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554616, ; uint32_t type_token_id (0x20000b8)
		i32 59; uint32_t java_name_index (0x3b)
	}, ; 54
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554557, ; uint32_t type_token_id (0x200007d)
		i32 21; uint32_t java_name_index (0x15)
	}, ; 55
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554539, ; uint32_t type_token_id (0x200006b)
		i32 11; uint32_t java_name_index (0xb)
	}, ; 56
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554560, ; uint32_t type_token_id (0x2000080)
		i32 23; uint32_t java_name_index (0x17)
	}, ; 57
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554845, ; uint32_t type_token_id (0x200019d)
		i32 171; uint32_t java_name_index (0xab)
	}, ; 58
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554662, ; uint32_t type_token_id (0x20000e6)
		i32 84; uint32_t java_name_index (0x54)
	}, ; 59
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554436, ; uint32_t type_token_id (0x2000004)
		i32 1; uint32_t java_name_index (0x1)
	}, ; 60
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554819, ; uint32_t type_token_id (0x2000183)
		i32 152; uint32_t java_name_index (0x98)
	}, ; 61
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554616, ; uint32_t type_token_id (0x20000b8)
		i32 7; uint32_t java_name_index (0x7)
	}, ; 62
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554623, ; uint32_t type_token_id (0x20000bf)
		i32 62; uint32_t java_name_index (0x3e)
	}, ; 63
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554536, ; uint32_t type_token_id (0x2000068)
		i32 9; uint32_t java_name_index (0x9)
	}, ; 64
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554843, ; uint32_t type_token_id (0x200019b)
		i32 170; uint32_t java_name_index (0xaa)
	}, ; 65
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555141, ; uint32_t type_token_id (0x20002c5)
		i32 2; uint32_t java_name_index (0x2)
	}, ; 66
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 15; uint32_t java_name_index (0xf)
	}, ; 67
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554756, ; uint32_t type_token_id (0x2000144)
		i32 111; uint32_t java_name_index (0x6f)
	}, ; 68
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554645, ; uint32_t type_token_id (0x20000d5)
		i32 73; uint32_t java_name_index (0x49)
	}, ; 69
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554661, ; uint32_t type_token_id (0x20000e5)
		i32 83; uint32_t java_name_index (0x53)
	}, ; 70
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554746, ; uint32_t type_token_id (0x200013a)
		i32 103; uint32_t java_name_index (0x67)
	}, ; 71
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554593, ; uint32_t type_token_id (0x20000a1)
		i32 47; uint32_t java_name_index (0x2f)
	}, ; 72
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554780, ; uint32_t type_token_id (0x200015c)
		i32 128; uint32_t java_name_index (0x80)
	}, ; 73
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554823, ; uint32_t type_token_id (0x2000187)
		i32 154; uint32_t java_name_index (0x9a)
	}, ; 74
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554829, ; uint32_t type_token_id (0x200018d)
		i32 158; uint32_t java_name_index (0x9e)
	}, ; 75
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554839, ; uint32_t type_token_id (0x2000197)
		i32 166; uint32_t java_name_index (0xa6)
	}, ; 76
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554712, ; uint32_t type_token_id (0x2000118)
		i32 96; uint32_t java_name_index (0x60)
	}, ; 77
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554804, ; uint32_t type_token_id (0x2000174)
		i32 140; uint32_t java_name_index (0x8c)
	}, ; 78
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33555142, ; uint32_t type_token_id (0x20002c6)
		i32 3; uint32_t java_name_index (0x3)
	}, ; 79
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554764, ; uint32_t type_token_id (0x200014c)
		i32 116; uint32_t java_name_index (0x74)
	}, ; 80
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554851, ; uint32_t type_token_id (0x20001a3)
		i32 175; uint32_t java_name_index (0xaf)
	}, ; 81
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554761, ; uint32_t type_token_id (0x2000149)
		i32 114; uint32_t java_name_index (0x72)
	}, ; 82
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 179; uint32_t java_name_index (0xb3)
	}, ; 83
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554584, ; uint32_t type_token_id (0x2000098)
		i32 38; uint32_t java_name_index (0x26)
	}, ; 84
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554659, ; uint32_t type_token_id (0x20000e3)
		i32 82; uint32_t java_name_index (0x52)
	}, ; 85
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554775, ; uint32_t type_token_id (0x2000157)
		i32 124; uint32_t java_name_index (0x7c)
	}, ; 86
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554837, ; uint32_t type_token_id (0x2000195)
		i32 164; uint32_t java_name_index (0xa4)
	}, ; 87
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554750, ; uint32_t type_token_id (0x200013e)
		i32 107; uint32_t java_name_index (0x6b)
	}, ; 88
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 14; uint32_t java_name_index (0xe)
	}, ; 89
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 135; uint32_t java_name_index (0x87)
	}, ; 90
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554773, ; uint32_t type_token_id (0x2000155)
		i32 122; uint32_t java_name_index (0x7a)
	}, ; 91
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554617, ; uint32_t type_token_id (0x20000b9)
		i32 60; uint32_t java_name_index (0x3c)
	}, ; 92
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554574, ; uint32_t type_token_id (0x200008e)
		i32 31; uint32_t java_name_index (0x1f)
	}, ; 93
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554656, ; uint32_t type_token_id (0x20000e0)
		i32 79; uint32_t java_name_index (0x4f)
	}, ; 94
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554868, ; uint32_t type_token_id (0x20001b4)
		i32 189; uint32_t java_name_index (0xbd)
	}, ; 95
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554818, ; uint32_t type_token_id (0x2000182)
		i32 151; uint32_t java_name_index (0x97)
	}, ; 96
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554863, ; uint32_t type_token_id (0x20001af)
		i32 185; uint32_t java_name_index (0xb9)
	}, ; 97
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554631, ; uint32_t type_token_id (0x20000c7)
		i32 65; uint32_t java_name_index (0x41)
	}, ; 98
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554858, ; uint32_t type_token_id (0x20001aa)
		i32 181; uint32_t java_name_index (0xb5)
	}, ; 99
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554602, ; uint32_t type_token_id (0x20000aa)
		i32 53; uint32_t java_name_index (0x35)
	}, ; 100
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554857, ; uint32_t type_token_id (0x20001a9)
		i32 180; uint32_t java_name_index (0xb4)
	}, ; 101
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554758, ; uint32_t type_token_id (0x2000146)
		i32 112; uint32_t java_name_index (0x70)
	}, ; 102
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554564, ; uint32_t type_token_id (0x2000084)
		i32 25; uint32_t java_name_index (0x19)
	}, ; 103
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554673, ; uint32_t type_token_id (0x20000f1)
		i32 90; uint32_t java_name_index (0x5a)
	}, ; 104
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 78; uint32_t java_name_index (0x4e)
	}, ; 105
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554871, ; uint32_t type_token_id (0x20001b7)
		i32 192; uint32_t java_name_index (0xc0)
	}, ; 106
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554864, ; uint32_t type_token_id (0x20001b0)
		i32 186; uint32_t java_name_index (0xba)
	}, ; 107
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554562, ; uint32_t type_token_id (0x2000082)
		i32 24; uint32_t java_name_index (0x18)
	}, ; 108
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554625, ; uint32_t type_token_id (0x20000c1)
		i32 63; uint32_t java_name_index (0x3f)
	}, ; 109
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554789, ; uint32_t type_token_id (0x2000165)
		i32 131; uint32_t java_name_index (0x83)
	}, ; 110
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554595, ; uint32_t type_token_id (0x20000a3)
		i32 49; uint32_t java_name_index (0x31)
	}, ; 111
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 133; uint32_t java_name_index (0x85)
	}, ; 112
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554554, ; uint32_t type_token_id (0x200007a)
		i32 19; uint32_t java_name_index (0x13)
	}, ; 113
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554869, ; uint32_t type_token_id (0x20001b5)
		i32 190; uint32_t java_name_index (0xbe)
	}, ; 114
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 94; uint32_t java_name_index (0x5e)
	}, ; 115
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554721, ; uint32_t type_token_id (0x2000121)
		i32 97; uint32_t java_name_index (0x61)
	}, ; 116
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554800, ; uint32_t type_token_id (0x2000170)
		i32 138; uint32_t java_name_index (0x8a)
	}, ; 117
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554663, ; uint32_t type_token_id (0x20000e7)
		i32 85; uint32_t java_name_index (0x55)
	}, ; 118
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554585, ; uint32_t type_token_id (0x2000099)
		i32 39; uint32_t java_name_index (0x27)
	}, ; 119
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554572, ; uint32_t type_token_id (0x200008c)
		i32 29; uint32_t java_name_index (0x1d)
	}, ; 120
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554759, ; uint32_t type_token_id (0x2000147)
		i32 113; uint32_t java_name_index (0x71)
	}, ; 121
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554613, ; uint32_t type_token_id (0x20000b5)
		i32 5; uint32_t java_name_index (0x5)
	}, ; 122
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554853, ; uint32_t type_token_id (0x20001a5)
		i32 177; uint32_t java_name_index (0xb1)
	}, ; 123
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554776, ; uint32_t type_token_id (0x2000158)
		i32 125; uint32_t java_name_index (0x7d)
	}, ; 124
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554596, ; uint32_t type_token_id (0x20000a4)
		i32 50; uint32_t java_name_index (0x32)
	}, ; 125
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554852, ; uint32_t type_token_id (0x20001a4)
		i32 176; uint32_t java_name_index (0xb0)
	}, ; 126
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554859, ; uint32_t type_token_id (0x20001ab)
		i32 182; uint32_t java_name_index (0xb6)
	}, ; 127
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554558, ; uint32_t type_token_id (0x200007e)
		i32 22; uint32_t java_name_index (0x16)
	}, ; 128
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554590, ; uint32_t type_token_id (0x200009e)
		i32 44; uint32_t java_name_index (0x2c)
	}, ; 129
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554854, ; uint32_t type_token_id (0x20001a6)
		i32 178; uint32_t java_name_index (0xb2)
	}, ; 130
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554816, ; uint32_t type_token_id (0x2000180)
		i32 149; uint32_t java_name_index (0x95)
	}, ; 131
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554633, ; uint32_t type_token_id (0x20000c9)
		i32 67; uint32_t java_name_index (0x43)
	}, ; 132
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554751, ; uint32_t type_token_id (0x200013f)
		i32 108; uint32_t java_name_index (0x6c)
	}, ; 133
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 77; uint32_t java_name_index (0x4d)
	}, ; 134
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554886, ; uint32_t type_token_id (0x20001c6)
		i32 193; uint32_t java_name_index (0xc1)
	}, ; 135
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554632, ; uint32_t type_token_id (0x20000c8)
		i32 66; uint32_t java_name_index (0x42)
	}, ; 136
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554752, ; uint32_t type_token_id (0x2000140)
		i32 109; uint32_t java_name_index (0x6d)
	}, ; 137
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554538, ; uint32_t type_token_id (0x200006a)
		i32 10; uint32_t java_name_index (0xa)
	}, ; 138
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554577, ; uint32_t type_token_id (0x2000091)
		i32 33; uint32_t java_name_index (0x21)
	}, ; 139
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 115; uint32_t java_name_index (0x73)
	}, ; 140
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554834, ; uint32_t type_token_id (0x2000192)
		i32 162; uint32_t java_name_index (0xa2)
	}, ; 141
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554862, ; uint32_t type_token_id (0x20001ae)
		i32 184; uint32_t java_name_index (0xb8)
	}, ; 142
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 34; uint32_t java_name_index (0x22)
	}, ; 143
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 86; uint32_t java_name_index (0x56)
	}, ; 144
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554817, ; uint32_t type_token_id (0x2000181)
		i32 150; uint32_t java_name_index (0x96)
	}, ; 145
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554802, ; uint32_t type_token_id (0x2000172)
		i32 139; uint32_t java_name_index (0x8b)
	}, ; 146
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554576, ; uint32_t type_token_id (0x2000090)
		i32 32; uint32_t java_name_index (0x20)
	}, ; 147
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554589, ; uint32_t type_token_id (0x200009d)
		i32 43; uint32_t java_name_index (0x2b)
	}, ; 148
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554553, ; uint32_t type_token_id (0x2000079)
		i32 18; uint32_t java_name_index (0x12)
	}, ; 149
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554861, ; uint32_t type_token_id (0x20001ad)
		i32 183; uint32_t java_name_index (0xb7)
	}, ; 150
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554841, ; uint32_t type_token_id (0x2000199)
		i32 168; uint32_t java_name_index (0xa8)
	}, ; 151
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554737, ; uint32_t type_token_id (0x2000131)
		i32 101; uint32_t java_name_index (0x65)
	}, ; 152
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554608, ; uint32_t type_token_id (0x20000b0)
		i32 4; uint32_t java_name_index (0x4)
	}, ; 153
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 88; uint32_t java_name_index (0x58)
	}, ; 154
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554838, ; uint32_t type_token_id (0x2000196)
		i32 165; uint32_t java_name_index (0xa5)
	}, ; 155
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554748, ; uint32_t type_token_id (0x200013c)
		i32 105; uint32_t java_name_index (0x69)
	}, ; 156
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554434, ; uint32_t type_token_id (0x2000002)
		i32 0; uint32_t java_name_index (0x0)
	}, ; 157
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554666, ; uint32_t type_token_id (0x20000ea)
		i32 87; uint32_t java_name_index (0x57)
	}, ; 158
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 174; uint32_t java_name_index (0xae)
	}, ; 159
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554774, ; uint32_t type_token_id (0x2000156)
		i32 123; uint32_t java_name_index (0x7b)
	}, ; 160
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554870, ; uint32_t type_token_id (0x20001b6)
		i32 191; uint32_t java_name_index (0xbf)
	}, ; 161
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554580, ; uint32_t type_token_id (0x2000094)
		i32 35; uint32_t java_name_index (0x23)
	}, ; 162
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554865, ; uint32_t type_token_id (0x20001b1)
		i32 187; uint32_t java_name_index (0xbb)
	}, ; 163
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 13; uint32_t java_name_index (0xd)
	}, ; 164
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554835, ; uint32_t type_token_id (0x2000193)
		i32 163; uint32_t java_name_index (0xa3)
	}, ; 165
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554677, ; uint32_t type_token_id (0x20000f5)
		i32 92; uint32_t java_name_index (0x5c)
	}, ; 166
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 16; uint32_t java_name_index (0x10)
	}, ; 167
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 17; uint32_t java_name_index (0x11)
	}, ; 168
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554815, ; uint32_t type_token_id (0x200017f)
		i32 148; uint32_t java_name_index (0x94)
	}, ; 169
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554745, ; uint32_t type_token_id (0x2000139)
		i32 102; uint32_t java_name_index (0x66)
	}, ; 170
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554597, ; uint32_t type_token_id (0x20000a5)
		i32 51; uint32_t java_name_index (0x33)
	}, ; 171
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554643, ; uint32_t type_token_id (0x20000d3)
		i32 71; uint32_t java_name_index (0x47)
	}, ; 172
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 117; uint32_t java_name_index (0x75)
	}, ; 173
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554583, ; uint32_t type_token_id (0x2000097)
		i32 37; uint32_t java_name_index (0x25)
	}, ; 174
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554634, ; uint32_t type_token_id (0x20000ca)
		i32 68; uint32_t java_name_index (0x44)
	}, ; 175
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554723, ; uint32_t type_token_id (0x2000123)
		i32 98; uint32_t java_name_index (0x62)
	}, ; 176
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 55; uint32_t java_name_index (0x37)
	}, ; 177
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554706, ; uint32_t type_token_id (0x2000112)
		i32 93; uint32_t java_name_index (0x5d)
	}, ; 178
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554672, ; uint32_t type_token_id (0x20000f0)
		i32 89; uint32_t java_name_index (0x59)
	}, ; 179
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554831, ; uint32_t type_token_id (0x200018f)
		i32 160; uint32_t java_name_index (0xa0)
	}, ; 180
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554779, ; uint32_t type_token_id (0x200015b)
		i32 127; uint32_t java_name_index (0x7f)
	}, ; 181
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554657, ; uint32_t type_token_id (0x20000e1)
		i32 80; uint32_t java_name_index (0x50)
	}, ; 182
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554622, ; uint32_t type_token_id (0x20000be)
		i32 61; uint32_t java_name_index (0x3d)
	}, ; 183
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 129; uint32_t java_name_index (0x81)
	}, ; 184
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554842, ; uint32_t type_token_id (0x200019a)
		i32 169; uint32_t java_name_index (0xa9)
	}, ; 185
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554798, ; uint32_t type_token_id (0x200016e)
		i32 136; uint32_t java_name_index (0x88)
	}, ; 186
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554644, ; uint32_t type_token_id (0x20000d4)
		i32 72; uint32_t java_name_index (0x48)
	}, ; 187
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554812, ; uint32_t type_token_id (0x200017c)
		i32 146; uint32_t java_name_index (0x92)
	}, ; 188
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 156; uint32_t java_name_index (0x9c)
	}, ; 189
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554747, ; uint32_t type_token_id (0x200013b)
		i32 104; uint32_t java_name_index (0x68)
	}, ; 190
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554555, ; uint32_t type_token_id (0x200007b)
		i32 20; uint32_t java_name_index (0x14)
	}, ; 191
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554847, ; uint32_t type_token_id (0x200019f)
		i32 173; uint32_t java_name_index (0xad)
	}, ; 192
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554710, ; uint32_t type_token_id (0x2000116)
		i32 95; uint32_t java_name_index (0x5f)
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
], align 8

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
