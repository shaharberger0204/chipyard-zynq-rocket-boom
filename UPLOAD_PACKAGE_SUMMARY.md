# Final GitHub update package

This package is intended to be merged into the existing repository `shaharberger0204/chipyard-zynq-rocket-boom`.

## Main updates

- Replaces the stale top-level README with the final architecture/results description.
- Adds the authoritative four-file final Scala target under `hardware/chipyard_scala/zynq7cg/`.
- Adds the cleaned final BOOM generated RTL/IP package.
- Adds clean Rocket and BOOM Vivado source snapshots plus XSA/bitstream artifacts.
- Adds the unified benchmark source and final FPGA executable.
- Adds final report and presentation.
- Adds final simulation/hardware evidence images and CSV result tables.
- Corrects the documented reset mechanism: VIO + system reset controls reset release; MMIO is used for status/results.

## Important upload behavior

GitHub does **not** unpack a ZIP uploaded as a normal repository file. Extract this ZIP locally first, then upload/commit the files and folders inside it at the repository root.

See `CLEANUP_EXISTING_REPO.md` for stale legacy files that should be removed or archived after the merge.
