function tex2pdf()
    local input_filename = vim.api.nvim_buf_get_name(0)
    local name = string.gsub(input_filename, "%.tex", "")
    if name == input_filename then
        print("not tex file")
    else
        local result = os.execute("lualatex sample.tex")
        print(result)
    end
end
