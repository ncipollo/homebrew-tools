class Tix < Formula
    desc "A command line utility for generating jira, etc tickets from a markdown document."
    url  "https://github.com/ncipollo/tix",
        :tag => "0.0.2"

    depends_on "go" => :build
    depends_on "make" => :build

    def install
        ENV["GOPATH"] = buildpath
        srcPath = buildpath/"src/github.com/ncipollo/tix"
        # Copy all files from their current location (GOPATH root)
        # to $GOPATH/src/github.com/golift/hello-world
        srcPath.install Dir["*",".??*"]
        cd srcPath do
            system "pwd"
            system "make build"
        end
    end
end