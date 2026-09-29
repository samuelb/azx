0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# run the script in its own process, so it can't change the calling shell
eval '
  function azx() {
    bash "'"${0:h}"'/azx.sh" "$@"
  }
'
