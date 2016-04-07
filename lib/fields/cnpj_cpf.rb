class CnpjCpf
  def initialize(cnpj_cpf)
    @cnpj_cpf = cnpj_cpf.present? ? cnpj_cpf.numeric : ""
  end

  def valid?
    cpf? || cnpj?
  end

  def cpf?
    @cnpj_cpf.length == 11
  end

  def cnpj?
    @cnpj_cpf.length == 14
  end

  def masked
    return mask_cpf if cpf?
    return mask_cnpj if cnpj?
    return @cnpj_cpf
  end

  def unmasked
    @cnpj_cpf
  end


  private

  def mask_cpf
    "#{@cnpj_cpf[0..2]}.#{@cnpj_cpf[3..5]}.#{@cnpj_cpf[6..8]}-#{@cnpj_cpf[9..11]}"
  end

  def mask_cnpj
    "#{@cnpj_cpf[0..1]}.#{@cnpj_cpf[2..4]}.#{@cnpj_cpf[5..7]}/#{@cnpj_cpf[8..11]}-#{@cnpj_cpf[12..13]}"
  end
end