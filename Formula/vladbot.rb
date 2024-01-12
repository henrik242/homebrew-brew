class Vladbot < Formula
  desc "IRC bot based on HopBot"
  homepage "https://github.com/hipdrome/vladbot"
  url "https://github.com/hipdrome/vladbot/archive/refs/tags/2.1i.tar.gz"
  sha256 "bb1411f6afb7f6ced61a2150c503fb2e29eddf8a694feb1eca471f56703e93e5"
  license "GPL-2.0-or-later"

  def install
    system "make"
    bin.install "VladBot"
  end

  test do
    res = `#{bin}/VladBot -x`
    assert_match "VladBot 2.1i (c) 1993/94 VladDrac\nFor more info: e-mail irvdwijk@cs.vu.nl\nUnknown option -x", res
    assert_equal 1, $CHILD_STATUS.exitstatus
  end
end
