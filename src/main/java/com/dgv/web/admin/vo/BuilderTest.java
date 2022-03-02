package com.dgv.web.admin.vo;

public class BuilderTest {
	private String name;
	private Integer age;
	
	private BuilderTest(final String name, final Integer age) {
		this.name = name;
		this.age = age;
	}
	
	public static Builder builder() {
		return new Builder();
	}
	
	public static class Builder {
		
		private Builder() {
			
		}
		
		private String name;
		private Integer age;
		
		public Builder name(final String name) {
			this.name = name;
			return this;
		}
		
		public Builder age(final Integer age) {
			this.age = age;
			return this;
		}
		
		public BuilderTest build() {
			return new BuilderTest(this.name, this.age);
		}
		
	}
	
}
