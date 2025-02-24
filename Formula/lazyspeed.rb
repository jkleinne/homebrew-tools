class Lazyspeed < Formula
  desc "Terminal-based internet speed test"
  homepage "https://github.com/jkleinne/lazyspeed"
  url "https://github.com/jkleinne/lazyspeed/archive/refs/tags/v0.1.2_8.tar.gz"
  sha256 "b4b171041e66aa899762796d8687957d8684ea71939a680141ee696051a428b2"
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
