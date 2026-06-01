Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FF7CD5BD1
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 03:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qd1Ud/gLx8tjIkNIoBuyPO176UGs+/dpZBkWv6jkelA=; b=rZiniI6nKnuHuXa5iQOSDFAtnt
	pXU59SkSu0VXtq0h+FdqZxItZDgXH+gfX6Fuy+Mls53/09WbeSh2hXHoyPKSsa2BjiAmt3Ma+ZLk9
	4/ml4R0CwQqKOhdceUElxshpakXkX4JHZowixd4oxyTbW7L8SSF0rmgymDo0djRUcnMhn2XoJqVHQ
	js4rcdgzOa6BmUs2VWH5sJ+ZDRBOtgd0p2VMaFI0E7RlBNE7F7rbzTgmvvtiVOFstBzArHK8d/yaV
	shm9b8kKPyUeFkd9lGXIOoVjHgB8I1KM+V4vOVUd5IgvTpF3wi1SK9ZbUM320VrI5sPxPAVs5UgZs
	DjsuhV+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTtBH-0000000A5G4-3z7v;
	Mon, 01 Jun 2026 03:19:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTtBF-0000000A5Fg-1ZKs
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 03:19:10 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6511Iadx717597
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 03:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qd1Ud/gLx8tjIkNIoBuyPO176UGs+/dpZBk
	Wv6jkelA=; b=eZxvDY/aWKCBPnmZzLYqEsPcB9e60TUrCWZA8l/IRNete0yZxOv
	BSuwgzK4GAQMourFDUUPjpS5goVNr2fn9EyuVR8GYR/qQ8LZBMForuUfHgT81kOd
	Xq0/W1FsKU7HhLQeC61cdl2Za2CcMha5RF0onZqmrQxB5R6g/rs4/fzm71TfwBF+
	3p36GiPiZapugDc/qupFQPlmrMOnZbMme/Gxq1z6VwPvCu4WYk89GhMIvCs6/sCt
	T/75UeSWY/HFchymWmc4CetAOXxVYPyA7Y6Q/O3KlOrdZz1dEEJj/Iky7BYq5PaW
	4KuLmE9QHqa7Y0NcVtr1dI4/6pSMXcbYMLQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr98dbw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 03:19:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c3315d31so9547375ad.3
        for <ath12k@lists.infradead.org>; Sun, 31 May 2026 20:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780283946; x=1780888746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qd1Ud/gLx8tjIkNIoBuyPO176UGs+/dpZBkWv6jkelA=;
        b=EybqMlvMW4aqnSdG5dXapqF00nYAWSn7HTnqshMtIgQaZgGChjQ1AUKEWw9KzNmXkh
         Gx2Q54uo1cyMoqRIS86ASqbIvoFgwMi2s2EJtGo3DfORuWVaWxSI1BSfTJKaeMwyI9BX
         YsbpCwdzbLY+wkwO0luvoEr1j8m9ZdBude1TuhyKs37Nt/3PqUS8wQW/qeTgUrRpPIa8
         FoLdNSDdPNFS6N3snqfwQLiqHdjE2K7JJjQ0den59OLtWT8ITBuZ1QtIAsaUNpwqCrQF
         z+I/204XHO6N2iFvaatZvDbpd/+W+JxFYS/w3c1sVeLxCdgkUqCohWbLOhXxsLopv9yc
         +XEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780283946; x=1780888746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qd1Ud/gLx8tjIkNIoBuyPO176UGs+/dpZBkWv6jkelA=;
        b=Be1+Dgh0qjE2E0ifY7P5nt6rG3MqDtjzLmLtMpExASYrA7aKJuCVhhpwrS3rhEEEo3
         qNidoq9TtmVdGxp9sQ46pwlvwVgBioKdpUralMvWvvhrp2MCTP7z7jqODVsGj2f9Xlj5
         c0Q3CQbGbD5Ti0JQwvWQ73cl2G0ZqTAQ7Ibdwh8SuxjL0F/L0zHzZYK8UnbVCjSW6h4r
         gYS5qj9UVWXpH753aA+22ai/COZbNXpovZEh56sBpsoCcDkLyjl3zqgRQdgNODexDLl2
         D78iZhLY9XO+/l/37+JwdYjxZE4YSOdwjGKJn1Dwot3QmQyyyK9t5RP4aTkO1KkHzOQz
         9g4g==
X-Gm-Message-State: AOJu0Yw8QYGPxSXUYPn3xdE2gkxT2rZyPKJgVaq7l5kH1lW66WirrE9K
	lBXwrsi53X5IxOYKzE9Fn1ARKpJL2RQ1Pe86S5ZvpisANryqBbT8lbXcZ0SdjoWD7AX0BjkmOEa
	NMLQydfq4zC6aeyK3GguNTwXUk5qZdCDggrVxgm13Xq2hH3hNAuvevr4VMvP6vdJOGxgHSuo1
