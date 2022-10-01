Release Notes
=========================

CODA System Optimiser Changelog

---------------

**Beta v0.6.0**


- Completely rework the way sound pressure levels are calculated

    - Maximum achievable sound pressure levels are now calculated by CODA's proprietary innovative and no-compromise :ref:`realSPL technolgy<maximumspl>`
    - Displayed / calculated SPL values are now maximum continuous or peak sound levels.
    - Almost all algorithms, which e.g. also calculate third-octave band levels, have been revised
    - Default SPL values shown are continuous RMS sound levels and can be changed to (continuous) peak sound levels (crest factor added) in the Preferences

- Add "Bottom Height" and "Bottom Angle" readout
- Fix a bug that would sometimes show an error message when opening System Optimiser
- General performance improvements
- Fix error when working with arrays which had templates "in the middle" deleted

    - If you have an array controller (applies to all HPS/HSA/SVA) with three templates and delete the second one, the bug would occur
    - This applied to both loading after storing arrays to files (venue files or source export files) as well as clicking the "X" button at the top of the controller editor window

- Adjust the icon colour of System Optimiser to match other CODA software products
- Add D5 speaker
- Changed behaviour of Vertical Arrays when a speaker has no link group assigned

    - Speakers which do not have a Link Group assigned are now muted instead of having a default preset assigned

- Stimuli:

    - EIA-426B and DIN-IEC 268 have been removed
    - Available stimuli:

        - White Noise (Periodic Noise)
        - Pink Noise (Periodic Noise)
        - Speech Noise (Male, 2020 as defined in IEC 60268-16)
        - AES75-2022
        - A-Weighted Pink Noise (Periodic Noise)
    
- 3D View

    - New arrangement of the options for the displayed values
    - From left to right:

        - Stimulus
        - Band (1/3 Oct (third octave), 1 Oct (octave band), Broadband (total level))
        - Frequency
        - Weighting (Z/A/C)

- Microphones

    - New concept: Mic Sets

        - Microphones can be grouped
        - This allows the easy and efficient use of several independent mic dialogues
        - Microphones from previous version files are migrated to a group called 'Migrated Project Microphones'

    - Microphones can now be named
    - Split into two modes: 2FR and SPA

        - 2FR is a dual channel FFT frequency response, most useful to optimise the frequency response of the system

            - 2FR can be normalised (level shifted) to some automatic or user defined value (setting the 0dB point)
            - Options: Smoothing and Average Curve

        - SPA is a spectrum analyser to evaluate the maximum achievable sound pressure level

            - Options (from left to right):

                - Smoothing
                - Stimulus
                - Weighting
                - Band Mode

                    - ASD (Amplitude Spectral Density), quasi continuous version of Max SPL frequency response
                    - 1/24 Oct
                    - 1/3 Oct (third octave band)
                    - 1 Oct (octave band)

                - Average curve

            - For the microphones themselves, the total sound pressure level (RMS) for the selected combination of options is displayed

- Probes

    - Probes are only available in 2FR mode

        - Options are identical to microphones in 2FR mode
        - Probes can be normalised (level shifted) to some automatic or user defined value (setting the 0dB point)

    - Colours no longer change when the site angle of the array is changed and some speakers then no longer hit a surface.
    - Button next to the speaker shows whether the respective speaker hits a surface and has a curve (red = does not hit a surface)

- New window / panel: Maximum SPL

    - This window determines the Max SPL setting (stimulus input level) for all other SPA calculations (Microphones / 3D view)
    - This window offers a detailed analysis of the system's headrooms
    - Limiting factors can be found very precisely this way
    - Options:

        - Stimulus: Selection of the stimulus
        - Mode: Automatic or Manual
        - Default is Auto, where the system is driven in such a way that no loudspeaker is limiting.
        - In Manual Mode, a manual input level of the signal (RMS) into the amplifiers can be set.
        - manual mode can be useful for example if you're either willing to sacrifice dynamics (you shouldn't!) or if you're assessing noise pollution when the audience is treated with a certain level below the maximum capability of the system.

    - If the maximum input level is exceeded in Manual Mode (shown on the right), the red "OVR" light warns of this condition.

---------------

**Beta v0.5.4**

- Fixed a bug that would crash System Optimiser on reloads (e.g. after dataset change)
- Fixed a big that would render System Optimiser unusable if venue files with a corrupted microphones section were loaded

---------------

**Beta v0.5.3**

-   Dataset changes

    -   TiRAY series is now available
    -   D12 is now available
    -   Angles of the combination "N-RAY below N-RAY with NR-LINK" were corrected
