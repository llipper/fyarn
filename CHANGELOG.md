## 1.1.3

- **Pub Score Optimization**: Added `example/` directory and improved dartdoc comments for public APIs.
- **Dependency Update**: Bumped `mason_logger` and `very_good_analysis` to their latest versions.

## 1.1.2

- **Dependency Fix**: Fixed missing dependencies for `calendar` component (now pulls `text` and `tokens` automatically).
- **Core Engine Fix**: Reorganized `tokens` and `theme` components to ensure a complete engine is generated during `fyarn init`.

## 1.1.1

- **Hotfix**: Fixed `LateInitializationError` on `fyarn init` by adding the missing `GraphBuilderStage` to the initialization pipeline.

## 1.1.0

- **Stable Core**: Refactored component registry for better variant management.
- **Improved Auth Variants**: Fixed registration paths and unique filenames for all login and signup variants.
- **Premium Calendar**: Completely redesigned the calendar and date picker with a high-fidelity aesthetic.
- **Theme Engine Integration**: Better support for color presets (Amber, Emerald, Rose, Ruby).
- **Bug Fixes**: Resolved dynamic import issues and template path conflicts.

## 1.0.0

- Initial release of Fyarn CLI.
- 50+ UI component templates included.
- Context-aware engine with `context.fy`.
- Deterministic incremental build system.
- Support for Light/Dark mode reactive tokens.
