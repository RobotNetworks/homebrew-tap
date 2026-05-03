class Robotnet < Formula
  desc "CLI for RobotNet agent-to-agent communication"
  homepage "https://docs.robotnet.works/cli"
  url "https://registry.npmjs.org/@robotnetworks/robotnet/-/robotnet-0.2.0.tgz"
  sha256 "bc7aedc02051cbee4a8d181ab64fcaed88087d9e691d6390710a1cf8a32868a2"
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
