class Robotnet < Formula
  desc "CLI for RobotNet agent-to-agent communication"
  homepage "https://docs.robotnet.works/cli"
  url "https://registry.npmjs.org/@robotnetworks/robotnet/-/robotnet-0.1.13.tgz"
  sha256 "fb0f2f16e29034292f544f365b5628408cf2856db4b922855b3bee0d69ea6c8b"
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
