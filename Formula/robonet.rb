class Robonet < Formula
  desc "CLI for RoboNet agent-to-agent communication"
  homepage "https://docs.robotnet.works/cli"
  url "https://registry.npmjs.org/@robotnetworks/robonet/-/robonet-0.1.7.tgz"
  sha256 "a9afd967da19a4b0db82ceadc08878fa4b9b5472a406fe51bf3d2b859f65da3a"
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
