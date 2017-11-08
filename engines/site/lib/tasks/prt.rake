namespace :prt do
  task seed: :environment do

    ParticipationType.create([
        {name: '1. Proposta de projeto',
          description: 'Mínimo 05 (cinco) e máximo 15 (quinze) pranchas, em formato PDF, no tamanho A1, com total máximo permitido de 8MB para cada arquivo'
        },
        {name: '2. Memorial descritivo e justificativo',
          description: 'Mínimo 01 (um) e máximo 03 (três) pranchas, em formato PDF, no tamanho A1,  com total máximo permitido de 8MB para cada arquivo'
        },
        {name: '3. Currículo do responsável técnico e autores',
          description: '01 (um) arquivo, em formato PDF, no tamanho A4, contendo breve currículo profissional do responsável técnico e demais autores, com total máximo permitido de 3MB para o arquivo'
        },
        {name: '4. Foto responsável técnico e membros',
          description: '01 (uma) foto na qual constem o responsável técnico e os demais membros da equipe, em formato “JPG”, com total máximo permitido de 3MB para o arquivo'
        },
        {name: '5. Imagens representativas do projeto',
          description: '03 (três) imagens representativas do projeto, em formato “JPG”, com total máximo permitido de 8MB para cada arquivo'
        },
        {name: '6. Memorial descritivo e justificativo',
          description: '01 (uma) página A4, em formato PDF, contendo breve Memorial Descritivo e Justificativo do Projeto, com total máximo permitido de 3MB para o arquivo'
        }
    ])
  end
end
