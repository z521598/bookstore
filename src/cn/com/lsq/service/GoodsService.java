package cn.com.lsq.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import cn.com.lsq.mapper.CommentMapper;
import cn.com.lsq.mapper.GoodsMapper;
import cn.com.lsq.mapper.OrderdetailMapper;
import cn.com.lsq.po.Goods;

public class GoodsService {
	@Autowired
	GoodsMapper goodsMapper;
	@Autowired
	CommentMapper commentMapper;

	public void add(Goods record, MultipartFile cover2,
			HttpServletRequest request) throws IllegalStateException,
			IOException {
		String url = request.getSession().getServletContext()
				.getRealPath("img");
		// 如果没有该路径，自动创建
		File floder = new File(url);
		if (!floder.exists()) {
			floder.mkdir();
		}
		record.setCreatetime(new Date());
		record.setIsonsale(0);
		record.setBuycount(0);
		if (cover2 != null) {
			// 原始文件名
			String originalFilename = cover2.getOriginalFilename();
			// 新文件名
			String fileName = UUID.randomUUID()
					+ originalFilename.substring(originalFilename
							.lastIndexOf("."));
			// 保存图片
			cover2.transferTo(new File(url, fileName));
			// 保存文件名至数据库
			record.setCover("img/" + fileName);
		}
		goodsMapper.insertSelective(record);
	}

	public void update(Goods goods, MultipartFile cover2,
			HttpServletRequest request) throws IllegalStateException,
			IOException {
		System.out.println("sssssssssssssssssssssssss");
		System.out.println(goods.getAuthor());
		System.out.println(goods.getCover());
		System.out.println(goods.getName());
		System.out.println(goods.getPress());
		System.out.println(goods.getPublishdate());
		System.out.println(goods.getType());
		System.out.println(goods.getWeight());
		System.out.println(goods.getIntroduce());
		System.out.println(goods.getIsonsale());
		System.out.println(goods.getBooknumber());

		String url = request.getSession().getServletContext()
				.getRealPath("img");
		// 如果没有该路径，自动创建
		File floder = new File(url);
		if (!floder.exists()) {
			floder.mkdir();
		}
		String cover3 = null;
		if (cover2 != null && !cover2.equals("")) {
			// 原始文件名
			String originalFilename = cover2.getOriginalFilename();
			if(originalFilename != null && !originalFilename.equals("")){	
				// 新文件名
				String fileName = UUID.randomUUID()
						+ originalFilename.substring(originalFilename
								.lastIndexOf("."));
				cover3 = fileName;
				// 保存图片
				cover2.transferTo(new File(url, cover3));
				// 保存文件名至数据库
				goods.setCover("img/" + cover3);
				
			}
			}

		goodsMapper.updateByPrimaryKeySelective(goods);
	}

	public void delete(Integer id) {
		// TODO Auto-generated method stub
		goodsMapper.deleteByPrimaryKey(id);
	}

	public Goods queryOne(Integer id) {
		// TODO Auto-generated method stub
		if (commentMapper.selectByGoodsId(id).size() != 0) {
			return goodsMapper.selectByPrimaryKey(id);
		} else {
			return goodsMapper.selectByPrimaryKeynocomment(id);
		}
	}

	public List<Goods> query() {
		List<Goods> list = goodsMapper.query();
		return list;
	}

	public List<Goods> queryByType(HttpServletRequest request)
			throws UnsupportedEncodingException {
		String type = request.getParameter("type");
		type = new String(type.getBytes("iso-8859-1"), "utf-8");
		return goodsMapper.queryByType(type);
	}

	public void updateOnSale(Goods goods, HttpServletRequest request) {
		goodsMapper.updateByPrimaryKeySelective(goods);
	}

	public List<Goods> queryLike(String queryname)
			throws UnsupportedEncodingException {
		// TODO Auto-generated method stub
		/*
		 * String name = request.getParameter("name"); name = new
		 * String(name.getBytes("ISO-8859-1"),"utf-8");
		 */
		return goodsMapper.queryLike(queryname);
	}

	public List<Goods> queryType(String type) {
		return goodsMapper.queryByType(type);
	}

	public List<Goods> queryLess() {
		return goodsMapper.queryLess();
	}

	public void updateselective(Goods goods) {
		goodsMapper.updateByPrimaryKeySelective(goods);
	}

	public List<Goods> queryPage(Integer lastdata, Integer pagesize) {
		Integer startdata = lastdata - pagesize;
		return goodsMapper.querypage(lastdata, startdata);
	}

	public List<Goods> queryHot() {
		return goodsMapper.queryHot();
	}

	public int querysumByTypeForSale(String name) {
		return goodsMapper.querysumbytype(name);
	}

}
