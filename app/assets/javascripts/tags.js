$(function() {
  return $('#tag_search').typeahead({
    name: "tag",
    remote: "/tags/autocomplete?query=%QUERY"
  });
});
