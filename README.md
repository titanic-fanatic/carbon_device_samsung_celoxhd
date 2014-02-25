## CM11.0 Build Instructions for CeloxHD

### Setting Up The Source Tree
You will first need to follow the instructions at http://source.android.com/source/initializing.html to setup and initialize your build environment.

Next, you will need to setup your working directory, download repo and init the CM10.2 repo in your new working directory:
```
1) mkdir ~/cm-11.0
2) cd ~/cm-11.0
3) curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo
4) chmod a+x ~/bin/repo
5) repo init -u git://github.com/CyanogenMod/android.git -b cm-11.0
```
The rest of the commands must be executed while in ~/cm-11.0

### Syncing Additionl Repositories
To allow these additional repositories to be synced, you must create a file called local_manifest.xml at .repo/local_manifests:
```
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="CyanogenMod/android_device_samsung_celox-common" path="device/samsung/celox-common" remote="github" revision="cm-11.0" />
  <project name="CyanogenMod/android_device_samsung_qcom-common" path="device/samsung/qcom-common" remote="github" revision="cm-11.0" />
  <project name="titanic-fanatic/android_device_samsung_celoxhd" path="device/samsung/celoxhd" remote="github" revision="cm-11.0" />
  <project name="titanic-fanatic/android_vendor_samsung_celoxhd" path="vendor/samsung/celoxhd" remote="github" revision="cm-11.0" />
  <project name="titanic-fanatic/android_kernel_samsung_msm8660-common" path="kernel/samsung/msm8660-common" remote="github" revision="cm-11.0" />
  <project name="titanic-fanatic/android_build_scripts" path="./" remote="github" revision="cm-11.0" />
  
  <!--<project name="titanic-fanatic/android_device_samsung_msm8660-common" path="device/samsung/msm8660-common" remote="github" revision="cm-11.0" />
  <project name="titanic-fanatic/android_packages_apps_Settings" path="packages/apps/Settings" remote="github" revision="cm-11.0" />-->
</manifest>
```
**NOTE:** If you want to build in the Advanced Device Settings, un-comment the last two repositories to sync from my github instead of CyanogenMod.

### Optimize your Linux installation for future rebuilds:
```
echo "export USE_CCACHE=1" >> ~/.bashrc
prebuilts/misc/linux-x86/ccache/ccache -M 20G
source ~/.bashrc
```
**NOTE:** 20GB cache here, but can be changed later

### Build Script
There should be a build script located at the root of your working directory named start_build.sh. This script should be used to start the build process:
```
./start_build.sh [OPTION(s)]
    -c    Clobber out directory before build
    -s    Sync repositories before build
    -p    Sync pre-builts before build
```
The first time you run this script, assuming you have not already run a repo sync and/or syncing the CM pre-builts, should be run with the -sp options to allow all repositories and pre-builts to be synced before build.

**NOTE:** Only one command line argument will be accepted and all options can be combined into one command -csp (order of options is unimportant).


### OPTIONAL: If you want to build ClockworkMod:
```
. build/envsetup.sh
. build/tools/device/makerecoveries.sh cm_celoxhd-eng 
```

