Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2947AC369AB
	for <ath12k@archiver.kernel.org>; Wed, 16 Apr 2025 02:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oUXs6/gT0zqEYDTtq6//pBYfvpU5FJFfhhoCoQYsQl8=; b=RDkP2GF1S7f8GXMcvp1csCjdT8
	NsDj/fmawAkil27EJg9ycVK0WRqYjaSmPDhVq0GOPB1lu5IHrZEd2iWD5sM/HtKTpbbz6I2Oz3v2n
	+QmpdW2MutGE3qIiByxs5fpz0MMvE7we+ejKzp337MJ7+626gGFjwU/9MtVgjHbjzXJnK1+gbNyKL
	Q93rBIUPhyHKYkmlB3R1lncrsRtrPVCkIujdPQI0cZd10wCOZli+UNA+4scwpgo18OUzvJu/4Q0WP
	6n9pKSYYCiS6yZhR6rrr+ku2CWIRhmuSUiy358lsq+uEvfsp7DcUTaNTS0zed0stOkkPPwmeo3f5z
	GbCM67rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4s7d-00000007sr4-3q85;
	Wed, 16 Apr 2025 02:03:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4s7a-00000007sqg-10Bz
	for ath12k@lists.infradead.org;
	Wed, 16 Apr 2025 02:03:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FI8Vei019556
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 02:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=oUXs6/gT0zqE
	YDTtq6//pBYfvpU5FJFfhhoCoQYsQl8=; b=cv+Mcc9DQ+yI/RJLNKLxaIBBi18x
	X7XqVmLfvDuD/KIy+0MSAahPmjt31kSpPIlxJOINcJYw9A862KO3g9GadH2edd5D
	/wwJ/iRfm/xIFcQvpcElo/uH6GEW8PObiau/4YZcz3iBytKu9MoBkaRkmbWInjeH
	yIClk/J+1+6Zd9J8ozNc0dzerAvFgj6ijWDFUfrRL7qxgKrx/aZiACAG9EZa1bN/
	x77w4kDrEEPJQ8ZRSpZpefQYxU8DNiqXqIbGo+Kd8y7JE6JzbwqAlvQbuZp9DKbi
	kDa1qWEmvPrPpIg0im/gEfJMx5KYhk+wQtzB/egwQAAtk5OXJAhwMVcI7w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfd1wqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 02:03:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22410b910b0so42901545ad.2
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 19:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744769004; x=1745373804;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUXs6/gT0zqEYDTtq6//pBYfvpU5FJFfhhoCoQYsQl8=;
        b=QXMgRjTSOko92BnL1RcIGxte2IsZ9ebygBI9MI7WbbqyPqBPvUEEglpEJA1uAMKpQR
         cU4K1+5Eae/ZGhu0/t0lPBqNvZ3BLDDwLNL9/ePh7NojisNEsYbbbCbxi8KStbaOlLHw
         JnHvpvXal/wUmgM5R+f+sJ4TQBAiZq7fnZCT7HMOgV/1zcOAvp6797rjTCc7tD5wJDIA
         lRr2xuWY5rTwG6vBjKgboYcobXsTTI9wUuLe9v+D6dnFLG5OUPMRIC0wP6VeimrXQdHt
         BOzIwxwWlKo9002UKHE0QCRQ4GR4aoWdLx8tUIGWxmL980RjsEKlzkbXsssh2BG1Q9G0
         nKIQ==
X-Gm-Message-State: AOJu0YyGt0cSdyoFEDtyjniODvyMXazkB0hlhJ7BdvI3GHEtwShvCdEH
	vVfqRxsQkFZHpHezV80PSwXyHw0IlbW+/v5Sf/fKDN5G/n1YfwFXQlALMpOadAjRjb2oL6UiCBu
	3KZ8rdDT7wLCB5INz6Aq9rU8n8vRswX+mp24bGORfkpN1gVUHPlhEWxq7bACdVVbwXsp+
X-Gm-Gg: ASbGnctIj6jnBrFxGmBPZWbGk0YlSW+qEhlDB7nnzz9D7STS7lAyVLwfWrZ8gdynNI4
	GOxd7+Td4HCzgmRulhe0WHC8eYc8EYPSwwEc5OiELvn+ysgrwW+hWHUyaJNjKDxH45SjssoFBbg
	81v6IYdoS0peeJbVEj1RAOFY+jItyAml0osEqvVgPlQ/hEsdFl/Pjyx3d28mv9HC2hT9FiHoaOX
	Ovgot+NmHwPHjDQmISBa0KdW57mJVP1d4ptz9qNnXp1rJSp9PSJcQxezrwW9Sd+Ymi7AwwFORvE
	zCNsqfZ4ZYbkteMy9SOHNW9SpzB5bxD5c0pInM3uMSL4n58kPISnyRh0ZmrG7dMv48+67Agy50J
	T+f2Fn/v5O169PUwGyoIo7bAGnyeVjGaf0KN+++gw0OqpdA==
X-Received: by 2002:a17:903:2f83:b0:21f:2a2:3c8b with SMTP id d9443c01a7336-22c358c5d8fmr845325ad.11.1744769004193;
        Tue, 15 Apr 2025 19:03:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwVcjY2E3/uliB2BY3uKDFb0cf+XAGREe6T225xViNYVMSw35L5LDl2ecPxyBmcHOq4bjixw==
X-Received: by 2002:a17:903:2f83:b0:21f:2a2:3c8b with SMTP id d9443c01a7336-22c358c5d8fmr845065ad.11.1744769003787;
        Tue, 15 Apr 2025 19:03:23 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fa7638sm2359235ad.142.2025.04.15.19.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 19:03:23 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, P Praneesh <quic_ppranees@quicinc.com>,
        Nithyanantham Paramasivam <quic_nithp@quicinc.com>
Subject: [PATCH ath-next] wifi: ath12k: Add MSDU length validation for tkip mic error
Date: Wed, 16 Apr 2025 07:33:17 +0530
Message-Id: <20250416020317.3167440-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67ff0fed cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=7QbXSr-hkXkeXhD5LnUA:9 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: J8Qugb8ZbnI0gHEVLxpVAcF2qOIKosr6
X-Proofpoint-ORIG-GUID: J8Qugb8ZbnI0gHEVLxpVAcF2qOIKosr6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_190326_283544_A5CF12F3 
X-CRM114-Status: GOOD (  11.90  )
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
Signed-off-by: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
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


