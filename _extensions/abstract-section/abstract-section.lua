--[[
abstract-section – move an "abstract" section into document metadata

Copyright: © 2017–2022 Albert Krewinkel
License:   MIT – see LICENSE file for details
]]

return {{
    Pandoc = function (doc)
      local abstract = {}

      doc.blocks = doc.blocks:walk {
        Blocks = function (blocks)
          local body_blocks = {}
          local looking_at_abstract = false

          for _, block in ipairs(blocks) do
            if block.t == 'Header' and block.level == 1 then
              if block.identifier == 'abstract' then
                looking_at_abstract = true
              else
                looking_at_abstract = false
                body_blocks[#body_blocks + 1] = block
              end
            elseif looking_at_abstract then
              if block.t == 'HorizontalRule' then
                looking_at_abstract = false
              else
                abstract[#abstract + 1] = block
              end
            else
              body_blocks[#body_blocks + 1] = block
            end
          end

          return body_blocks
        end
      }

      if not doc.meta.abstract and #abstract > 0 then
        doc.meta.abstract = abstract
      end

      return doc
    end
}}
