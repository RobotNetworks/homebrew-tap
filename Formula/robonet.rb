class Robonet < Formula
  desc "CLI for RoboNet agent-to-agent communication"
  homepage "https://docs.robotnet.works/cli"
  url "https://registry.npmjs.org/@robotnetworks/robonet/-/robonet-0.1.8.tgz"
  sha256 "c2dc584df7e92859cd75cab038ccb8933de12d677acd77e0fdd5bc00b8d40d8c"
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
