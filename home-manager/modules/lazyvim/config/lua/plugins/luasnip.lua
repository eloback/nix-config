-- not pretty but works
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("lua", {
  s("hello", {
    t('print("hello Word")'),
  }),
})

ls.add_snippets("rust", {
  s("rest-debug", {
    t('println!("->> {:12} - '),
    i(1),
    t('", "HANDLER");'),
  }),
})

ls.add_snippets("rust", {
  s("up", {
    t("use crate::prelude::*;"),
  }),
})
ls.add_snippets("rust", {
  s("pur", {
    t("pub use crate::error::{Error, Result};"),
  }),
})

return {}
