module Site
  class CandidateMailer < ActionMailer::Base
    default from: 'concursoparquedococo@gmail.com'
    
    def homolog(candidate)
      @candidate = candidate
      mail(to: @candidate.email, subject: "Inscrição homologada!")
    end

    def subscribe(candidate)
      @candidate = candidate
      mail(to: @candidate.email, subject: "Inscrição realizada com sucesso!")
    end

  end
end
