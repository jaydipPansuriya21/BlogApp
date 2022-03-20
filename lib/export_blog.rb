class ExportBlog
    require 'spreadsheet'
    # Documentation : https://github.com/zdavatz/spreadsheet/blob/master/GUIDE.md

    def initialize
        @workbook = Spreadsheet::Workbook.new
        @blogs = Article.all
    end  

    def export_blogs
        # this method will create excel file with data in it and return path of that file.
        file_name = "public/blogs_#{Time.now.to_i}.xls"
        blogs_worksheet = @workbook.create_worksheet :name => "Blogs"
        custom_formate = Spreadsheet::Format.new(weight: :bold, color: :blue)
        heading = ['title', 'body', 'status']
        blogs_worksheet << heading
        blogs_worksheet.last_row.default_format = custom_formate
        @blogs.each do |blog|
            blog_data = []
            blog_data.push(
                blog.title,
                blog.body,
                blog.status
            )
            blogs_worksheet << blog_data
        end
        @workbook.write file_name
        file_name
    end

end