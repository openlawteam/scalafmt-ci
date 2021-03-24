IMAGE := openlaw/scalafmt-ci
# DEFAULT_ARGS := --list
WORKDIR := /github/workspace
TESTDATA := .github/testdata

.PHONY: test testfail testdata clean

image:
	docker build -t $(IMAGE) .

test:
	docker run --rm -it \
		-w=$(WORKDIR) \
		-v "$$(pwd)/$(TESTDATA)":$(WORKDIR) \
		$(IMAGE) --list --exclude Bad.scala

# expected failure, to see output
testfail:
	docker run --rm -it \
		-w=$(WORKDIR) \
		-v "$$(pwd)/$(TESTDATA)":$(WORKDIR) \
		$(IMAGE) --list

# generate the "good" version of the sample file
$(TESTDATA)/Good.scala: $(TESTDATA)/Bad.scala $(TESTDATA)/.scalafmt.conf
	docker run --rm -i \
		-v "$$(pwd)/$(TESTDATA)":/conf \
		mrothy/scalafmt-native:2.2.2 \
			--config /conf/.scalafmt.conf \
			--stdin --stdout \
	< $< > $@

testdata: $(TESTDATA)/Good.scala

clean:
	rm -rf $(TESTDATA)/Good.scala
