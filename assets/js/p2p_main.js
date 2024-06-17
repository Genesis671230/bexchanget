const formP2PTopBtnBox = document.querySelector('.formP2p__top-btn-box')
const inputCoinOne = document.querySelector('.coin-one')
const inputCoinTwo = document.querySelector('.coin-two')
const inputCoinThree = document.querySelector('.coin-three')
const listCoinOne = document.querySelector('.list-coin-one')
const listCoinTwo = document.querySelector('.list-coin-two')
const listCoinThree = document.querySelector('.list-coin-three')
const coinItemsOne = document.querySelector('.coin-items-one')
const coinItemsTwo = document.querySelector('.coin-items-two')
const coinItemsThree = document.querySelector('.coin-items-three')
const labelTitleOne = document.querySelector('.label-title-one')
const labelTitleTwo = document.querySelector('.label-title-two')
const mobileBtnMenu = document.querySelector('.formP2p__mobile-btn')
const mobileFormWrapper = document.querySelector('.formP2p__form-wrapper')
const mobileCloseBtn = document.querySelector('.formP2p__mobile-close')
const body = document.querySelector('.body')


//body.classList.remove('preload')

window.addEventListener('click', elem => {
    if (!elem.target.classList.contains('formP2p__coin') && !elem.target.classList.contains('validate')){
        listRemove()
    }
})

mobileBtnMenu.addEventListener('click', () => {
    mobileFormWrapper.classList.add('active')
    body.classList.add('lock')
})

mobileCloseBtn.addEventListener('click', () => {
    mobileFormWrapper.classList.remove('active')
    body.classList.remove('lock')
})

mobileFormWrapper.addEventListener('click', elem => {
    if (elem.target.classList.contains('formP2p__form-wrapper')){
        mobileFormWrapper.classList.remove('active')
        body.classList.remove('lock')
    }
})



formP2PTopBtnBox.addEventListener('click', elem => {
    const leftBtn = document.querySelector('.formP2p__top-btn.left')
    const rightBtn = document.querySelector('.formP2p__top-btn.right')
    listRemove()
    if (elem.target.classList.contains('formP2p__top-btn') && elem.target.classList.contains('left')){
        leftBtn.classList.add('active')
        rightBtn.classList.remove('active')
    } else {
        rightBtn.classList.add('active')
        leftBtn.classList.remove('active')
    }
})


inputCoinOne.addEventListener('click', () => {
    if (inputCoinTwo.classList.contains('active') || inputCoinThree.classList.contains('active')){
        listRemove()
    }
    listActive(listCoinOne, inputCoinOne)
})

inputCoinTwo.addEventListener('click', () => {
    if (inputCoinOne.classList.contains('active') || inputCoinThree.classList.contains('active')){
        listRemove()
    }
    listActive(listCoinTwo, inputCoinTwo)
})

inputCoinThree.addEventListener('click', () => {
    if (inputCoinOne.classList.contains('active')){
        listRemove()
    }
    listActive(listCoinThree, inputCoinThree)
})



coinItemsOne.addEventListener('click', elem => {
    const target = elem.target
    const slideImg = target.querySelector('.formP2p__currency-sub').innerText
    inputCoinOne.innerHTML = slideImg
    labelTitleOne.innerHTML = slideImg
    listRemove()
})

coinItemsTwo.addEventListener('click', elem => {
    const target = elem.target
    const slideImg = target.querySelector('.formP2p__currency-sub').innerText
    inputCoinTwo.innerHTML = slideImg
    labelTitleTwo.innerHTML = slideImg
    listRemove()
})

coinItemsThree.addEventListener('click', elem => {
    const target = elem.target
    const slideImg = target.querySelector('.formP2p__currency-sub').innerText
    inputCoinThree.innerHTML = slideImg
    listRemove()
})

function listActive(list, input) {
    list.classList.toggle('active')
    input.classList.toggle('active')
}

function listRemove() {
    listCoinOne.classList.remove('active')
    inputCoinOne.classList.remove('active')
    listCoinTwo.classList.remove('active')
    listCoinThree.classList.remove('active')
    inputCoinTwo.classList.remove('active')
    inputCoinThree.classList.remove('active')
}


