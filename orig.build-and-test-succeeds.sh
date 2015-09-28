#!/bin/sh

# Clean the build/ directory
xcodebuild -alltargets -configuration Debug -sdk iphonesimulator clean SYMROOT=build OBJROOT=build/Intermediates

# Run the tests against iPhone 6 simulator, but store all built products in build/
# let xcodebuild know that it's going to have to build before it can test
xcodebuild -scheme simulator-launch-timeout-includes-build -configuration Debug build test -destination "platform=iOS Simulator,name=iPhone 6" SYMROOT=build OBJROOT=build/Intermediates
