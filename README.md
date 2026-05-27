# nvim

Personal Neovim configuration repository, managed in Git, with an emphasis on reproducible setup, clean plugin management, and cross-platform use.

## Repository overview
- Entry point: `init.lua`
- Main config modules: `lua/`
- Plugin management: `lazy.nvim` and `lazy-lock.json`
- Optional local planning docs: `whitepaper.md`, `context.md` (ignored by git)

## General usage
```sh
nvim --version
nvim --headless "+Lazy! sync" +qa
```

## Windows
- Ensure `nvim` is on `PATH`.
- Ensure a C toolchain is available for parser/plugin builds (`zig`, `clang`, etc).
- Install `gdb` (winget):
```powershell
winget install --id BrechtSanders.WinLibs.POSIX.UCRT -e --accept-package-agreements --accept-source-agreements
```
- Add `gdb` to user `PATH` (if your shell cannot find it after install):
```powershell
$gdbBin = "$env:LOCALAPPDATA\Microsoft\WinGet\Packages\BrechtSanders.WinLibs.POSIX.UCRT_Microsoft.Winget.Source_8wekyb3d8bbwe\mingw64\bin"
[Environment]::SetEnvironmentVariable("Path", ([Environment]::GetEnvironmentVariable("Path","User").TrimEnd(";") + ";" + $gdbBin), "User")
```
- Reopen terminal and verify:
```powershell
where.exe gdb
gdb --version
```
- If Windows security features block writes, use user-writable runtime/data paths.
- Verify:
```powershell
nvim --headless "+Lazy! check" +qa
```

## WSL
- Use the WSL distro’s own `~/.config/nvim` and package toolchain.
- Confirm branch/commit if mirroring from Windows.
- Verify:
```bash
nvim --headless "+Lazy! check" +qa
nvim --headless "+checkhealth nvim-treesitter" +qa
```

## Linux
- Install Neovim, Git, and build tools required by Treesitter parsers.
- Keep config under `~/.config/nvim`.
- Verify:
```bash
nvim --headless "+Lazy! check" +qa
nvim --headless "+checkhealth lazy" +qa
```
