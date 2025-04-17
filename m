Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546B9C369CB
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 05:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jv4RsssVGnpHJQ0Yb1OoYhjDQ9B5Idtfd3Pwq2rl3E=; b=SFKb5qTIGzMVqtQzJ7A8wYPXiS
	ex0KSm1U1HP5tf4UGU3dW5irtIMfWUGj0N6/HLMXMKCljjGBmqsetcv8uUQ/zifZUmceI8y8t0wIM
	i1Bdbp0htgbHoy49kXpVjQRU9EbB6rsNiZIgb6TTo+PIyTLrsI5dYGRjPJEy5BPtFOk56+vWHpm2L
	9uWWdS7doqtThu17Fj+TswxWvgpal7513fxpbeVE3CIcv+SIrlyBHUk4dUArnw58JQ9Tu3VitN4pW
	QZ0pHd4fk+Zj5frlhInJBFSwvpvrM/GoKKgDrEeBN/cbO6uQued8ze+R9UsuzpsWBUfFwRrH+8trL
	z0I0zi7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5I82-0000000BovE-06B9;
	Thu, 17 Apr 2025 05:49:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5I7z-0000000Botw-0eIv
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 05:49:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5lPna022641
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 05:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/jv4RsssVGnpHJQ0Yb1OoYhjDQ9B5Idtfd3Pwq2rl3E=; b=OVFsZneFzQoYIZQI
	pQFmXdp33zmE2n7pIvOHdcaaZkJJo49Z5beCeZfK1VTtSCAMc6OI/qFWzBg/8It9
	LrnCmC83qCX9X8kCOK1xF0hpHMlK5N6ByEx7iyG26cDOjjEBmwRwVxsiq9/jwDdp
	NNYERx6vmWgKNieDH1SaE70BqsQ9Lkl5gRXdUV6ND+dub1HO5CVantE999dg5DFS
	JxTdep9AHc62Nh+ScnZi5JjnZAXLpCzuZYorcthSnFU+pZRZt/AkRpti4J1QD29b
	L9vE31IF6be9jx7XKYHXX/7qVcGgMAAEKObuyGzpQ52l2lq8qyeUkekNm7rOW/9x
	/B4sMA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpwkht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 05:49:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-227ed471999so4858615ad.3
        for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 22:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744868974; x=1745473774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jv4RsssVGnpHJQ0Yb1OoYhjDQ9B5Idtfd3Pwq2rl3E=;
        b=Q3/P2lftCburEh+p/yJgae6hwqpXluRSo2Fj1d03Qpc7RDsMnCScTgsM7CmaG8EvrQ
         On+KOM5yKV+QgnalWZhL3bY6pqAdz9DdAr00ciCA8O081avkuKQhijbl4PnThR/K33xT
         rL+e7x2brhGSl0tNLp894CcO3VbPJF0e0KfY0nKUxYcQxdS4tJc0SrTQDG1ipG+/Ftam
         dn33xtP3e3Ju0wv10hKSujaXLLN0qRMQngFBWEXtP0VzrqV43aV3Kx6DscqyLKor/S4S
         WDpNWo/E8tRhz7BVNeg3644wQHBQPXEnETb93tB5gU2WyK6AU4OodmQYX+b5GT10OAiV
         o4mw==
X-Gm-Message-State: AOJu0Yzz1R1gF4Jo1yWO0hrBaAaaKHkN6w+Wvi1HjtpANmaAnM630IuN
	2k/LZ1PdlsWlth0gQkKt2u44JSvIsd3dOpWEidy79OUZM790Lv113Xw0nhjVC0tBjAsIO6ib+MY
	SjV4ecBqAwxUIKsk5B3Ih3OmMjlhx7ZULwocpDYC1S6OsTZbhs5bk2sKXl1sN
