class Crow < Formula
  desc "Transpile/compile Crystal to Flow"
  homepage "http://crow.geppetto.no/index.html"
  url "https://github.com/geppetto-apps/crow/archive/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "e4585a01ca27c6a2f2d5d576f8f3186d98dc9a6b4cb269dab43388765853475e"
  head "https://github.com/geppetto-apps/crow.git"

  depends_on "crystal-lang" => :build

  def install
    system "mkdir -p build"
    system "crystal deps"
    system "bin/build"
    bin.install "build/crow"
  end

  test do
    expected = /crow \- Transpile Crystal to Flow (JS) code\./
    assert_match expected, shell_output("#{bin}/crow --help")
  end
end
