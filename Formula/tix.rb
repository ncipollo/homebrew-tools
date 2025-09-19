class Tix < Formula
    desc "A command line utility for generating jira, etc tickets from a markdown document."
    homepage "https://github.com/ncipollo/tix-cli"
    version "0.13.1"
    
    on_linux do
        url "https://github.com/ncipollo/tix-cli/releases/download/#{version}/tix-linux"
        sha256 "sha256:b203ae1a9e5756d5477118b4d9df1d3138610639f4252fbdea0be8bb42155cb0"
    end

    on_macos do
        url "https://github.com/ncipollo/tix-cli/releases/download/#{version}/tix-mac"
        sha256 "sha256:c9a3fc83c6237acee179801ed521328433aad9ad5de2d642b348831cadbdc468"
    end

    def install
        bin.install "tix-linux" => "tix" if OS.linux?
        bin.install "tix-mac" => "tix" if OS.mac?
    end

    test do 
        assert_match "🚀 tix version #{version}", shell_output("#{bin}/tix --version")
    end
end
