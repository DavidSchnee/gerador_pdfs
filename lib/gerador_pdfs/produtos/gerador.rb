require 'hexapdf'
require 'base64'

module Produtos
  class Gerador
    def initialize(payload)
      @produtos = payload["produtos"]
      @output_file = payload["output_file"] || "products.pdf"
    end

    def self.call(payload)
      new(payload).call
    end

    def call
      pdf = HexaPDF::Document.new
      canvas = pdf.pages.add.canvas
      canvas.font("Helvetica", size: 12)
      canvas.text("Lista de Produtos", at: [100, 700])
      y_position = 660
      @produtos.each do |produto|
        canvas.text("#{produto["nome"]} - R$#{produto["preco"]}", at: [100, y_position])
        y_position -= 20
      end
      pdf_data = StringIO.new
      pdf.write(pdf_data)
      pdf_data.rewind
      Base64.strict_encode64(pdf_data.read)
    end
  end
end
