function md2pdf()
    local input_filename = vim.fn.expand('%:t')
    local name = string.gsub(input_filename, "%.md", "")
    if name == input_filename then
        print("not md file")
    else
        local output_filename = name .. '.pdf'
        local result = os.execute('pandoc ' .. input_filename .. ' -o ' .. output_filename ..
            ' --pdf-engine=lualatex -V documentclass=ltjsarticle')
        if result == 0 then
            print("done")
            os.execute("echo hello")
        else
            print("error")
        end
    end
end
