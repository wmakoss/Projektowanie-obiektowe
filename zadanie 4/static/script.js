
window.addEventListener("load", onload);

function onload()
{
    refresh();
}

async function refresh()
{
    update();

    setTimeout("refresh()",1000);
}

async function update()
{
    const symbol = document.querySelector("#symbol").value;
    const response = await fetch("/price/" + symbol);
    const responsejson = await response.json();
    // console.log(responsejson);
    document.querySelector("#price").innerHTML = responsejson["price"];
    const datetime = new Date(responsejson["closeTime"]);
    document.querySelector("#time").innerHTML = datetime.toLocaleString();
    
}
