#!/bin/sh

# Clean the build/ directory
xcodebuild -alltargets -configuration Debug -sdk iphonesimulator clean SYMROOT=build OBJROOT=build/Intermediates

# Run the tests against iPhone 6 simulator, but store all built products in build/
xcodebuild -scheme simulator-launch-timeout-includes-build -configuration Debug test -destination "platform=iOS Simulator,name=iPhone 6" SYMROOT=build OBJROOT=build/Intermediates
