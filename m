Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2161CCD98E6
	for <ath12k@archiver.kernel.org>; Fri, 19 Jun 2026 06:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xOtmqStDoUGhma7QcihIweAGCbgOFJi/DMLIntRLZpU=; b=OR/wf7KhmI/8Lg9VO72zcqDk3E
	HJCRLp9NNDO2eCEpA6op5RGCXT8vY8X1/Mno5L9MeYEvD1zgY69L98NF/oJXcfkIwICeoXInOc8VD
	Pn+buGSOIgIn77sKLrcpdhrEjnpz2GbVWhdHq7qf7bvWi/QqxhlaOt4os3kSJEtlPvraTpo5r6TFa
	qAquVS3Wakie2xmfkuDJvWQw+jJP5BgcKpQUH0ojYUBOi88v55S27Z9Mj2Atf85RCOF3L5JEJwLu/
	a7wJhsrIyNnmjla9w8RzoAMI+ABj5dEDOMSmTreVHApIECyh58ajmJ1aCeg/iuotYjeqFgFm9mnbe
	IeD/wWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTBN-000000023su-0zFL;
	Fri, 19 Jun 2026 06:58:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTBJ-000000023sR-2N1M
	for ath12k@lists.infradead.org;
	Fri, 19 Jun 2026 06:58:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J2sjrQ3130592
	for <ath12k@lists.infradead.org>; Fri, 19 Jun 2026 06:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xOtmqStDoUGhma7QcihIweAGCbgOFJi/DML
	IntRLZpU=; b=D+RuCDuPKF6K//qHbNHkkIfsw3TVBqU0sz8D9+9h17aozl2YxH8
	MjMFnxTw9an9PPC8rkoPyTzO7Cq1lbDsYpRC4W5/rvoJaLdqQ+7RsL/r39soCgJ9
	TDD9zzDKX9nsHmfdyxNVNq1pMs6hO0oWx1emqMXWj95IwHO8L9URFH80Z+ONSai6
	P6rw4xO/qpIO649JENq5QyFhklSgd+dQobDkL5aBSoJpwpJjAhduv9+G+F8vuvoH
	bWqCj6mogANxiyNqpfpIZ/BjqU/8zLsxe9OWOa0HL7dIYf+YJeXY9N+8TzI/ESoA
	w3kffo9GLLe1OrJxmCR5fZsYLBec5M6lMMA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp67261r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 19 Jun 2026 06:58:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c725d3e886so6483525ad.0
        for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 23:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781852304; x=1782457104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xOtmqStDoUGhma7QcihIweAGCbgOFJi/DMLIntRLZpU=;
        b=i6lS8CWLd7BAi+XJPBdBSpz6TiZ+61kvru6M3KaVNHmEK1KzfAf8EbLG18MHYwM1ha
         33SttU2VaXdOauiSjib6/PaDCNmuxWYGj1MPw1Xt1FZ3TMUEz+gk+t9aoVGDKpQs67Ba
         hb5zGBkqRHGLBFrQwx7qe/YV1a3YOV56yMK1oiVcNM/Lm920VK2jchbxbcEfRivTr6Yy
         c+rD5vHfvTj2ub+3fLWvzodgx0bYfsuaPiBo+kR6f2x5plN5SaiSA2GlQfZZvKT/GVs0
         b6XYI92LT1/nxdnrCrecQp41z01QOMW89jPwpIXOHzZ4yAT3SYDWuFOfiA3veWbh46pT
         /nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781852304; x=1782457104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOtmqStDoUGhma7QcihIweAGCbgOFJi/DMLIntRLZpU=;
        b=fm7QaMldqLHUqCQn2wN2fa1Iqbo6I4Yg2iheZaDkQN7+SoKIIkMm3Gp+cT1OKlQuU/
         MSw6hJvtpTgHfQLC1V9QnR6i2+rjvn5dOqrFsfwvRO3jbMHNen/FjwP9lAwHK+TX8uu/
         uSF6ZHYmkuvxNCpqDlI6zDUmJtbUahdK6tmTyJFYmgX//9LdieThODRmeY35XPTYinql
         WPSdBKQbMs/TRRH10/k5Iz3Zirazi9uaEvQVtyO1KS3By0TFfk2Qk8Z5BLEbglZyr5Dm
         icO56ZZKOazH7T2fzbpgAYxHSe0I064Qc6SyYd06JlgE9N4z87qRCtxxtYVEHQaZ8VgR
         Y0Xw==
