package com.kh.respect.message.model.service;

import java.util.List;
import java.util.Map;

import com.kh.respect.message.model.vo.Message;

public interface MessageService {

	List<Map<String,String>> receiveMessageList(String userId, int cPage, int numPerPage);

	int receiveMessageTotalCount(String userId);

	Message receiveMessageView(int msgNo);

	List<Map<String,String>> writeMessageList(String userId, int cPage, int numPerPage);

	int writeMessageTotalCount(String userId);

	Message writeMessageView(int msgNo);

	int sendMessageEnd(Map<String, String> map);

	int receiveMessageDelete(int msgNo);

	int wrtieMessageDelete(int msgNo);

	

}
