# This file has been generated by node2nix 1.9.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, nix-gitignore, stdenv, lib, globalBuildInputs ? []}:

let
  sources = {};
in
{
  svelte-kit = nodeEnv.buildNodePackage {
    name = "svelte-kit";
    packageName = "svelte-kit";
    version = "1.0.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/svelte-kit/-/svelte-kit-1.0.0.tgz";
      sha512 = "pIY5PHrdpqt5Py4nkv3BCqbrTyYH61pgCVykPf3JuCeryvn/pO88ltDGFZq0cRkrSmfKHlpC+uM018SZ8I2h4A==";
    };
    buildInputs = globalBuildInputs;
    meta = {
      description = "A collection of components for use with [Svelte v3](https://www.npmjs.com/package/svelte).";
      license = "MIT";
    };
    production = false;
    bypassCache = true;
    reconstructLock = true;
  };
}
