// 設定ファイル
#import "../settings.typ": *

// ===============================
// === 付録用の設定（消さないで）===
// ===============================
#set heading(
  numbering: (..nums) => {
    let ns = nums.pos()
    if ns.len() == 1 {
      [付録 #numbering("A", ns.first())]
    } else {
      numbering("A.1", ..ns)
    }
  },
  supplement: none,
)
#appendix
// ===============================

