Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE04CC369AB
	for <ath12k@archiver.kernel.org>; Wed, 16 Apr 2025 02:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jAyP5X08tuLyEctt/gIwcX04M/yZMnGfT0a239xb/cc=; b=IRWFH2BMCZxxbV+dr/Xp8LpcQ3
	HrQDR3Extjanc1aMEiXlJXugnN88qYA2XsgyqeVszAVyPAAinRj6TAfYMykm6chrsSxW/TmQ73gjG
	/u+PT/50dRIHB/RFywBv3VTu+xGBppxsJJ7veBJC/c0nquWK0dhg+DNAjlTIw3LHh3t3hchjx1tiW
	sGNASOHhrq4eeWMUS/Y/uy5/YxdGwuq6hOo/oeAeZO8F+IbCAu3LS73K5uYtBXCmAs+dudZkqYyTx
	xlmg4ufIsv2cmCW4ng7+Ao1dWZJiNIN4yFX/OjlVcc4KGMfz8hJEWtA1H8T0XoD5G+C70KjuP0iYE
	5Xwd7P0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4sMx-00000007vdj-2NqU;
	Wed, 16 Apr 2025 02:19:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4sMv-00000007vd1-1TQe
	for ath12k@lists.infradead.org;
	Wed, 16 Apr 2025 02:19:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FIcC8l031767
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 02:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=jAyP5X08tuLy
	Ectt/gIwcX04M/yZMnGfT0a239xb/cc=; b=MrJVhLTGWCde/EAuOV5GkKqJLGNT
	Wr6kclut978Mm9k0Dbfb8OLfYQsDJFE8ArRi5ZIlqeGt0egNuB4SrHeagfT88JpS
	8kOo3+Tx1t5TJxSxXekNsYPHr4hgJ7hYC9YtNPsM1dma/Ot8mscpBR8SJVkHpaBM
	Wd2B2uMzZUeRaGDX/WwWngQi5fYIFHVGk0ui7zM7wV7BfzZhoyD8eiSdTygXmFfC
	ztTqwAEx7rCWnoP4NCpwQ2AhTF3xAMWPtEKOY9uEFWrOCjMhwsfqQ6tFnujpkmsZ
	yeNt9crgDktvifeKUNhWQWFCnG4mzqYzNyJqouWobzwmipqzhs0A7dKU6g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1a0f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 02:19:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-736cd36189bso7632725b3a.2
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 19:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744769954; x=1745374754;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAyP5X08tuLyEctt/gIwcX04M/yZMnGfT0a239xb/cc=;
        b=eFYRA0RJKki8uYFqTjod11eNoYoKAV3DlKoOaBTh47vYpaMZZ0iqg8+k4XvFKQuIOA
         dkARoqodnw01eOfr2Nn8p15oDRveahuwltWMLZtTh2XtwxQI3mTPKoAAeBjbyXjy8fZu
         aRV0BbGzytYlL+pwokXxPD8NieribtcJkYllgIAXHmbyJTB1SwvYRAZjEAAHa0r8S2KC
         l9PjwEgbyyQTFaVB6Td9IERKJMUyghJBDL7Y1wzzlHR+tFrC2H9QTqToNRYH96+F6bVT
         gVka9tXtb7HtrVOBYc3AEshKB6YZU9MPNfoPwTnI7GA4v4ugomWofpBNQOOphsAibXId
         2TeQ==
X-Gm-Message-State: AOJu0YxlRTE+go4rmG65TImF3ImG3TbpFRgIbHhHKfmjngnS0B9NuM2g
	9EprVhNyoaW0F3bnzoWmM8JvyZB4cRNGiKEref2UUDO3Ls+woHE90WzTm8ECRv/63E5LohAWBSl
	keD9T4bUbfialF9vbTmVwWNTnDrCxk2ZWHMU0tFuBdLQTMS18rt4t6ko7fC5Bz8/6m5Kc
