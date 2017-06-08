/**
 * Created by tetsukazu on 2017/02/05.
 */
$(document).ready(function () {
    var createFileName = function() {
        var m = moment();
        return 'clip-' + m.format('YYYYMMDDHHmmss') + '.png';
    };

    if (!$.fn.pastableTextarea) {
        return;
    }
    $('#content,#comment').pastableTextarea()
        .on('pasteImage', function(ev, data) {
           var imageBlob,formData,url,element;
            imageBlob = data.blob;
            formData = new FormData();
            formData.append('files[]', imageBlob, createFileName());
            url = _CONTEXT + '/protect.file/upload';
            element = this;
            jQuery.ajax({
                type: 'POST',
                url: url,
                contentType: false,
                processData: false,
                data: formData,
                success: function (msg) {
                    uploadedFiles(msg.files);
                    var target = $(element);
                    writeImageLink(msg, target);
                }
            });
        });
});


var writeImageLink = function(msg, obj) {
    var file,str,obj,s,p,np;
    if (0 < msg.files.length) {
        file = msg.files[0];
        str = '![' + file.name + '](' + file.url + ')';
        obj.focus();
        s = obj.val();
        p = obj.get(0).selectionStart;
        np = p + str.length;
        obj.val(s.substr(0, p) + str + s.substr(p));
        obj.get(0).setSelectionRange(np, np);
    }
};


