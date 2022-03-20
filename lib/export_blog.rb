class ExportBlog
    require 'spreadsheet'
        
    def initialize
        @workbook = Spreadsheet::Workbook.new
        @blogs = Article.all
    end  

    def export_blogs
        file_name = "public/blogs_#{Time.now.to_i}.xls"
        blogs_worksheet = @workbook.create_worksheet :name => "Blogs"
        custom_formate = Spreadsheet::Format.new(weight: :bold, color: :blue)
        blogs_worksheet.row(0).default_format = custom_formate
        heading = ['title', 'body', 'status']
        blogs_worksheet << heading
        @blogs.each do |blog|
            blog_data = []
            blog_data.push(
                blog.title,
                blog.body,
                blog.status
            )
            blogs_worksheet << blog_data
        end
        blogs_worksheet.write file_name
    end

end