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

// Focus the first control in page
Event.observe(window, 'load', function() {
  var e = $A(document.getElementsByTagName('*')).find(function(e) {
    return (e.tagName.toUpperCase() == 'INPUT' && (e.type == 'text' || e.type == 'password'))
        || e.tagName.toUpperCase() == 'TEXTAREA' || e.tagName.toUpperCase() == 'SELECT';
  });
  if (e) e.focus();
});