X-Gm-Message-State: AOJu0YxzTrHSC2mmvs762c0JEh6uPL31kqLn6KUGnGvUwTwvqOG0b0aU
	aRyNWxyDguush/oLOjx6zpnP9HrdrrDTJQ3TPI6VCdJFmJZcTgGCfjsQ32t7sJI8YNDo1hPT+vQ
	PLAjk0noShaBYUeH7PEjeQ+fcvTsUptmB0xJy0f6yPZiqUP8ct4zgNnT9ol5DM7PYMokXqKzX
X-Gm-Gg: AfdE7cmplrqp7pGPxkjPPILXpopRWv/oKCXipu3TVaG0mYRvaHIetWDocfEFPzXcewJ
	jM/9FRKD9lARUb0gRGiImbqimwioV7SzSRKA0DgOnx8RRCSj4LjQLZ3VROYpKEnlU87bhiUoYTX
	OliAGI60bYan8E9k4biGnQ98DuatMIhg8qZOnOn3rN6uCWdxVeWceLHdiuc5wrfRcHQ3LuS2WY0
	zNzOUb5nhSdZnphFJkhoZkq1aPAkxs7Uda/SUv6sCjgpqLRjbjHTNkcblJADmkF2zk9SXXKYnlz
	NsbTapPwLLAm3lIX5Iq0V9TqXIKCxu6ZYFRnuCd2K+ymkRl8bSN0nEQwXcLZvAVBBMpPAxJFFzz
	QVuHTzBBvWZ1EM+dflQA1dCAhQ4fe+n5dcWfcFIDCPP9sRo8b7jZYjsZxEarYnS08hLbjbUB3Zo
	z4MspT0UTkesT/S1K+HsNL9bdJVq1TNu7JgA==
X-Received: by 2002:a17:902:e807:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c7185ed173mr30060445ad.0.1781852303563;
        Thu, 18 Jun 2026 23:58:23 -0700 (PDT)
X-Received: by 2002:a17:902:e807:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c7185ed173mr30060155ad.0.1781852303045;
        Thu, 18 Jun 2026 23:58:23 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c72089a6a7sm12373025ad.10.2026.06.18.23.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 23:58:22 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath12k: add QMI capability negotiation for dynamic memory mode
Date: Fri, 19 Jun 2026 12:28:16 +0530
Message-Id: <20260619065816.2139392-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: r9Y9GGXL8Da2PswWgCwtKjVOQxGm4M3N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA2MyBTYWx0ZWRfX0txI0jMGTFFu
 4KJD18tiK/r2ghzjQ8+VAK8u6H8g1aeIJ8XnR7Tb4B3dNzn4gmt8Ah8y0XERsRxExuj3k0wM75b
 keAsEZ8FGkEsqnGTTCA7bYqybLp6KllwThJf4dhIK6oscNYwvndtrAurzjvR4uTdTXL5bXCO5k1
 PMMlfhsIoMPvT8U/jT5H1Y23M2HuV19EXRVwEwSLdGb0YxBAKuk0K684c5UIfPhmys1E/lEJbOz
 gR3FzPAc1n5m8aBxDY03PbRjWztdFcDKunJ6QrNlOLgq/lpTL9r2V03UxS93RBWib1qUuGX2N5b
 TMdUulE8eMvHCpSp+DkA/RDzW9YSejedBxx2u75DcICuXH1O1hS1ZnSxNTXhVKy2WSAts8OHXT/
 3Vx424rcXKQTlPnNsYqKh6VG5Yx8n7kiprUjvBJQ5J8APZ1GT3qBVf6pQqezheWfXomF1LN75bU
 r4zxBC+7v4rv6k701bQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA2MyBTYWx0ZWRfX4HXtw/L3ASp0
 BgF3am3ivbrGwRHNo4UHA7K4FXLN00HgZmhJSg+Ht/RYXpPuJv1F6/2+0GtHOlhtyrnJwiwJFTn
 HEhrabjtCVfDMBkMmOMmluZCFHnICjw=
X-Proofpoint-GUID: r9Y9GGXL8Da2PswWgCwtKjVOQxGm4M3N
X-Authority-Analysis: v=2.4 cv=TdOmcxQh c=1 sm=1 tr=0 ts=6a34e890 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=m70HO3XBkMWC9QqM1QIA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_235825_640106_67FA13E0 
X-CRM114-Status: GOOD (  18.26  )
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

On AHB platforms, firmware operates in two modes: fixed-memory mode where
firmware uses hardcoded addresses for memory regions such as BDF and does
not request HOST_DDR memory from the host, and dynamic-memory mode where
firmware expects the host to provide memory addresses including HOST_DDR
after the Q6 read-only region and relies on host allocation for all memory
types.

