Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FABCD4F26
	for <ath12k@archiver.kernel.org>; Fri, 26 Jun 2026 08:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DiG6xrFFnY3h+S/4VDuUJoQQWaLq0xCJdWXESpTaCaU=; b=0KQ2d7hQfxO24PNJz1Bo9ueyEE
	BcgkO2AQXUNe9x8HkQyHnbN7gQUfHEd4XxR1PoWxxcj4lXx4l09hX3sF1UqpsAPkT5J3vjBbpjMrH
	06zy5fmot5D3qaZc3SrQB55daxawy5bcjDUiwhvfBACxa6YWKK8OulglXRQQG7hzC/Z2yO8fzKzGQ
	7YzhzVWaV8ZASkH3wONTNIYuhrrPTBWK+41tarwczsoKntxHBIOdQvj3rWXPpxtKfQu7J53fMP4rx
	sMWOIcvlv0gcfgsP3W0YOrPr73VjA9k1PTSX92Ho1eQt1Aro/zgdC7oe9bgywwNMt+F4DmxO5Hr6W
	HD10NrUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2A1-0000000Asrl-0rjW;
	Fri, 26 Jun 2026 08:43:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd29y-0000000Asqf-0iNc
	for ath12k@lists.infradead.org;
	Fri, 26 Jun 2026 08:43:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VjN9320945
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 08:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DiG6xrFFnY3h+S/4VDuUJoQQWaLq0xCJdWX
	ESpTaCaU=; b=hUstw7Hxfyz5lcx2p4jAraLwLpMKnj5w7qec6T/8raY6i816x9x
	ntBVSVK9rIvPGPs8g+om4TJHMijgtedh7yn7L5t4r2+IhNxp3/Ort/BkC7hZM5v0
	65cmU6waov3107UcbOFPtvGVyqPlZSWH6ubwMT7HicF4E3gck2JIfDHefbKe9Mne
	tXLvdJt9RJwwu9WeFWu+LYQaaDtM2zPZVa/SBD5THFDBJ+8mQCIj9CMs64QjKmrC
	I8ov9dwVXTEIBWi9aKi/K9Hn1hoKUtXLVHM8c7waBdM9xotEQ6bxtYz46rCWUOdo
	Hhy2mx+sYcOVD8UarjtGFvns4HFJukscmQQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1eeq9w05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 08:43:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcbb34e57so889629eec.1
        for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 01:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782463416; x=1783068216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DiG6xrFFnY3h+S/4VDuUJoQQWaLq0xCJdWXESpTaCaU=;
        b=kwzwrXDKi/uwO1EmGU0c6fiHh5vHTnraULFuJeBByK/x/zqvytysu4iVgQcuH2AA/4
         zTUU2zWEZsuCYyLKMALSobSuYviXw6MMqaEyCN4zIcgJ/Yrt5DY7rumMfjh7L8M+ioxD
         H+wB8yvhOYn2YyDZS9pWmGKqQhFyiV+iFe9LBiimEGD+p/WQeHXIFKJ9pcxLJ0TLV5bN
         EosrECnxFjPGcy9rCxbYREgGtXBrxqTGLXeFLF7oXPwV8bkDRL5IntFj8FgUIzfAaalo
         VKvR5PD/3HNNVQ9NrhssE9wjYNli2xymMjbXKBmWcqrN/c6b6qOe5yTxDIzJrN6CDKDi
         JbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782463416; x=1783068216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiG6xrFFnY3h+S/4VDuUJoQQWaLq0xCJdWXESpTaCaU=;
        b=U6UHsa2USadQbKsttduGhLgcdcF2N/St/qsZi+ETe5gSe5ya3zQ7sWkB8OvMckOy1U
         kEAPX7e81GwUaKO7J4e/UZrxUgI3uivgyED0QyFVAOF7bTqAArV1a913uDC5Cz+F+euQ
         T6ZoEU9EBr1WcHGuJmih1LV6zI8916YSKImngWP64N9wpybWthen4aRRWcDq6F5uwzbq
         40W4BwoFePUU+dqrcm0Mgzfp6SIY8v9j7ycbFLRD0BpZ59KTsJfnn0YDc6VsvmUauhYZ
         2CT8tri78dAvlREg8kQztpPKkcG5br5Ut+hHbBv6Lpk1P+cd1D8pbVKknPz6C3PIXDNT
         HTUg==
X-Gm-Message-State: AOJu0YwYskm7iv4uWLmD5I0KHhE8KIVIdm65tO+H5RmruE/GYbZca6N8
	sIkhn0DOQl8LY9VT+0aobzaN1KjPDM1mqfQAwTCrRM0cHYPW2vPYtDnr/A+S2XX68f+GqOH88Gz
	PADsT1zxTIMuRzuggElhjo8xt2X5I4dDNYghLU7FpxJ1G2ENGX2fi0Z014T96jP0NHI93jokA
