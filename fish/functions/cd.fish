function cd --description "Change working directory"
  builtin cd $argv
  set -l cwd $PWD
  while true
    if [ "/" = $cwd ]
      rvm default 1>/dev/null 2>&1
      break
    else
      if begin; test -s ".rvmrc"; or test -s ".ruby-version"; or test -s ".ruby-gemset"; end
        eval "rvm reload" > /dev/null
        break
      else
        set cwd (dirname "$cwd")
      end
    end
  end

  set -e cwd
end
