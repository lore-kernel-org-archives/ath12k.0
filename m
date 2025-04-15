Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DBBC369AB
	for <ath12k@archiver.kernel.org>; Tue, 15 Apr 2025 18:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AnG8RaDQG0mNElO4Ji4G4ZEUY33FUuDgfLM344hdeNI=; b=P6UmlWgZg1/JWv4WtUciW41KzX
	JhvUwrVhMyhdqD6ej7FBXJFzwfhVB5JFhj9TCT40nuRttNKivSI1l0vq0629Em9VZWXFr65eUp/mt
	o8yOFzK6SV6O78h0XqjbFZshAWTpKEa1raTaVQqSibnSA3RrCiUO9hQfmgobEFTMd1z1cowp/rpmN
	kDv13nXwXUMZhvRy17/ovmFxavCrPNA5fo5HDXbiW5mrjXLaVmJ5+XCHaURq/FobHG1K+67kbdnyM
	R0M5dfAwJp7cf5kzrSWOh/wMbOSydWrZubvuc8GZieUvMGTtbtU9Lcd4n3ik1Z+EngNzja0PoPkpB
	2nEa7SIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lI4-00000006l97-0QLH;
	Tue, 15 Apr 2025 18:45:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lDb-00000006kQS-3OCg
	for ath12k@lists.infradead.org;
	Tue, 15 Apr 2025 18:41:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FIcCf7031767
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 18:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=AnG8RaDQG0mN
	ElO4Ji4G4ZEUY33FUuDgfLM344hdeNI=; b=SVhmLOP1vhhY6Lcg+Kv/pGGdiWDt
	aiVgLdzjELNxfIBgxFv1+DJIm+OjJMU/8XqOtQN62Hsmci8fN0eBm9FxRgZBaxtK
	PST7I/elv7mI2O8nM1VBlE6kppEUdhFZjIlgKR/OPLRUeYXepYNk/WTrUQjfAnc5
	sb+6zFWp3sd8n2uXm14wI7ccbxNlCiW5zVTMPLseoPyfy3j88J8V6c5krZAnrCUx
	1qJo2AfMfhEXNwN30JNJZSakr5m3hFRkO4QpwauZnEHoEMaa8FSzmUSYawQ71Bnk
	/rrBrsfNEhfVWNAiDFCK7wv+cvZQPGc4BplXgDjUCAhndKqMNzc+2q7BeA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1941q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 18:41:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-227e2faab6dso49466645ad.1
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 11:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742468; x=1745347268;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnG8RaDQG0mNElO4Ji4G4ZEUY33FUuDgfLM344hdeNI=;
        b=Nj7p4U0AgCpVlnF5awG7E42x/z/6l9TiKeZHleQJl+A9Ytuf89iGZzKtl6UzEwW+k5
         MYw0dBLpKnX2sQVu4pMx1tnzzK293hP21NT5JZMIYH2ANTOZdXKRUQB8n9LkCGXfNiLj
         R15U8N2gJ/d7RMWnvRHU8nLuhrhpdnQod22kLYnocljWjdw3qccgjwu+efHA4V4q+6/H
         ACblNGBoYZem8Wc5AZWdN5DYmLmfR67fPVCEJZ/zqr03yXOzlWrPmWa2dQ9gwoEr9+hq
         CwBhLxiRFeeDzejvRXB6TsK89UxjWaW62regkyCZdSqeR+8fwVJ3dL5zx7bD8ieOXL8B
         ARZw==
X-Gm-Message-State: AOJu0YyfrNe0zRuLVLkVIYuJVq0UhXACfYw8u/H+WpgiOPK5xvBMaQR0
	QifepSbgDfXDd3+AeYqceQzUPnwI96Cm7VahL59NhJmngJOam1p2dUA6fV28pN1i1bsE/rWAjMn
	zLOxM3g9eQ/2YfvZsAIgkO2+O68NQx3D2IoXttIILDrdlJTWJWPMF4a3w48r6HoOeKWgt
