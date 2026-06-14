local documents = vim.fn.expand("~/Documents")

if vim.fn.argc() == 0 and vim.fn.isdirectory(documents) == 1 then
  vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
      vim.cmd.cd(documents)
    end,
  })
end
