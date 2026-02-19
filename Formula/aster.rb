class Aster < Formula
  desc "Terminal file reader. Markdown, JSONL, diffs, and more."
  homepage "https://github.com/wildreason/reader"
  url "https://github.com/wildreason/reader/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "74dbccf5b05995ff41726edfa3b8b3e656aa8cd0dde86377424100f8110e5629"
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
