# frozen_string_literal: true

$LOAD_PATH.unshift(*Dir["./vendor/bundle/ruby/3.3.0/gems/**/lib"])
$LOAD_PATH.unshift(File.expand_path("./lib", __dir__))

require "lib/gerador_pdfs"

def lambda_handler(event:, context:)
  GeradorPdfs::Processor.call(event)
end
