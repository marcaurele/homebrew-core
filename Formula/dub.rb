class Dub < Formula
  desc "Build tool for D projects"
  homepage "https://code.dlang.org/getting_started"
  url "https://github.com/dlang/dub/archive/v1.2.0.tar.gz"
  sha256 "836caddb30ad5972a453269b027f614d51b5fd2f751a0fe63cfeb0be7388a8e9"
  version_scheme 1

  head "https://github.com/dlang/dub.git"

  bottle do
    sha256 "f286985ce85ceb50e94011ce34b049ae4a5be725a53ca638ebb4e984ca3df8e9" => :sierra
    sha256 "f286985ce85ceb50e94011ce34b049ae4a5be725a53ca638ebb4e984ca3df8e9" => :el_capitan
    sha256 "c5321228092bf1ad8c22ac3c822cf06f92bb3a5dc4844b944929e0365a4bce65" => :yosemite
  end

  devel do
    url "https://github.com/dlang/dub/archive/v1.2.1-beta.1.tar.gz"
    sha256 "8d0a8fd59afaf23194b99dd4e5b3ffd65c56f9d9da74d762d01fba9af6d79b07"
    version "1.2.1-beta.1"
  end

  depends_on "pkg-config" => [:recommended, :run]
  depends_on "dmd" => :build

  def install
    ENV["GITVER"] = version.to_s
    system "./build.sh"
    bin.install "bin/dub"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dub --version")
  end
end
