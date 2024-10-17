Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3BBD2F7E2
	for <ath12k@archiver.kernel.org>; Thu, 17 Oct 2024 03:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dv31Dft1u9+cntKlhDh62mu6SyaHorgNbrWTeE1nTUE=; b=LvyFUCkocZ5sUFZ4zudRoTGAiN
	keD0gD03G9ww8JdrY+1LebiL28rqYj5HusQGUrEl7ybf8iWBs4gXH8xdKkHdzOQklZf3h6h2CjU2W
	59g/JZdxtyehkks11YcrrtWKBnkv6VTkQ6CesLVEpD0KMy33QBYrVG8U17bEMSri79OENHCqulIZE
	R2R+sTihf0fy3mdKdjKoLJ9MAbmOBvABv/oCxDM2BshuPvVG2dHkwZzFlwadZ8lFAhZYx5tCxWrZD
	4S7oCZhnS0qIF4fxjkzWFVVIuKNPsVaEm2MLfLEP+QUWqThkJJDWp0ENYgETscKEk9rnFf3rs7B58
	+/1pCdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1GvP-0000000DdJz-3naK
	for ath12k@archiver.kernel.org;
	Thu, 17 Oct 2024 03:11:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1GvL-0000000DdHE-38tU
	for ath12k@lists.infradead.org;
	Thu, 17 Oct 2024 03:11:41 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFopJs002357;
	Thu, 17 Oct 2024 03:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dv31Dft1u9+cntKlhDh62mu6SyaHorgNbrWTeE1nTUE=; b=bPZD30UCWx4g2/GR
	/LTJUccevG9z+hWmSDIVKa9yybMC5V/+2DOMPXETE2dY7nkyckVGfjWaBryxZxlS
	Ux8dLgH1Xu6FnYfiUG0BjqtJXd+AhhiuL8vbUXlQB7zC1qs58jgtLc5FjzxYo4bP
	M6gT7AgwrZBWgs35WTiVpg3FYD9A4HaHW5eSEqSTYN6btdUQbX2hH5iSVaP1NNN8
	yxSXrqjtEN0B7I8fCn4vDn4/RMnHCet+N+ZulRiYIFZg6PndoPaCmcFXc+TOJ1Ao
	9aOSk7HLOo8r83uhoZFen75j9KM/fMlKsEEl8RFD/uJt/wQXQGCwVp+jN+6q6Jf9
	/XHIZA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a5xykkt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 03:11:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H3Bcku030707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 03:11:38 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 20:11:37 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v4 10/11] wifi: ath12k: fix A-MSDU indication in monitor mode
Date: Thu, 17 Oct 2024 11:10:55 +0800
Message-ID: <20241017031056.1714-11-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20241017031056.1714-1-quic_kangyang@quicinc.com>
References: <20241017031056.1714-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PWullOR_7GzzJWwBd5CKw6FT6Xbv1aB3
X-Proofpoint-ORIG-GUID: PWullOR_7GzzJWwBd5CKw6FT6Xbv1aB3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=951 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_201139_829675_D3F27A19 
X-CRM114-Status: GOOD (  12.49  )
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

In monitor mode, host will reap MSDUs and then the MSDUs with same PPDU
ID will be aggregated into an A-MSDU in ath12k_dp_mon_rx_merg_msdus().

However, ath12k_dp_mon_rx_merg_msdus() doesn't calculate the total
length of the A-MSDU. This causes Wireshark to display the A-MSDU
incorrectly.

Therefore, need to add calculation of the A-MSDU length.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 42181652bfd9..bf50c90f4c40 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -873,11 +873,11 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar, u32 mac_id,
 			    struct ieee80211_rx_status *rxs, bool *fcs_err)
 {
 	struct ath12k_base *ab = ar->ab;
-	struct sk_buff *msdu, *mpdu_buf, *prev_buf;
+	struct sk_buff *msdu, *mpdu_buf, *prev_buf, *head_frag_list;
 	struct hal_rx_desc *rx_desc, *tail_rx_desc;
 	u8 *hdr_desc, *dest, decap_format;
 	struct ieee80211_hdr_3addr *wh;
-	u32 err_bitmap;
+	u32 err_bitmap, frag_list_sum_len = 0;
 
 	mpdu_buf = NULL;
 
@@ -900,10 +900,15 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar, u32 mac_id,
 
 		prev_buf = head_msdu;
 		msdu = head_msdu->next;
+		head_frag_list = NULL;
 
 		while (msdu) {
 			ath12k_dp_mon_rx_msdus_set_payload(ar, msdu, tail_msdu);
 
+			if (!head_frag_list)
+				head_frag_list = msdu;
+
+			frag_list_sum_len += msdu->len;
 			prev_buf = msdu;
 			msdu = msdu->next;
 		}
@@ -911,6 +916,12 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar, u32 mac_id,
 		prev_buf->next = NULL;
 
 		skb_trim(prev_buf, prev_buf->len - HAL_RX_FCS_LEN);
+		if (head_frag_list) {
+			skb_shinfo(head_msdu)->frag_list = head_frag_list;
+			head_msdu->data_len = frag_list_sum_len;
+			head_msdu->len += head_msdu->data_len;
+			head_msdu->next = NULL;
+		}
 	} else if (decap_format == DP_RX_DECAP_TYPE_NATIVE_WIFI) {
 		u8 qos_pkt = 0;
 
-- 
2.34.1


