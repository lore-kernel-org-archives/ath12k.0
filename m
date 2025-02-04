Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8777C02194
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 17:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQTyuAWmUFPgAQKIR4TL14IlRB58wBIAJ8OSjdQfdm4=; b=oXNs539DGiRcoxTYJm/Lub5lCw
	4i6HsV+mjKU3dxk0NWiz8yeenR31UbeghN6NKL54Q3xjeKsjPVnWbi+6oi5+ARU60gG0q50IBdFNv
	/4Sy8vQJoUXiBfsa5XEzSLyjlC5LzECeFxBrFSgYEy0P4/H5T/nE1INdNqemrdfDCg/TawTwK0141
	1cAkWr0emxvvly6PoW+5GieZKC6mnWJpXDxfYUWCxNK4yOBWe5biPrPMQrcgG8YnqfipllRcRwkcm
	RxSGf2HrIMW8WWLB3an1EKqFM/j2PmlHTl9XJ1jSbhesa5LXmPsTFOZVvnPSsiwo5n1m4c5gfUNbe
	HFPFmSJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMMc-000000012Ee-1xgB
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 17:05:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMMZ-000000012DC-1HE2
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 17:05:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514EWWLV016940
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 17:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQTyuAWmUFPgAQKIR4TL14IlRB58wBIAJ8OSjdQfdm4=; b=RUKL34PUZSk4/Avq
	Ki8be12eYAOTP6ZCwht519p5q4Dm/Kg/GV7q9izxwXxg6SKfmRcdDETcO7zRrw1Q
	uEOCsfrO+HKexurJYBDfNZENiyF0gDd48XhqvMSg9lVROdRDHHs6ynvOeTBnsCUq
	1rtrbNUxzELOPItn7vhzJ7jJxscPtS06PQt5LrULMuKjPymQEX/zzECQQ4bgnfD5
	h2k8MimYLk9biKi6gf4K9EQuLCbs5SAB/o4qYaFHXXIB5+RVI0QrEOMjHzF9G4NM
	xY5pAlVgQKHP0cLa4mj059MyNWHJkEIuNb2bBA146CMoO+8xTHZRcctPRIWsTLKs
	WAhWMA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kmre0ckf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 17:05:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef9e4c5343so16542145a91.0
        for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 09:05:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688726; x=1739293526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQTyuAWmUFPgAQKIR4TL14IlRB58wBIAJ8OSjdQfdm4=;
        b=pxuLOPB0eeaC3gtBH6wdE0ImmYGCL7kSCALlMU5BeF7qFAqqctVo/XkMNrO7MPZH05
         Kz7cgvyvXxeZ7EmRl5DVXSpQ/rTUSIWOLile/gclWkX9vYbmRb5gGjGkroVJ14eo6Cte
         fNLJ5DVOx2a7WiSbm4f3f/NVuYTRKZ2ctD3JsxyDemgc5kN1CJSpOKl03ZrnRQIsXTyK
         22OSgJ7CC3KXpIe6TOP6GXMK07lo5xi073UCe3YMg4huRH5embDqxHjtO229ETDGRXfW
         TnYQ73dq3kRABaQE6f+FXh7a/LBwWpGGVfh1SnytaUzIvGwUBBPFkdVJITzL0og8e77N
         u42g==
X-Forwarded-Encrypted: i=1; AJvYcCX4CLPD9Aee9HZM448AC80km59aTiHzZGg3f0tDLskNskzPO864GO4Qo9zD+lGAYtBzBntRTeM=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywky1wh0ql9L504+OGEFDnTrd8/sVxNj4s87wNNJqpp4E3pez81
	xSNKr/V531TsrUSJbMxyVYuT4r/INwjpFhCfkBDQj5pOHi+vBki6+ahYTBeQLB9w1STWVD4mpaA
	+IkmhJDLRpdoE9LGdn8tWuKeWRCVJPrkViH1kvdcgJ/csRlReQgxBFcVN/IKun3jLQ0PA
X-Gm-Gg: ASbGncu1aOI+HEr/C7mAUKuKlzvZ3ZH9so1EM8KBbT9bdIFkFQXvkp8RTtt2aJVms6t
	tmbOWmZ/K2T3dl/+eljzPnGocJPRFtuHblh3KJcVNvQvF7pcVOXrjrMbvp2RW8r02ANOrg+gGNQ
	ZcDBDq4iMyjsnKiudA18bxprPc19vScEL2VsR/v3gmZRsfSDAT7RQFBzSwVRFZTju4gxd3tB7te
	l9EhsMS2kSpGwxdUcGkCU38ohj39a/0j7OrPUfprtN0R/Rq8wwpfLWliPR19j1v4QEiL3J7rifi
	tVJ4tYiYCJTuD0tVyCFvlE9EfjHjjzJuBAIep/T8B1H1xPOz/CjlnyOPb3oyNBoVN7D/S5o4mTR
	ISjOmv6qrxVrKtOpmL60RvKFGCkKH/Q==
X-Received: by 2002:a05:6a00:928d:b0:727:3b77:4174 with SMTP id d2e1a72fcca58-72fd0c7f7bfmr40485146b3a.23.1738688725909;
        Tue, 04 Feb 2025 09:05:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWwMmLGyTw18js8RIrutWNTN4NIewNUcg9CwPYOFLN7vXFURF6WhyJs710xW0ZmzHIAw3JFQ==
X-Received: by 2002:a05:6a00:928d:b0:727:3b77:4174 with SMTP id d2e1a72fcca58-72fd0c7f7bfmr40485107b3a.23.1738688725498;
        Tue, 04 Feb 2025 09:05:25 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cddbbsm10772788b3a.125.2025.02.04.09.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:05:25 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 22:35:09 +0530
Subject: [PATCH v2 3/8] wifi: ath12k: remove redundant vif settings during
 link interface creation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v2-3-764fb5973c1a@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: OHHaIdqNQvCTlGNsk1rPPIqGyAQw0mLy
X-Proofpoint-GUID: OHHaIdqNQvCTlGNsk1rPPIqGyAQw0mLy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_090527_352832_1842924C 
X-CRM114-Status: GOOD (  13.34  )
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

Currently, vif level settings are done in ath12k_mac_assign_link_vif() as
well as in ath12k_mac_op_add_interface(). Since it is vif level settings,
doing this on per link does not make sense and it contributes to redundant
code. Get rid of this redundant code from ath12k_mac_assign_link_vif().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 16e6f2fae943d3fa6a46ab1ba6780c9070418279..7defc2b20fb61dcaec06d0e332c48a1b6cd2f5d6 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4022,13 +4022,6 @@ static struct ath12k_link_vif *ath12k_mac_assign_link_vif(struct ath12k_hw *ah,
 		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
 	}
 
-	/* Allocate Default Queue now and reassign during actual vdev create */
-	vif->cab_queue = ATH12K_HW_DEFAULT_QUEUE;
-	for (i = 0; i < ARRAY_SIZE(vif->hw_queue); i++)
-		vif->hw_queue[i] = ATH12K_HW_DEFAULT_QUEUE;
-
-	vif->driver_flags |= IEEE80211_VIF_SUPPORTS_UAPSD;
-
 	rcu_assign_pointer(ahvif->link[arvif->link_id], arvif);
 	ahvif->links_map |= BIT(link_id);
 	synchronize_rcu();

-- 
2.34.1