X-Gm-Gg: ASbGnctJoqfGAHUAXYzZx0vj8DCaFhlPh6bevEsIIQp+88MU6IMtkdl1OtWP5yju93N
	24khAn0GSk2YU8LK6CL3AU4ugxSV42ZTzziAlp7YpMKmMlOXjvpLX3NKB0O1goSRxIcwdrFiOqo
	OqaEwAVeYelrRtOLlS/5zf1YJBptlE6h7QkhSeSOv3HnXXJLcY8+OtouQkQ/ic3+wnwawOa1i5p
	fbsuiAR/oib6XLmuk7wSZOjZiK8/hjBRvngBPOw7NdeNuz1KjA5nOjpmU4rDeUGu6wQ3D/UDeux
	8z+jYMtk82laWmc4+EMz8xWyp9QXRecS0rAd15J0K11Q/ytKDQgfbD4z9qRsdeL4TsS1Dq/UL+D
	fvdnAwYNSXlwIpyi1GiRq60H0vkXVrzbeaXGrNPXrBXMZjg==
X-Received: by 2002:a17:902:e54b:b0:21f:85d0:828 with SMTP id d9443c01a7336-22c31abc38bmr2673065ad.41.1744742468488;
        Tue, 15 Apr 2025 11:41:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuYSe0Qgken9sfyrJV7IJYJtXKq4CQqbIoZJb7RCpQsz8F5cE1Y/xhyJlz7m0Nt+lSApbi0w==
X-Received: by 2002:a17:902:e54b:b0:21f:85d0:828 with SMTP id d9443c01a7336-22c31abc38bmr2672745ad.41.1744742468109;
        Tue, 15 Apr 2025 11:41:08 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b6284dsm121760265ad.38.2025.04.15.11.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:41:07 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Fix the QoS control field offset to build QoS header
Date: Wed, 16 Apr 2025 00:11:02 +0530
Message-Id: <20250415184102.2707300-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fea846 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=jThI9XsKaXDONeLtTJQA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: aoCfhxsotns9Dw4CazzOPf2FYWpGSfzq
X-Proofpoint-ORIG-GUID: aoCfhxsotns9Dw4CazzOPf2FYWpGSfzq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=895 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_114111_976594_C9481DA2 
X-CRM114-Status: GOOD (  12.76  )
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

From: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>

Currently, in the mac80211 layer, received EAPOL packets are dropped
when the HT control field is present in the QoS header. This issue
arises due to an incorrect QoS control field offset used to build
the QoS header in the MSDU data, leading to a corrupted header in the
mac80211 layer. This issue also applies to other frames that contain
the QoS control field, such as QoS data or Null frames. To resolve
this, use ieee80211_get_qos_ctl() to obtain the correct QoS control
offset from the MSDU data. Additionally, ensure the QoS control header
is copied in little-endian format within the MSDU data.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 96785d60d671..93f93639270e 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2135,7 +2135,7 @@ static void ath12k_get_dot11_hdr_from_rx_desc(struct ath12k *ar,
 	struct ath12k_base *ab = ar->ab;
 	size_t hdr_len, crypto_len;
 	struct ieee80211_hdr hdr;
-	u16 qos_ctl;
+	__le16 qos_ctl;
 	u8 *crypto_hdr, mesh_ctrl;
 
 	ath12k_dp_rx_desc_get_dot11_hdr(ab, rx_desc, &hdr);
@@ -2156,13 +2156,13 @@ static void ath12k_get_dot11_hdr_from_rx_desc(struct ath12k *ar,
 
 	/* Add QOS header */
 	if (ieee80211_is_data_qos(hdr.frame_control)) {
-		qos_ctl = rxcb->tid;
+		struct ieee80211_hdr *qos_ptr = (struct ieee80211_hdr *)msdu->data;
+
+		qos_ctl = cpu_to_le16(rxcb->tid & IEEE80211_QOS_CTL_TID_MASK);
 		if (mesh_ctrl)
-			qos_ctl |= IEEE80211_QOS_CTL_MESH_CONTROL_PRESENT;
+			qos_ctl |= cpu_to_le16(IEEE80211_QOS_CTL_MESH_CONTROL_PRESENT);
 
-		/* TODO: Add other QoS ctl fields when required */
-		memcpy(msdu->data + (hdr_len - IEEE80211_QOS_CTL_LEN),
-		       &qos_ctl, IEEE80211_QOS_CTL_LEN);
+		memcpy(ieee80211_get_qos_ctl(qos_ptr), &qos_ctl, IEEE80211_QOS_CTL_LEN);
 	}
 }
 

base-commit: d0bcc5eaaa611aacbffe6b2cc2fb64bfc3bdfcbc
-- 
2.17.1


