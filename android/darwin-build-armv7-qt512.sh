BUILD_DIR=build-armv7-512
rm -rf $BUILD_DIR/*
mkdir -p $BUILD_DIR

export PLATFORM_LEVEL=29
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home/
export ANDROID_SDK=/Users/Shared/Android/Sdk
export ANDROID_NDK=/Users/Shared/Android/Sdk/ndk/18.1.5063045
export ANDROID_NATIVE_API_LEVEL=24
export ANDROID_SDK_MINVER=24
export ANDROID_SDK_TARGET=26
export QT_DIR=/Users/Shared/Qt/5.12.12/android_armv7

cmake .. -B $BUILD_DIR -DCMAKE_SYSTEM_NAME=Android \
-DCMAKE_PREFIX_PATH=$QT_DIR \
-DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
-DCMAKE_MAKE_PROGRAM=$ANDROID_NDK/prebuilt/darwin-x86_64/bin/make \
-DCMAKE_BUILD_TYPE=Release \
-DANDROID_ABI="armeabi-v7a" \
-DANDROID_STL_PREFIX="llvm-libc++" \
-DANDROID_STL_SHARED_LIBRARIES="c++_shared" \
-DANDROID_SDK_MINVER=$ANDROID_SDK_MINVER \
-DANDROID_SDK_TARGET=$ANDROID_SDK_TARGET \
-DANDROID_NATIVE_API_LEVEL=$ANDROID_NATIVE_API_LEVEL \
-DQT_ANDROID_PLATFORM_LEVEL=$PLATFORM_LEVEL \
-DQT_ANDROID_TOOL_PREFIX="arm-linux-androideabi" \
-DQT_ANDROID_SDK_ROOT=$ANDROID_SDK \
-DQT_ANDROID_NDK_ROOT=$ANDROID_NDK \
-DQT_ANDROID_QT_ROOT=$QT_DIR \
-DQT_ANDROID_SDK_BUILDTOOLS_REVISION="21.0.0" \
-DQt5_DIR=$QT_DIR/lib/cmake/Qt5 \
-DQt5Core_DIR=$QT_DIR/lib/cmake/Qt5Core \
-DQt5Gui_DIR=$QT_DIR/lib/cmake/Qt5Gui \
-DQt5Qml_DIR=$QT_DIR/lib/cmake/Qt5Qml \
-DQt5Network_DIR=$QT_DIR/lib/cmake/Qt5Network \
-DQt5Quick_DIR=$QT_DIR/lib/cmake/Qt5Quick \
-DQt5QuickControls2_DIR=$QT_DIR/lib/cmake/Qt5QuickControls2 \
-DQt5Xml_DIR=$QT_DIR/lib/cmake/Qt5Xml \
-DQt5Svg_DIR=$QT_DIR/lib/cmake/Qt5Svg \
-DQt5Widgets_DIR=$QT_DIR/lib/cmake/Qt5Widgets \
-DQt5Sensors_DIR=$QT_DIR/lib/cmake/Qt5Sensors \
-DQt5Positioning_DIR=$QT_DIR/lib/cmake/Qt5Positioning \
-DQt5Multimedia_DIR=$QT_DIR/lib/cmake/Qt5Multimedia \
-DQt5AndroidExtras_DIR=$QT_DIR/lib/cmake/Qt5AndroidExtras \
-DQt5RemoteObjects_DIR=$QT_DIR/lib/cmake/Qt5RemoteObjects \
$@

[ $? -eq 0 ] && cmake --build $BUILD_DIR --parallel 4

