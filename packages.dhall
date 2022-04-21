{-
Welcome to your new Dhall package-set!

Below are instructions for how to edit this file for most use
cases, so that you don't need to know Dhall to use it.

## Use Cases

Most will want to do one or both of these options:
1. Override/Patch a package's dependency
2. Add a package not already in the default package set

This file will continue to work whether you use one or both options.
Instructions for each option are explained below.

### Overriding/Patching a package

Purpose:
- Change a package's dependency to a newer/older release than the
    default package set's release
- Use your own modified version of some dependency that may
    include new API, changed API, removed API by
    using your custom git repo of the library rather than
    the package set's repo

Syntax:
where `entityName` is one of the following:
- dependencies
- repo
- version
-------------------------------
let upstream = --
in  upstream
  with packageName.entityName = "new value"
-------------------------------

Example:
-------------------------------
let upstream = --
in  upstream
  with halogen.version = "master"
  with halogen.repo = "https://example.com/path/to/git/repo.git"

  with halogen-vdom.version = "v4.0.0"
  with halogen-vdom.dependencies = [ "extra-dependency" ] # halogen-vdom.dependencies
-------------------------------

### Additions

Purpose:
- Add packages that aren't already included in the default package set

Syntax:
where `<version>` is:
- a tag (i.e. "v4.0.0")
- a branch (i.e. "master")
- commit hash (i.e. "701f3e44aafb1a6459281714858fadf2c4c2a977")
-------------------------------
let upstream = --
in  upstream
  with new-package-name =
    { dependencies =
       [ "dependency1"
       , "dependency2"
       ]
    , repo =
       "https://example.com/path/to/git/repo.git"
    , version =
        "<version>"
    }
-------------------------------

Example:
-------------------------------
let upstream = --
in  upstream
  with benchotron =
      { dependencies =
          [ "arrays"
          , "exists"
          , "profunctor"
          , "strings"
          , "quickcheck"
          , "lcg"
          , "transformers"
          , "foldable-traversable"
          , "exceptions"
          , "node-fs"
          , "node-buffer"
          , "node-readline"
          , "datetime"
          , "now"
          ]
      , repo =
          "https://github.com/hdgarrood/purescript-benchotron.git"
      , version =
          "v7.0.0"
      }
-------------------------------
-}
let upstream =
      https://raw.githubusercontent.com/purescript/package-sets/prepare-0.15/src/packages.dhall
        sha256:b1c6d06132b7cbf1e93b1e5343044fba1604b50bfbe02d8f80a3002e71569c59

in  upstream
  with debug =
    { dependencies = [ "prelude", "functions" ]
    , repo =
        "https://github.com/working-group-purescript-es/purescript-debug.git"
    , version = "es-modules"
    }
  with justifill =
    { dependencies =
      [ "aff", "effect", "maybe", "prelude", "record", "typelevel-prelude" ]
    , repo = "https://github.com/i-am-the-slime/purescript-justifill.git"
    , version = "v0.3.1"
    }
  with react-basic =
    { dependencies = [ "prelude", "effect", "record" ]
    , repo = "https://github.com/lumihq/purescript-react-basic.git"
    , version = "v16.0.0"
    }
  with react-basic-dom =
    { dependencies =
      [ "prelude"
      , "console"
      , "effect"
      , "foreign-object"
      , "psci-support"
      , "react-basic"
      , "unsafe-coerce"
      , "web-dom"
      , "web-events"
      , "web-file"
      , "web-html"
      ]
    , repo = "https://github.com/lumihq/purescript-react-basic-dom.git"
    , version = "v4.2.0"
    }
  with react-basic-emotion =
    { dependencies =
      [ "colors"
      , "console"
      , "effect"
      , "foreign"
      , "foreign-object"
      , "numbers"
      , "prelude"
      , "react-basic"
      , "react-basic-hooks"
      , "typelevel-prelude"
      , "unsafe-reference"
      ]
    , repo = "https://github.com/lumihq/purescript-react-basic-emotion.git"
    , version = "v6.0.0"
    }
  with uuid =
    { dependencies = [ "effect", "maybe", "foreign-generic", "console", "spec" ]
    , repo = "https://github.com/i-am-the-slime/purescript-uuid.git"
    , version = "patch-2"
    }
  with react-basic-hooks =
    { dependencies =
      [ "aff"
      , "aff-promise"
      , "bifunctors"
      , "console"
      , "control"
      , "datetime"
      , "effect"
      , "either"
      , "exceptions"
      , "foldable-traversable"
      , "functions"
      , "indexed-monad"
      , "integers"
      , "maybe"
      , "newtype"
      , "now"
      , "nullable"
      , "ordered-collections"
      , "prelude"
      , "psci-support"
      , "react-basic"
      , "refs"
      , "tuples"
      , "type-equality"
      , "unsafe-coerce"
      , "unsafe-reference"
      , "web-html"
      ]
    , repo = "https://github.com/spicydonuts/purescript-react-basic-hooks.git"
    , version = "v7.0.1"
    }
  with react-basic.repo
       =
      "https://github.com/working-group-purescript-es/purescript-react-basic.git"
  with react-basic.version = "es-modules"
  with react-basic-dom.repo
       =
      "https://github.com/working-group-purescript-es/purescript-react-basic-dom.git"
  with react-basic-dom.version = "es-modules"
  with react-basic-hooks.repo
       =
      "https://github.com/working-group-purescript-es/purescript-react-basic-hooks.git"
  with react-basic-hooks.version = "es-modules"
  with react-basic-emotion.repo
       =
      "https://github.com/working-group-purescript-es/purescript-react-basic-emotion.git"
  with react-basic-emotion.version = "es-modules"
  with spec =
    { repo = "https://github.com/purescript-spec/purescript-spec.git"
    , version = "master"
    , dependencies =
      [ "aff"
      , "ansi"
      , "avar"
      , "console"
      , "exceptions"
      , "foldable-traversable"
      , "fork"
      , "now"
      , "pipes"
      , "prelude"
      , "strings"
      , "transformers"
      ]
    }
  with record-extra =
    { repo =
        "https://github.com/working-group-purescript-es/purescript-record-extra.git"
    , version = "v0.15.0-update"
    , dependencies =
      [ "arrays"
      , "console"
      , "effect"
      , "functions"
      , "lists"
      , "maybe"
      , "prelude"
      , "record"
      , "tuples"
      , "typelevel-prelude"
      ]
    }
  with literals =
    { dependencies =
      [ "assert"
      , "effect"
      , "console"
      , "integers"
      , "numbers"
      , "partial"
      , "psci-support"
      , "unsafe-coerce"
      , "typelevel-prelude"
      ]
    , repo = "https://github.com/jvliwanag/purescript-literals.git"
    , version = "v0.2.0"
    }
  with literals.repo
       =
      "https://github.com/working-group-purescript-es/purescript-literals.git"
  with literals.version = "es-modules"
  with untagged-union =
    { dependencies =
      [ "assert"
      , "console"
      , "effect"
      , "foreign"
      , "foreign-object"
      , "literals"
      , "maybe"
      , "newtype"
      , "psci-support"
      , "tuples"
      , "unsafe-coerce"
      ]
    , repo = "https://github.com/jvliwanag/purescript-untagged-union.git"
    , version = "v0.3.0"
    }
  with untagged-union.repo
       =
      "https://github.com/working-group-purescript-es/purescript-untagged-union.git"
  with untagged-union.version = "es-modules"
