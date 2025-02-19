class Lazyspeed < Formula
  desc "Terminal-based internet speed test"
  homepage "https://github.com/jkleinne/lazyspeed"
  url "https://github.com/jkleinne/lazyspeed/archive/v0.1.2.tar.gz"
  sha256 "b659384384b4a2a377f394d3d4b0b039781e0fa4ee11545616214d8bf1c4cd53"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "mod", "download"
    system "go", "build", *std_go_args, "."
  end

  test do
    assert_match "version #{version}", shell_output("#{bin}/lazyspeed version")
  end
end