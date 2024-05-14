require "lib/gerador_pdfs"

def lambda_handler(payload:, context:)
  GeradorPdfs::Processor.call(payload)
end