- A native version for Apple Silicon (Apple M1) is now available
- The versions for different processor (avx2-generic, avx2-generic, sse42-generic, skl, znver1) were merged into a single version

    - System Optimiser now automatically chooses the best version for the current hardware and thus ensures optimal efficiency and minimum calculation times
    - The used version can be viewed via "File -> About" ("Corelib build in use: <used version>")
    - Crashes due to an incompatible version should not occur any longer
    - For Windows and Linux, there is only a single binary
    - For MacOS, there are two versions: One for Intel based hardware and one for Apple Silicon based hardware
    - System Optimiser warns if it is executed via Rosetta
    - CODA Audio discourages and strongly recommends against using System Optimiser via Rosetta, because a native version is available 
- Fixed a bug that could made System Optimiser crash when switching between different views
- General dependency updates and minor fixes to improve performance and reliability

---------------

**Beta v0.5.2**

-   Dataset changes

    -   Replace omnidirectional balloons for SCV (& reversed), SC2 and SCN
    -   Update acoustic centre positions for SCV (& reversed), SC2 and SCN
    -   Slightly adjust SCP balloon to be in line with SCV, SC2 and SCN balloons
    -   Increase maximum frequency of SCP, SC2 and SCV (& reversed)
-   Improve Free Plane (Polygon) visualisation in edit mode
-   Add "Reset View" option to context-menu (right click) of default views (Venue, Sources, Rigging) to quickly reset views without the Quick Command Line

---------------

**Beta v0.5.1**

-   Dataset changes

    -   Added HOPS12
    -   Added N-RAY 105°
    -   Updated Presets and added new ones (e.g. CardioX, SCN-SUB, new latency variants)
    -   Fixed N-RAY 120° / 90° presets
    -   Added CoRAY4 + CoRAY4L
-   Improved phase processing algorithms for spatial SPL distribution in MF / HF range even closer to reality
-   Added confirmation dialogs to prevent accidental data loss
-   HPS now allows to turn speakers (left, right, upside down, custom angle)
-   Added option in HPS to quickly set acoustical variants of all speakers
-   Fix a bug that occasionally prevented to change from dual to single pickpoint
-   Add a warning in SVA if asymmetric coupler configurations are used

--------------------------

**Beta v0.5**

-   Added XYZ support for free-planes. Includes algorithms for:

    -   Detection for when ‘all points describe a line’.
    -   Detection for duplicate points.
    -   Surface fitting – making the plane ‘fit’ a certain set of inaccurate / incomplete co-ordinates.
-   Added detection for self-intersecting surfaces.
-   Redesigned floorplan editor.

    -   Implemented Transparency
    -   Supports aspect ratio linking.
    -   Depth / Width mirroring.
-   3D Scene axis lines are now bold in the positive direction.
-   Fixed bug with arc arrangement in SVA / HSA, where “Chord Length” didn’t allow scrolling.
-   Fixed bug with mapping being inverted in some cases on sectors.
-   Fixed bug with free plane mapping being inverted in some cases.
-   Application now remembers & restores window state (layout & zoom) on mac.
-   Fixed issue where application crashed when loading certain files.
-   Added custom colour scales:

    -   New ‘CODA’ colour scale.
    -   Different scales for day / night.
-   Added RGB / HEX / HSL methods for all colour pickers.
-   Fixed window zoom level not being passed to ‘popped-out’ windows.
-   Fixed issues with throw lines not being accurately drawn on some sector surfaces.
-   Removed HF shelf / human / array / distance electronic filters from HSA controller.
-   Removed Distance filter from SVA controller filters section.
-   Fixed bug with source delay values being incorrectly applied.
-   Fixed issue with stack layout table not loading correctly when the ‘Stereo’ button was pressed.
-   Added methods to right click context menu of sources list:

    -   Duplicate.
    -   Split.
    -   Add Fills – (for HSA).
-   Added methods to right click context menu of venue list:

    -   Mark children as scenery.
    -   Mark children as not scenery.
    -   Mark children as obstacle.
    -   Mark children as not obstacle.
-   Added methods to venue layer group controller:

    -   Colour picker for all children.
    -   Mark children as scenery.
    -   Mark children as not scenery.
    -   Mark children as obstacle.
    -   Mark children as not obstacle.
