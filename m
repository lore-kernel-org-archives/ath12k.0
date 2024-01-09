Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7ADC47079
	for <ath12k@archiver.kernel.org>; Tue,  9 Jan 2024 17:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5VlpeuodbB1DMvG8sLo1Ojxo2aWLkN76d0378K62RA=; b=oxn8KggpU8YahRCSl/YYTol+Tj
	cYJw4xIvupRJ7ZkPMUyAWomrC9kWNKCsz4mB2AW5e5PTELnIuq4RP9UuReFdfbSsXZdq0I5o67DB1
	iw9ci5Oy9na7N/7mH1WHxRwakhhsBw+6D0UczIVTWEJ7T1+KVjniUWzqk25wWzrTNjflvpuo7/fG/
	xbOKV8s33J4XPD7EH7YVJroCdDU0knJkuHua8sNAJIEF44G3RtNok4qt3YIYRODutm3gbfSEbCt71
	yGD1SqhpX2yHHzsl/LlHDH1LXOm2ns4kp8ij93JSxBtJfya404kR3BDuVUcL1FBdzi1Pgu8pB9kgQ
	sxmI4+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNGFv-0092TI-31
	for ath12k@archiver.kernel.org;
	Tue, 09 Jan 2024 17:51:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNGFr-0092RO-0W
	for ath12k@lists.infradead.org;
	Tue, 09 Jan 2024 17:51:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 409EhhdQ020762;
	Tue, 9 Jan 2024 17:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=y5VlpeuodbB1DMvG8sLo1Ojxo2aWLkN76d0378K62RA
	=; b=eH5yz393/pAg6u4UVSiokgG3A8AcVLYXvXso9a0c3Mnal5imoR9Abvdp+Vb
	WXb9zU/5O99leWiUoLR8qzePEHk+1Z78KDd3fm15jfLeX82kJ/1QOEILMGHE2Vqi
	VK/UrZF6lFKzVkSTGQUikvKskZdNvrDGaORkbG7vDWUzVndp7U0ILrLF60morqc6
	6uppr1rppWYfwA8I4QZI/ejBAfdakwYWmNARpe2wB9bIiWHW+R8qU38kv8TN7cGs
	nqbkMoh90AF1Bn13s4ABixEHcetxSn6nZes07xwQz8JvMI9hFWFAzpb04glvKnbQ
	4s2w84l7gGQIEYjGf2+0H2WBasw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vgwx39n6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 17:51:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 409Hp7Xt031647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jan 2024 17:51:07 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 9 Jan
 2024 09:51:07 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 9 Jan 2024 09:51:05 -0800
