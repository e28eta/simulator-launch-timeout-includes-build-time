# `xcodebuild test` vs `xcodebuild build test`

This is a sample project demonstrating an Xcode bug.

### Given

1. An iOS application 
 * created from the "Single View Application" template
2. whose build takes > 120 seconds 
 * faked with a Run Script phase that sleeps for 125 seconds

### `test-only-fails.sh`

This build script runs `xcodebuild test`.  During the build process, xcodebuild logs:

    xcodebuild[54591:624937]  iPhoneSimulator: Timed out waiting 120 seconds for simulator to boot, current state is 1.
    
Just after xcodebuild `touches` the `xctest` bundle, it reports

    ** TEST FAILED **

without even trying to launch the simulator.

### `build-and-test-succeeds.sh`

This build script runs `xcodebuild build test`. It takes just as long as the previous script
to execute, but the iPhoneSimulator does not time out waiting to boot. Instead, the tests
launch and run successfully.
