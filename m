Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777D4C369D3
	for <ath12k@archiver.kernel.org>; Mon, 21 Apr 2025 02:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gesON2CEg60SDvlicUFLEupsU8yrVPsf/z621XhBNZM=; b=WRXERsOwr8KrAcBQe9H9nXsv1E
	ncHVGqAf0epcnz2p8G5dGAUZXjNDhG8PgCHXtauXzucr9wPjwRuLH63kRVc6ht8PzzLsZGTTTz+3s
	yBHYX95sadbtoGAR3B2YwiHt6eXKwIvA4umkMAoIOWfXa/tECPgFY2L4RUJlln9XDhf55xV1yHu11
	Ew4dFrUrWoOIwnecu1wNz+5hmAvUA6bVFLLzY5/nnvNX0bZNA4aZcYerlRooFXqNukLiQEbISzccU
	jj2d6jV6SQzkAgInubMAtnaq94ua/6jR+ByTVg1GguZAXRIkweQnLOuvYu/asifRWVuZ9JdDuGAY0
	5Qng0/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0Z-00000003SDx-115S;
	Mon, 21 Apr 2025 02:35:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0V-00000003SAx-3iTn
	for ath12k@lists.infradead.org;
	Mon, 21 Apr 2025 02:35:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KNGOcB029441
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gesON2CEg60
	SDvlicUFLEupsU8yrVPsf/z621XhBNZM=; b=U1ihZKE4MmcJ8hgojGukEruQOAH
	SHwvWSAQGyyu6+ccskEz+u7I4Cni7IH2rEhV8Gcp9QfeAeC1lGnNe+k7KPxw+XP9
	VHDgfDD7v0AIG8MsSBN9WZnnTHjCcXo46b+iNGrsCc6lM7EhjZOEe/ckrOeofqbW
	ZM0pOCCOE6X7zsKQal3o668Uwgc5MR2UfwG5F9B3/xBfZw25wS7HnT7NYaW6hKj/
	/mDtXSJDCXMBJinsy09j4W+ZPF2YOSOCTgTgHoV5JJPcOcdYytSawg1QB+WDFr5i
	N1UWYvFmO4zBcvpZSm/OpEc9CTAlUWiWghkNcUBTP6HTue7UZ1rfj+V2Fxg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642svau30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b06b29fee16so3741617a12.0
        for <ath12k@lists.infradead.org>; Sun, 20 Apr 2025 19:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745202938; x=1745807738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gesON2CEg60SDvlicUFLEupsU8yrVPsf/z621XhBNZM=;
        b=Ky0BltmJIY1YyzmMjyLAnqru9Ta1uQcN97DSrdcE0BZkvVhS8GHbR/YelVaCMvfj2q
         ge6jQSlyP5iD677Ii31or1hPpeIL4fWXiH8ULNmou4PzM2I43aoGwaNzlXt0XjCa7GPO
         rqczAZEJau/mnc33nGL4mrKdJlNfhPga9sDUC/zKZQzVXqdIrTHEe39/1P9ZBmRdBVSp
         0qZWIcFGtv1ncVaBPwv9EPgdeKlvz3xgO13JP5aPbKIauhLVHcU80tuv7CqXVrLlpDDc
         Nh5su8L8648dTKKHNnknUsgU5kZnTnH+7GXhEmtm3GmcSzN6ugy7a9bIKBTwIbSELs/E
         sVEA==
X-Gm-Message-State: AOJu0Yx2/TzEYJXMJBlzcjG5vvHxuF5eEZyzrgot3a2gM+0ugzdhUIUr
	VGrfKx77XDtA0x349a5dYnjbypwovo0uP+xDmVjf4TlRexslDAilOafAkPr+rrOwqzjAPDm0llk
	+fEtl2tr21hxnU87BnQKQPxNK8Ap0+nMCUc40a/GxKnkLTd6CWOZaH8YcUHH96LdkQ4a3t+Q=
X-Gm-Gg: ASbGncv/tYVvP4itU9FOxieWKamvbVA1xmC8oiA9jLXrngUwxLWalk5f9X5NcHrcwJC
	B3FjNmjEZHyTknCmweBFCd88M3bx/yUHecyX/UxHtnKUxkX9AmTaJhHGy/dF7VHjN44nnd3Bd+7
	FhVSvMGS5wTyPHj7M18uXixuUodZBZn5BgzxB5qWMJ7m8iTvzqht9Fzlsw/oUztDJ/RD0sqr2mM
	BPvYCgZovzSgqd7uTCufjSi+reMyGA/BdVssb/7oiW+RY8BKOp//y2HnoW2V8c3ukqmVbjs/6HZ
	5ZVQYQTtnGF7KLIR6E33+Zwz5axD4pP0ACUQ/bAtuLnfy3YPIHIGUseg7Lj1SkK1x4bzHYNgCrd
	lKfz1nDwpEIc=
