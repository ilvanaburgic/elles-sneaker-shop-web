let SortingService = {
    init: function () {
        document.addEventListener('DOMContentLoaded', () => {
            document.getElementById('searchInput')?.addEventListener('input', this.fetchProducts);
            document.getElementById('sortBy')?.addEventListener('change', this.fetchProducts);

            document.querySelectorAll('.brand-filter, #priceRange, #color, #gender').forEach(el => {
                el.addEventListener('change', this.fetchProducts);
            });

            this.fetchProducts(); // initial load
        });
    },

    fetchProducts: function () {
        const search = document.getElementById('searchInput')?.value || '';
        const sortBy = document.getElementById('sortBy')?.value || 'name-asc';

        let order_column = 'name';
        let order_direction = 'ASC';

        switch (sortBy) {
            case 'price-asc':
                order_column = 'price';
                order_direction = 'ASC';
                break;
            case 'price-desc':
                order_column = 'price';
                order_direction = 'DESC';
                break;
            case 'name-asc':
                order_column = 'name';
                order_direction = 'ASC';
                break;
            case 'name-desc':
                order_column = 'name';
                order_direction = 'DESC';
                break;
        }

        const url = `/public/products?search=${encodeURIComponent(search)}&order_column=${order_column}&order_direction=${order_direction}&offset=0&limit=100`;

        fetch(url)
            .then(response => response.json())
            .then(data => {
                SortingService.displayProducts(data.data);
            })
            .catch(error => {
                console.error('Error fetching products:', error);
            });
    },

    displayProducts: function (products) {
        const container = document.getElementById('pro-container');
        if (!container) return;

        container.innerHTML = '';

        if (products.length === 0) {
            container.innerHTML = '<p>No products found.</p>';
            return;
        }

        products.forEach(product => {
            const productHTML = `
        <div class="product-card">
          <img src="${product.image}" alt="${product.name}" />
          <h3>${product.name}</h3>
          <p>${product.description}</p>
          <p><strong>$${product.price}</strong></p>
        </div>
      `;
            container.innerHTML += productHTML;
        });
    }
};
