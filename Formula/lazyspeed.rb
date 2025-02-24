class Lazyspeed < Formula
  desc "Terminal-based internet speed test"
  homepage "https://github.com/jkleinne/lazyspeed"
  url "https://github.com/jkleinne/lazyspeed/archive/v0.1.2-3.tar.gz"
  sha256 "6e4327cdc9b4b8f5b36c01a65e10a322389357f78820cc673f07d6d16be3e0f4"
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