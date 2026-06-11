# Bash completion for rgxg

_rgxg() {
    local cur prev
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    local subcmd=""
    local i
    for ((i=1; i < COMP_CWORD; i++)); do
        case "${COMP_WORDS[i]}" in
            alternation|cidr|escape|range|help|version)
                subcmd="${COMP_WORDS[i]}"
                break
                ;;
        esac
    done

    if [[ -z "$subcmd" ]]; then
        if [[ "$cur" == -* ]]; then
            COMPREPLY=($(compgen -W "-h -v" -- "$cur"))
        else
            COMPREPLY=($(compgen -W "alternation cidr escape range help version" -- "$cur"))
        fi
        return
    fi

    case "$subcmd" in
        alternation)
            if [[ "$cur" == -* ]]; then
                COMPREPLY=($(compgen -W "-N -h" -- "$cur"))
            fi
            ;;
        cidr)
            if [[ "$cur" == -* ]]; then
                COMPREPLY=($(compgen -W "-N -l -U -u -s -h" -- "$cur"))
            fi
            ;;
        escape)
            if [[ "$cur" == -* ]]; then
                COMPREPLY=($(compgen -W "-h" -- "$cur"))
            fi
            ;;
        range)
            case "$prev" in
                -b|-m) return ;;
            esac
            if [[ "$cur" == -* ]]; then
                COMPREPLY=($(compgen -W "-b -N -l -U -h -z -Z -m" -- "$cur"))
            fi
            ;;
        help)
            COMPREPLY=($(compgen -W "alternation cidr escape range" -- "$cur"))
            ;;
    esac
}

complete -F _rgxg rgxg
