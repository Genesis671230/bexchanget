// Инициализация табов
new tabsCrypto('btnBox',{
    tabs: [
        {
            btn: 'USDBtn',
            item: 'USDContent'
        },
        {
            btn: 'bitcoinBtn',
            item: 'bitcoinContent'
        },
        {
            btn: 'ethereumBtn',
            item: 'ethereumContent'
        },
        {
            btn: 'litecoinBtn',
            item: 'litecoinContent'
        },
        {
            btn: 'tetherBtn',
            item: 'tetherContent'
        },
        {
            btn: 'moneroBtn',
            item: 'moneroContent'
        },
        {
            btn: 'rippleBtn',
            item: 'rippleContent'
        },
        {
            btn: 'bitcoinCashBtn',
            item: 'bitcoinCashContent'
        },
        {
            btn: 'ethereumClassicBtn',
            item: 'ethereumClassicContent'
        },
        {
            btn: 'binanceUsdBtn',
            item: 'binanceUsdContent'
        },
        {
            btn: 'tetherBtnTRC20',
            item: 'tetherTRC20Content'
        },
        {
            btn: 'tetherBtnBEP20',
            item: 'tetherBEP20Content'
        },
        {
            btn: 'tetherBtnOMNI',
            item: 'tetherOMNIContent'
        },
        {
            btn: 'binanceBNBBtn',
            item: 'binanceBNBContent'
        },
        {
            btn: 'binanceBNBBEP2Btn',
            item: 'binanceBNBBEP2Content'
        },
        {
            btn: 'dogeCoinBtn',
            item: 'dogeCoinContent'
        },
        {
            btn: 'dashBtn',
            item: 'dashContent'
        },
        {
            btn: 'tronBtn',
            item: 'tronContent'
        },
        {
            btn: 'polygonBtn',
            item: 'polygonContent'
        },
        {
            btn: 'zcashBtn',
            item: 'zcashContent'
        },
        {
            btn: 'NEMBtn',
            item: 'NEMContent'
        },
        {
            btn: 'cardanoBtn',
            item: 'cardanoContent'
        },



    ],
    buttonActive : 'buttonActiveNew',
    itemActive : 'deposit__content-item-active'
})



// Начало скриптов формы
const monthList = document.querySelector('.month-list')
const monthItems = document.querySelector('.month-items')
const monthTitle = document.querySelector('.month-title')
const yearList = document.querySelector('.year-list')
const yearItems = document.querySelector('.year-items')
const yearTitle = document.querySelector('.year-title')
const walletList = document.querySelector('.wallet-list')
const walletItems = document.querySelector('.wallet-items')
const walletTitle = document.querySelector('.wallet-title')


window.addEventListener('click', elem => {
    if (!elem.target.classList.contains('formP2p__coin') && !elem.target.classList.contains('validate')){
        listRemove()
    }
})



walletItems.addEventListener('click', elem => {
    targetText(elem.target, walletTitle)
})

yearItems.addEventListener('click', elem => {
    targetText(elem.target, yearTitle)
})

monthItems.addEventListener('click', elem => {
    targetText(elem.target, monthTitle)
})



monthTitle.addEventListener('click', () => {
    if ( yearTitle.classList.contains('active') || walletTitle.classList.contains('active')){
        listRemove()
    }
    listActive(monthList, monthTitle)
})


yearTitle.addEventListener('click', () => {
    if (monthTitle.classList.contains('active') || walletTitle.classList.contains('active')){
        listRemove()
    }
    listActive(yearList, yearTitle)
})

walletTitle.addEventListener('click', () => {
    if (monthTitle.classList.contains('active') || yearTitle.classList.contains('active')){
        listRemove()
    }
    listActive(walletList, walletTitle)
})

function targetText(target, activeInput) {
    const targetText = target.querySelector('.formP2p__currency-sub').innerText
    activeInput.innerHTML = targetText
    listRemove()
}

function listActive(list, input) {
    list.classList.toggle('active')
    input.classList.toggle('active')
}

function listRemove() {
    monthList.classList.remove('active')
    yearList.classList.remove('active')
    walletList.classList.remove('active')
    monthTitle.classList.remove('active')
    yearTitle.classList.remove('active')
    walletTitle.classList.remove('active')
}


// Конец скриптов формы
