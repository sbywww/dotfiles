-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local keymap = vim.keymap.set

-- 반 페이지 스크롤 + 센터링
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- 검색 결과 센터링
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Visual 모드 줄 이동
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Visual 인덴트 후 선택 유지
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- 블랙홀 레지스터 (삭제 시 yank 레지스터 오염 방지)
keymap("n", "x", '"_x')
keymap({ "n", "v" }, "<leader>d", '"_d')
keymap("x", "<leader>p", '"_dP')

-- 파일 경로 클립보드 복사
keymap("n", "<leader>fp", function()
  local path = vim.fn.expand("%:~:.")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path)
end, { desc = "Copy file path" })

-- 커서 단어 전역 치환
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" })
