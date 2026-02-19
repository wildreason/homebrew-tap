class Aster < Formula
  desc "Terminal file reader. Markdown, JSONL, diffs, and more."
  homepage "https://github.com/wildreason/reader"
  url "https://github.com/wildreason/reader/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e9d409d4e9017cf77480ac0b303dd87e64c302780105585ab28b9982b97ff4cf"
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
