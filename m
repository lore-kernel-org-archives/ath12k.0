Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4A3C47DD3
	for <ath12k@archiver.kernel.org>; Mon, 22 Jan 2024 08:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwBrK9z4RbSk+oCwSWmJmRVPXHOrn8B/Aq6x7lYtMfE=; b=Ja3jfNMmXvzjYkS9ZKYnNBMll6
	/FeuXqrogltL2CX0noiQW9Vw+kQgcN1LJIWScHf3e6trbUqrKKeqLJEYJdYnUheKeEq6aYuirBcHO
	L5hwfGV8DIOq64VKcugWsSA567nQJQ2mX4fhxTQet25KOLR+FoYdtbXVXT4yqJ9DdIHNWBmrFP+wK
	6eeqYSWZefJ6/TPTs5vA4na0VA1RvVMi8cDndFePs0bmzF44kbsrhvD/cRWzbreLte5oMPjhw7Pta
	57nQ1nB6LQffO0ALzGPph0z3YhHeSMCRGmH5faduzsq8Mois0FgGTnbumvVH4hhsapILTfR0p8+n2
	pSbrFWcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRq4Q-00B9QK-26
	for ath12k@archiver.kernel.org;
	Mon, 22 Jan 2024 08:54:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRq4K-00B9Nb-33
	for ath12k@lists.infradead.org;
	Mon, 22 Jan 2024 08:54:16 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40M4x6fQ020004;
	Mon, 22 Jan 2024 08:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=EwBrK9z4RbSk+oCwSWmJmRVPXHOrn8B/Aq6x7lYtMfE=; b=X4
	WnLI46GPltAbdse0OWfhl2AKO1MCXMroxSGtIf52jOYkR0ymO7j+kA0sI+Rt4yL+
	/WDD57MN2+DWTvJYx5yOEtMttRjRJyQs9ZU2JCYLdbpnFUwPti9/dMR8SJ0FKWgj
	ZTwA2mh5s8GOfBH01W1VaY06YqbFH0fJpSk7fiJxiGmyqgqk2RgnnHk8YEVYUj6W
	fAapmvjk4FqQyx7m04Dbnwd09WRglUid12PX5SSQSx+JJIECiw23OWg4sTYZrj9U
	s0PFH8iEPJ397DisKI2jq4pl0Hz7ncaNX5FgV4QaPZULhfI06H5Rz13a41iTBriN
	NFLUNDpugouoQWvYL2CQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vr54wuf6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 08:54:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40M8sBwY023489
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 08:54:11 GMT
Received: from lingbok-Latitude-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 22 Jan 2024 00:54:09 -0800
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v2 2/2] wifi: ath12k: add processing for TWT disable event
Date: Mon, 22 Jan 2024 03:53:36 -0500
Message-ID: <20240122085336.3985-3-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122085336.3985-1-quic_lingbok@quicinc.com>
References: <20240122085336.3985-1-quic_lingbok@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Pyg44WRuSS9GbVky_VbOxIxANsCorE8E
X-Proofpoint-GUID: Pyg44WRuSS9GbVky_VbOxIxANsCorE8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-21_04,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=827 clxscore=1015 suspectscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_005412_987017_5F8CDA72 
X-CRM114-Status: GOOD (  16.18  )
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

When ath12k send TWT disable command to firmware, firmware will return a
TWT disable event to ath12k. Through the analysis of TWT disable event
status, we can easily obtain the status of TWT disable command. It can be
more convenient to debug TWT.

This patch works with WCN7850 and QCN9274.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
---
v2:
1.Change the call way of ath12k_wmi_tlv_parse_alloc() based on
wifi: ath12k: refactor ath12k_wmi_tlv_parse_alloc()

 drivers/net/wireless/ath/ath12k/wmi.c | 35 ++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h |  5 ++++
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index e6276d92ea73..0ed1eaee1a75 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -164,6 +164,8 @@ static const struct ath12k_wmi_tlv_policy ath12k_wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_vdev_delete_resp_event) },
 	[WMI_TAG_TWT_ENABLE_COMPLETE_EVENT] = {
 		.min_len = sizeof(struct wmi_twt_enable_event) },
+	[WMI_TAG_TWT_DISABLE_COMPLETE_EVENT] = {
+		.min_len = sizeof(struct wmi_twt_disable_event) },
 };
 
 static __le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len)
@@ -6701,6 +6703,35 @@ static void ath12k_wmi_twt_enable_event(struct ath12k_base *ab,
 	kfree(tb);
 }
 
+static void ath12k_wmi_twt_disable_event(struct ath12k_base *ab,
+					 struct sk_buff *skb)
+{
+	const void **tb;
+	const struct wmi_twt_disable_event *ev;
+	int ret;
+
+	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	if (IS_ERR(tb)) {
+		ret = PTR_ERR(tb);
+		ath12k_warn(ab, "failed to parse wmi twt disable status event tlv: %d\n",
+			    ret);
+		return;
+	}
+
+	ev = tb[WMI_TAG_TWT_DISABLE_COMPLETE_EVENT];
+	if (!ev) {
+		ath12k_warn(ab, "failed to fetch twt disable wmi event\n");
+		goto exit;
+	}
+
+	ath12k_dbg(ab, ATH12K_DBG_MAC, "wmi twt disable event pdev id %d status %u\n",
+		   le32_to_cpu(ev->pdev_id),
+		   le32_to_cpu(ev->status));
+
+exit:
+	kfree(tb);
+}
+
 static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_cmd_hdr *cmd_hdr;
@@ -6799,10 +6830,12 @@ static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 	case WMI_TWT_ENABLE_EVENTID:
 		ath12k_wmi_twt_enable_event(ab, skb);
 		break;
+	case WMI_TWT_DISABLE_EVENTID:
+		ath12k_wmi_twt_disable_event(ab, skb);
+		break;
 	/* add Unsupported events here */
 	case WMI_TBTTOFFSET_EXT_UPDATE_EVENTID:
 	case WMI_PEER_OPER_MODE_CHANGE_EVENTID:
-	case WMI_TWT_DISABLE_EVENTID:
 	case WMI_PDEV_DMA_RING_CFG_RSP_EVENTID:
 		ath12k_dbg(ab, ATH12K_DBG_WMI,
 			   "ignoring unsupported event 0x%x\n", id);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 7570ef7be38d..d9e8b10a3c3c 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -4802,6 +4802,11 @@ struct wmi_twt_enable_event {
 	__le32 status;
 } __packed;
 
+struct wmi_twt_disable_event {
+	__le32 pdev_id;
+	__le32 status;
+} __packed;
+
 void ath12k_wmi_init_qcn9274(struct ath12k_base *ab,
 			     struct ath12k_wmi_resource_config_arg *config);
 void ath12k_wmi_init_wcn7850(struct ath12k_base *ab,
-- 
2.34.1


