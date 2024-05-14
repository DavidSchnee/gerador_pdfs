require_relative "./gerador_pdfs/processor"
require_relative "./gerador_pdfs/produtos/gerador"

begin
  require "pry"
  require "dotenv/load"
rescue LoadError
  nil
end

module GeradorPdfs
end
