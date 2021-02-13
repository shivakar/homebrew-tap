class Pdfjam < Formula
  homepage "https://github.com/rrthomas/pdfjam"
  url "https://github.com/rrthomas/pdfjam/archive/v3.03.tar.gz"
  version "3.03"
  sha256 "bd27e44e75909cac2a53f0c8d0b253d9c95e496a181b7837f7919724dff78b69"

   resource "extras" do
    url "https://github.com/rrthomas/pdfjam-extras/archive/master.tar.gz"
    sha256 "26a89d5f2365de94e3ee7f5790be1e97eb00def7db01d385ba6f2f8d7bc95815"
   end

  def install
    bin.install Dir["bin/*"]
    man.install "man1"
    resource("extras").stage { bin.install Dir["bin/*"] }
    resource("extras").stage { man.install "man1" }
  end

  test do
    system "#{bin}/pdfjam", "-h"
  end
end