X-Received: by 2002:a17:902:d546:b0:227:e74a:a057 with SMTP id d9443c01a7336-22c53631d76mr157868495ad.44.1745202938310;
        Sun, 20 Apr 2025 19:35:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQrbfsrPTpnu5PWwGEpRYv0c+vIVsT++xkokknPcxMUq0vFPisysy1eBQlP3GsCCga9SrssQ==
X-Received: by 2002:a17:902:d546:b0:227:e74a:a057 with SMTP id d9443c01a7336-22c53631d76mr157868195ad.44.1745202937884;
        Sun, 20 Apr 2025 19:35:37 -0700 (PDT)
Received: from kangyang.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4287sm54631685ad.130.2025.04.20.19.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 19:35:37 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 12/13] wifi: ath12k: use different packet offset for WCN7850
Date: Mon, 21 Apr 2025 10:34:43 +0800
Message-Id: <20250421023444.1778-13-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
References: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jusY-KQtAMo2wDbxiNP6IvwFvfTs5O5h
X-Proofpoint-ORIG-GUID: jusY-KQtAMo2wDbxiNP6IvwFvfTs5O5h
X-Authority-Analysis: v=2.4 cv=QLJoRhLL c=1 sm=1 tr=0 ts=6805aefb cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=QblmAMADz5KIc7vKYBUA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 mlxlogscore=839 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_193539_929177_A4281E48 
X-CRM114-Status: GOOD (  14.77  )
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

In ath12k_dp_mon_rx_merg_msdus(), will set packet offset to 8. This is a
right value for QCN9274.

But WCN7850 use different hardware rings for monitor mode because it
doesn't have RX MON component. So the packet offset is different. With
current offset, upper-layer application will failed to parse the payload
correctly.

Should use different value for those who don't have RX MON component.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 29 ++++++++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 7e0dc4d0327c..28cadc4167f7 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1948,6 +1948,24 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
 	}
 }
 
+static void ath12k_dp_mon_rx_msdus_set_payload(struct ath12k *ar,
+					       struct sk_buff *head_msdu,
+					       struct sk_buff *tail_msdu)
+{
+	u32 rx_pkt_offset, l2_hdr_offset, total_offset;
+
+	rx_pkt_offset = ar->ab->hal.hal_desc_sz;
+	l2_hdr_offset =
+		ath12k_dp_rx_h_l3pad(ar->ab, (struct hal_rx_desc *)tail_msdu->data);
+
+	if (ar->ab->hw_params->rxdma1_enable)
+		total_offset = ATH12K_MON_RX_PKT_OFFSET;
+	else
+		total_offset = rx_pkt_offset + l2_hdr_offset;
+
+	skb_pull(head_msdu, total_offset);
+}
+
 static struct sk_buff *
 ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar,
 			    struct dp_mon_mpdu *mon_mpdu,
@@ -1956,7 +1974,7 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar,
 {
 	struct ath12k_base *ab = ar->ab;
 	struct sk_buff *msdu, *mpdu_buf, *prev_buf, *head_frag_list;
-	struct sk_buff *head_msdu;
+	struct sk_buff *head_msdu, *tail_msdu;
 	struct hal_rx_desc *rx_desc;
 	u8 *hdr_desc, *dest, decap_format = mon_mpdu->decap_format;
 	struct ieee80211_hdr_3addr *wh;
@@ -1966,8 +1984,9 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar,
 
 	mpdu_buf = NULL;
 	head_msdu = mon_mpdu->head;
+	tail_msdu = mon_mpdu->tail;
 
-	if (!head_msdu)
+	if (!head_msdu || !tail_msdu)
 		goto err_merge_fail;
 
 	ath12k_dp_mon_fill_rx_stats_info(ar, ppdu_info, rxs);
@@ -1995,14 +2014,14 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar,
 	ath12k_dp_mon_fill_rx_rate(ar, ppdu_info, rxs);
 
 	if (decap_format == DP_RX_DECAP_TYPE_RAW) {
-		skb_pull(head_msdu, ATH12K_MON_RX_PKT_OFFSET);
+		ath12k_dp_mon_rx_msdus_set_payload(ar, head_msdu, tail_msdu);
 
 		prev_buf = head_msdu;
 		msdu = head_msdu->next;
 		head_frag_list = NULL;
 
 		while (msdu) {
-			skb_pull(msdu, ATH12K_MON_RX_PKT_OFFSET);
+			ath12k_dp_mon_rx_msdus_set_payload(ar, head_msdu, tail_msdu);
 
 			if (!head_frag_list)
 				head_frag_list = msdu;
@@ -2037,7 +2056,7 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar,
 		msdu = head_msdu;
 
 		while (msdu) {
-			skb_pull(msdu, ATH12K_MON_RX_PKT_OFFSET);
+			ath12k_dp_mon_rx_msdus_set_payload(ar, head_msdu, tail_msdu);
 			if (qos_pkt) {
 				dest = skb_push(msdu, sizeof(__le16));
 				if (!dest)
-- 
2.34.1


