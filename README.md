# Interfacing the Neuromuscular System Laboratory

MATLAB coursework for analysing high-density surface electromyography (HD-sEMG), force signals, and motor-unit activity during isometric index-finger movements.

The experiment studies three degrees of freedom:

- index-finger abduction;
- index-finger flexion; and
- index-finger extension.

Recordings were made from the first dorsal interosseous muscle while a participant followed force-feedback ramps at two force levels.

## Analyses

The repository follows the three tasks in the laboratory exercise:

1. **Force analysis** - conversion of the force-transducer signal to Newtons, offset removal, low-pass filtering, and calculation of the coefficient of variation during force plateaus.
2. **EMG analysis** - signal inspection, 50 Hz interference removal, moving-window root-mean-square (RMS) amplitude, and EMG-force correlation.
3. **Motor-unit analysis** - spike-train visualisation, firing-rate comparison, and spike-triggered averaging (STA) of motor-unit action potentials.

The final report also discusses PCA and non-negative matrix factorisation (NMF) for EMG reconstruction and muscle-synergy analysis. The PCA/NMF implementation is not included in the current MATLAB scripts.

## Repository contents

| Path | Description |
| --- | --- |
| `Lab1_task1.m` | Force conversion, filtering, visualisation, and coefficient-of-variation calculations for all three movements. |
| `Lab1_task2.m` | RMS EMG and force-correlation analysis for all three movements. |
| `Lab1_task3.m` | Motor-unit spike trains and spike-triggered averaging. |
| `Task1_sy.m`, `task2_sy.m`, `task3_sy.m` | Alternative or work-in-progress analysis scripts. |
| `plotSpikeRaster.m` | Helper function for plotting binary spike trains. |
| `*.otb+.mat` | Raw EMG and force recordings. |
| `*_MU.mat` | Decomposed motor-unit datasets. |
| `Exercise_1.pdf` | Original laboratory instructions. |
| `Group 4 - Final Report after chatcheck.pdf` | Final project report. |
| `new_Report 1.pdf` | Extended analysis report. |

### Main data variables

The raw recording files contain:

- `EMG`: raw signals from the 64-channel electrode grid;
- `AUX1`: force-transducer signal in mV; and
- `fsamp`: sampling frequency in Hz.

The motor-unit files additionally contain variables such as:

- `SIG`: grid-organised raw EMG signals;
- `ref_signal`: reference force signal;
- `MUPulses`: detected discharge sample indices for each motor unit;
- `discardChannelsVec`: channels excluded during decomposition; and
- `SIGlength`, `IED`, and `fsamp`: recording metadata.

## Requirements

- MATLAB (the project was created as MATLAB coursework in 2023)
- Signal Processing Toolbox, used by functions including `designfilt`, `filtfilt`, and `pwelch`
- Enough memory to load the HD-sEMG `.mat` files (individual datasets are approximately 29-52 MB)

No separate installation step is required; `plotSpikeRaster.m` is included in the repository.

## Running the analysis

1. Clone or download the repository.
2. Open MATLAB and set this repository as the current folder.
3. Open one of the main scripts.
4. Run the script section by section using **Run Section** or `Ctrl+Enter` (`Cmd+Enter` may be configured on macOS).

Recommended order:

```matlab
run('Lab1_task1.m')
run('Lab1_task2.m')
run('Lab1_task3.m')
```

Running by section is preferable because the scripts contain independent movement-specific blocks and several `clear all` / `close all` commands. The scripts display computed values in the Command Window and create figures for the force, RMS, correlation, spike-train, and motor-unit-action-potential results.

## Important notes

- Several filenames retain spelling used in the original dataset, including `flextion.otb+.mat` and `Extention_MU.mat`. Do not rename them without also updating the corresponding `load(...)` calls.
- The scripts expect the data files to remain in the repository root.
- `Lab1_task3.m` contains an author-specific absolute `addpath` entry. Because `plotSpikeRaster.m` is already included here, remove that entry or replace it with `addpath(pwd)` when running the project elsewhere.
- Filter parameters, force-conversion constants, and plateau intervals are hard-coded in the scripts. Verify them against the laboratory instructions and the recording being analysed before reusing the code with other data.
- The alternative `*_sy.m` files are incomplete working versions; use `Lab1_task1.m`, `Lab1_task2.m`, and `Lab1_task3.m` as the primary entry points.

## Reports

- [Laboratory exercise](Exercise_1.pdf)
- [Final report](Group%204%20-%20Final%20Report%20after%20chatcheck.pdf)
- [Extended report](new_Report%201.pdf)

## Acknowledgement

The included `plotSpikeRaster.m` helper identifies Jeffrey Chiou as its original author (revision 1.2, 2014). Refer to the source header for attribution and usage details.