Subject: [PATCH 3/3] wifi: ath12k: Use initializers for QMI message buffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240109-qmi-cleanup-v1-3-607b10858566@quicinc.com>
References: <20240109-qmi-cleanup-v1-0-607b10858566@quicinc.com>
In-Reply-To: <20240109-qmi-cleanup-v1-0-607b10858566@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HIjEzzWSJ5epqKywNhNwbC429jrY5vQI
X-Proofpoint-ORIG-GUID: HIjEzzWSJ5epqKywNhNwbC429jrY5vQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401090144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_095111_210645_8B32114A 
X-CRM114-Status: GOOD (  14.72  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently most of the QMI messaging functions use memset() to zero out
the QMI message buffers. Prefer to use a {} initializer to allow the
compiler to generate optimized code and avoid the function call
overhead.

No functional changes, compile tested only.
---
 drivers/net/wireless/ath/ath12k/qmi.c | 40 ++++++++++-------------------------
 1 file changed, 11 insertions(+), 29 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 1f2df2e3fbce..c4c7f31a91cd 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -1919,14 +1919,11 @@ static void ath12k_host_cap_parse_mlo(struct qmi_wlanfw_host_cap_req_msg_v01 *re
 
 static int ath12k_qmi_host_cap_send(struct ath12k_base *ab)
 {
-	struct qmi_wlanfw_host_cap_req_msg_v01 req;
-	struct qmi_wlanfw_host_cap_resp_msg_v01 resp;
+	struct qmi_wlanfw_host_cap_req_msg_v01 req = {};
+	struct qmi_wlanfw_host_cap_resp_msg_v01 resp = {};
 	struct qmi_txn txn;
 	int ret = 0;
 
-	memset(&req, 0, sizeof(req));
-	memset(&resp, 0, sizeof(resp));
-
 	req.num_clients_valid = 1;
 	req.num_clients = 1;
 	req.mem_cfg_mode = ab->qmi.target_mem_mode;
@@ -2070,7 +2067,7 @@ static int ath12k_qmi_fw_ind_register_send(struct ath12k_base *ab)
 static int ath12k_qmi_respond_fw_mem_request(struct ath12k_base *ab)
 {
 	struct qmi_wlanfw_respond_mem_req_msg_v01 *req;
-	struct qmi_wlanfw_respond_mem_resp_msg_v01 resp;
+	struct qmi_wlanfw_respond_mem_resp_msg_v01 resp = {};
 	struct qmi_txn txn;
 	int ret = 0, i;
 	bool delayed;
@@ -2079,8 +2076,6 @@ static int ath12k_qmi_respond_fw_mem_request(struct ath12k_base *ab)
 	if (!req)
 		return -ENOMEM;
 
-	memset(&resp, 0, sizeof(resp));
-
 	/* Some targets by default request a block of big contiguous
 	 * DMA memory, it's hard to allocate from kernel. So host returns
 	 * failure to firmware and firmware then request multiple blocks of
@@ -2090,7 +2085,6 @@ static int ath12k_qmi_respond_fw_mem_request(struct ath12k_base *ab)
 		delayed = true;
 		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi delays mem_request %d\n",
 			   ab->qmi.mem_seg_count);
-		memset(req, 0, sizeof(*req));
 	} else {
 		delayed = false;
 		req->mem_seg_len = ab->qmi.mem_seg_count;
@@ -2211,17 +2205,14 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 
 static int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
 {
-	struct qmi_wlanfw_cap_req_msg_v01 req;
-	struct qmi_wlanfw_cap_resp_msg_v01 resp;
+	struct qmi_wlanfw_cap_req_msg_v01 req = {};
+	struct qmi_wlanfw_cap_resp_msg_v01 resp = {};
 	struct qmi_txn txn;
 	unsigned int board_id = ATH12K_BOARD_ID_DEFAULT;
 	int ret = 0;
 	int r;
 	int i;
 
-	memset(&req, 0, sizeof(req));
-	memset(&resp, 0, sizeof(resp));
-
 	ret = qmi_txn_init(&ab->qmi.handle, &txn,
 			   qmi_wlanfw_cap_resp_msg_v01_ei, &resp);
 	if (ret < 0)
@@ -2314,7 +2305,7 @@ static int ath12k_qmi_load_file_target_mem(struct ath12k_base *ab,
 					   const u8 *data, u32 len, u8 type)
 {
 	struct qmi_wlanfw_bdf_download_req_msg_v01 *req;
-	struct qmi_wlanfw_bdf_download_resp_msg_v01 resp;
+	struct qmi_wlanfw_bdf_download_resp_msg_v01 resp = {};
 	struct qmi_txn txn;
 	const u8 *temp = data;
 	int ret;
@@ -2323,7 +2314,6 @@ static int ath12k_qmi_load_file_target_mem(struct ath12k_base *ab,
 	req = kzalloc(sizeof(*req), GFP_KERNEL);
 	if (!req)
 		return -ENOMEM;
-	memset(&resp, 0, sizeof(resp));
 
 	while (remaining) {
 		req->valid = 1;
@@ -2549,14 +2539,11 @@ static void ath12k_qmi_m3_free(struct ath12k_base *ab)
 static int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
 {
 	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
-	struct qmi_wlanfw_m3_info_req_msg_v01 req;
-	struct qmi_wlanfw_m3_info_resp_msg_v01 resp;
+	struct qmi_wlanfw_m3_info_req_msg_v01 req = {};
+	struct qmi_wlanfw_m3_info_resp_msg_v01 resp = {};
 	struct qmi_txn txn;
 	int ret = 0;
 
-	memset(&req, 0, sizeof(req));
-	memset(&resp, 0, sizeof(resp));
-
 	ret = ath12k_qmi_m3_load(ab);
 	if (ret) {
 		ath12k_err(ab, "failed to load m3 firmware: %d", ret);
@@ -2601,14 +2588,11 @@ static int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
 static int ath12k_qmi_wlanfw_mode_send(struct ath12k_base *ab,
 				       u32 mode)
 {
-	struct qmi_wlanfw_wlan_mode_req_msg_v01 req;
-	struct qmi_wlanfw_wlan_mode_resp_msg_v01 resp;
+	struct qmi_wlanfw_wlan_mode_req_msg_v01 req = {};
+	struct qmi_wlanfw_wlan_mode_resp_msg_v01 resp = {};
 	struct qmi_txn txn;
 	int ret = 0;
 
-	memset(&req, 0, sizeof(req));
-	memset(&resp, 0, sizeof(resp));
-
 	req.mode = mode;
 	req.hw_debug_valid = 1;
 	req.hw_debug = 0;
@@ -2654,7 +2638,7 @@ static int ath12k_qmi_wlanfw_mode_send(struct ath12k_base *ab,
 static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 {
 	struct qmi_wlanfw_wlan_cfg_req_msg_v01 *req;
-	struct qmi_wlanfw_wlan_cfg_resp_msg_v01 resp;
+	struct qmi_wlanfw_wlan_cfg_resp_msg_v01 resp = {};
 	struct ce_pipe_config *ce_cfg;
 	struct service_to_pipe *svc_cfg;
 	struct qmi_txn txn;
@@ -2667,8 +2651,6 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 	if (!req)
 		return -ENOMEM;
 
-	memset(&resp, 0, sizeof(resp));
-
 	req->host_version_valid = 1;
 	strscpy(req->host_version, ATH12K_HOST_VERSION_STRING,
 		sizeof(req->host_version));

-- 
2.42.0


