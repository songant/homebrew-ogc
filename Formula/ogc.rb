# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Ogc < Formula
  desc "ogc"
  homepage "https://github.com/songant/open-gpu-cloud"
  version "0.0.1"


  if Hardware::CPU.intel?
    url "https://github.com/songant/open-gpu-cloud/releases/download/ogc-cli-0.0.1/ogc_cli-darwin_amd64"
    sha256 "08072ffb4256867fd984ce33e6c28dc40cc1e7f864513414cc6a364e37940894"
  elsif Hardware::CPU.arm?
    url "https://github.com/songant/open-gpu-cloud/releases/download/ogc-cli-0.0.1/ogc_cli-darwin_arm64"
    sha256 "9e0556eb8612150e0399e4aa6dc0ce7c15323a6846c518508ec5ee1424713164"
  else
    odie "Unsupported CPU architecture"
  end

  def install

    if Hardware::CPU.intel?
      bin.install "ogc_cli-darwin_amd64" => "ogc"
    elsif Hardware::CPU.arm?
      bin.install "ogc_cli-darwin_arm64" => "ogc"
    end
    system "xattr", "-c", "#{bin}/ogc"
  end

end