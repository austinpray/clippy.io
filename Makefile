# Main entry point
SOURCE = src/app.js

# The dependencies (other than node_modules/**)
LIBS = $(shell find src/components src/lib -name "*.js")
CSS_MODULES = $(shell find src/styles -name "*.scss")

# The targets
TARGET              = build/app.js
TARGET_ES6_POLYFILL = build/es6.js
TARGET_CSS          = build/app.css
TARGET_HTML         = build/index.html

TARGETS = $(TARGET) $(TARGET_ES6_POLYFILL) $(TARGET_CSS) $(TARGET_HTML)

# Compilation flags
FLAGS = -t babelify

# Enable sourcemap with "make sourcemap=1"
ifdef sourcemap
	FLAGS += --debug
endif

# Binaries
WATCHIFY     = ./node_modules/.bin/watchify
BROWSERIFY   = ./node_modules/.bin/browserify
SASS         = ./node_modules/.bin/node-sass --include-path node_modules
AUTOPREFIXER = ./node_modules/.bin/autoprefixer
WACH         = ./node_modules/.bin/wach
NPM          = npm

.PHONY: build clean watch watchify

build: $(TARGETS)

clean:
	rm -f $(TARGETS)

watchify:
	$(WATCHIFY) --verbose $(FLAGS) -o $(TARGET) -- $(SOURCE)

watch:
	$(WACH) -o "src/**/*" make

build/%.js: src/%.js $(LIBS) node_modules
	$(BROWSERIFY) $(FLAGS) -o $@ -- $<

build/%.css: src/%.scss $(CSS_MODULES) node_modules
	$(SASS) $< $@
	$(AUTOPREFIXER) $@

build/%.html: src/%.html
	cp $< $@

node_modules:
	$(NPM) install

# http://blog.jgc.org/2015/04/the-one-line-you-should-add-to-every.html
print-%: ; @echo $*=$($*)
