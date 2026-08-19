# Cleanup after merging this update

The existing GitHub repository contains older organization/placeholder material. After uploading this package, remove or archive the following stale items so that readers do not confuse them with the final sources:

1. `ADD_LATER.md` — no longer needed after the final update.
2. Any old duplicated Rocket/BOOM Scala copies that contradict `hardware/chipyard_scala/zynq7cg/`.
3. In particular, an old standalone `IOBinders.scala` should not be presented as part of the authoritative final four-file Scala set unless it is intentionally kept as historical material.
4. Old result files whose hardware numbers differ from the final captures/`results/final_results.csv`.

The authoritative final files are the ones documented in the new top-level `README.md` and `SOURCE_MANIFEST.md`.
