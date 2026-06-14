# nvim

My personal Neovim config, NoW wItH tHe PoWeR oF aI...

## Repository overview
- Main config modules: `lua/`
- Plugin management: `lazy.nvim` and `lazy-lock.json`


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
- If Windows security features block writes, use user-writable runtime/data paths.


## Linux / WSL
- Install Neovim, Git, and build tools required by Treesitter parsers.
- Install `tree-sitter-cli` and ensure `tree-sitter` is on `PATH` if you want local parser builds.
- Install `codex-acp` on `PATH` if you want the Agentic integration to work:
```bash
npm install -g @zed-industries/codex-acp
codex-acp --help
```
- To use the agents you will need to install codex-cli
```bash
curl -fsSL https://chatgpt.com/codex/install.sh | sh
codex login
```