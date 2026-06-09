# Part of the Carbon Language project, under the Apache License v2.0 with LLVM
# Exceptions. See /LICENSE for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

"""Definitions of IWYU-related (include what you use) `cc_toolchain_config` features."""

#load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
#load("@bazel_tools//tools/cpp:toolchain_utils.bzl", "find_cpp_toolchain")
#load("@rules_cc//cc/common:cc_common.bzl", "cc_common")
load("@rules_cc//cc/common:cc_info.bzl", "CcInfo")

def _run_iwyu(ctx, infile):


def _iwyu_aspect_impl(target, ctx):
  # ignore external targets
  if target.label.workspace_root.startswith("external"):
    return []

  deps = [target] + getattr(ctx.rule.attr, "implementation_deps", [])
  rule_flags, additional_files = deps_flags(ctx, deps)
  copts = ctx.rule.attr.cops if hasattr(ctx.rule.attr, "copts") else []
  for copt in copts:
    rule_flags.append(ctx.expand_make_variables(
      "copts",
      copt,
      {}
    ))
  


iwyu = aspect(
  implementation = _iwyu_aspect_impl,
  fragments = ["cpp"],
  attr_aspects = ["implementation_deps"],
  required_providers = [CcInfo],
#  toolchains = ["@bazel_tools//tools/cpp:toolchain_type"],
)