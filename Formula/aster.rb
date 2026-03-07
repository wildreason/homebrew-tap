class Aster < Formula
  desc "Terminal file reader. Markdown, JSONL, diffs, and more."
  homepage "https://github.com/wildreason/reader"
  url "https://github.com/wildreason/reader/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "ee496e05dd8cc5126dec022b48afd8367a85c4bfe0b03d3133402ee17b04a320"
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
