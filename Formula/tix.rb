class Tix < Formula
    desc "A command line utility for generating jira, etc tickets from a markdown document."
    url  "https://github.com/ncipollo/tix.git",
        :tag => "0.9.1"

    depends_on "go" => :build
    depends_on "make" => :build

    def install
        ENV["GOPATH"] = buildpath
        ENV["VERSION"] = version
        src_path = buildpath/"src/tix"
        # Copy all files from their current location (GOPATH root)
        # to $GOPATH/src/github.com/ncipollo/tix
        src_path.install Dir["*",".??*"]
        cd src_path do
            system "make", "deps"
            system "make", "build"
            build_path = src_path/"build/release/tix"
            bin.install build_path

            zsh_completion.install "completions/_tix"
        end
    end

    test do 
        assert_match "🚀 tix version #{version}", shell_output("#{bin}/tix --version")
    end
end
