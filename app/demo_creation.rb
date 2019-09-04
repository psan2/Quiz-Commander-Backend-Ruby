#this file provides a method to destroy the demo host and re-seed demo account data to ensure that the experience for demo users is not impacted by previous users
module DemoCreation
  def clean_demo
    Host.find_by(username: "demo").destroy

    h1 = Host.create(
      name: 'Demo Host 1',
      email: 'temp@mail.com',
      username: 'demo',
      password: 'password'
    )

    #create demo questions
    q1 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content:
          "According to an aptitude test, what is Gerald's potential future profession?",
        nickname: 'Hey Arnold 1'
      )
    q2 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: "What color are Chuckie's glasses?",
        nickname: 'Rugrats 2'
      )
    q3 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: 'Where did Sam move to Ocean Shores from?',
        nickname: 'Rocket Power 3'
      )
    q4 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: "What is pictured on The Squid's helmet?",
        nickname: 'Rocket Power 4'
      )
    q5 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: "What is Skeeter's catchphrase?",
        nickname: 'Doug 5'
      )
    q6 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: 'What animals raised Heffer?',
        nickname: "Rocko's Modern Life 6"
      )
    q7 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: "What number is on Gerald's shirt?",
        nickname: 'Hey Arnold 7'
      )
    q8 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: "What is pictured on Skeeter's shirt?",
        nickname: 'Doug 8'
      )
    q9 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content:
          'What kind of animal is Stimpy?',
        nickname: 'Ren & Stimpy 9'
      )
    q10 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: 'According to Stimpy, why do kids go to school?',
        nickname: 'Ren & Stimpy 10'
      )
    q11 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: "What is Raymundo's new wife's name?",
        nickname: 'Rocket Power 11'
      )
    q12 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content:
          'Who does Reggi have a crush on, as revealad in her Zine?',
        nickname: 'Rocket Power 12'
      )
    q13 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content:
          "In The Ren & Stimpy show, who is Stimpy's only love interest?",
        nickname: 'Ren & Stimpy 13'
      )
    q14 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content:
          "In the Rugrats, Angelica's love interest Dean claims that what book changed his life?",
        nickname: 'Rugrats 14'
      )
    q15 =
      Question.create(
        host: h1,
        question_type: 'multiple',
        question_content:
          'What two nicknames does Nigel Thornberry refer to Eliza by?',
        nickname: 'Wild Thornberries 15'
      )
    q16 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content:
          'Aside from Arnold, who is the only other character Helga falls in love with, briefly?',
        nickname: 'Hey Arnold 16'
      )
    q17 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: 'Who tries to marry Cat in CatDog?',
        nickname: 'CatDog 17'
      )
    q18 =
      Question.create(
        host: h1,
        question_type: 'multiple',
        question_content: 'What names does Helga Pataki refer to her fists by?',
        nickname: 'Hey Arnold 18'
      )
    q19 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: "What is Roger's mom's occupation?",
        nickname: 'Doug 19'
      )
    q20 =
      Question.create(
        host: h1,
        question_type: 'multiple',
        question_content:
          'What three species of animals does Rocko fall in love with? (one point per)',
        nickname: 'Hey Arnold 20'
      )
    q21 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: "What was Grandpa Lou's late wife's name?",
        nickname: 'Rugrats 21'
      )
    q22 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content:
          "Reggie and Otto's mom dies when they're very little - what was her name?",
        nickname: 'Rocket Power 22'
      )
    q23 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: 'Who raised Donnie?',
        nickname: 'Wild Thornberries 23'
      )
    q24 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: "What kind of animals are Rocko's parents?",
        nickname: "Rocko's Modern Life 24"
      )
    q25 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: "What is Rancid Rabbit's niece's name?",
        nickname: 'CatDog 25'
      )
    q26 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content:
          "Didi's dad, Grandpa Boris, talks about life in the 'Old Country' - which one?",
        nickname: 'Rugrats 26'
      )
    q27 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content:
          'Who is the only family member that knows Eliza can talk to animals?',
        nickname: 'Wild Thornberries 27'
      )
    q28 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: "What happened to Tito's parents?",
        nickname: 'Rocket Power 28'
      )
    q29 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: "What political cause is Doug's mother passionate about?",
        nickname: 'Doug 29'
      )
    q30 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: "What is Arnold's Grandpa's nickname?",
        nickname: 'Hey Arnold 30'
      )
    q31 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: "Name Catdog's great-great uncle.",
        nickname: 'CatDog 31'
      )
    q33 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: 'What is the name of Reggies magazaine?',
        nickname: 'Rocket Power 33'
      )
    q34 =
      Question.create(
        host: h1,
        question_type: 'text',
        question_content: 'What food is Helga allergic to?',
        nickname: 'Hey Arnold 34'
      )

    #generate demo answers
    a1 =
      Answer.create(
        question: q1,
        answer_content: 'Talk-show Host Sidekick',
        correct_answer: true
      )
    a2 = Answer.create(question: q2, answer_content: 'Purple', correct_answer: true)
    a3 = Answer.create(question: q3, answer_content: 'Kansas', correct_answer: true)
    a4 =
      Answer.create(question: q4, answer_content: 'A shark', correct_answer: true)
    a5 =
      Answer.create(question: q5, answer_content: 'Honk Honk', correct_answer: true)
    a6 = Answer.create(question: q6, answer_content: 'Wolves', correct_answer: true)
    a7 =
      Answer.create(
        question: q7, answer_content: 'Thirty-three', correct_answer: true
      )
    a8 =
      Answer.create(
        question: q8, answer_content: 'A Lightning bolt', correct_answer: true
      )
    a9 =
      Answer.create(question: q9, answer_content: 'Manx cat', correct_answer: true)
    a10 =
      Answer.create(
        question: q10,
        answer_content: 'Because their parents are aliens',
        correct_answer: true
      )
    a11 =
      Answer.create(question: q11, answer_content: 'Noelani', correct_answer: true)
    a12 =
      Answer.create(question: q12, answer_content: 'Trent', correct_answer: true)
    a13 =
      Answer.create(
        question: q13, answer_content: 'A raw chicken', correct_answer: true
      )
    a14 =
      Answer.create(
        question: q14, answer_content: 'The Cat in the Hat', correct_answer: true
      )
    a15 =
      Answer.create(question: q15, answer_content: 'Poodles', correct_answer: true)
    a15 =
      Answer.create(question: q15, answer_content: 'Poppet', correct_answer: true)
    a15 =
      Answer.create(
        question: q15, answer_content: 'Sweetkins', correct_answer: false
      )
    a15 =
      Answer.create(question: q15, answer_content: 'Papaya', correct_answer: false)
    a15 =
      Answer.create(question: q15, answer_content: 'Numpkin', correct_answer: false)
    a16 =
      Answer.create(question: q16, answer_content: 'Stinky', correct_answer: true)
    a17 =
      Answer.create(
        question: q17, answer_content: "Lube's sister", correct_answer: true
      )
    a180 =
      Answer.create(
        question: q18, answer_content: "Ol' Betsy", correct_answer: true
      )
    a181 =
      Answer.create(
        question: q18, answer_content: 'The Five Avengers', correct_answer: true
      )
    a182 =
      Answer.create(
        question: q18, answer_content: 'The Rickle Pickle', correct_answer: false
      )
    a183 =
      Answer.create(
        question: q18,
        answer_content: "Five Fingers of Fightin'",
        correct_answer: false
      )
    a183 =
      Answer.create(question: q18, answer_content: 'Justice', correct_answer: false)
    a183 =
      Answer.create(question: q18, answer_content: 'Revenge', correct_answer: false)
    a19 =
      Answer.create(
        question: q19, answer_content: 'Monster truck driver', correct_answer: true
      )
    a200 =
      Answer.create(question: q20, answer_content: 'Kangaroo', correct_answer: true)
    a201 =
      Answer.create(question: q20, answer_content: 'Wallaby', correct_answer: true)
    a202 =
      Answer.create(question: q20, answer_content: 'Fox', correct_answer: false)
    a203 = Answer.create(question: q20, answer_content: 'Ox', correct_answer: false)
    a204 =
      Answer.create(question: q20, answer_content: 'Hippo', correct_answer: false)
    a21 =
      Answer.create(question: q21, answer_content: 'Trixie', correct_answer: true)
    a22 =
      Answer.create(question: q22, answer_content: 'Danielle', correct_answer: true)
    a23 =
      Answer.create(
        question: q23, answer_content: 'Orangutans', correct_answer: true
      )
    a24 =
      Answer.create(
        question: q24, answer_content: 'Wallabies', correct_answer: true
      )
    a25 =
      Answer.create(question: q25, answer_content: 'Rancine', correct_answer: true)
    a26 =
      Answer.create(question: q26, answer_content: 'Russia', correct_answer: true)
    a27 =
      Answer.create(question: q27, answer_content: 'Debbie', correct_answer: true)
    a28 =
      Answer.create(
        question: q28, answer_content: 'Captured by shoobies', correct_answer: true
      )
    a29 =
      Answer.create(
        question: q29, answer_content: 'Environmentalism', correct_answer: true
      )
    a30 =
      Answer.create(
        question: q30, answer_content: 'Steely Phil', correct_answer: true
      )
    a31 =
      Answer.create(
        question: q31, answer_content: 'Horseduck', correct_answer: true
      )
    a33 =
      Answer.create(question: q33, answer_content: 'The Zine', correct_answer: true)
    a34 =
      Answer.create(
        question: q34, answer_content: 'Strawberries', correct_answer: true
      )

    #create demo rounds
    r1 = Round.create(host: h1, nickname: 'Demo Round 1')
    r2 = Round.create(host: h1, nickname: 'Demo Round 2')
    r3 = Round.create(host: h1, nickname: 'Demo Round 3')

    #add questions to rounds
    Question.all[0..9].each.with_index(1) do |question, index|
      RoundQuestion.create(question: question, round: r1, index_in_round: index)
    end

    Question.all[10..19].each.with_index(1) do |question, index|
      RoundQuestion.create(question: question, round: r2, index_in_round: index)
    end

    Question.all[20..29].each.with_index(1) do |question, index|
      RoundQuestion.create(question: question, round: r3, index_in_round: index)
    end

    #create demo quiz
    qz1 = Quiz.create(host: h1, nickname: 'Demo Quiz 1', public: true)

    #add demo rounds to demo quiz
    Round.all.each.with_index(1) { |round, index| QuizRound.create(quiz: qz1, round: round, index_in_quiz: index) }

    return h1
  end
end