X-Gm-Gg: AfdE7ckvs6FzaKY0232kX7qusHh+JKQRwhriiTUc307vQyUfXRTLCrLCb0Y5E5KF4aJ
	COVn5uzyFeuZ5+EBQQ+4kJbsWoMitAwisSdl+fUaqDNtPX4h4m3Ggee9uhn/zeZ7Ob06V2xNKd7
	2KRYSObTKRYV8sh7p52B14TVWaMumQi4EU3Pfuq1qqwDtpCa9YgQ0ICBMYyZkhGZ155J5fHhKCM
	m3Sy2JLPubITZy+BtYntPdmQUge4uflREk9rNPTdc9ouaU2InWCY6feyutTM9n97Wi/nyW1iHVy
	c1NI8U63LM4wAmkCBf3mzxzNXBp6Y08AL+xN5QP/SMSpsjtsYHnxul9ZVNwqaRPOpgql2427Oa/
	9FMYcOKLHZCWB3hdQRPdK2f2wp4ExaB1yTdAf2iGysPZjNF6qsIE980gD4btRUJBcsyda9kpihZ
	0wnwS+t8V84ldGAI+13+qkEjSszLpeuwj4qg==
X-Received: by 2002:a05:7301:5789:b0:2ed:e14:42e9 with SMTP id 5a478bee46e88-30c84e0f0c1mr5869381eec.34.1782463415680;
        Fri, 26 Jun 2026 01:43:35 -0700 (PDT)
X-Received: by 2002:a05:7301:5789:b0:2ed:e14:42e9 with SMTP id 5a478bee46e88-30c84e0f0c1mr5869358eec.34.1782463415114;
        Fri, 26 Jun 2026 01:43:35 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca208sm16444583eec.3.2026.06.26.01.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:43:34 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next v3] wifi: ath12k: add QMI capability negotiation for dynamic memory mode
Date: Fri, 26 Jun 2026 14:13:27 +0530
Message-Id: <20260626084327.2022076-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA2OSBTYWx0ZWRfX5Y/fxu26GWmm
 FmI9/468acwEeI9QjnFoF0bfmR/T0bsql62v9mbH51J87TvB+jH2xz5TnHLtFx3E3DtCeNgZVHT
 +acQyODS9p69mLDNdJd0kq8Rvdkg/jqBb2oQJ0WkLJ9nMvyYRWSDLPj4TIluHsNSDsz6zEL26h5
 adQr6Mi7EjxJzf0FPEAB+kXwsYHd2RHpSo7g4Jes2D52yyNeSyJLTp5tk+5Dhs/hR8u8lv5tSNg
 0de0oAO6osyratWxUzTviCKvniWISoGgZbAAPERp2Gri1kIxJN7GGuXUsCfy5rlouXInZUujSov
 2GWeNX7O9FKF/dsFjRCrckbEIPc+9fk4OTVSq8seGZ64MEzgbPNt6kJdXt1eJhATnjVhSLPhoRw
 ooh4dxV2APXSHsL3beLgRjKmOH7kwjUx57Casy1r6unmfWKfXhDVIve4NizEp5s7ifvAO1271v4
 +mPuUTS6yM5KJCQ1Blw==
X-Proofpoint-ORIG-GUID: 5tXquwRdwgwlAXI6IYZey032hkuD7Hh-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA2OSBTYWx0ZWRfXxka8zdhH+vnh
 OleLCrtoJ1TK0mM6cmK3MfF+SbXcrcbjgDyEtY1N/UPYkhmjnhaS072XC+5q5DwjWFKuwmhH2Vy
 TqXnplWYdyDHJRCQaLlwnrkQ6qZcxRQ=
X-Proofpoint-GUID: 5tXquwRdwgwlAXI6IYZey032hkuD7Hh-
X-Authority-Analysis: v=2.4 cv=MLpQXsZl c=1 sm=1 tr=0 ts=6a3e3bb8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=m9xaxUC3f_2y1K4foloA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_014338_360563_98947D31 
X-CRM114-Status: GOOD (  18.65  )
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
v3:
  -Restored QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN change.
v2:
  -Dropped QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN and QMI_WLANFW_PHY_CAP_RESP_MSG_V01_MAX_LEN changes.
  -Used %u instead of %d in the debug log.
---
 drivers/net/wireless/ath/ath12k/qmi.c | 50 +++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/qmi.h |  8 +++--
 2 files changed, 53 insertions(+), 5 deletions(-)

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
index 2a63e214eb42..9bdb290e2cce 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -156,9 +156,10 @@ struct ath12k_qmi {
 	struct m3_mem_region aux_uc_mem;
 	unsigned int service_ins_id;
 	struct dev_mem_info dev_mem[ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01];
+	u8 dynamic_ddr_support;
 };
 
-#define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN		261
+#define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN		265
 #define QMI_WLANFW_HOST_CAP_REQ_V01			0x0034
 #define QMI_WLANFW_HOST_CAP_RESP_MSG_V01_MAX_LEN	7
 #define QMI_WLFW_HOST_CAP_RESP_V01			0x0034
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

base-commit: 1547a99cd8d8c1ab3e04dbd92b72b3b5f7cb85a9
-- 
2.34.1


