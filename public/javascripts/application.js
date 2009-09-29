// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


// Show selected tab. 
function showTab(divParent, tabSelected) {
  $(tabSelected).show(); 
  $$(divParent + ' .tabContent').each(function(node) { 
      if (node.id != tabSelected) {
        node.hide(); 
      }
    });
}
