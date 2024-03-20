source libexec/options.bash

function __submagic {
  parse_options "$@"
  file="$(mktemp --suffix=.submagic)"
  cat >> "${file}"
  echo "${file}"
}

export -f __submagic
