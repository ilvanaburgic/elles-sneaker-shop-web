function redirectToShop() {
  window.location.href = "shop.html";
}

const buyButton = document.getElementById("buyButton");
const successMessage = document.getElementById("successMessage");

function validateForm() {
  const inputs = document.querySelectorAll('#profile-section input');
  for (let input of inputs) {
    if (!input.value.trim()) {
      alert('Please fill out all fields.');
      return false;
    }
  }
  return true;
}


var app = $.spapp({
  defaultView: "#shop",
  templateDir: "../../views/",
  pageNotFound: "error_404"
});

app.route({
  view: "sproduct",
  load: "sproduct.html",
  onReady: function () {
    var productId = localStorage.getItem("productId");

    $.ajax({
      url: '/backend/public/products',
      type: 'GET',
      dataType: 'json',
      success: function (data) {
        const products = data.data;
        var product = products.find(p => p.id.toString() === productId);

        if (product) {
          const singleProImage = document.querySelector('.single-pro-image');
          singleProImage.innerHTML = '';

          product.image.split(',').forEach(img => {
            const imgElement = document.createElement('img');
            imgElement.src = img.trim();
            imgElement.style.width = '100%';
            imgElement.style.marginBottom = '10px';
            singleProImage.appendChild(imgElement);
          });

          document.querySelector('.single-pro-details h6').textContent = product.brand;
          document.querySelector('.single-pro-details h4').textContent = product.name;
          document.querySelector('.single-pro-details h3').textContent = `$${product.price}`;
          document.querySelector('.single-pro-details span').textContent = product.description;

          $('.add-to-cart').off('click').on('click', function () {
            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            cart.push(product);
            localStorage.setItem('cart', JSON.stringify(cart));

            const button = $(this);
            button.text('Added!');
            button.addClass('success');
            button.prop('disabled', true);

            setTimeout(function () {
              button.text('Add to cart');
              button.removeClass('success');
              button.prop('disabled', false);
            }, 2000);
          });
        } else {
          console.error('The product is not found');
        }
      },
      error: function (error) {
        console.error('An error occurred while retrieving data', error);
      }
    });
  }
});


app.route({
  view: "home",
  load: "home.html",
  onReady: function () {
    $.ajax({
      url: '/backend/public/products',
      type: 'GET',
      dataType: 'json',
      success: function (data) {
        const products = data.data.filter(product => product.is_active === 1);
        var proContainer = $('#pro-container');
        proContainer.empty();

        products.forEach(function (product) {
          var productHTML =
            '<div class="pro" data-id="' + product.id + '">' +
            '<img src="' + product.image.split(',')[0].trim() + '" alt="">' +
            '<div class="description">' +
            '<span>' + product.brand + '</span>' +
            '<h5>' + product.name + '</h5><br>' +
            '<h4>$' + product.price + '</h4>' +
            (product.tags ? '<div class="tags">' +
              product.tags.split(',').map(tag => `<span class="tag">${tag.trim()}</span>`).join('') +
              '</div>' : '') +
            '</div>' +
            '</div>';


          proContainer.append(productHTML);
        });

        $('.pro').click(function () {
          var productId = $(this).data('id');
          localStorage.setItem("productId", productId);
          window.location.href = '#sproduct';
        });
        if ($('#searchInputHome').length) {
          $('#searchInputHome').on('input', function () {
            const query = $(this).val().toLowerCase();
            $('#pro-container .pro').each(function () {
              const productName = $(this).find('h5').text().toLowerCase();
              if (productName.includes(query)) {
                $(this).show();
              } else {
                $(this).hide();
              }
            });
          });
        }
      },
      error: function (error) {
        console.error('An error occurred while retrieving data', error);
      }
    });
  }
});

