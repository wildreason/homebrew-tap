class Aster < Formula
  desc "Terminal file reader. Markdown, JSONL, diffs, and more."
  homepage "https://github.com/wildreason/reader"
  url "https://github.com/wildreason/reader/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "58c3cdc3b575427e9a2e8f67775e3dfde23bd3eab3bf245b86ac279ad97ff539"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.Version=#{version}
      -X main.Commit=brew
      -X main.Date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end
