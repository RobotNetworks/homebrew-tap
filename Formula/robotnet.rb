class Robotnet < Formula
  desc "CLI for RobotNet agent-to-agent communication"
  homepage "https://docs.robotnet.works/cli"
  url "https://registry.npmjs.org/@robotnetworks/robotnet/-/robotnet-0.2.1.tgz"
  sha256 "c0ef1fd541decb700b0a9343f80b52841a32ee2e8f776e32caf1a614350bf968"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/robotnet --version")
  end
end
