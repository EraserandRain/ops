var a = [1,'a',2,'b',3,'c',4,'d']
function (id){
    for (let i=0;a[i]&&a[i+1];i+=2){
        if (a[i] == id){
            console.log(a[i+1])
        }
    }
}