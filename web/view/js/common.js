function validateSearchForm() {
    if (document.frm.name.value == "") {
        alert("Строка поиска пуста");
        document.frm.username.focus();
        return false;
    }
}

function genreNotFound() {
    alert("Жанр не найден.");
}

function trackNotFound() {
    alert("Трек не найден.");
}

function artistNotFound() {
    alert("Артист не найден.");
}

function validateEmpty() {
    if (document.getElementById('inputField').value.replace(/\s+/g, '').length) {
    } else {
        alert('Введите текст');
        return false;
    }
}

function validateTrackInForm() {
    if (document.getElementById('track_name').value.replace(/\s+/g, '').length) {
    } else {
        alert('Введите название');
        return false;
    }
    if (document.getElementById('track_genre').value.replace(/\s+/g, '').length) {
    } else {
        alert('Введите жанр');
        return false;
    }
    if (document.getElementById('track_artist').value.replace(/\s+/g, '').length) {
    } else {
        alert('Введите исполнителя');
        return false;
    }
}

function duplicateGenre() {
    alert('Данный жанр уже существует.');
}
