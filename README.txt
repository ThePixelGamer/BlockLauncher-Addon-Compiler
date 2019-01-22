If you don't already have an addon to compile:
http://zhuoweizhang.net/addongen/

------------------------------------------------------

Stuff this compiler needs:

Android NDK (latest) - https://developer.android.com/ndk/downloads/ 
Android NDK (recommended for this) - (32bit): http://dl.google.com/android/ndk/android-ndk-r9d-windows-x86.zip (64bit): http://dl.google.com/android/ndk/android-ndk-r9d-windows-x86_64.zip
Android SDK (latest, 1/22/19) - https://dl.google.com/android/repository/sdk-tools-windows-4333796.zip
Android SDK (latest, scroll down) - https://developer.android.com/studio/#downloads
Apache Ant (latest binary distribution zip) - http://ant.apache.org/bindownload.cgi
Java DK (top left, whatever os/bit system you're running on) - http://www.oracle.com/technetwork/java/javase/downloads/index.html

------------------------------------------------------

Install Instructions:

1. Extract the ndk, sdk and ant somewhere (I suggest putting them in one folder)
2. Go ahead and install the JDK
3. Go into android-sdk -> tools -> android.bat
4. Install these items 

	Tools
		Android SDK Platform-tools
		Android SDK Build-Tools Rev (latest)
	Android x.x.x (API xx) xx is the version number in androidmanifest.xml and project.properties                      
		SDK Platform
		ARM EABI v7a System Image
		Google APIs ARM EABI v7a System Image (if you want intel support do the same thing as the ones above, but for intel)
		Google APIs (7.0 and below)
		Sources for Android SDK
	Extras
		Android Support Repository
		Google USB driver
		
5. While they download and install go to android-ndk -> build -> core -> setup-toolchain.mk and comment (#) out
line 37 (TARGET_TOOLCHAIN_LIST := $(filter-out %4.7 %4.8,$(TARGET_TOOLCHAIN_LIST)))
6. Right click BLAC.exe and click "Run as administrator" to setup everything before you start compiling
7. Enter in the directories by either typing or using the "Browse..." button
7.5 If you think you've messed something up click the "Restore" checkbox and then click "Reset"
7.51 You can use this to uninstall but becareful because it resets the PATH environment variable back to how it was when you installed it

------------------------------------------------------

Running Instructions:
1. Enter in the base directory of the addon by either typing or using the "Browse..." button
2. Click compile
2.5 It saves up to 10 of your most recent compile directories so easy recompiling :D

------------------------------------------------------

Compiler should be idiot proof, if not dm me/tweet at me @ThePixelCoder
Also avoid deleting any files you see with the exe because they're semi-important