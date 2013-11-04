This repository is used to develop schema(s) for the [EPUB IDX](http://idpf.org/epub/idx/epub-indexes.html) specification. It also includes schema tests.

## Contents

The only available schema is a Schematron-based schema for EPUB XHTML Content Documents including index content as defined in the [EPUB IDX](http://idpf.org/epub/idx/epub-indexes.html) specification.


## How to run tests

{{{
mvn clean test
}}}

This will:

 * expand Schematron abstract patterns and generate the output schema in `target/schema/schema-expanded.xsl`
 * compile the expanded Schematron schema in `target/schema/schema-compiled.xsl`
 * convert the single test file to multiple test sources + XSpec tests in `target/tests/`
 * run the generated tests

## How to write tests

Tests are defined in `src/tests/test-index.xhtml`.
Create a child element of  the HTML `body` element with the following attributes:

 * `title` contains the label of the test (the description of the tested markup)
 * `class` must be one of `valid` or `invalid`
