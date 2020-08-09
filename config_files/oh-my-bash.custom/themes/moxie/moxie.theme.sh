# moxie oh-my-bash theme - 2020-08-08 - tylevad@gmail.com
# bits borrowed and altered from kitsune, iterate, and rana themes
# !!! - uses custom color definitions: `gray` and `bright`

function cmd_failed() {
  if [ $? != 0 ];
  then
    echo "${red}"
  else
    echo "${green}"
  fi
}

function prompt_command() {
  PROMPT_COLOR=$(cmd_failed)

  PS1="$PROMPT_COLOR┌ ${bright}\u${gray}@${blue}\h ${gray}\D{%m-%d %H:%M} ${green}\w$(scm_prompt_info) $(ruby_version_prompt)\n$PROMPT_COLOR└ ${gray}\$ ${reset_color}"
}

# scm theming
SCM_GIT_SHOW_DETAILS=false
SCM_THEME_PROMPT_DIRTY="${red}!"
SCM_THEME_PROMPT_CLEAN=""
SCM_THEME_PROMPT_PREFIX="${gray}@${purple}"
SCM_THEME_PROMPT_SUFFIX="${reset_color}"

# ruby version display
RBENV_THEME_PROMPT_PREFIX="${gray}(${light_gray}"
RBENV_THEME_PROMPT_SUFFIX="${gray})${reset_color}"

safe_append_prompt_command prompt_command
