package ModelDAO;

import Interfaces.ValidationCrud;

public class ValidationDAO implements ValidationCrud {

    @Override
    public boolean validationNumberPhone(String number) {
        if (number.equals("")) {
            return false;
        }
        if (number.length() == 10) {
            return !number.substring(0, 2).equals("09");
        } else {
            return true;
        }
    }

    @Override
    public boolean validationPassword(String password) {
        return password.length() < 8;
    }

    @Override
    public boolean validationIdentityCard(String cedula) {
        boolean validation;
        try {
            if (cedula.length() == 10) {

                int[] cofValCedula = {2, 1, 2, 1, 2, 1, 2, 1, 2};
                int verificador = Integer.parseInt(cedula.substring(9, 10));
                int suma = 0;
                int dijito;
                for (int i = 0; i < (cedula.length() - 1); i++) {
                    dijito = Integer.parseInt(cedula.substring(i, i + 1)) * cofValCedula[i];
                    suma += ((dijito % 10) + (dijito / 10));
                }

                if ((suma % 10 == 0) && (suma % 10 == verificador)) {
                    validation = true;
                } else {
                    validation = (10 - (suma % 10)) == verificador;
                }
            } else {
                validation = false;
            }
        } catch (NumberFormatException e) {
            validation = false;
        } catch (Exception err) {
            System.out.println("Una excepcion ocurrio en el proceso de validadcion");
            validation = false;
        }
        return validation;
    }
}