Introduce QMI capability negotiation to support both modes. Add a new QMI
PHY capability flag dynamic_ddr_support which is advertised by firmware to
indicate it supports dynamic memory mode. When the host detects this
capability, set the dynamic_mem_support flag in the host capability message
to signal the host is ready to provide dynamic memory allocation. This
triggers firmware to send the HOST_DDR memory request and use the
host-provided address.

For backward compatibility, if firmware doesn't advertise
dynamic_ddr_support, the firmware continues to operate in fixed-memory mode
where firmware uses predefined addresses.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
v2:
  -Dropped QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN and QMI_WLANFW_PHY_CAP_RESP_MSG_V01_MAX_LEN changes.
  -Used %u instead of %d in the debug log.
---
 drivers/net/wireless/ath/ath12k/qmi.c | 50 +++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/qmi.h |  6 +++-
 2 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index fd762b5d7bb5..e15a0c0120d3 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -506,6 +506,24 @@ static const struct qmi_elem_info qmi_wlanfw_host_cap_req_msg_v01_ei[] = {
 		.offset		= offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
 					   feature_list),
 	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x33,
+		.offset		= offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
+					   dynamic_mem_support_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x33,
+		.offset		= offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
+					   dynamic_mem_support),
+	},
 	{
 		.data_type	= QMI_EOTI,
 		.array_type	= NO_ARRAY,
@@ -602,6 +620,24 @@ static const struct qmi_elem_info qmi_wlanfw_phy_cap_resp_msg_v01_ei[] = {
 		.offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
 					   single_chip_mlo_support),
 	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x17,
+		.offset		= offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
+					   dynamic_ddr_support_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x17,
+		.offset		= offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
+					   dynamic_ddr_support),
+	},
 	{
 		.data_type	= QMI_EOTI,
 		.array_type	= NO_ARRAY,
@@ -2248,6 +2284,11 @@ int ath12k_qmi_host_cap_send(struct ath12k_base *ab)
 	if (ret < 0)
 		goto out;
 
+	if (ab->qmi.dynamic_ddr_support) {
+		req.dynamic_mem_support_valid = 1;
+		req.dynamic_mem_support = 1;
+	}
+
 	ret = qmi_txn_init(&ab->qmi.handle, &txn,
 			   qmi_wlanfw_host_cap_resp_msg_v01_ei, &resp);
 	if (ret < 0)
@@ -2319,11 +2360,14 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
 
 	ab->qmi.num_radios = resp.num_phy;
 
+	if (resp.dynamic_ddr_support_valid)
+		ab->qmi.dynamic_ddr_support = resp.dynamic_ddr_support;
+
 	ath12k_dbg(ab, ATH12K_DBG_QMI,
-		   "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d\n",
+		   "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d dynamic_ddr_valid %u dynamic_ddr_support %u\n",
 		   resp.single_chip_mlo_support_valid, resp.single_chip_mlo_support,
-		   resp.num_phy_valid, resp.num_phy,
-		   resp.board_id_valid, resp.board_id);
+		   resp.num_phy_valid, resp.num_phy, resp.board_id_valid, resp.board_id,
+		   resp.dynamic_ddr_support_valid, resp.dynamic_ddr_support);
 
 	return;
 
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 2a63e214eb42..08225242d30a 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -156,6 +156,7 @@ struct ath12k_qmi {
 	struct m3_mem_region aux_uc_mem;
 	unsigned int service_ins_id;
 	struct dev_mem_info dev_mem[ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01];
+	u8 dynamic_ddr_support;
 };
 
 #define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN		261
@@ -258,7 +259,8 @@ struct qmi_wlanfw_host_cap_req_msg_v01 {
 	struct wlfw_host_mlo_chip_info_s_v01 mlo_chip_info[QMI_WLFW_MAX_NUM_MLO_CHIPS_V01];
 	u8 feature_list_valid;
 	u64 feature_list;
-
+	u8 dynamic_mem_support_valid;
+	u8 dynamic_mem_support;
 };
 
 struct qmi_wlanfw_host_cap_resp_msg_v01 {
@@ -281,6 +283,8 @@ struct qmi_wlanfw_phy_cap_resp_msg_v01 {
 	u32 board_id;
 	u8 single_chip_mlo_support_valid;
 	u8 single_chip_mlo_support;
+	u8 dynamic_ddr_support_valid;
+	u8 dynamic_ddr_support;
 };
 
 #define QMI_WLANFW_IND_REGISTER_REQ_MSG_V01_MAX_LEN		54

base-commit: 83f028be15fe071efbee8e27837538d6cca77e87
-- 
2.34.1


