define-command repl-send-newline -docstring 'Send a new line to a repl' %{
    repl-send-text "
"
}

define-command unset-run-after-write -params 0 -docstring 'Unset repl command to run after write' %{
    remove-hooks buffer set-run-after-write
}

define-command set-run-after-write -params 1 -docstring 'Set repl command to run after write' %{
    declare-option str auto_repl_command %arg{1}
    remove-hooks buffer set-run-after-write
    hook -group set-run-after-write buffer BufWritePost .* %{
        repl-send-text %opt{auto_repl_command}
        repl-send-newline
    }
}


