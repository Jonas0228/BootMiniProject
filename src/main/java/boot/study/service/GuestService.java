package boot.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.study.dto.GuestDto;
import boot.study.dto.GuestPhotoDto;
import boot.study.mapper.GuestMapper;

@Service
public class GuestService implements GuestServiceInter{

	@Autowired
	GuestMapper guestMapper;
	
	@Override
	public void insertGuest(GuestDto dto) {
		// TODO Auto-generated method stub
		guestMapper.insertGuest(dto);
	}

	@Override
	public void insertPhoto(GuestPhotoDto dto) {
		// TODO Auto-generated method stub
		guestMapper.insertPhoto(dto);
	}

	@Override
	public List<GuestDto> getAllGuest() {
		// TODO Auto-generated method stub
		return guestMapper.getAllGuest();
	}

	@Override
	public List<GuestPhotoDto> getPhotos(int guest_idx) {
		// TODO Auto-generated method stub
		return guestMapper.getPhotos(guest_idx);
	}

	@Override
	public void deletePhoto(int photo_idx) {
		// TODO Auto-generated method stub
		guestMapper.deletePhoto(photo_idx);
	}

	@Override
	public void deleteAllPhoto(int guest_idx) {
		// TODO Auto-generated method stub
		guestMapper.deleteAllPhoto(guest_idx);
	}

	@Override
	public void deleteGuest(int guest_idx) {
		// TODO Auto-generated method stub
		guestMapper.deleteGuest(guest_idx);
	}

	@Override
	public String getSelectPhoto(int photo_idx) {
		// TODO Auto-generated method stub
		return guestMapper.getSelectPhoto(photo_idx);
	}

	@Override
	public List<String> getAllPhoto(int guest_idx) {
		// TODO Auto-generated method stub
		return guestMapper.getAllPhoto(guest_idx);
	}
	
	
	
}
