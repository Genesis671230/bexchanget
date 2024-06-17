const documentFileOutput = document.getElementById("verification__file-output-document")
const selfieFileOutput = document.getElementById("verification__file-output-selfie")

const verificationCountryInput = document.getElementById("verificationCountry")
const verificationCountryInputList = verificationCountryInput.nextElementSibling

const verificationPassportInput = document.getElementById("verificationPassport")
const verificationPassportInputList = verificationPassportInput.nextElementSibling

// const verificationPhoneInput = document.getElementById("verificationPhone")
// const verificationPhoneInputList = verificationPhoneInput.nextElementSibling

function removeActiveClasses () {
    verificationCountryInputList.classList.remove("verification__input-list-active")
    verificationCountryInput.classList.remove("verification__input-input-active")
    verificationPassportInputList.classList.remove("verification__input-list-active")
    verificationPassportInput.classList.remove("verification__input-input-active")
    // verificationPhoneInputList.classList.remove("verification__input-list-active")
    // verificationPhoneInput.classList.remove("verification__input-input-active")
}

function inputListener(list, input) {
    input.addEventListener("click", () => {
        if (!input.classList.contains("verification__input-input-active")) {
            removeActiveClasses()
        }

        list.classList.toggle("verification__input-list-active")
        input.classList.toggle("verification__input-input-active")
    })
}

function changeTextOnSelected (list, input) {
    list.addEventListener("click", (event) => {
        if (event.target.classList.contains("verification__input-list-item")) {
            input.querySelector(".verification__input-value").innerText = event.target.innerText
            removeActiveClasses()
        }
    })
}

function changeImgOnSelected (list, input) {
    list.addEventListener("click", (event) => {
        if (event.target.classList.contains("verification__input-list-item")) {
            input.querySelector(".verification__input-value").childNodes[1].src = event.target.childNodes[1].src
        }
    })
}

inputListener(verificationCountryInputList, verificationCountryInput)
inputListener(verificationPassportInputList, verificationPassportInput)
// inputListener(verificationPhoneInputList, verificationPhoneInput)

changeTextOnSelected(verificationCountryInputList, verificationCountryInput)
changeTextOnSelected(verificationPassportInputList, verificationPassportInput)

// changeImgOnSelected(verificationPhoneInputList, verificationPhoneInput)

document.body.addEventListener("click", (event) => {
    if (!event.target.classList.contains("verification__input-input")) {
        removeActiveClasses()
    }
})

function getFileName (event, type) {
    if (!event || !event.target || !event.target.files || event.target.files.length === 0) {
        return;
    }

    const name = event.target.files[0].name;

    if (type === "document") {
        documentFileOutput.innerText = name
    } else {
        selfieFileOutput.innerText = name
    }
}