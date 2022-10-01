.. _installSO:


Installation Instructions
=========================

Choosing the right version
--------------------------
System Optimiser is available for Linux, macOS and Windows.

Until v0.5.3, users could choose between several versions, each optimised for a different type of processor (znver1, sky, avx2-generic, avx-generic, sse42-generic),
to archieve optimum execution speed and make full use of their hardware.

In v0.5.3, this process has been streamlined. Now there is only one version per operating system and System Optimiser automagically chooses the best version for the current hardware
in the background. Currently available versions are znver1 (AMD Zen), skl (most modern Intel CPUs), avx2-generic, avx-generic and sse42-generic. The chosen version can be viewed via *File -> About -> Corelib build in use*

macOS is an exception to this rule. Because Apple has both x64 (Intel) and ARM64 (Apple Silicon) CPUs and a combined executable would be twice as large, System Optimiser is being shipped
in two versions for macOS, one for x64 (Intel) and one for ARM64 (Apple Silicon). **Please note that the default version for download is currently for Intel**. It is not possible to execute
the version for Apple Silicon on an Intel based platform. It is possible to run the version for Intel on an Apple Silicon based platform with Rosetta. **Please note that this approach is strongly discouraged,
because a native version for Apple Silicon is available**. The version for Apple Silicon can be downloaded in the dropdown. The dropdown is made visible by clicking the small arrow below the Apple logo.


**MacOS**
    * Download the .dmg file from the :ref:`System Optimiser website<website>`.
    * Install System Optimiser according to your practises, e.g. by moving the *coda-system-optimiser.app* file to your Applications directory.
    * Run the application

**Windows/Linux**
    * Download the .exe or .AppImage file from the :ref:`System Optimiser website<website>`
    * Move the downloaded file to a directory of your choice
    * Run the application


Upon running System Optimiser for the first time, the :ref:`Data Version Manager<DVM>` will open and prompt you to log in, and can be used to download the latest dataset.