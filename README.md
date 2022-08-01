# abstract-section

This extension allows to write an abstract anywhere in the main
text and moves it to the metadata. Quarto expects the abstract to
be given as part of the metadata, but adding the abstract to the
body text is often easier and more natural.

## Defining an Abstract

A document abstract can either be put directly in the document
metadata, for example by inserting an *abstract* attribute into a
YAML block.

    ---
    abstract: |
      Place abstract here.

      Multiple paragraphs are possible.
    ---

The additional indentation and formatting requirements in YAML
headers can be confusing or annoying for authors. It can be
preferable to write abstracts as normal sections.

    # Abstract

    Place abstract here.

    Multiple paragraphs are possible.

This filter turns the latter into the former by looking for a
header whose ID is `abstract`. Quarto auto-creates IDs based on
header contents, so a header titled *Abstract* will satisfy this
condition.

The abstract can be placed anywhere in the document.

The filter assumes that the abstract contains all text up to the
next heading or horizontal rule, whichever comes first. Thus the
abstract can be placed at the beginning of a document whose text
doesn't start with a heading:

    # Abstract

    The abstract text includes this.

    * * * *

    This text is the beginning of the document.
