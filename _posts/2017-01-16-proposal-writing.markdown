---
layout: post
title:  "An Approach (and Template) for Reproducible Proposal Writing"
date:   2017-01-16 16:00:00
categories:
- science
tags:
- careers
- science
- writing
- latex
- github
---
This past year came with a significant increase in the number and complexity of funding proposals I put together. The process has been a bit of a learning experience, particularly in how important organization can be to larger writing projects. While I think the standard approach is to fight with Word, I’ve taken the opportunity to try and adopt some software tools (including Latex and Git) to make the process a bit more reproducible and straightforward. A few lessons I’ve taken away from the year follow below; if you would like to replicate the workflow I apply, please take a look at the [template I start from on Github](https://github.com/thanatosmin/grant-template).

- *Codify good practice.* When putting together large documents I find it challenging to maintain consistency. For example, I would like acronyms to be introduced once, subsequently used throughout, and included in the glossary. The `glossary` package can seamlessly handle this for me. I would like all citations to be of the `supercite` variety and so overload the `cite` command. Aims and tasks end up subtly edited throughout the process of writing and proofing, and so these phrases are defined in commands. Make the computer work for you.
- *Ensure final tweaking steps will be seamless.* Inevitably, a few tweaks will be necessary to ensure the Specific Aims page is, in fact, a page, or that a figure isn’t hanging off the end of a page split. The main place where I adjust my practice in order to accomplish this is wrapping each figure into a command. That way, when I need to move a figure down, it's just a single line making the trip.
- *Use git as your track changes.* A versioning system allows you to concentrate only on the document before you. What I’ve found works for me is to make commits roughly once a day, or when I hand the document to anyone else for proofing/approval. That way, I can continue to work on a document while someone else is looking through it, and when they provide edits I can instantly jump back to the point they saw. While folks in biology are most used to a Word document with track changes[^1], I tell people they can provide me comments however they find most convenient, and many are most comfortable scribbling on a hard copy.
- *Separate style and content.* A style file seems redundant since it all can just go in the preamble of a document but, at least for me, it helps to enforce that those are not settings I should be tweaking when trying to assemble the content.
- *Respect your readers by being boring.* If the purpose of your document is to convey information as efficiently as possible, eschew complications that do not directly serve that purpose. Those font ligatures and bright colors aren’t going to help your reader if it distracts them from learning what you want to tell them.

Obviously, these tips won't make you have high-quality science to talk about, but have helped me streamline the process of getting that material onto a page without errors.

[^1]: I also find track changes very distracting, so versioning being handled in a separate tool is helpful.
