#!/usr/bin/env bash
# don't need /sbin/init calls if we are already non-windowsystem.
#/sbin/init 3
# This enables DRM(Direct Render). Commercial license and pre-releases only.
export ENABLE_GLUON_COMMERCIAL_EXTENSIONS=true
export JAVAFX_VER=20
export GLUON_VER=1.1.7
java \
  -Degl.displayid=/dev/dri/card0 \
  -Dembedded=monocle \
  -Dglass.platform=Monocle \
  -Dmonocle.egl.lib=/opt/javafx-sdk-${JAVAFX_VER}/lib/libgluon_drm-${GLUON_VER}.so \
  -Djava.library.path=/opt/javafx-sdk-${JAVAFX_VER}/lib \
  -Dmonocle.platform.traceConfig=false \
  -Dprism.verbose=true \
  -Djavafx.verbose=false \
  -Dmonocle.platform=EGL \
  --module-path .:/opt/javafx-sdk-${JAVAFX_VER}/lib \
  --add-modules javafx.controls \
  --module com.maehem.example/com.maehem.example.JavaFxExample $@
#/sbin/init 5

