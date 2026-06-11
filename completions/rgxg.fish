# Fish completion for rgxg

set -l commands alternation cidr escape range help version

# Disable file completion globally
complete -c rgxg -f

# Top-level flags (only before a subcommand)
complete -c rgxg -n "not __fish_seen_subcommand_from $commands" -s h -d 'Display help and exit'
complete -c rgxg -n "not __fish_seen_subcommand_from $commands" -s v -d 'Print version and exit'

# Subcommands
complete -c rgxg -n "not __fish_seen_subcommand_from $commands" -a alternation -d 'Create regex that matches any of the given patterns'
complete -c rgxg -n "not __fish_seen_subcommand_from $commands" -a cidr       -d 'Create regex that matches all addresses of the given CIDR block'
complete -c rgxg -n "not __fish_seen_subcommand_from $commands" -a escape     -d 'Escape the given string for use in a regex'
complete -c rgxg -n "not __fish_seen_subcommand_from $commands" -a range      -d 'Create regex that matches integers in a given range'
complete -c rgxg -n "not __fish_seen_subcommand_from $commands" -a help       -d 'Describe the usage of rgxg or a given command'
complete -c rgxg -n "not __fish_seen_subcommand_from $commands" -a version    -d 'Print the version of rgxg'

# alternation options
complete -c rgxg -n "__fish_seen_subcommand_from alternation" -s N -d 'Omit outer parentheses'
complete -c rgxg -n "__fish_seen_subcommand_from alternation" -s h -d 'Display help and exit'

# cidr options
complete -c rgxg -n "__fish_seen_subcommand_from cidr" -s N -d 'Omit outer parentheses'
complete -c rgxg -n "__fish_seen_subcommand_from cidr" -s l -d 'Match only lower case letters'
complete -c rgxg -n "__fish_seen_subcommand_from cidr" -s U -d 'Match only upper case letters'
complete -c rgxg -n "__fish_seen_subcommand_from cidr" -s u -d 'Do not match IPv6 addresses with zero compression'
complete -c rgxg -n "__fish_seen_subcommand_from cidr" -s s -d 'Do not match IPv6 addresses in mixed notation'
complete -c rgxg -n "__fish_seen_subcommand_from cidr" -s h -d 'Display help and exit'

# escape options
complete -c rgxg -n "__fish_seen_subcommand_from escape" -s h -d 'Display help and exit'

# range options
complete -c rgxg -n "__fish_seen_subcommand_from range" -s b -r -d 'Base for the number range (2-32)'
complete -c rgxg -n "__fish_seen_subcommand_from range" -s N    -d 'Omit outer parentheses'
complete -c rgxg -n "__fish_seen_subcommand_from range" -s l    -d 'Match only lower case letters (bases > 10)'
complete -c rgxg -n "__fish_seen_subcommand_from range" -s U    -d 'Match only upper case letters (bases > 10)'
complete -c rgxg -n "__fish_seen_subcommand_from range" -s h    -d 'Display help and exit'
complete -c rgxg -n "__fish_seen_subcommand_from range" -s z    -d 'Match numbers with leading zeros'
complete -c rgxg -n "__fish_seen_subcommand_from range" -s Z    -d 'Match numbers with variable number of leading zeros'
complete -c rgxg -n "__fish_seen_subcommand_from range" -s m -r -d 'Minimum length of matched numbers'

# help subcommand: complete with command names
complete -c rgxg -n "__fish_seen_subcommand_from help" -a "alternation cidr escape range"
