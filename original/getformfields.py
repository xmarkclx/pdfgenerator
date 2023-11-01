import fillpdf
from fillpdf import fillpdfs

f = fillpdfs.get_form_fields('input.pdf')

data_dict = {
    'Address1 Text Box': '500 West Main Street',
    'Driving License Check Box': 'Yes',
    'Language 1 Check Box': 'Off',
}

fillpdfs.write_fillable_pdf('blank.pdf', 'new.pdf', data_dict)

print(f)
