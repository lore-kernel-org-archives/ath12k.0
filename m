Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C04E7718D
	for <ath12k@archiver.kernel.org>; Tue, 24 Dec 2024 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woPoc25xzCoyxWUhxzIknoBHAl3zc8AO1jYiVTGjUzI=; b=nB6GCcU7w7JO8V9Y4P1vzn9n5u
	ctU8/GTJ53sQflqfckE3FGCWe6COLFcaNlFDb9WJ///GWNpeXW5FathrFomyLKl+kkG2tjWN7fw6X
	/sM9uO3eoT62aQiyghyRGQzNe70joweUTOjqCYHCFBo68Ni8gOvFHmfv/KU/Oi2UcEqT7OCD3wGcq
	PAAPSRhPo3OUOiaRt/XdRil24OG9LDNwd1QzXR8CwXVGLajB8O17P2ThGQbuBm5O7ayGdU4drSW61
	K7l3XMs7QZJz73I+7EwiaAOYOo2wtTeN6qJUfPFBII7xQ7vfQcblXlQVffim84Io06Hxa0g+z4QnI
	gD38emhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ7Z3-0000000CHV5-34fF
	for ath12k@archiver.kernel.org;
	Tue, 24 Dec 2024 16:15:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ7Z1-0000000CHT3-0fCI
	for ath12k@lists.infradead.org;
	Tue, 24 Dec 2024 16:15:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BODt00w024977;
	Tue, 24 Dec 2024 16:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	woPoc25xzCoyxWUhxzIknoBHAl3zc8AO1jYiVTGjUzI=; b=hJJPWFwOYkJYye4l
	VvCkoZ2ua/WILkpgwtmCq5Rnw0zXV7JjxmE1n3QCd+2yd8Yqo3t8vjyYMp4HNArl
	JpbRAuhc6upYC2VmyP0XoyfCc1fVJ8Oy2kNoaTw4yC1nk/M/7fIzVZLMn+8VVJw6
	z/bp7zloK8AsZc12xn9vVNDjpIMWgyK1+6mAl3Is34VSf213J9BEYIoxIcVgdqme
	2DNxe70gTQTXpDfalwlRrUs8qH9hRZ58RqrbNJGfscCx+sKkt/hkig7Zucn0k33p
	YXqAKS5V5gD6pLp2YuYkx/GriZ6nXJssgciDQ0JFRljNhMy/UiO4wHiDhTnXfmBQ
	iXWomw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qwm18nrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 16:15:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BOGFIKK015116
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 16:15:18 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Dec 2024 08:15:16 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH v2 09/10] wifi: ath12k: Add EHT rate statistics support
Date: Tue, 24 Dec 2024 21:44:41 +0530
Message-ID: <20241224161442.263729-10-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241224161442.263729-1-quic_periyasa@quicinc.com>
References: <20241224161442.263729-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oyLUfULZ_hm9D9sYiD6sMBoOF9wwRxb1
X-Proofpoint-ORIG-GUID: oyLUfULZ_hm9D9sYiD6sMBoOF9wwRxb1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=932
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_081519_199784_7898E2C7 
X-CRM114-Status: GOOD (  12.22  )
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

Currently, EHT rate information is not populated. Therefore, populate the
EHT rate information from the status TLV data in the monitor Rx path. In
the future, this information will be used in the peer extended Rx
statistics dump.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h    |  1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c   | 15 +++++++++++++++
 drivers/net/wireless/ath/ath12k/rx_desc.h |  2 ++
 3 files changed, 18 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 96510ead55c6..5b4ac0568a00 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -85,6 +85,7 @@ enum wme_ac {
 #define ATH12K_HT_MCS_MAX	7
 #define ATH12K_VHT_MCS_MAX	9
 #define ATH12K_HE_MCS_MAX	11
+#define ATH12K_EHT_MCS_MAX	15
 
 enum ath12k_crypt_mode {
 	/* Only use hardware crypto engine */
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 5c5a3aae393b..689a011439f8 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2392,6 +2392,21 @@ static void ath12k_dp_rx_h_rate(struct ath12k *ar, struct hal_rx_desc *rx_desc,
 		rx_status->he_gi = ath12k_he_gi_to_nl80211_he_gi(sgi);
 		rx_status->bw = ath12k_mac_bw_to_mac80211_bw(bw);
 		break;
+	case RX_MSDU_START_PKT_TYPE_11BE:
+		rx_status->rate_idx = rate_mcs;
+		if (rate_mcs > ATH12K_EHT_MCS_MAX) {
+			ath12k_warn(ar->ab,
+				    "Received with invalid mcs in EHT mode %d\n",
+				    rate_mcs);
+			break;
+		}
+		rx_status->encoding = RX_ENC_EHT;
+		rx_status->nss = nss;
+		rx_status->he_gi = ath12k_he_gi_to_nl80211_he_gi(sgi);
+		rx_status->bw = ath12k_mac_bw_to_mac80211_bw(bw);
+		break;
+	default:
+		break;
 	}
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/rx_desc.h b/drivers/net/wireless/ath/ath12k/rx_desc.h
index bfd554b55ca1..863481f367a4 100644
--- a/drivers/net/wireless/ath/ath12k/rx_desc.h
+++ b/drivers/net/wireless/ath/ath12k/rx_desc.h
@@ -637,6 +637,8 @@ enum rx_msdu_start_pkt_type {
 	RX_MSDU_START_PKT_TYPE_11N,
 	RX_MSDU_START_PKT_TYPE_11AC,
 	RX_MSDU_START_PKT_TYPE_11AX,
+	RX_MSDU_START_PKT_TYPE_11BA,
+	RX_MSDU_START_PKT_TYPE_11BE,
 };
 
 enum rx_msdu_start_sgi {
-- 
2.34.1


