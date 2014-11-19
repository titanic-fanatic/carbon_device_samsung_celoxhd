## Carbon-KK Build Instructions for CeloxHD

### Setting Up The Source Tree
You will first need to follow the instructions at http://source.android.com/source/initializing.html to setup and initialize your build environment.

Next, you will need to setup your working directory, download repo and init the Carbon-KK repo in your new working directory:
```
1) mkdir ~/carbon-kk
2) cd ~/carbon-kk
3) curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo
4) chmod a+x ~/bin/repo
5) repo init -u https://github.com/CarbonDev/android.git -b kk
```
The rest of the commands must be executed while in ~/carbon-kk

### Syncing Additionl Repositories
To allow these additional repositories to be synced, you must create a file called local_manifest.xml at ~/carbon-kk/.repo/local_manifests:
```
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <!-- Device Specific Repositories -->
  <project name="titanic-fanatic/carbon_device_samsung_celoxhd" path="device/samsung/celoxhd" remote="gh" revision="kk" />
  <project name="titanic-fanatic/android_vendor_samsung_celoxhd" path="vendor/samsung/celoxhd" remote="gh" revision="cm-11.0" />
  
  <!-- Common Repositories -->
  <project name="titanic-fanatic/android_device_samsung_msm8660-common" path="device/samsung/msm8660-common" remote="gh" revision="cm-11.0" />
  <project name="CyanogenMod/android_device_samsung_qcom-common" path="device/samsung/qcom-common" remote="gh" revision="cm-11.0" />
  <project name="titanic-fanatic/android_device_samsung_celox-common" path="device/samsung/celox-common" remote="gh" revision="cm-11.0" />
  <project name="titanic-fanatic/android_kernel_samsung_msm8660-common" path="kernel/samsung/msm8660-common" remote="gh" revision="cm-11.0" />
  
  <!-- Remove default repos to replace with our own forked repos -->
  <remove-project name="CarbonDev/android_frameworks_base" />
  <remove-project name="CarbonDev/android_packages_apps_CarbonFibers" />
  <remove-project name="CarbonDev/android_packages_apps_PerformanceControl" />
  <remove-project name="CarbonDev/android_packages_apps_Settings" />
  
  <!-- Repositories to replace the ones removed above -->
  <project name="titanic-fanatic/carbon_frameworks_base" path="frameworks/base" remote="gh" revision="kk" />
  <project name="titanic-fanatic/carbon_packages_apps_CarbonFibers" path="packages/apps/CarbonFibers" remote="gh" revision="kk" />
  <project name="titanic-fanatic/carbon_packages_apps_PerformanceControl" path="packages/apps/PerformanceControl" remote="gh" revision="kk" />
  <project name="titanic-fanatic/carbon_packages_apps_Settings" path="packages/apps/Settings" remote="gh" revision="kk" />
  
  <!-- Build script for the celoxhd -->
  <project name="titanic-fanatic/android_build_scripts" path="buildtools" remote="gh" revision="carbon-kk">
    <copyfile dest="start_build.sh" src="start_build.sh" />
    <copyfile dest="fixzip.sh" src="fixzip.sh" />
  </project>
</manifest>
```
**NOTE:** The above manifest.xml will build Carbon with the Slim Recents integrated instead of Carbon's Recents app. to build Carbon with it's default recents app, remove all of the replacement repositories except for carbon_packages_apps_PerformanceControl and also remove the "remove-project" lines for each. Make sure you repo sync after this so that your local copy of the source reflects these changes. 

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
    -p    Sync pre-builts before build (CyanogenMod ROMs ONLY)
```
The first time you run this script, assuming you have not already run a repo sync, should be run with the -s option to allow all repositories to be synced before build.

**NOTE:** Only one command line argument will be accepted and all options can be combined into one command -csp (order of options is unimportant).


### OPTIONAL: If you want to build ClockworkMod:
```
. build/envsetup.sh
. build/tools/device/makerecoveries.sh cm_celoxhd-eng 
```

