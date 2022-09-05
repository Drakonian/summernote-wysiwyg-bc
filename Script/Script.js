function InitializeControl(controlId) {
    var controlAddIn = document.getElementById(controlId);
    controlAddIn.innerHTML = '<textarea class="summernote" id="summernote"></textarea>';
}

function InitializeSummerNote(Data) {
    //Initialize editor only once when DOM is loaded
    $(document).ready(function() {
        //Bind InvokeExtensibilityMethod for onBlur BC event
        const onBlur = getALMethod('onBlur',false);
        editor = $('#summernote');
        editor.summernote({
            height: ($(window).height() - 55),
            focus: true,
            callbacks: {
                //Bind onChange callback with our OnChange BC event
                onBlur: function() {
                    Data = $('#summernote').summernote('code');
                    onBlur(Data);
                }
            },
            //List of features to include them to toolbar
            toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'underline', 'clear']],
                ['fontname', ['fontname']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['table', ['table']],
                ['insert', ['link', 'picture', 'video']],
                ['view', ['codeview', 'help']],
                ]
        });
        //Set init data
        $('.note-editable').html(Data);
        
    });
}

function GetData(Data) {
    Data = $('#summernote').summernote('code');
}

function SetData(Data) {
    $('#summernote').summernote('code', Data);
}

function getALMethod(name, SKIP_IF_BUSY) {
    const nav = Microsoft.Dynamics.NAV.GetEnvironment();

    return (...args) => {
        let result;

        window["OnInvokeResult"] = function (alResult) {
            result = alResult;
        }

        return new Promise(resolve => {
            if (SKIP_IF_BUSY && nav.Busy) {
                resolve(SKIP_IF_BUSY);
                return;
            }

            Microsoft.Dynamics.NAV.InvokeExtensibilityMethod(name, args, false, () => {
                delete window.OnInvokeResult;
                resolve(result);
            });
        });
    }
}