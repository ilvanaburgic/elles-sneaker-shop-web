// scripts/filters.js

let FilterService = {
    setup: function (products) {
        this.products = products;
        this.attachEventListeners();
        this.applyFilters();
    },

    applyFilters: function () {
        const selectedBrands = $('.brand-filter:checked').map(function () {
            return this.value.toLowerCase();
        }).get();

        const priceRange = $('#priceRange').val();
        let [minPrice, maxPrice] = [0, Infinity];
        if (priceRange !== 'all') {
            const parsed = priceRange.split('-').map(Number);
            [minPrice, maxPrice] = parsed.length === 2 ? parsed : [parsed[0], Infinity];
        }

        const selectedColor = $('#color').val().toLowerCase();
        const selectedGender = $('#gender').val().toLowerCase();

        const filtered = this.products.filter(p => {
            const brandMatch = selectedBrands.length === 0 || selectedBrands.includes(p.brand?.toLowerCase());

            let priceVal = p.price;
            if (typeof priceVal === 'string') {
                priceVal = parseFloat(priceVal.replace(/\$/g, ''));
            }

            const priceMatch = priceVal >= minPrice && priceVal <= maxPrice;
            const colorMatch = !selectedColor || (p.color && p.color.toLowerCase() === selectedColor);
            const genderMatch = !selectedGender || (p.gender && p.gender.toLowerCase() === selectedGender);

            return brandMatch && priceMatch && colorMatch && genderMatch;
        });

        this.renderProducts(filtered);
    },

    renderProducts: function (products) {
        const container = $('#pro-container');
        container.empty();

        if (products.length === 0) {
            container.append('<p>No products found.</p>');
            return;
        }

        products.forEach(p => {
            const html = `
        <div class="product-card">
          <img src="${p.image}" alt="${p.name}" />
          <h3>${p.name}</h3>
          <p>${p.description}</p>
          <p><strong>$${p.price}</strong></p>
        </div>`;
            container.append(html);
        });
    },

    attachEventListeners: function () {
        const self = this;

        $('.brand-filter').on('change', () => self.applyFilters());
        $('#priceRange').on('change', () => self.applyFilters());
        $('#color').on('change', () => self.applyFilters());
        $('#gender').on('change', () => self.applyFilters());

        $('#searchInput').on('input', function () {
            const query = $(this).val().toLowerCase();
            $('#pro-container .product-card').each(function () {
                const productName = $(this).find('h3').text().toLowerCase();
                $(this).toggle(productName.includes(query));
            });
        });
    }
};
