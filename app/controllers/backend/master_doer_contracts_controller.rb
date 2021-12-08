module Backend
  class MasterDoerContractsController < Backend::BaseController
    unroll translation: :fra, primary_key: :reference_name

    def show
      return unless @master_doer_contract = MasterDoerContract.find_by(reference_name: params[:reference_name])

      respond_to do |format|
        format.json
      end
    end
  end
end