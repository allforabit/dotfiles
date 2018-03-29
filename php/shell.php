#!/usr/bin/env php
<?php
// ↓Namespace for your project
namespace Nyaan;

// load Composer autoload file
require_once __DIR__ . '/vendor/autoload.php';
// load other initialize PHP files
// require_once …

echo __NAMESPACE__ . " shell\n";

$sh = new \Psy\Shell();

// Set project namespace in REPL
if (defined('__NAMESPACE__') && __NAMESPACE__ !== '') {
    $sh->addCode(sprintf("namespace %s;", __NAMESPACE__));
}

$sh->run();

// Termination message
echo "Bye.\n";
