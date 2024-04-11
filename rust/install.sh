#!/bin/bash
make init # install dependencies
make all # build the project

# copy libraries to the corresponding directories
cp ./target/aarch64-apple-ios-sim/release/libinfra_did_binding.a ../ios/libinfra_did_binding.a

cp ./target/aarch64-linux-android/release/libinfra_did_binding.so ../android/src/main/jniLibs/arm64-v8a/libinfra_did_binding.so
cp ./target/armv7-linux-androideabi/release/libinfra_did_binding.so ../android/src/main/jniLibs/armeabi-v7a/libinfra_did_binding.so
cp ./target/i686-linux-android/release/libinfra_did_binding.so ../android/src/main/jniLibs/x86/libinfra_did_binding.so
cp ./target/x86_64-linux-android/release/libinfra_did_binding.so ../android/src/main/jniLibs/x86_64/libinfra_did_binding.so