/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
(function(){function b(b){var c=this,d=c instanceof CKEDITOR.ui.dialog.checkbox;if(b.hasAttribute(c.id)){var e=b.getAttribute(c.id);d?c.setValue(a[c.id]["true"]==e.toLowerCase()):c.setValue(e)}}function c(b){var c=this,d=c.getValue()==="",e=c instanceof CKEDITOR.ui.dialog.checkbox,f=c.getValue();d?b.removeAttribute(c.att||c.id):e?b.setAttribute(c.id,a[c.id][f]):b.setAttribute(c.att||c.id,f)}var a={scrolling:{"true":"yes","false":"no"},frameborder:{"true":"1","false":"0"}};CKEDITOR.dialog.add("iframe",function(a){var d=a.lang.iframe,e=a.lang.common,f=a.plugins.dialogadvtab;return{title:d.title,minWidth:350,minHeight:260,onShow:function(){var b=this;b.fakeImage=b.iframeNode=null;var c=b.getSelectedElement();if(c&&c.data("cke-real-element-type")&&c.data("cke-real-element-type")=="iframe"){b.fakeImage=c;var d=a.restoreRealElement(c);b.iframeNode=d,b.setupContent(d)}},onOk:function(){var b=this,c;b.fakeImage?c=b.iframeNode:c=new CKEDITOR.dom.element("iframe");var d={},e={};b.commitContent(c,d,e);var f=a.createFakeElement(c,"cke_iframe","iframe",!0);f.setAttributes(e),f.setStyles(d),b.fakeImage?(f.replace(b.fakeImage),a.getSelection().selectElement(f)):a.insertElement(f)},contents:[{id:"info",label:e.generalTab,accessKey:"I",elements:[{type:"vbox",padding:0,children:[{id:"src",type:"text",label:e.url,required:!0,validate:CKEDITOR.dialog.validate.notEmpty(d.noUrl),setup:b,commit:c}]},{type:"hbox",children:[{id:"width",type:"text",style:"width:100%",labelLayout:"vertical",label:e.width,validate:CKEDITOR.dialog.validate.htmlLength(e.invalidHtmlLength.replace("%1",e.width)),setup:b,commit:c},{id:"height",type:"text",style:"width:100%",labelLayout:"vertical",label:e.height,validate:CKEDITOR.dialog.validate.htmlLength(e.invalidHtmlLength.replace("%1",e.height)),setup:b,commit:c},{id:"align",type:"select","default":"",items:[[e.notSet,""],[e.alignLeft,"left"],[e.alignRight,"right"],[e.alignTop,"top"],[e.alignMiddle,"middle"],[e.alignBottom,"bottom"]],style:"width:100%",labelLayout:"vertical",label:e.align,setup:function(a,c){b.apply(this,arguments);if(c){var d=c.getAttribute("align");this.setValue(d&&d.toLowerCase()||"")}},commit:function(a,b,d){c.apply(this,arguments),this.getValue()&&(d.align=this.getValue())}}]},{type:"hbox",widths:["50%","50%"],children:[{id:"scrolling",type:"checkbox",label:d.scrolling,setup:b,commit:c},{id:"frameborder",type:"checkbox",label:d.border,setup:b,commit:c}]},{type:"hbox",widths:["50%","50%"],children:[{id:"name",type:"text",label:e.name,setup:b,commit:c},{id:"title",type:"text",label:e.advisoryTitle,setup:b,commit:c}]},{id:"longdesc",type:"text",label:e.longDescr,setup:b,commit:c}]},f&&f.createAdvancedTab(a,{id:1,classes:1,styles:1})]}})})();