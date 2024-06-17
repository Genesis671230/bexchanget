const selectSwap = document.querySelector('.send-select')
const listCoinOne = document.querySelector('.list-coin-one')
const sendImg = document.querySelector('.send-img')
const sendTitle = document.querySelector('.send-title')
const coinItemsOne = document.querySelector('.coin-items-one')
const buttonsContainer = document.querySelector('.staking__select-buttons')

window.addEventListener('click', event => {
    if (!event.target.classList.contains("staking__send-select")) {
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

buttonsContainer.addEventListener('click', (e) => {
    if (e.target.classList.contains("staking__select-button")) {
        for (const child of buttonsContainer.children) {
            child.classList.remove("staking__select-button-active")
        }
        e.target.classList.add("staking__select-button-active")
    }
})
