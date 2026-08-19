# Final consistency note

This archive uses the final report and the corrected final presentation as the numerical source of truth.

The `README.md`, `results/final_results.csv`, final report, and final presentation are aligned to the final Rocket/BOOM hardware captures for the key hardware-cycle values:

- Rocket dependent: **2,100,178** cycles
- Rocket matrix: **39,503,151** cycles
- BOOM ILP: **1,000,131** cycles
- BOOM matrix: **6,995,224** cycles

The report's simulation section/captures show an ILP retired-instruction count of 1,000,023 in simulation, while the hardware captures show 1,000,022. `results/final_results.csv` preserves the values visible in each corresponding capture.
