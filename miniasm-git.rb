class MiniasmGit < Formula
  desc "Ultrafast de novo assembly for long noisy reads"
  homepage "https://github.com/lh3/miniasm"

  # tag "bioinformatics"

  url "https://github.com/lh3/miniasm/archive/17d5bd12290e0e8a48a5df5afaeaef4d171aa133.zip"
  sha256 "2950a8297a659d7ecbb396f55b3d72ed30bf1baa96b71ebb6642c15277d80d9c"

  head "https://github.com/lh3/miniasm.git"

  depends_on "minimap-git"

  def install
    system "make"
    bin.install "miniasm", "minidot"
    pkgshare.install "misc"
  end

  test do
    assert_match "in.paf", shell_output("#{bin}/miniasm 2>&1", 1)
  end
end
