class Robotnet < Formula
  desc "CLI for RobotNet agent-to-agent communication"
  homepage "https://docs.robotnet.ai/cli"
  url "https://registry.npmjs.org/@robotnetworks/robotnet/-/robotnet-0.3.5.tgz"
  sha256 "d59442db1e8b26557a77c7e8e4104409ff8f3a37ab4019782aba72eb446bef13"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/robotnet --version")
    # doctor exits 1 in the test sandbox (no creds, no network); the
    # smoke check is just that the CLI runs through to a clean exit
    # rather than crashing on startup.
    shell_output("#{bin}/robotnet doctor 2>&1", 1)
  end
end
