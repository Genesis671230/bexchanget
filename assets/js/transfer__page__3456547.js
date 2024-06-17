const selectSwap = document.querySelector('.transfer-select')
const listCoinOne = document.querySelector('.list-coin-one')
const sendImg = document.querySelector('.transfer-img')
const sendTitle = document.querySelector('.transfer-title')
const coinItemsOne = document.querySelector('.coin-items-one')
const rangeInputs = document.querySelectorAll('input[type="range"]')

function handleInputChange(e) {
    let target = e.target
    if (e.target.type !== 'range') {
        target = document.getElementById('range')
    }
    const min = target.min
    const max = target.max
    const val = target.value

    target.style.backgroundSize = (val - min) * 100 / (max - min) + '% 100%'
}

rangeInputs.forEach(input => {
    input.addEventListener('input', handleInputChange)
})

window.addEventListener('click', event => {
    if (!event.target.classList.contains("transfer__send-select")) {
        listCoinOne.classList.remove('active')
        coinItemsOne.classList.remove('active')
        selectSwap.classList.remove('active')
    }
})

selectSwap.addEventListener('click', () => {
    listCoinOne.classList.toggle('active')
    coinItemsOne.classList.toggle('active')
    selectSwap.classList.toggle('active')
})

coinItemsOne.addEventListener('click', e => {
    const target = e.target
    sendImg.src = target.children[0].src
    sendTitle.innerHTML = target.children[1].children[0].innerHTML
    listCoinOne.classList.remove('active')
    coinItemsOne.classList.remove('active')
    selectSwap.classList.remove('active')
})