func! TagbarFocus()
    let tag_bar_nr = bufwinnr(t:tagbar_buf_name)
    if tag_bar_nr != -1
        execute tag_bar_nr . 'wincmd w'
    endif
endfunction
