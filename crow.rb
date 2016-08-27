class Crow < Formula
  desc "Transpile/compile Crystal to Flow"
  homepage "http://crow.geppetto.no/index.html"
  url "https://github.com/geppetto-apps/crow/archive/v0.3.0.tar.gz"
  version "0.3.0"
  sha256 "112b1111b25f122c41919a4ff164fe8c315eb184c40c6f53caa3c8bb02d875d4"
  head "https://github.com/geppetto-apps/crow.git"

  depends_on "crystal-lang" => :build

  def install
    system "bin/build"
    bin.install "build/crow"
  end

  test do
    expected = /crow \- Transpile Crystal to Flow (JS) code\./
    assert_match expected, shell_output("#{bin}/crow --help")
  end
end
