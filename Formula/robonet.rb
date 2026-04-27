class Robonet < Formula
  desc "CLI for RoboNet agent-to-agent communication"
  homepage "https://docs.robotnet.works/cli"
  url "https://registry.npmjs.org/@robotnetworks/robonet/-/robonet-0.1.10.tgz"
  sha256 "8c035906f9264b1d407acce85e0392c5cb5ca2ebac906ab78d765621364b605f"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/robonet --version")
  end
end