// shop.html
app.route({
  view: "shop",
  load: "shop.html",
  onReady: function () {
    $.ajax({
      url: '/backend/public/products',
      type: 'GET',
      dataType: 'json',
      success: function (data) {
        const products = data.data.filter(product => product.is_active === 1);
        const proContainer = $('#pro-container');

        function renderProducts(filteredProducts) {
          proContainer.empty();

          filteredProducts.forEach(function (product) {
            const productHTML =
              '<div class="pro" data-id="' + product.id + '">' +
              '<img src="' + product.image.split(',')[0].trim() + '" alt="">' +
              '<div class="description">' +
              '<span>' + product.brand + '</span>' +
              '<h5>' + product.name + '</h5><br>' +
              '<h4>$' + product.price + '</h4>' +
              (product.tags ? '<div class="tags">' +
                product.tags.split(',').map(tag => `<span class="tag">${tag.trim()}</span>`).join('') +
                '</div>' : '') +
              '</div>' +
              '</div>';


            proContainer.append(productHTML);
          });

          $('.pro').click(function () {
            const productId = $(this).data('id');
            localStorage.setItem("productId", productId);
            window.location.href = '#sproduct';
          });
        }


        function sortProducts(productsToSort) {
          const sortBy = $('#sortBy').val();

          return productsToSort.sort((a, b) => {
            switch (sortBy) {
              case 'price-asc':
                return parseFloat(a.price) - parseFloat(b.price);
              case 'price-desc':
                return parseFloat(b.price) - parseFloat(a.price);
              case 'name-asc':
                return a.name.localeCompare(b.name);
              case 'name-desc':
                return b.name.localeCompare(a.name);
              default:
                return 0; // No sorting
            }
          });
        }

        // Initial render
        renderProducts(products);


        // Filtering logic
        function applyFilters() {
          // Get selected brands (checkboxes)
          const selectedBrands = $('.brand-filter:checked').map(function () {
            return this.value.toLowerCase();
          }).get();

          // Get selected price range
          const priceRange = $('#priceRange').val();
          let [minPrice, maxPrice] = [0, Infinity];

          if (priceRange !== 'all') {
            const parsed = priceRange.split('-').map(Number);
            if (parsed.length === 2) {
              [minPrice, maxPrice] = parsed;
            } else if (parsed.length === 1) {
              [minPrice, maxPrice] = [parsed[0], Infinity];
            }
          }

          // Get selected color
          const selectedColor = $('#color').val().toLowerCase();
          const selectedGender = $('#gender').val().toLowerCase();

          const filtered = products.filter(p => {
            const brandMatch = selectedBrands.length === 0 || selectedBrands.includes(p.brand?.toLowerCase());

            // Price parsing with $ or $$ handling
            let priceVal = p.price;
            if (typeof priceVal === 'string') {
              priceVal = parseFloat(priceVal.replace(/\$/g, ''));
            }

            const priceMatch = priceVal >= minPrice && priceVal <= maxPrice;

            const colorMatch = !selectedColor || (p.color && p.color.toLowerCase() === selectedColor);

            const genderMatch = !selectedGender || (p.gender && p.gender.toLowerCase() === selectedGender);

            return brandMatch && priceMatch && colorMatch && genderMatch;
          });

          const sorted = sortProducts(filtered);
          renderProducts(sorted);
        }

        // Event listeners
        $('.brand-filter').on('change', applyFilters);
        $('#priceRange').on('change', applyFilters);
        $('#color').on('change', applyFilters);
        $('#gender').on('change', applyFilters);
        $('#sortBy').on('change', applyFilters);

        // Search
        if ($('#searchInput').length) {
          $('#searchInput').on('input', function () {
            const query = $(this).val().toLowerCase();
            $('#pro-container .pro').each(function () {
              const productName = $(this).find('h5').text().toLowerCase();
              if (productName.includes(query)) {
                $(this).show();
              } else {
                $(this).hide();
              }
            });
          });
        }
      },
      error: function (error) {
        console.error('An error occurred while retrieving data', error);
      }
    });
  }
});


