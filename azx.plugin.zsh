0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

eval '
  function azx() {
    source "'"${0:h}"'/azx.sh"
  }
'
