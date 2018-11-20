let g:projectionist_heuristics = {
  \  "lib/*.js": {
  \    "lib/*.js": {
  \      "alternate": ["tests/units/{}.js", "tests/{}.js"],
  \      "type": "source"
  \    },
  \    "tests/units/*.js": {
  \      "alternate": "lib/{}.js",
  \      "type": "test"
  \    }
  \  },
  \  "src/app/*.js": {
  \    "src/app/*.js": {
  \      "alternate": ["tests/units/{}.js", "tests/{}.js"],
  \      "type": "source"
  \    },
  \    "tests/units/*.js": {
  \      "alternate": "src/app/{}.js",
  \      "type": "test"
  \    }
  \  },
  \  "*.js": {
  \    "*.js": {
  \      "alternate": ["tests/units/{}.js", "tests/{}.js"],
  \      "type": "source"
  \    },
  \    "tests/units/*.js": {
  \      "alternate": "{}.js",
  \      "type": "test"
  \    }
  \  },
  \  "*.php": {
  \    "*.php": {
  \      "alternate": ["tests/{}Test.php"],
  \      "type": "source"
  \    },
  \    "tests/*Test.php": {
  \      "alternate": "{}.php",
  \      "type": "test"
  \    }
  \  },
  \}
