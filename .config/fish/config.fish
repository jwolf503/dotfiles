if status is-interactive
    # Commands to run in interactive sessions can go here

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
  end
end
zoxide init fish | source
fzf --fish | source
nitch++
alias n="nvim"
alias v="vim"
alias g="geany"
