import fillpdf
from fillpdf import fillpdfs

data_dict = {
    "Maximale koopsom/biedprijs": "1",
    "Eigen middelen": "2",
    "Maximale hypotheek": "3",
    "Naam klant\\(en\\)": "4",
    "straat": "5",
    "Postcode": "6",
    "Datum Haalbaarheidsgesprek": "7",
    "Plaats": "8",
    "Geldig tot": "9",
    "Toetsrente": "10",
    "Rentevaste periode": "11",
    "NHG": "Nee",
    "De Hypotheekshop": "1",
    "Naam adviseur": "2",
    "Telefoonnummer": "3",
    "Handtekening": "",
    "Extra toelichting": "5",
}

fillpdfs.write_fillable_pdf("input.pdf", "new.pdf", data_dict)
fillpdfs.place_image('square.png', 482, 748, "input.pdf", "new2.pdf", 1, width=77, height=77)

