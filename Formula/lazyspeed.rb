class Lazyspeed < Formula
  desc "Terminal-based internet speed test"
  homepage "https://github.com/jkleinne/lazyspeed"
  url "https://github.com/jkleinne/lazyspeed.git",
      tag:      "v0.1.3-4",
      revision: "40e587c7209d70486047249defbe34e7d412f937"
  license "MIT"
  head "https://github.com/jkleinne/lazyspeed.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "mod", "download"
    system "go", "build", *std_go_args, "."
  end

  test do
    assert_match "lazyspeed version", shell_output("#{bin}/lazyspeed version")
  end
end
