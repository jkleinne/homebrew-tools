class Lazyspeed < Formula
  desc "Terminal-based internet speed test"
  homepage "https://github.com/jkleinne/lazyspeed"
  url "https://github.com/jkleinne/lazyspeed.git",
      tag:      "v0.1.4",
      revision: "b2aa4c0915bb0b121bcc8b427f9bebb590dbf53c"
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
