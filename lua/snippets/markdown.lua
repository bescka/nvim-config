local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Define the snippet for markdown 
ls.add_snippets("markdown", {
    s("javascript-display",{
    t({"```javascript", ""}),
    i(1),
    t({"", "```"}),
    i(0),
    }),
    s("typescript-display",{
    t({"```ts", ""}),
    i(1),
    t({"", "```"}),
    i(0),
    }),
    s("css-display",{
    t({"```css", ""}),
    i(1),
    t({"", "```"}),
    i(0),
    }),
    s("html-display",{
    t({"```html", ""}),
    i(1),
    t({"", "```"}),
    i(0),
    }),
    s("title", {
    t({"---", "title: "}), i(1, "Enter title"), -- i(1) is for the title
    t({"", "description: "}), i(2, "Enter description"), -- i(2) for description
    t({"", "date: "}), i(3, "Enter date"), -- i(3) for the date
    t({"", "---", ""}), -- closing the front matter block
    i(0) -- final jump point
  })
})
