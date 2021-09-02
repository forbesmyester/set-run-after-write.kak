declare-option -hidden str xmux_run_command
declare-option -hidden str xmux_run_name
declare-option -hidden str xmux_run_loc

define-command xmux-run-after-write-buffer -params 2 -docstring %{
    usage: xmux-run-after-write XMUX_SESSION_NAME COMMAND
    Runs xmux command after save. COMMAND = "" to disable
    } %{

    set-option buffer xmux_run_command %arg{2}
    set-option buffer xmux_run_name "xmux-lines-%arg{1}"
    evaluate-commands %sh{
        test -z "${kak_opt_xmux_run_command}" && echo "unset-option buffer xmux_run_command"
    }
    xmux-repl %arg{1}
}

define-command xmux-run-after-write -params 2 -docstring %{
    usage: xmux-run-after-write XMUX_SESSION_NAME COMMAND
    Runs xmux command after save. COMMAND = "" to disable
    } %{

    set-option global xmux_run_command %arg{2}
    set-option global xmux_run_name "xmux-lines-%arg{1}"
    xmux-repl %arg{1}
}

hook -group xmux-set-run-after-write-hook global BufWritePost .* %{
    evaluate-commands %sh{
        test -n "${kak_opt_xmux_run_command}" && echo "%opt{xmux_run_name} %opt{xmux_run_command}"
    }
}

