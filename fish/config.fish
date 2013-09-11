# Ruby optimizations
set -x RUBY_HEAP_MIN_SLOTS 800000
set -x RUBY_HEAP_FREE_MIN 100000
set -x RUBY_HEAP_SLOTS_INCREMENT 300000
set -x RUBY_HEAP_SLOTS_GROWTH_FACTOR 1
set -x RUBY_GC_MALLOC_LIMIT 79000000

set -x SBT_OPTS "-Xms512M -Xmx2G -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"

cd .

SET fish_color_autosuggestion:555\x1eyellow
SET fish_color_command:005fd7\x1epurple
SET fish_color_comment:red
SET fish_color_cwd:green
SET fish_color_cwd_root:red
SET fish_color_error:red\x1e\x2d\x2dbold
SET fish_color_escape:cyan
SET fish_color_history_current:cyan
SET fish_color_host:\x2do\x1ecyan
SET fish_color_match:cyan
SET fish_color_normal:normal
SET fish_color_operator:cyan
SET fish_color_param:00afff\x1ecyan
SET fish_color_quote:brown
SET fish_color_redirection:d7005f
SET fish_color_search_match:d7ff5f\x1e\x2d\x2dbackground\x3dff00ff\x1e\x2d\x2dunderline
SET fish_color_status:red
SET fish_color_user:\x2do\x1egreen
SET fish_color_valid_path:\x2d\x2dunderline
SET fish_pager_color_completion:normal
SET fish_pager_color_description:normal
SET fish_pager_color_prefix:cyan
SET fish_pager_color_progress:cyan
