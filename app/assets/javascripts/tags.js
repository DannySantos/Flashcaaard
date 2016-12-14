$(function() {
  return $('#flashcard_all_tags').typeahead({
    name: "tag",
    remote: "/tags/autocomplete?flashcard[all_tags]=%QUERY"
  });
});