app.route({
  view: "administrator",
  load: "administrator.html",
  onReady: function () {
    if (!Utils.get_from_localstorage("user")) {
      window.location.href = '#login';
      return;
    }
    app.route({
      view: "administrator",
      load: "administrator.html",
      onReady: function () {
        if (!Utils.get_from_localstorage("user")) {
          window.location.href = '#login';
          return;
        }
        loadProducts();
      }
    });
  }
});

app.route({
  view: "sproductAdministrator",
  load: "sproductAdministrator.html",
  onReady: function () {
    if (!Utils.get_from_localstorage("user")) {
      window.location.href = '#login';
      return;
    }
    var productId = localStorage.getItem("productId");
    $.ajax({
      url: '/backend/products',
      type: 'GET',
      headers: {
        "Authorization": JSON.parse(localStorage.getItem("user")).token
      },
      dataType: 'json',
      success: function (data) {
        const products = data.data;
        var product = products.find(p => p.id.toString() === productId);
        if (product) {
          document.getElementById("MainImg").src = product.image;
          document.querySelector('.single-pro-details h4').textContent = product.name;
          document.querySelector('.single-pro-details h3').textContent = `$${product.price}`;
          document.querySelector('.single-pro-details span').textContent = product.description;

        } else {
          console.error('The product is not found');
        }
      },
      error: function (error) {
        console.error('An error occurred while retrieving data', error);
      }
    });
  }
});

app.route({
  view: "cart",
  load: "cart.html",
  onReady: function () {
    const products = JSON.parse(localStorage.getItem('cart'));

    var proContainer = $('#cart-container');
    var totalPrice = 0;
    proContainer.empty();

    products.forEach(function (product, index) {
      var productHTML = `
      <tr data-index="${index}">
        <td><img src="${product.image.split(',')[0].trim()}" alt="" ></td>
        <td>${product.name}</td>
        <td>$ ${product.price}</td>
        <td>$ ${product.price}</td>
        <td><button class="remove-btn">Delete</button></td>
      </tr>
    `;
      proContainer.append(productHTML);
      totalPrice += Number(product.price);
    });

    $('#cart-container').on('click', '.remove-btn', function () {
      const row = $(this).closest('tr');
      const index = row.data('index');
      let cart = JSON.parse(localStorage.getItem('cart')) || [];

      cart.splice(index, 1); // izbaci item iz niza
      localStorage.setItem('cart', JSON.stringify(cart)); // ažuriraj localStorage

      row.remove(); // ukloni red iz DOM-a

      // Ažuriraj total
      let totalPrice = 0;
      $('#cart-container tr').each(function () {
        const priceText = $(this).find('td:nth-child(3)').text().replace('$ ', '');
        totalPrice += parseFloat(priceText);
      });

      $('#subtotal table tr:nth-child(1) td:nth-child(2)').text(`$ ${totalPrice.toFixed(2)}`);
      $('#subtotal table tr:nth-child(3) td:nth-child(2)').text(`$ ${totalPrice.toFixed(2)}`);
    });

    document.querySelector('#subtotal table tr:nth-child(3) td:nth-child(2)').textContent = `$ ${totalPrice.toFixed(2)}`;
    document.querySelector('#subtotal table tr:nth-child(1) td:nth-child(2)').textContent = `$ ${totalPrice.toFixed(2)}`;

    $('#cart-container').on('change', 'input[type="number"]', function () {
      var input = $(this);
      var quantity = 1;
      var price = parseFloat(input.closest('tr').find('td:nth-child(3)').text().replace('$ ', ''));
      var subtotal = quantity * price;
      input.closest('tr').find('td:nth-child(5)').text(`$ ${subtotal.toFixed(2)}`);


      var total = 0;
      $('#cart-container tr').each(function () {
        var row = $(this);
        var rowSubtotal = parseFloat(row.find('td:nth-child(5)').text().replace('$ ', ''));
        total += rowSubtotal;
      });

      $('#subtotal table tr:nth-child(1) td:nth-child(2)').text(`$ ${total.toFixed(2)}`);
      $('#subtotal table tr:nth-child(3) td:nth-child(2)').text(`$ ${total.toFixed(2)}`);
    });
  }
});


app.run();