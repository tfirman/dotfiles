if test (uname) = Darwin
	function prompt_pwd --description "Print the current working directory, shortend to fit the prompt"
		echo $PWD | sed -e "s|^$HOME|~|" -e 's|^/private||'
	end
else
	function prompt_pwd --description "Print the current working directory, shortend to fit the prompt"
		echo $PWD | sed -e "s|^$HOME|~|"
	end
end