X-Gm-Gg: Acq92OFIS3r2VDlnjF/kmXE78Mf3+nFfzK/KLnE+FGs3XakkLn/lTyvvvI6HVJfxLp8
	XsjSJX4N8kNe1O/jNc/3cCQbopf2zVvjHiuOynIWBx1xTTsJAOJVdmaM9Hau68vFo/pzTijlAfK
	kOw6epUjNGjIXxcchhFRtRfNJBleuCmExwwmu4Y/491y+w6a8DR2ItNXh3msmCBj8T74TYok1TR
	lUjOswjyhlps05OBuOg91FoLe8HrMeSh1sbZXPU4iE8dB881jH4/4LnPmJyFecYaQqmtcjLHPym
	yiSojtk10pxq2tPayf2MdVamkRfgOCsEIykbKWhEcMYl70YKjfvVKFPRNEb/pJTit85/epBAMMU
	E1WU8QlZchXQjUhF1I0W4Hgcisi3F5QwfTPVwndDLt7F+kU/DCMBqBM51ymSUVnD6Tlp3oeXWau
	96ZU25eZ8+NOXfqIPEnClSwQ98lkjTov/3HACtioMOl722XkPfW0qfrSI=
X-Received: by 2002:a17:903:986:b0:2bd:2de3:519a with SMTP id d9443c01a7336-2bf367939b7mr92783625ad.7.1780283946035;
        Sun, 31 May 2026 20:19:06 -0700 (PDT)
X-Received: by 2002:a17:903:986:b0:2bd:2de3:519a with SMTP id d9443c01a7336-2bf367939b7mr92783215ad.7.1780283945486;
        Sun, 31 May 2026 20:19:05 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd6desm88336815ad.24.2026.05.31.20.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 20:19:05 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: add QMI capability negotiation for dynamic memory mode
Date: Mon,  1 Jun 2026 08:48:50 +0530
Message-Id: <20260601031850.3715354-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1cfa2b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=FGVNU_2SYgeZMn_85CMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 6PgZt5iXqanxj_FlyoxMGclaomi1C2CN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAzMSBTYWx0ZWRfX2MjOSBnj+6hh
 XZjBJOBiFtLl7rC+dWde9GpL8xG1HyS68S+DpGY0OddeylmcMcg4sZrcH/4mE93f3mrCwY0/MDo
 h7+T3Lde/xjQJR0psZOv/GptFNHHgW9K4XO6K0ARYxXKdtntM1zwOkqH4VW99d/oEViWPfJbvI8
 5RgM2DQNtQgQsZURvrrwpV57AlRpM++57nEFOE/5Yht7Up266uw/tvN+QagGxtRlEvt/ms1T3Ty
 YkFXMuqIhh4YStDl3GbwOhQdIH5iXFTbUSkuGn944x7x26r4g9nl6b3LaBL6nrYeRMzHJAukXyv
 m1yP2vQJKL2rfEks0YxevcIa7hOAi8uQ33oJkIfYIINRiY3s3GjNY9D4rz/i7H8+184Ch9M+S8A
 GSK/dSqFKS/5q+upqYZhpwMvntkDllPTyseYgvQBfz4aUijKz1x81FZM83s8zBmgAdWhJv7QNFE
 FRJLkyzyhT76qBpgc3A==
X-Proofpoint-ORIG-GUID: 6PgZt5iXqanxj_FlyoxMGclaomi1C2CN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_201909_553675_8974A516 
X-CRM114-Status: GOOD (  19.89  )
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

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 50 +++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/qmi.h | 10 ++++--
 2 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index fd762b5d7bb5..85406d6e6da1 100644
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
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type     = NO_ARRAY,
+		.tlv_type       = 0x17,
+		.offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
+					   dynamic_ddr_support_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_1_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type     = NO_ARRAY,
+		.tlv_type       = 0x17,
+		.offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
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
+		   "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d dynamic_ddr_valid %d dynamic_ddr_support %d\n",
 		   resp.single_chip_mlo_support_valid, resp.single_chip_mlo_support,
-		   resp.num_phy_valid, resp.num_phy,
-		   resp.board_id_valid, resp.board_id);
+		   resp.num_phy_valid, resp.num_phy, resp.board_id_valid, resp.board_id,
+		   resp.dynamic_ddr_support_valid, resp.dynamic_ddr_support);
 
 	return;
 
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 2a63e214eb42..dbde76e5a78d 100644
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
@@ -267,7 +269,7 @@ struct qmi_wlanfw_host_cap_resp_msg_v01 {
 
 #define QMI_WLANFW_PHY_CAP_REQ_MSG_V01_MAX_LEN		0
 #define QMI_WLANFW_PHY_CAP_REQ_V01			0x0057
-#define QMI_WLANFW_PHY_CAP_RESP_MSG_V01_MAX_LEN		18
+#define QMI_WLANFW_PHY_CAP_RESP_MSG_V01_MAX_LEN		22
 #define QMI_WLANFW_PHY_CAP_RESP_V01			0x0057
 
 struct qmi_wlanfw_phy_cap_req_msg_v01 {
@@ -281,6 +283,8 @@ struct qmi_wlanfw_phy_cap_resp_msg_v01 {
 	u32 board_id;
 	u8 single_chip_mlo_support_valid;
 	u8 single_chip_mlo_support;
+	u8 dynamic_ddr_support_valid;
+	u8 dynamic_ddr_support;
 };
 
 #define QMI_WLANFW_IND_REGISTER_REQ_MSG_V01_MAX_LEN		54

base-commit: e6b476e4ea19919b4c06ba2f5504258ab5d5d9aa
-- 
2.34.1


