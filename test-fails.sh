#!/bin/sh

# Run the tests against iPhone 6 simulator, but store all built products in build/
# let xcodebuild know that it's going to have to build before it can test
xcodebuild -scheme simulator-launch-timeout-includes-build \
  clean test \
  -destination "platform=iOS Simulator,name=iPhone 6"
