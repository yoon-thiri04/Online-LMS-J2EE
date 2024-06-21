package model;

public class QuizResultAnswer {
        private int result_id;
        private String answer;
        private int quizz_id;
        private String isCorrect;
        public QuizResultAnswer(String answer,String isCorrect) {
        	this.answer=answer;
        	this.isCorrect=isCorrect;
        }
		public int getResult_id() {
			return result_id;
		}
		public void setResult_id(int result_id) {
			this.result_id = result_id;
		}
		public String getAnswer() {
			return answer;
		}
		public void setAnswer(String answer) {
			this.answer = answer;
		}
		public int getQuizz_id() {
			return quizz_id;
		}
		public void setQuizz_id(int quizz_id) {
			this.quizz_id = quizz_id;
		}
		public String getIsCorrect() {
			return isCorrect;
		}
		public void setIsCorrect(String isCorrect) {
			this.isCorrect = isCorrect;
		}
}