-   Fixed issue where mapping was blocked when any surface in the layers list was disabled.
-   Fixed issue whereby surfaces marked as ‘disabled’ were still processed in some cases.
-   Added mics & probes to standard layout of Sources view.
-   Added QCL command to collapse visual / source groups.
-   Fixed bug where ‘set as default’ buttons would not work in some cases.
-   Fixed bug with dragging layer entities over groups in the layers list would cause glitches.
-   Added 3D Mode to rigging tab side view.
-   Fixed bugs with ‘circle / ellipse’ arrangement for sector angles less than 360°.

    -   Rotation angles of instances were incorrect – (not tangent).
    -   Phase did not work for angle < 360o.
-   New features in microphones:

    -   Ability to place microphones with XYZ coordinates.
    -   Fixed bug that allowed to you to delete all microphones.
    -   Added smoothing:

        -   3 oct.
        -   1 oct.
        -   1/3 oct.
        -   1/6 oct.
        -   1/12 oct.

    -   Added SPL readouts for TF’s.
    -   Added source stimulus for TF measurements SPL readouts:

        -   White Noise.
        -   Pink Noise.
        -   EIA-426B.
        -   DIN IEC 268-1 (Filtered).

    -   Added weighting filters for TF SPL readouts:

        -   A
        -   B
        -   C
        -   D
        -   Z (None)

    -   Added average trace, with SPL readout.
    -   Added new ‘Bands’ mode to microphones (akin to single channel
        RTA mode) with:

        -   Data Smoothing level (None => 3 octave).
        -   Noise stimulus choice (as above).
        -   Weighting filters (as above).
        -   Data banding (1/3-oct / 1-oct / 3-oct).
        -   Mouse hover data readout.
        -   Average trace.
-   Added native keyboard shortcut commands – new / save / save as / load / close.
-   Double clicking a loudspeaker in the 3D Scene presents the loudspeaker’s controller.
-   Fixed bug whereby SPL legend would be blocked in the 3D Scene by tabs placed below it.
-   Added timeout to prompt users to log in to check for updates.
-   Added screenshot export feature.
-   Added option to draw outline for surfaces in the 3D Scene.
-   Added Trimble SketchUp Extension (SU Exporter).
-   Performance improvements for large venues.

------------------------

**Beta v0.4.1**

-   Fixed optimisation issue on Windows builds; reducing calculation time significantly.
-   Fixed broadband algorithm; weighting factors were previously incorrectly calculated.
-   Fixed issue on Windows where launching multiple instances of SO would crash all but the first.

-----------------------

**Beta v0.4**

-   Loudspeakers added:

    -   SVA:

        -   N-APS asymmetric configurations
        -   ViRAY 1WAY = 80° / 120°
        -   APS = 60° / 90° / 120°

    -   HPSA:

        -   N-APS asymmetric configurations
        -   G712-Pro/L = 60° x 90° / 90° x 60°
        -   G712-Pro/R = 60° x 90° / 90° x 60°
    -   HSA:

        -   APS-SUB
        -   N-SUB
    -   Support for multiple CPU’s:

        -   avx2 – (Default, CPUs later than 2015 (AMD) / 2013 (Intel).
        -   avx (AMD K8 / Intel Nehalem).
        -   znver1 – (AMD Zen1/2μArch).
        -   skl – (Intel Skylake / Coffeelake, etc).
        -   sse42 – (AMD K8 / Intel Nehalem).
-   Continuous phase processing.
-   Improvements to multipole expansions.
-   New smoothing algorithm.
-   Improved loading vertical arrays, with more humanoid-friendly error messages.
-   Prevented closing data version manager whilst download is in progress, causing dataset to fail, leading to white-screen.
-   Multiple DVM improvements.
-   Removed flying hardware from HOPS8 / HOPS5 for now.
-   Improved application title bar – application name, version and filename etc.
-   Application signing – Mac & Win.
-   Major updates to web portal to handle archive versions / multiple CPU builds.
-   Prevent SPL recalculation for certain UI features e.g. renaming or hiding an array.
-   Fixed dropdown for stack / hang selection missing in Rigging tab.
-   Fixed probes not updating in certain situations when switching between muted and unmuted sources.
-   Optimised compiler settings - should notice a slight speedup on certain configurations and CPUs.
-   Multi-window Support.
-   Custom screen layouts.
-   Set minimum application size (Mac).
-   Added Broadband mapping modes:

    -   White Noise
    -   Pink Noise
    -   EIA-426B
    -   DIN IEC268-1
-   CTRL+SHIFT+P opens the quick command line.
-   Multiple Probes tabs.
-   Multiple Sideview tabs.
-   Added support for mixed 1WAY and 2WAY arrays.
-   Array coloured highlighting.
-   Many updates to error messages.
-   Improved fault tolerance of loading SVA / HPSA’s.

--------------------

**Beta v0.3**

-   First public release
