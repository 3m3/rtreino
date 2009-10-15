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


function preview(textarea) {
  $('preview').update('<h2>Preview</h2><hr/>' + $(textarea).value);
  AMtranslated = false; 
  generic();
}

function iconImageTag(src, title) {
  return "<img src='/images/icons/" + src + ".png' title='" + title + "'/>";
}

function setToolbarFor(elem) {
    //setup
    var textarea = new Control.TextArea(elem);
    var toolbar = new Control.TextArea.ToolBar(textarea);
    toolbar.container.id = 'markdown_toolbar'; //for css styles

    //buttons
    toolbar.addButton(iconImageTag("text_heading_1", 'Heading 2'),function() {
      var selection = this.getSelection();
      if(selection == '') 
        selection = 'Heading';
      this.replaceSelection("\\section{" + selection + "}");
    }, {});

    toolbar.addButton(iconImageTag("text_heading_2", 'Heading 2'),function() {
      var selection = this.getSelection();
      if(selection == '') 
        selection = 'Heading';
      this.replaceSelection("\\subsection{" + selection + "}");
    }, {});

    toolbar.addButton(iconImageTag("text_heading_3", 'Heading 3'),function() {
      var selection = this.getSelection();
      if(selection == '') 
        selection = 'Heading';
      this.replaceSelection("\\subsubsection{" + selection + "}");
    }, {});

    toolbar.addButton(iconImageTag('text_italic', 'Italic'), function() {
      this.wrapSelection('\\textit{','}');
    }, {});

    toolbar.addButton(iconImageTag('text_bold', 'Bold'), function() {
      this.wrapSelection('\\textbf{','}');
    }, {});

    toolbar.addButton(iconImageTag('text_list_bullets', 'Unordered List'),function(event){
      this.wrapSelection('\\begin{itemize}\n  \\item ', '\n\\end{itemize}\n')
    }, {});

    toolbar.addButton(iconImageTag('text_list_numbers', 'Ordered List'),function(event){
      this.wrapSelection('\\begin{enumerate}\n  \\item ', '\n\\end{enumerate}\n')
    }, {});

    toolbar.addButton(iconImageTag('image_add', 'Image add'),function(event){
      var url = window.prompt('Enter Link URL', '');
      var caption = window.prompt('Caption of image');
      var label = window.prompt('Label if you want to use \\ref', '');
      var rep = "\\begin{figure}\n";
      if (caption != '') rep += "  \\caption{" + caption + "}\n";
      if (label != '')   rep += "  \\label{" + label + "}\n";
      rep += "  \\includegraphics{" + url + "}\n";
      rep += "\\end{figure}";
      this.replaceSelection(rep);
    }, {});
    
    toolbar.addButton(iconImageTag('link', 'Link'),function(){
      var selection = this.getSelection();
      var response = prompt('Enter Link URL','');
      if(response == null) return;
      if(selection == '') selection = 'Link text';
      this.replaceSelection('\\href{' + response + '}{' + selection + '}');
    },{ });
   
    toolbar.addButton(iconImageTag('text_subscript', 'Subscript'),function(event){
      this.wrapSelection('{', '}_{}');
    }, {});

    toolbar.addButton(iconImageTag('text_superscript', 'Superscript'),function(event){
      this.wrapSelection('{', '}^{}');
    }, {});

    toolbar.addButton(iconImageTag('math_sum', 'Math Sum'),function(event){
      this.wrapSelection('$\\sum_{i=0}^{n}', '$');
    }, {});

    toolbar.addButton(iconImageTag('math_frac', 'Math Frac'),function(event){
      this.wrapSelection('$\\frac{','}{}$');
    }, {});

    toolbar.addButton(iconImageTag('math_sqrt', 'Math Sqrt'),function(event){
      this.wrapSelection('$\\sqrt{','}$');
    }, {});


    toolbar.addButton(iconImageTag('math', 'Math inline'),function(event){
      this.wrapSelection('$', '$')
    }, {});

    toolbar.addButton(iconImageTag('math', 'Math outline'),function(event){
      this.wrapSelection('$$', '$$')
    }, {});

    toolbar.addButton(iconImageTag('math', 'Math block'),function(event){
      this.wrapSelection('\\begin{displaymath}\n', '\\end{displaymath}')
    }, {});

    toolbar.addButton(iconImageTag('math', 'Recorrence'),function(event){
      var selection = this.getSelection();
      if (selection == '') selection = "a";
      this.replaceSelection('\\begin{displaymath}\ny = \\left\\{ \\begin{array}{ll}\n' + selection + ' & \\textrm{se } d>c \\\\\nb+x & \\textrm{c.c.} \\\\\n\\end{array}\\right.\n\\end{displaymath}');
    }, {});
}