X-Gm-Gg: ASbGncvcWjnsV9HByPzO659YSUaVXc/HjgEVVzMJjFRXIRdr1l5NFif2KqQhQUi10P3
	uvP6U4+13PkXgMTkGEj49Qw80Q5RIG/zfsRBNJAQZG4m1uAztvYDUJKCwjBJI0We9EG6SLZSEq2
	TdurIjOX9IyrenW/HBpGoPoJj6NLNZ7TiE6NsELLbe7ogVlwnKLZydE7qdctspnbyyPTM0ZDcbv
	NK5EOF+NSgoUSpZ3emwhBjz7q9TpN/BWu2pLkKmg6ndgG5pyzsLtxDSFx6nXIIHmapNYLF2jQc2
	B6jUgSz4wRH53N3iQgtXfaDuN3KI3Zepo6M0rNtkkDA7UM5tNxW/dyNk5WFOQ8ewhp5Ry0P9zw7
	WqknHRLW5/SqlrJV1OyvWS8ZaLscWm43zRCSO
X-Received: by 2002:a17:902:fc8f:b0:220:fce7:d3a6 with SMTP id d9443c01a7336-22c358ebd79mr77625345ad.23.1744868973790;
        Wed, 16 Apr 2025 22:49:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmWzEnXzI6K18qhm1XkVw0g9sKnW73TV706ko6b0LeLWy3RIMhAT8HKqzp3d9+9Aw/m2GXtw==
X-Received: by 2002:a17:902:fc8f:b0:220:fce7:d3a6 with SMTP id d9443c01a7336-22c358ebd79mr77625175ad.23.1744868973440;
        Wed, 16 Apr 2025 22:49:33 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fc47e0sm24745715ad.167.2025.04.16.22.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 22:49:33 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 11:19:14 +0530
Subject: [PATCH ath-next v3 2/2] wifi: ath12k: Use scan link ID 15 for all
 scan operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-fix_scan_vdev_handling-v3-2-9ec42513d26b@oss.qualcomm.com>
References: <20250417-fix_scan_vdev_handling-v3-0-9ec42513d26b@oss.qualcomm.com>
In-Reply-To: <20250417-fix_scan_vdev_handling-v3-0-9ec42513d26b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: ki5N1GrwwQs3FYc5jRwT3tdiHuwCYqva
X-Proofpoint-GUID: ki5N1GrwwQs3FYc5jRwT3tdiHuwCYqva
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=6800966e cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=HrdbKVgjrEfcEFtqRF4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_224935_202302_E2F95AB8 
X-CRM114-Status: GOOD (  16.23  )
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

According to the code documentation in ath12k_mac_op_hw_scan(), "if no
links of an ML VIF are already active on the radio corresponding to the
given scan frequency, the scan link (link ID 15) should be used". This rule
should apply to non-ML interfaces as well to maintain uniformity across the
driver. However, currently, link 0 is selected as the scan link during
non-ML operations.

Update the code to use scan link ID 15 in all cases.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d219c5b07a79c9829a1de12183e298d24eb5336a..5e3f77894d035e0dab6d24481e696fd15415a3d2 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3466,25 +3466,18 @@ static struct ath12k_link_vif *ath12k_mac_assign_link_vif(struct ath12k_hw *ah,
 	if (arvif)
 		return arvif;
 
-	if (!vif->valid_links) {
-		/* Use deflink for Non-ML VIFs and mark the link id as 0
-		 */
-		link_id = 0;
+	/* If this is the first link arvif being created for an ML VIF
+	 * use the preallocated deflink memory except for scan arvifs
+	 */
+	if (!ahvif->links_map && link_id != ATH12K_DEFAULT_SCAN_LINK) {
 		arvif = &ahvif->deflink;
+
+		if (vif->type == NL80211_IFTYPE_STATION)
+			arvif->is_sta_assoc_link = true;
 	} else {
-		/* If this is the first link arvif being created for an ML VIF
-		 * use the preallocated deflink memory except for scan arvifs
-		 */
-		if (!ahvif->links_map && link_id != ATH12K_DEFAULT_SCAN_LINK) {
-			arvif = &ahvif->deflink;
-			if (vif->type == NL80211_IFTYPE_STATION)
-				arvif->is_sta_assoc_link = true;
-		} else {
-			arvif = (struct ath12k_link_vif *)
-			kzalloc(sizeof(struct ath12k_link_vif), GFP_KERNEL);
-			if (!arvif)
-				return NULL;
-		}
+		arvif = kzalloc(sizeof(*arvif), GFP_KERNEL);
+		if (!arvif)
+			return NULL;
 	}
 
 	ath12k_mac_init_arvif(ahvif, arvif, link_id);

-- 
2.34.1


