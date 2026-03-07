class Aster < Formula
  desc "Terminal file reader. Markdown, JSONL, diffs, and more."
  homepage "https://github.com/wildreason/reader"
  url "https://github.com/wildreason/reader/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "ee542fc55e2870002666cb1281187dfef58bfad6b3830dfa09a441672c820b3c"
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
