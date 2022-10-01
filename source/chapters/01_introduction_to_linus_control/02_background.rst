.. _background:

Background To The Application
=========================================


Acoustical Model
-----------------------------------------
The efficient calculation of accurate and useful response curves in strongly varying environments (e.g. quasi-freefield outdoor arenas
large indoor arenas or smaller values) is a task that has been challenging the industry for years and is still being actively researched.

CODA makes use of an algorithm or calculation model that has emerged as standard over the years and is widely accepted within the industry,
which we call *Hybrid Summation* or *Direct Sound Hybrid Summation*.
This model is based on the Precedence effect or law of the first wavefront and thus **does not take any reflections into account**.
The proper calculation of reflections requires more sophisticated and time-consuming techniques like Ray Tracing or (FM)BEM ((Fast Multipole) Boundary Element Methods).
Especially physically-correct techniques like the Boundary Element Method require special treatment in order to be usable for such scenarios, as they usually assume
a closed geometry, but only infinitely thin bodies (surfaces) are available.
In addition to this, the mentioned techniques would require the entry of material properties like absorption factory to give useful results.
All of the above points make the more sophisticated techniques unsuitable for this purpose, at least for now.

This also means that other acoustical effects like inter-cabinet coupling of (closely) stacked low frequency transducers leading to an increase in 
radiation impedance and a change of response or shadowing / diffraction from other cabinets (e.g. when stacking subwoofers or flying low frequency
extensions behind a Line Array are not taken into account.

There are more acoustical effects (like the influence of wind), but in order to take those into account, one must solve similar challenges as for the other
previously mentioned effects.

So, like the name *Direct Sound Hybrid Summation* says, only the Direct Sound radiated by the placed speakers is taked into account.

However, the method to actually obtain a response from the placed speakers, the exact summation method, is still unexplained.
This is where the **Hybrid Summation** part comes in.

The Hybrid Summation is a two-level summation. First, speakers placed within a single instance (hang, stack) are summed together using complex summation.
Complex summation is also sometimes termed *coherent summation* and takes phase differences into account. Complex summation is the physically correct way
for summation of sound sources and gives highly accurate results across the entire frequency range including spurious directivity effects from Line Arrays.
Complex summation gives the widely known, approximately 6dB more (actually around 5.9dB) level when two identical sources are combined.

After the instance responses have been obtained, the actual hybrid summation stage follows.
The hybrd summation stage makes use of both complex (coherent) and energetic (incoherent) summation and a mix of both.
Energetic summation assumes random phase and thus gives +3dB level when combining two identical sources.

In the low frequency range, the instance levels are combined using complex summation which ensures that directivity patterns in the low frequency range are accurately calculated.
Starting at the 200Hz frequency range, the hybrid summation slowly shifts (over a bandwidth of one octave) from complex summation to energetic summation, until a fully energetic
summation is employed starting at the 400Hz range.

Energetic summation in the MF / HF frequency range has been proven useful many times in a huge variety of different real world scenarios. It has the distinct advantage
that unhelpful, fine-grained interference patterns are suppressed.

Surfaces marked as Obstacles are taken into account using geometric intersection tests and block the entire frequency range of the respective balloon. They do not add any reflections.

.. _maximumspl:

Maximum SPL
---------------------------------------------------
System Optimiser uses CODA's **realSPL** technology to calculate the maximum attainable sound pressure level

.. admonition:: CODA realSPL

   | **CODA realSPL** is a set of cutting-edge, continuously improving techniques that facilitate customers to more accurately predict the achievable sound pressure level of CODA loudspeaker setups.
   | It uses a combined hybrid time- and frequency-domain approach and creates a digital twin of the loudspeaker setup to precisely calculate the behaviour of the entire signal chain.
   | Users are presented with a detailed analysis of both peak and RMS headroom for a collection of industry-standard stimuli like Pink Noise, White Noise, AES75-2022 or Speech Noise together with advanced postprocessing features. This allows for improving the fidelity for every listener at concerts or designing safer EVAC systems in fixed installations.
   | Paired with CODA's market-leading, proprietary acoustic prediction engine, CODA realSPL gives you the insights you need to accomplish our motto: Hearing is believing!

CODA realSPL and System Optimiser's Maximum SPL subsystem works by creating a digital twin of the loudspeaker setup and signal processing chain.

.. _stimuli:

System Optimiser include five different stimuli:

- White Noise
- Pink Noise
- Speech Noise (Male, 2020 as defined in IEC 60268-16)
- AES75-2022
- A-Weighted Pink Noise

Each stimulus, approximately one minute long, is passed through the signal processing chain, starting with CODA's manufacturer preset.
Afterwards, the user specified EQs are applied and finally the processed stimulus is passed into a transient model of the loudspeaker to accurately determine the headroom.

Each stimulus is calculated individually - They do not affect each other, including settings made like manual mode or input level. 

**This technology allows precise calculation of RMS and real Peak headrooms as opposed to the frequently encountered peak estimation based on RMS value and crest factor.**

Based on the headrooms of each loudspeaker, an overall maximum input level is calculated for each stimulus individually, such that the loudspeaker with the smallest headroom is just at its limit.
Gain differences between loudspeakers, stacks or hangs are preserved. You can imagine this process by moving the master fader of your mixing console up until the loudspeaker with the smallest headroom is just at its limit.
Note that this only applies to automatic mode. If you are in manual mode and enter an input level that exceeds the shown maximum input level, inter-cabinet gain differences will change because some loudspeakers are already running into the limiters.
In no case will a loudspeaker be louder than defined by its limiters, even in manual mode.

Additionally a detailed analysis of headrooms is created and presented to the user. This enables the user to find bottlenecks or unleash more SPL if required.

To see how manual mode, automatic mode and the analysis of headrooms look like and work, please head over to the :ref:`Maximum SPL / Headroom Panel<maximumsplpanel>`

SPL Postprocessing (2FR, Fractional Octave Bands and Amplitude Spectral Density)
----------------------------------------------------------------------------------

SPL Postprocessing means the set of algorithms and techniques used to process internally calculated SPL values of different kinds for presentation to the user.

System Optimiser uses Postprocessing techniques which may be unfamiliar to some users. Additionally it has turned out that certain frequently used Postprocessing features in the industry are often either misunderstood or not fully understood.

System Optimiser has two modes of operation for postprocessing:

.. _2FR:

2FR 
^^^^^^^

*2FR* stands for *Dual Channel FFT*. 2FR shows the relative, Dual Channel response or transfer function of the system. It is thus **independent of any stimulus or overall system gain**. It can be used to tune the frequency response of the system to the user's specification. A perfectly flat spectrum corresponds to 0dB at every frequency.
Any response in 2FR mode is not affected by changes made in the :ref:`Maximum SPL / Headroom Panel<maximumsplpanel>` window and internally uses White Noise in automatic mode. 2FR mode can be activated in the :ref:`Microphones Panel<mics>` and :ref:`Probes Panel<probes>`, but **not** in the :ref:`3D View<3dview>` as it wouldn't give any useful information because the 3D view only shows a single frequency at a time.
Users can choose either automatic normalisation or give a manual reference level.

.. _SPA:

SPA
^^^^^^^

*SPA* stands for *Spectrum Analysis*. This is the main mode for analysis of maximum achievable sound pressure levels. SPA mode can be activated in the :ref:`Microphones Panel<mics>` and :ref:`3D View<3dview>`, but *not* in the :ref:`Probes Panel<probes>` as it does not give any useful information for the Probes workflow and may even mislead users.

The SPA mode itself has two modes of operation:

**Amplitude Spectral Density**

Amplitude Spectral Density is a measure which is probably unfamiliar to most users. If you know what Power Spectral Density is and how it works, you may skip this section, because Amplitude Spectral Density is essentially just the square root of Power Spectral Density.

Maximum SPL is usually presented with Fractional Octave Bands, but sometimes it may be useful to choose a different way of presenting the same data.

Most users probably know that White Noise is somehow "flat" and that Pink Noise gets quieter as frequency increases. However if you look at the standard Fractional Octave Bands presentation, White Noise gets louder with increasing frequency and Pink Noise is flat. So how does this all add up?

The answer lies in understanding that Fractional Octave Bands are derived from the Amplitude Spectral Density / Power Spectral Density.
Fractional Octave Bands are a measure of **power**, while Amplitude Spectral Density / Power Spectral Density is a measure of **power density**

.. Important::
   Amplitude Spectral Density / Power Spectral Density is the amount of **power per frequency**, while Fractional Octave Bands are the **total power in a specific frequency range**

Mathematically speaking, Fractional Octave Bands are obtained from Power Spectral Density by integrating it (taking the integral). If your Power Spectral Density is constant, the integral simplifies to a multiplication of the Power Spectral Density value times the bandwidth in Hertz.

Now let us circle back to White Noise and Pink Noise: White Noise has a constant Power Spectral Density and Pink Noise has a Power Spectral Density that is inversely proportional to the frequency
Fractional Octave Bands have a constant relative bandwidth, but that means that their absolute bandwidth in Hertz is not constant. The one-third octave band at 100Hz is much narrower than the one-third octave band at 10kHz in terms of absolute bandwidth. If we remember how the integral is calculated, basically a multiplication of absolute bandwidth in Hertz and Power Spectral Density Value, if becomes obvious why the resulting Fractional Octave Bands of White Noise and Pink Noise look like they do:

- White Noise has a constant Power Spectral Density and the width of the Fractional Octave Bands increases -> The values of the Fractional Octave Bands must increase with frequency
- Pink Noise has a Power Spectral Density that is inversely propertional to frequency and Fractional Octave Bands bandwidth increases exponentialle -> The values of the Fractional Octave Bands do not change with frequency

The Amplitude Spectral Density that is shown in System Optimiser is calculated as the square root of the Power Spectral Density (similar to electrical circuits where voltage is the square root of power times resistance).

**Fractional Octave Bands**

Fractional Octave Bands are the most common and de facto standard for showing and plotting Maximum SPL values or SPL values from spectrum analysers.

System Optimisers implements several different Fractional Octave Bands (all at standard norm frequencies):

- 1/24 Oct (not available in the :ref:`3D View<3dview>`)
- 1/3 Oct
- 1 Oct
- 3 Oct (not available in the :ref:`Microphones Panel<mics>`)
- Broadband

As explained in the section above, Fractional Octave Bands show the total power within a certain frequency band (or the entire frequency range in case of Broadband).
Within a category (like 1/3 Oct), the bands mostly do not overlap. This is not the case for 3 Oct, because we added additional overlapping frequencies due to customer demand.

Please note that there are two ways to calculate Amplitude Spectral Density / Power Spectral Density from an underlying power spectrum.
One is based on brick wall filters is the preferred method for high resolution analysis and implemented in System Optimiser. The other method is based on 6-pole Class-0 Butterworth bandpass filters and mimics the behaviour of old analog spectrum analysers where the value was obtained by filtering the input signal and calculating the RMS level after the band filter. This method is not implemented in System Optimiser.

CODA has decided to **not implement** yet another mode of showing SPL Levels which is called *Octave smoothing / sweeping* in *ARTA* or *Banding* in *Smaart*.
We believe this mode is highly misleading as it performs the Fractional Octave Band calculation not at discrete standard frequencies, but rather in a continuous / sweeping manner at all frequencies
and thus gives the impression that there's more power than there actually is, especially if you switch from e.g. 1/24 Oct to 1/3 Oct and the overall level increases.

**Weighting**

Users can choose between different SPL weightings, namely Z (flat), A, and C.
You usually want to use Z (flat / no weighting), but you may need A or C weighting in certain situations such as noise impact analysis or tenders. 


Technical Specifications of the Acoustic Subsystem
---------------------------------------------------
CODA believes that customers should be able accurately assess the quality of the software they use as a basis of their daily work and thus has decided to publish
technical specifications of the acoustic subsystem of the System Optimiser software.

**General**

The internal frequency resolution of System Optimiser is 1/24th Octave (standard rounded center frequency), which provides by far enough accuracy for the purpose of the software.
In total, 246 frequencies are used and calculated.
The Maximum SPL subsystem (time-domain processing of the stimuli) does not have this frequency resolution limit, as it is based on time-domain data with sufficient sampling rate.

**Atmospheric Model**

CODA makes use of a sophisticated and highly accurate model for calculation of frequency-dependent atmospheric absorption coefficients that has been independently
published and peer-reviewed [#atmosmodref1]_ [#atmosmodref2]_ [#atmosmodref3]_

.. _balloons:

**Balloons**

Balloons are the heart of System Optimiser and CODA has put a significant amount of time and effort into the development of the balloons.

Balloons in System Optimiser are fully complex which means they contain amplitude and phase data.
Balloons in System Optimiser range from 2° spatial resolution (Line Arrays) to 10° spatial resolution (subwoofers). Please note that currently some speakers are still being
modelled als truly omnidirectional, but will be improved in due time.
Interpolation between data points is done using a combination of sophisticated techniques including Spherical Harmonics / Acoustic Multipoles for increased accuracy.
Please note that this technology increases the actual resolution over the data resolution of the balloon.

The creation of balloons from acoustical measurements is a complex process with many steps that involves a considerable number of proprietary techniques developed by and for
CODA, e.g. optimised Spherical / Spatial Continuous Phase unwrapping and special resampling algorithms. 

Balloons contain data on the 1/24th Octave spaced frequency grid used throughout System Optimiser (and thus can contain a maximum of 246 frequencies with thousand of data points each).
Balloons make use of symmetry where appropriate. Data is stored using 32-bit floating point numbers and optimised normalisation.

**Maximum SPL**

White Noise, Pink Noise, Speech Noise and A-Weighted Pink Noise are Periodic Noise signals. That means they are generated by an inverse FFT of random-phase spectra and **not** by sampling of random numbers from a distribution (e.g. normal distribution for White Noise, Gaussian distribution for Pink Noise).
Periodic Noise signals have better visual properties and for example give a perfectly flat spectral density without averaging or signal windowing.

The stimuli are about 60-seconds long and are sampled at a rate of 96kHz, which is also the internal processing rate for all FIR filters and IIR Filters.

**Spatial Sampling**

Polygons and Quads are currently sampled on a cartesian grid with 30cm distance between rows and columns.
Sectors are sampled with 3° angular resolution and 30cm radial / slant resolution.

Please note that this is subject to change and users will be able to adjust the resolution to their own needs soon.

Interpolation between sampling points for rendering purposes is done using standard bilinear interpolation.

Please note that Microphones placed on surfaces do **not** perform interpolation between adjacent data points, but instead calculate an entirely new response.


List of included balloons
-----------------------------------------
Please refer to the :ref:`List of Available Loudspeakers and Presets<listofspeakers>`


.. rubric:: Footnotes
.. [#atmosmodref1] Bass, H. E., Sutherland, L. C., Piercy, J., and Evans, L., “Absorption of sound by the atmosphere”, in *IN: Physical acoustics: Principles and methods. Volume 17 (A85-28596 12-71). Orlando*, 1984, vol. 17, pp. 145–232.
.. [#atmosmodref2] H. E. Bass, L. C. Sutherland, and A. J. Zuckerwar, “Atmospheric absorption of sound: Update,” *The Journal of the Acoustical Society of America*, vol. 88, no. 4, pp. 2019–2021, 1990. 
.. [#atmosmodref3] H. E. Bass, L. C. Sutherland, A. J. Zuckerwar, D. T. Blackstock, and D. M. Hester, “Atmospheric absorption of sound: Further developments,” *The Journal of the Acoustical Society of America*, vol. 97, no. 1, pp. 680–683, 1995. 