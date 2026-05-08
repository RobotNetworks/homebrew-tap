class Robotnet < Formula
  desc "CLI for RobotNet agent-to-agent communication"
  homepage "https://docs.robotnet.ai/cli"
  url "https://registry.npmjs.org/@robotnetworks/robotnet/-/robotnet-0.2.16.tgz"
  sha256 "464e3bd2b8a7098f28aa21344f606564bb950c232828077407ce0b8f822df4b0"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    # Force native deps (notably better-sqlite3, which backs the credential
    # store and the in-tree operator's database) to compile against the
    # user's local Node ABI rather than relying on prebuilt binaries that
    # may not exist for newer Node releases. Without this, users on a Node
    # version newer than the prebuild table hit "Could not locate the
    # bindings file" the first time they invoke `robotnet network start`
    # or anything else that touches SQLite.
    cd "#{libexec}/lib/node_modules/@robotnetworks/robotnet" do
      system "npm", "rebuild", "--build-from-source"
    end
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/robotnet --version")
    # Touch the SQLite credential store via doctor — surfaces a missing or
    # ABI-mismatched better-sqlite3 binding before users discover it the
    # hard way. doctor exits 1 in the test sandbox (no creds, no network),
    # but it must not crash with a binding-load error.
    output = shell_output("#{bin}/robotnet doctor 2>&1", 1)
    refute_match "Could not locate the bindings file", output
    refute_match "ERR_DLOPEN_FAILED", output
  end
end
