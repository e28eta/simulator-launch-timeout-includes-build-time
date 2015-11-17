# `xcodebuild test` vs `xcodebuild build test`

This is a sample project demonstrating an Xcode bug.

Related Radar link: https://openradar.appspot.com/22413115

### Given

1. An iOS application
 * created from the "Single View Application" template
2. whose build takes > 120 seconds
 * faked with a Run Script phase that sleeps for 125 seconds

### Notes

* Xcode 7.1: there might have been changes / improvements, as running `bash test-fails.sh` did not fail if the iOS Simulator was running, only if you don't have the simulator open (which is usually the case on a CI server/service)
  * this practically means that if you run `bash test-ok.sh` first and then `bash test-fails.sh` it'll work with Xcode 7.1, but not if you close the iOS Simulator and you just run `bash test-fails.sh`
* Xcode 7.0, Xcode 6.4: running `bash test-fails.sh` it failes in every case

### `orig.test-only-fails.sh` / `test-fail.sh`

*Note: `test-fail.sh` is a minimized version of the original `orig.test-only-fails.sh`
script, fails just like the original, more verbose version.*

This build script runs `xcodebuild test`.  During the build process, xcodebuild logs:

    xcodebuild[54591:624937]  iPhoneSimulator: Timed out waiting 120 seconds for simulator to boot, current state is 1.

Just after xcodebuild `touches` the `xctest` bundle, it reports

    ** TEST FAILED **

without even trying to launch the simulator.

### `orig.build-and-test-succeeds.sh` / `test-ok.sh`

*Note: `test-ok.sh` is a minimized version of the original `orig.build-and-test-succeeds.sh`
script, succeeds just like the original, more verbose version.*

This build script runs `xcodebuild build test`. It takes just as long as the previous script
to execute, but the iPhoneSimulator does not time out waiting to boot. Instead, the tests
launch and run successfully.
