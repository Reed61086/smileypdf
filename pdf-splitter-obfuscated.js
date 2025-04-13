/* SmileyPDF - Proprietary Code
 * Copyright (c) 2025 SmileyPDF
 * UNAUTHORIZED COPYING, MODIFICATION, OR DISTRIBUTION IS STRICTLY PROHIBITED
 * All rights reserved.
 */

// Anti-debugging mechanism
(function(){setInterval(function(){(function(){return!1})["constructor"]("debugger")()},100);var e=new Date;setInterval(function(){var t=new Date;t-e>200&&window.location.reload(),e=t},100)})();

// String decryption function
function _0xd3c(s){return s.split("").map(function(c){return String.fromCharCode(c.charCodeAt(0)-3)}).join("")}

// PDF Splitter Core Logic - Heavily obfuscated
(function(){
    var _0x7a1b=document.getElementById("pdf-upload"),_0x8c2d=document.getElementById("file-info"),_0x9e3f=document.getElementById("pdf-preview-container"),_0xa04g=document.getElementById("pdf-preview"),_0xb15h=document.getElementById("split-options"),_0xc26i=document.getElementById("page-ranges"),_0xd37j=document.getElementById("split-button"),_0xe48k=document.getElementById("progress-container"),_0xf59l=document.getElementById("progress-bar"),_0xg60m=document.getElementById("results-container"),_0xh71n=document.getElementById("results"),_0xi82o=null,_0xj93p=null,_0xka4q=0;
    
    // Initialize PDF.js
    pdfjsLib.GlobalWorkerOptions.workerSrc=_0xd3c("kwwsv=22fgqmv1forxgioduh1frp2dmda2sgi1mv261441497sgi1zrunhu1plq1mv");
    
    // File upload handler
    _0x7a1b.addEventListener("change",function(e){
        if(e.target.files.length===0)return;
        _0xa04g.innerHTML="",_0x8c2d.innerHTML="",_0xg60m.classList.add("hidden"),_0xh71n.innerHTML="",_0xi82o=e.target.files[0];
        var t=URL.createObjectURL(_0xi82o),n=document.createElement("iframe");
        n.src=t,n.width="100%",n.height="400px",_0xa04g.appendChild(n),_0x9e3f.classList.remove("hidden");
        var a=new FileReader;
        a.onload=function(e){
            var t=new Uint8Array(e.target.result);
            pdfjsLib.getDocument({data:t}).promise.then(function(e){
                _0xj93p=e,_0xka4q=e.numPages,_0x8c2d.innerHTML+='<p class="text-sm text-gray-600">'+_0xd3c("Sdjhv=")+_0xka4q+"</p>",_0xc26i.value="1-"+_0xka4q,_0xb15h.classList.remove("hidden")
            }).catch(function(e){
                console.error(_0xd3c("Huuru#ordglqj#SGI="),e),alert(_0xd3c("Huuru#ordglqj#SGI=")+e.message)
            })
        },a.onerror=function(){
            alert(_0xd3c("Huuru#uhdglqj#iloh"))
        },a.readAsArrayBuffer(_0xi82o)
    });
    
    // Parse page ranges
    function _0xl5br(e){
        if(!e.trim())return[];
        for(var t=[],n=e.split(","),a=0;a<n.length;a++){
            var r=n[a].trim();
            if(r.indexOf("-")!==-1){
                var i=r.split("-"),o=parseInt(i[0].trim()),s=parseInt(i[1].trim());
                if(!isNaN(o)&&!isNaN(s))
                    for(var l=o;l<=s;l++)l>=1&&l<=_0xka4q&&t.indexOf(l)===-1&&t.push(l)
            }else{
                var c=parseInt(r);
                !isNaN(c)&&c>=1&&c<=_0xka4q&&t.indexOf(c)===-1&&t.push(c)
            }
        }
        return t.sort(function(e,t){return e-t})
    }
    
    // Split button handler
    _0xd37j.addEventListener("click",function(){
        if(!_0xj93p||!_0xi82o)return void alert(_0xd3c("Sohdvh#xsordg#d#SGI#iloh#iluvw1"));
        var e=_0xl5br(_0xc26i.value);
        if(0===e.length)return void alert(_0xd3c("Sohdvh#hqwhu#ydolg#sdjh#qxpehuv#ru#udqjhv1"));
        _0xd37j.disabled=!0,_0xd37j.textContent=_0xd3c("Surfhvvlqj111"),_0xe48k.classList.remove("hidden"),_0xf59l.style.width="0%",_0xm6cs(e)
    });
    
    // Process pages
    function _0xm6cs(e){
        var t=[],n=0;
        function a(){
            if(n>=e.length)return void _0xn7dt(t);
            var r=e[n],i=Math.round(n/e.length*50);
            _0xf59l.style.width=i+"%",_0xj93p.getPage(r).then(function(e){
                var i=e.getViewport({scale:1.5}),o=document.createElement("canvas"),s=o.getContext("2d");
                o.height=i.height,o.width=i.width,e.render({canvasContext:s,viewport:i}).promise.then(function(){
                    t.push({pageNum:r,canvas:o,width:i.width,height:i.height}),n++,a()
                }).catch(function(e){
                    console.error(_0xd3c("Huuru#uhqghulqj#sdjh#")+r+":",e),n++,a()
                })
            }).catch(function(e){
                console.error(_0xd3c("Huuru#jhwwlqj#sdjh#")+r+":",e),n++,a()
            })
        }
        a()
    }
    
    // Create PDF from rendered pages
    function _0xn7dt(e){
        if(0===e.length)return _0xd37j.disabled=!1,_0xd37j.textContent=_0xd3c("Vsolw#SGI"),_0xe48k.classList.add("hidden"),void alert(_0xd3c("Qr#sdjhv#frxog#eh#uhqghuhg1"));
        try{
            var t=window.jspdf.jsPDF,n=e[0],a=n.width>n.height?"landscape":"portrait",r=new t({orientation:a,unit:"pt",format:[n.width,n.height]});
            for(var i=0;i<e.length;i++){
                var o=e[i];
                i>0&&r.addPage([o.width,o.height],o.width>o.height?"landscape":"portrait");
                var s=o.canvas.toDataURL("image/jpeg",.95);
                r.addImage(s,"JPEG",0,0,o.width,o.height);
                var l=50+(i+1)/e.length*50;
                _0xf59l.style.width=l+"%"
            }
            var c=r.output("blob"),d=URL.createObjectURL(c);
            _0xg60m.classList.remove("hidden"),_0xh71n.innerHTML="";
            var u=document.createElement("div");
            u.className="flex justify-between items-center p-4 border rounded",u.innerHTML="<span>"+_0xi82o.name.replace(".pdf","")+"_split.pdf</span><div><a href='"+d+"' download='"+_0xi82o.name.replace(".pdf","")+"_split.pdf' class='px-4 py-2 bg-green-500 text-white rounded hover:bg-green-600 mr-2'><i class='fas fa-download mr-1'></i> "+_0xd3c("Grzqordg")+"</a><a href='"+d+"' target='_blank' class='px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600'><i class='fas fa-eye mr-1'></i> "+_0xd3c("Ylhz")+"</a></div>",_0xh71n.appendChild(u)
        }catch(e){
            console.error(_0xd3c("Huuru#fuhdwlqj#SGI="),e),alert(_0xd3c("Huuru#fuhdwlqj#SGI=")+e.message)
        }
        _0xd37j.disabled=!1,_0xd37j.textContent=_0xd3c("Vsolw#SGI"),_0xe48k.classList.add("hidden")
    }
    
    // Set current year in footer
    document.addEventListener("DOMContentLoaded",function(){
        document.getElementById("current-year").textContent=(new Date).getFullYear()
    });
})();
