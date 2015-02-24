# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  mount_uploader :cv, CvUploader




  validates :name,
    :presence =>{:message => "Nom manquant"}

  validates :mail,
    :presence =>{:message => "E-Mail manquant"},
    :uniqueness => { :case_sensitive => true },
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
              :message => "Mail non valide" }


    validates_date :date_of_birth,
    :before => lambda { 2.years.ago },
    :after => lambda { 120.years.ago },
    :before_message => "Date invalide, vous êtes trop jeune! (2 ans minimum)",
    :after_message => "Date invalide, vous êtes trop vieux! (120 ans maximum)"


    validates :actual_weight,
    :presence =>{:message => "Poids actuel manquant"},
    numericality: { only_float:true, :message => "Poids actuel doit être un nombre"},
    :numericality => { :greater_than => 0, :less_than_or_equal_to => 600, :message => "Poids actuel doit être compris entre 0 et 600 kg"}

    validates :ideal_weight,
    :presence =>{:message => "Poids ideal manquant"},
    numericality: { only_float:true, :message => "Poids idéal doit être un nombre"},
    :numericality => { :greater_than => 0, :less_than_or_equal_to => :actual_weight, :message => "Poids idéal doit être compris entre 0 et 600 kg"}

    validates :size,
    :presence =>{:message => "Taille manquante"},
    numericality: { only_float:true, :message => "La taille doit etre un nombre"},
    :numericality => { :greater_than => 0, :less_than_or_equal_to => 300, :message => "Taille doit être comprise entre 0 et 300 m"}

    validates :in_diet,
    :inclusion => {:in => [true, false], :message => "La mention \"Faites-vous actuellement un regime?\" doit être renseignée"}

    validates :like_diet,
    :inclusion => {:in => [true, false], :message => "La mention \"Faites-vous actuellement un regime?\" doit être renseignée"}
    def bool2String b
      if b
        return "Oui"
      else
        return "Non"
      end
    end

    def getIMC
      if self.size.present? && self.actual_weight.present?
        res = (((self.actual_weight+0.00)/(self.size*self.size))*10000).round()
        return res
      else
        return 0
      end
    end


end
