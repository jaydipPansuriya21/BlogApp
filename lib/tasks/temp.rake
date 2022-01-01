task :temp do
    puts __FILE__
    puts __dir__
    puts File.expand_path('../assets',__dir__)
end