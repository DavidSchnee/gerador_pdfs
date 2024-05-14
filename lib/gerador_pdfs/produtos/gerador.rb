require 'pdfkit'
require 'base64'

module Produtos
  class Gerador
    def initialize(payload)
      @produtos = payload[:produtos]
      @output_file = payload[:output_file] || "products.pdf"
    end

    def self.call(payload)
      new(payload).call
    end

    def call
      html_content = "<html><head><title>Lista de produtos</title></head><body>"
      html_content << "<h1>Lista de produtos</h1>"
      html_content << "<ul>"
      @produtos.each do |produto|
        html_content << "<li>#{produto[:nome]} - $#{produto[:preco]}</li>"
      end
      html_content << "</ul>"
      html_content << "</body></html>"
      kit = PDFKit.new(html_content, page_size: 'Letter')
      pdf_data = kit.to_pdf
      Base64.strict_encode64(pdf_data)
    end
  end
end
