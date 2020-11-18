(function (E) {
    const onKeyUpDelay = 1000;
    const namingFromatUrl = '/backend/naming_format_land_parcels/build.json';

    class SupportNamePreview {
        constructor(formElement) {
            this.formElement = formElement;
            this.previewElement = formElement.querySelector('[data-support-name-preview]');
            this.customNameInput = formElement.querySelector('#activity_production_custom_name');
            this.cultivableZoneSelect = formElement.querySelector('input#activity_production_cultivable_zone_id');
            this.namingBaseParams = JSON.parse(this.previewElement.dataset.supportNamePreview).activity_production;
        }

        init() {
            this.customNameInput.addEventListener('keyup', () => this.enableLoader());

            this.customNameInput.addEventListener('keyup', _.debounce(this.update.bind(this), onKeyUpDelay));

            this.cultivableZoneSelect.addEventListener('unroll:selector:change', () => {
                this.enableLoader();
                this.update();
            });

            window.addEventListener('focus', () => this.update());
        }

        enableLoader() {
            if (this.previewElement.classList.contains('loading-error')) {
                this.previewElement.classList.remove('loading-error');
            }
            this.previewElement.classList.add('spinner');
            this.previewElement.textContent = '';
        }

        disableLoader() {
            this.previewElement.classList.remove('spinner');
        }

        setValue(value) {
            this.previewElement.textContent = '(' + value + ')';
        }

        getParams() {
            const cultivableZoneId = this.formElement.querySelector('input#activity_production_cultivable_zone_id + input').value;
            let seasonId = '';
            if (this.formElement.querySelector('#activity_production_season') !== null) {
                seasonId = this.formElement.querySelector('input[id^=activity_production_season_id]:checked').value || '';
            }
            const freeFieldValue = this.formElement.querySelector('input#activity_production_custom_name').value;
            return {
                ...this.namingBaseParams,
                cultivable_zone_id: cultivableZoneId,
                season_id: seasonId,
                free_field: freeFieldValue,
            };
        }

        update() {
            $.ajax({
                url: namingFromatUrl,
                data: this.getParams(),
                context: this,
                success: function (data, status, request) {
                    this.disableLoader();
                    this.setValue(data.name);
                },
                error: function (err) {
                    _.delay(
                        function () {
                            this.previewElement.classList.add('loading-error');
                        }.bind(this),
                        1000
                    );
                },
            });
        }
    }

    E.onDomReady(function () {
        const formElement = document.querySelector('form#new_activity_production,form[id^=edit_activity_production]');
        if (formElement !== null) {
            const previewElement = formElement.querySelector('[data-support-name-preview]');
            if (previewElement !== null) {
                new SupportNamePreview(formElement).init();
            }
        }
    });
})(ekylibre);