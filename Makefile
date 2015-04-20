# Main entry point
SOURCE = src/app.js
SOURCE_CSS = src/app.scss
SOURCE_HTML = src/index.html

# The dependencies (other than node_modules/**)
LIBS = $(shell ls src/lib/*.js src/components/*.js)
CSS_MODULES = $(shell ls src/styles/*.scss)

# The targets
TARGET = build/app.js
TARGET_CSS = build/app.css
TARGET_HTML = build/index.html

TARGETS = $(TARGET) $(TARGET_CSS) $(TARGET_HTML)

# Compilation flags
FLAGS = -t babelify

# Enable sourcemap with "make sourcemap=1"
ifdef sourcemap
	FLAGS += --debug
endif

# Binaries
WATCHIFY = ./node_modules/.bin/watchify
BROWSERIFY = ./node_modules/.bin/browserify
SASS = ./node_modules/.bin/node-sass --include-path node_modules
AUTOPREFIXER = ./node_modules/.bin/autoprefixer
WACH = ./node_modules/.bin/wach
NPM = npm

.PHONY: build clean watch watchify

build: $(TARGETS)

clean:
	rm -f $(TARGETS)

watchify:
	$(WATCHIFY) --verbose $(FLAGS) -o $(TARGET) -- $(SOURCE)

watch:
	#browser-sync start --server "build" --files "build/**/*"
	$(WACH) -o "src/**/*" make

# Note: browserify --list is so slow, just rely on node_modules
$(TARGET): $(SOURCE) $(LIBS) node_modules
	$(BROWSERIFY) $(FLAGS) -o $@ -- $<

$(TARGET_CSS): $(SOURCE_CSS) $(CSS_MODULES) node_modules
	$(SASS) $< $@
	$(AUTOPREFIXER) $@

$(TARGET_HTML): $(SOURCE_HTML)
	cp $< $@

node_modules:
	$(NPM) install
