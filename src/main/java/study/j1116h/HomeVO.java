package study.j1116h;

public class HomeVO {
	private String product;
	private int price;
	private int pcs;
	
	public HomeVO(String product, int price, int pcs) {
		this.product = product;
		this.price = price;
		this.pcs = pcs;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPcs() {
		return pcs;
	}

	public void setPcs(int pcs) {
		this.pcs = pcs;
	}

	@Override
	public String toString() {
		return "HomeVO [product=" + product + ", price=" + price + ", pcs=" + pcs + "]";
	}

	
	
}
