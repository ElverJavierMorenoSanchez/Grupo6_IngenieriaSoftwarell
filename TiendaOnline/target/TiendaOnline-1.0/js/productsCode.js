var band = true;

$(document).ready(function () {
    $(".shoppingCart").css("visibility", "visible");
    $(".shoppingCart").show();
    renderStore();
});

const db = {
    methods: {
        find: (id) => {
            return db.items.find(item => item.id === id);
        },
        remove: (items) => {
            items.forEach(item => {
                const product = db.methods.find(item.id);
                product.qty -= item.qty;
            });

            console.log(db);
        }
    },
    items: []
};

const shoppingCart = {
    items: [],
    methods: {
        add: (id, qty) => {
            const cartItem = shoppingCart.methods.get(id);

            if (cartItem) {
                if (shoppingCart.methods.hasInventory(id, qty + cartItem.qty)) {
                    cartItem.qty += qty;
                } else {
                    alert('No hay inventario suficiente');
                }
            } else {
                shoppingCart.items.push({id, qty});
            }
        },
        remove: (id, qty) => {
            const cartItem = shoppingCart.methods.get(id);
            if (cartItem.qty - qty > 0) {
                cartItem.qty -= qty;
            } else {
                shoppingCart.items = shoppingCart.items.filter(item => item.id !== id);
            }
        },
        count: () => {
            return  shoppingCart.items.reduce((acc, item) => acc + item.qty, 0);
        },
        get: (id) => {
            const index = shoppingCart.items.findIndex(item => item.id === id);
            return index >= 0 ? shoppingCart.items[index] : null;
        },
        getTotal: () => {
            const total = shoppingCart.items.reduce((acc, item) => {
                const found = db.methods.find(item.id);
                return (acc + found.price * item.qty);
            }, 0);

            return total;
        },
        hasInventory: (id, qty) => {
            return db.items.find(item => item.id === id).qty - qty >= 0;
        },
        purchase: () => {
            db.methods.remove(shoppingCart.items);
            shoppingCart.items = [];
        }
    }
};

function renderStore() {
    document.querySelectorAll('.optionCart .add').forEach((button) => {
        button.addEventListener("click", (e) => {
            const id = parseInt(button.getAttribute('data-id'));
            const item = db.methods.find(id);

            if (!shoppingCart.methods.get(id)) {
                const cont = parseInt($(".shoppingCart .cont h3").text());
                $(".shoppingCart .cont h3").text(cont + 1);
            }

            if (item && item.qty - 1 > 0) {
                shoppingCart.methods.add(id, 1);
                renderShoppingCart();
            } else {
                console.log('Ya no hay inventario');
            }
            const selector = "[data-id='" + id + "'] h3";
            if (band) {
                
                $(selector).text("QUITAR DEL CARRITO");
                band = false;
            } else {
                $(selector).text("AÑADIR AL CARRITO");
                const qty = shoppingCart.methods.get(id).qty;
                shoppingCart.methods.remove(id, qty);
                const cont = parseInt($(".shoppingCart .cont h3").text());
                $(".shoppingCart .cont h3").text(cont - 1);
                renderShoppingCart();
                band = true;
            }
        });
    });
}

function renderShoppingCart() {
    const html = shoppingCart.items.map(item => {
        const dbItem = db.methods.find(item.id);
        return ` 
	<div class="item">
            <div class="title"> ${dbItem.title} </div>
            <div class="info">
                <div class="price"> ${item.qty} x ${numberToCurrency(dbItem.price)} </div>

                <div class="actions"> 
                    <button class="addOne" data-id="${item.id}">+</button>
                    <button class="removeOne" data-id="${item.id}">-</button>
                </div>
            </div>
            <div class="subtotal"> Subtotal: ${numberToCurrency(item.qty * dbItem.price)} </div>
        </div> 
		`;
    });

    const total = shoppingCart.methods.getTotal();
    const totalContainer = `
                <div class="totalCash"><h2>TOTAL:</h2><h2>${numberToCurrency(total)}</h2></div>
                `;

    const totalCash = document.querySelector(".cartOptions .totalCash");
    const shoppingCartContainer = document.querySelector("#shopping-cart-container");
    shoppingCartContainer.innerHTML = html.join("");
    totalCash.innerHTML = totalContainer;

    document.querySelectorAll(".addOne").forEach(button => {
        button.addEventListener('click', e => {
            const id = parseInt(button.getAttribute('data-id'));
            shoppingCart.methods.add(id, 1);
            renderShoppingCart();
        });
    });
    document.querySelectorAll(".removeOne").forEach(button => {
        button.addEventListener('click', e => {
            const id = parseInt(button.getAttribute('data-id'));

            if (shoppingCart.methods.get(id).qty === 1) {
                const cont = parseInt($(".shoppingCart .cont h3").text());
                $(".shoppingCart .cont h3").text(cont - 1);
                $(".button h3").text("AÑADIR AL CARRITO");
            }
            shoppingCart.methods.remove(id, 1);
            renderShoppingCart();
        });
    });

    const bPurchase = document.querySelector(".bPurchase");

    if (bPurchase) {
        bPurchase.addEventListener('click', e => {
            
        });
    }
}

function numberToCurrency(n) {
    return new Intl.NumberFormat('en-US', {
        maximunSignificantDigits: 2,
        style: 'currency',
        currency: 'USD'
    }).format(n);
}