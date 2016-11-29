class MinimapGit < Formula
  desc "Find approx mapping positions between long sequences"
  homepage "https://github.com/lh3/minimap"
  # tag "bioinformatics"

  url "https://github.com/lh3/minimap/archive/1cd6ae3bc7c7a6f9e7c03c0b7a93a12647bba244.zip"
  sha256 "a91b8d25f44c092404a4c50eb6d66af5bed093ceaab4598a32b930c2931ac40d"

  head "https://github.com/lh3/minimap.git"

  def install
    system "make"
    bin.install "minimap"
  end

  test do
    assert_match "mapping", shell_output("#{bin}/minimap 2>&1", 1)
  end
end
