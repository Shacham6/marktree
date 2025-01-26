vim.cmd([[
" Define the list of entries
let loc_list = [
      \ {'filename': 'file1.txt', 'lnum': 10, 'col': 5, 'text': 'Issue in file1'},
      \ {'filename': 'file2.txt', 'lnum': 20, 'col': 15, 'text': 'Issue in file2'},
      \]

" Set the location list for the current window
call setloclist(0, loc_list, 'r')
]])