X-Gm-Gg: ASbGncssWpGZFpBjUEnM2RDo7i6QIGdyEqBGNJNCguXG6ydh6he9prxhd8wui2ahRuD
	ViGRf2poBSRS0XvFaFUOgXml7Kp02XjFrE2/iz6eR91F+BYJNAgvVX/6S1CAXuB6x08gsReT48A
	7cn4rmozgn+vicLWfTh9Ce0WpmhLf2uXQgJAjmvXHtwqRv3PwngAIBxRuy/47zeLSDJLDmp8lIF
	k5/2UA2JME40KEGCW9QWh3y/ZATJWxwB74C52mevY9bnSZkM2NzWsF/6WYW3r/toNuYQaZIo+8m
	16EhvtH3vr8raz0tmYMA/cQD06dyf7TLdsZ5OBFHp0MMnLy+viCU3GMm1TCB7GIBEiyEk0TB5/O
	FzXQ3to0KSluXvwN13mK70UHmXKMwct7Gan/5uMamVvvh6w==
X-Received: by 2002:a05:6a00:e0f:b0:739:b1df:2410 with SMTP id d2e1a72fcca58-73c267f5565mr101325b3a.20.1744769954588;
        Tue, 15 Apr 2025 19:19:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHcefSat6xvhJY36JnxMsXYZ7bDRoeCF96m/MWBtasTDKYJTOO9aNLvg+eXHySif43wGU3cQ==
X-Received: by 2002:a05:6a00:e0f:b0:739:b1df:2410 with SMTP id d2e1a72fcca58-73c267f5565mr101297b3a.20.1744769954190;
        Tue, 15 Apr 2025 19:19:14 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f8253sm9559789b3a.93.2025.04.15.19.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 19:19:13 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, P Praneesh <quic_ppranees@quicinc.com>,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath12k: Add MSDU length validation for tkip mic error error
Date: Wed, 16 Apr 2025 07:49:03 +0530
Message-Id: <20250416021903.3178962-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67ff13a4 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7QbXSr-hkXkeXhD5LnUA:9 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jSDjiWJN33kEjkeMRdPdi04NFTvG6G8q
X-Proofpoint-ORIG-GUID: jSDjiWJN33kEjkeMRdPdi04NFTvG6G8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_191917_511124_00C707AB 
X-CRM114-Status: GOOD (  10.98  )
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

From: P Praneesh <quic_ppranees@quicinc.com>

In the WBM error path, while processing TKIP MIC errors, MSDU length
is fetched from the hal_rx_desc's msdu_end. This MSDU length is
directly passed to skb_put without validation. In stress test
scenarios, the WBM error ring may receive invalid descriptors, which
could lead to an invalid MSDU length.

To fix this, add a check to drop the skb when the calculated MSDU
length is greater than the skb size.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
v2:
- Signed off mail updated
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 96785d60d671..52ccafefd35e 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -3869,6 +3869,15 @@ static bool ath12k_dp_rx_h_tkip_mic_err(struct ath12k *ar, struct sk_buff *msdu,
 
 	l3pad_bytes = ath12k_dp_rx_h_l3pad(ab, desc);
 	msdu_len = ath12k_dp_rx_h_msdu_len(ab, desc);
+
+	if ((hal_rx_desc_sz + l3pad_bytes + msdu_len) > DP_RX_BUFFER_SIZE) {
+		ath12k_dbg(ab, ATH12K_DBG_DATA,
+			   "invalid msdu len in tkip mic err %u\n", msdu_len);
+		ath12k_dbg_dump(ab, ATH12K_DBG_DATA, NULL, "", desc,
+				sizeof(*desc));
+		return true;
+	}
+
 	skb_put(msdu, hal_rx_desc_sz + l3pad_bytes + msdu_len);
 	skb_pull(msdu, hal_rx_desc_sz + l3pad_bytes);
 

base-commit: d0bcc5eaaa611aacbffe6b2cc2fb64bfc3bdfcbc
-- 
2.17.1


