const selectSwap = document.querySelector('.send-select')
const listCoinOne = document.querySelector('.list-coin-one')
const listCoinTwo = document.querySelector('.list-coin-two')
const sendImg = document.querySelector('.send-img')
const getImg = document.querySelector('.get-img')
const sendTitle = document.querySelector('.send-title')
const getTitle = document.querySelector('.get-title')
const coinItemsOne = document.querySelector('.coin-items-one')
const coinItemsTwo = document.querySelector('.coin-items-two')
const getSelect = document.querySelector('.get-select')


window.addEventListener('click', event => {
    if (!event.target.classList.contains("swap__send-select")) {
        listCoinTwo.classList.remove('active')
        listCoinOne.classList.remove('active')
        coinItemsOne.classList.remove('active')
        selectSwap.classList.remove('active')
    }
})

selectSwap.addEventListener('click', () => {
    listCoinTwo.classList.remove('active')
    listCoinOne.classList.toggle('active')
    coinItemsOne.classList.toggle('active')
    selectSwap.classList.toggle('active')
})

getSelect.addEventListener('click', () => {
    listCoinOne.classList.remove('active')
    listCoinTwo.classList.toggle('active')
    coinItemsOne.classList.toggle('active')
    getSelect.classList.toggle('active')
})


coinItemsOne.addEventListener('click', e => {
    const target = e.target
    sendImg.src = target.children[0].src
    sendTitle.innerHTML = target.children[1].children[0].innerHTML
    listCoinOne.classList.remove('active')
    listCoinTwo.classList.remove('active')
    coinItemsOne.classList.remove('active')
    selectSwap.classList.remove('active')
})

coinItemsTwo.addEventListener('click', e => {
    const target = e.target
    getImg.src = target.children[0].src
    getTitle.innerHTML = target.children[1].children[0].innerHTML
    listCoinTwo.classList.remove('active')
    listCoinOne.classList.remove('active')
    coinItemsOne.classList.remove('active')
    selectSwap.classList.remove('active')
})
