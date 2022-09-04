#!/usr/bin/env bash
# Use for running in a window on desktop.
java \
  -Dglass.platform=gtk \
  -Djava.library.path=/opt/javafx-sdk-20/lib \
  -Dmonocle.platform.traceConfig=true \
  -Dprism.verbose=true \
  -Djavafx.verbose=true \
  --module-path .:/opt/javafx-sdk-20/lib \
  --add-modules javafx.controls \
  --module com.maehem.example/com.maehem.example.JavaFxExample $@
