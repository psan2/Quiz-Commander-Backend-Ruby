# frozen_string_literal: true

#destroy all existing records
Team.destroy_all
Participation.destroy_all
TeamAnswer.destroy_all
Answer.destroy_all
RoundQuestion.destroy_all
Round.destroy_all
Question.destroy_all
QuizRound.destroy_all
Quiz.destroy_all
QuizNight.destroy_all
Host.destroy_all
CorrectAnswer.destroy_all

#create demo hosts
# Host.create(name:"Demo Host 1", username:"host1", password:)
