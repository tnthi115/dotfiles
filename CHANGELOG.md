## Unreleased

### Feat

- **aliases**: add new alias for tree, rm, cp, mv, mkdir
- **lvim**: add telescope-file-browser
- **lvim**: add yamlls settings
- **lvim**: add full python language support
- **lvim**: add global commitlint config and commitlint linter in lvim
- change lazygit commitizen custom keybind to "Z" from "C"
- add commitizen config file
- change telescope theme to default center from dropdown lvim default
- add conventional commits (commented) in lvim and commitizen custom command in lazygit

### Fix

- **lvim**: typo in file browser whichkey description
- **commitlint**: rename commitlint.config.js to .commitlintrc.js
- **aliases**: add quotes around the dir path argument to pushd
- cmp-conventionalcommits plugin to correctly lazy load with configuration

### Refactor

- **lvim**: add neotest as a dependency of neotest-python
