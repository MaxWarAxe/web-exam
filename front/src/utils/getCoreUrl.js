const url = 'localhost'
const port = '80'


const fullUrl = "http://" + url + ":" + port

function getCoreUrl(){
    return fullUrl;
}

export default getCoreUrl;
