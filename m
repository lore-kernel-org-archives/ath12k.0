Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0F9CCF9E5
	for <ath12k@archiver.kernel.org>; Sun, 26 Oct 2025 18:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mG+RYsLT98tO9MCLjpeevtNsKHifcEXrsuza3lazY6c=; b=bXoccb/+wRNNjF52+XYH1ih9Ue
	lx36x+PGYbf/FmWQJ5PCsniJEdv8ofhA34Fs6cF16xv6zJbdkXSfz8hiAkW/P9Zjlcpm5lD76yev3
	LCSgErG19NHtD59fSCLQc4tr7E0wA/CXtIEqyJ1dv287G8RbtcHKyMUkWGvpVITm5vsyYuw5k4AUR
	eBrX/DHqFXR3uo2Zw/i9Lb2+JioDvChmUlwWcRDVvAqrl9Vhf1Zas8exFwD7Od2XTyIhI4OhChtj8
	PJC64NTvrTLxOsoznLIaZFhfxZwAlnu/uR+8iVazvqlt65i91V87dv8ysyijLFnr9Yx+JUr9Bz0q5
	WPPRIvgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD5P3-0000000Ccm8-0Dwz;
	Sun, 26 Oct 2025 18:23:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD5P0-0000000CclP-1RvN
	for ath12k@lists.infradead.org;
	Sun, 26 Oct 2025 18:23:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QGXJju331947
	for <ath12k@lists.infradead.org>; Sun, 26 Oct 2025 18:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mG+RYsLT98t
	O9MCLjpeevtNsKHifcEXrsuza3lazY6c=; b=cfssedO6I8veDU/wU3Qpqjfkkw8
	Am2L8sCx8auU8RNOxIeyXLi8LMkR+3FU1LvG9DyFMZqxh8HzXkRY+qG0VMzZME3E
	Dd6lBkuYbqpHYDvrOg/EbCFhRMmpBw9jJ0Frcq4LDGJyDunQFOb9ucXfRHD35eFA
	m+8cPm41I7TsaYmz0iRbkvnU7GvT6bcLLizRoPaT5n3MBlTQVx7TP8UJxK0TIOTi
	WccRZLLVJbpoYCmix/aTOReE9KJE7mbN6X1L+svJHd519sryXZZlJRuZvkLnZ8Qf
	jH54molFMtj7ZW9ZY/XexHCJKTgTbUgnm2mOd9ejXgGsjMhyV6i98qDeG1A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nnxterw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 26 Oct 2025 18:23:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-290c9724deeso32587275ad.2
        for <ath12k@lists.infradead.org>; Sun, 26 Oct 2025 11:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761503016; x=1762107816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mG+RYsLT98tO9MCLjpeevtNsKHifcEXrsuza3lazY6c=;
        b=G2tRB3m2ZD3D/cMhqIRwLmwLsBQaKhYte+n8c4x5uGOtWIdrVyQmcLaWAniKVCHcas
         PElYcUOtY1l2D6B7PIEP7YDdeJ2pM+e4bdxIj2Lae0Cjk2oEQEopzGvR+SXk6UCmCMwa
         qAAURxfcsHipiSGLKQcDi0WOAwdzRWZLe25dRO0rhNgalgHqbKHhn164UVBAUdd4Qx1o
         Dl8w1L6Bp0sjJZ7RqDlQ6bBmIRDnbKbhyfOX+DA3/sOQ5I8iai6TFhqJ6x341RiI9U6X
         Oaw0o5YRL5UB+CFy2cRnPRwfi2qrUSij9YUu5r3MBpkZh2ilM6w0+cCpPhYhkJd9fgaU
         xyRw==
X-Gm-Message-State: AOJu0Yx21+rcomS/jwqLrUHXxaRmJrw3V55GrTeu3LxkH6mDWn3WHpu4
	afcLAEY2xyJqEdBoDdVvPbgThDOCZWbWKWvKY4fDTJqlE2kspD+rk3NGGpiwi9q4lA53dDIFbrq
	SRpE8ZXe/318dArfxGXxcOi6GSX1lWbT1olsk8csqMKQ5d8Xt41NYJs2Zzuc6ILpsrxVHLoo4
X-Gm-Gg: ASbGncurMxi5BveN9RIZGFIm2ZahQeuKJx63sJYIXWYLLI+8+PbsmrhNQ+XX56syxNd
	rXScy0P9lKm8Gr/WIPDWYS8qBxbYs+ZPAeGI73VO9ZORIPefVTeAwyGxebnjdO4QgbcOQKnREic
	aADT27x1aM13CaeIte8NnG2y10MQe53zZvBJZNbiProlxJ2vLbR7Edk5QF6g1RWqDcEG8pZcGtv
	Pa4cxY0IZsLvV79VY9jdEtl2X2AMvYXFxuUylpHjuVkcEFrlDI0d9ND9dcUGGcoBSVgfNUYjxWd
	nqpVT5cBtHA/pvxO1wRLgJf1tY50wXKxh8v/GNOg/uYeHpXIlz1zrTnAW0WlYx79KEKigLoGM4N
	IWVNg/wE7hlvOhaygEYvU0xeShY8X2CorxjBbUQyD5TLq24jbd+eA/MVDcJ0ZDV51CjBWzFyY7o
	LGKfG8ACgD+Eu1o4HLXcAV1d63myM=
X-Received: by 2002:a17:903:1a4c:b0:267:ba92:4d19 with SMTP id d9443c01a7336-290c99a8ed3mr435861225ad.0.1761503015974;
        Sun, 26 Oct 2025 11:23:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHswKgrqRdmMzEaLmyHg/B3sPp31a13mYJaP42VLJaQB0/JCuphSY2wn+y7KiotSh1X+pry9g==
X-Received: by 2002:a17:903:1a4c:b0:267:ba92:4d19 with SMTP id d9443c01a7336-290c99a8ed3mr435861025ad.0.1761503015470;
        Sun, 26 Oct 2025 11:23:35 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e429d9sm55208655ad.100.2025.10.26.11.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 11:23:35 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 1/2] wifi: ath12k: enforce vdev limit in ath12k_mac_vdev_create()
Date: Sun, 26 Oct 2025 23:52:53 +0530
Message-Id: <20251026182254.1399650-2-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251026182254.1399650-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20251026182254.1399650-1-rameshkumar.sundaram@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Xc+EDY55 c=1 sm=1 tr=0 ts=68fe6729 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=9mMTWwSXXuGFS-eWrSwA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 08-qhEnIt95wbA32X8I4YAzg-tIN9_43
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI2MDE3NiBTYWx0ZWRfXxACLgB1eMBc+
 YheiBjjPGo15oQYLOHc83tqRQ5GnIjMFPd3yqlTLW6IcZhK1MS+L3teGoUx3RJyIQv5FaVNX+f9
 KIosg7I0SjSiXxq5hXfZ9aDL1Hwtp7R75BNvt0GSJnyhfp6Tb0/2QMEQOy527Gb6CnY/CxFWyDs
 sYvKKnnRWkSEvbAduvbz0DoSlUMTKY6aFbL3TtLZOxYT6u6vcp+Q2/VB+R0D+qSxzDr9i5DvpA+
 HNTmJT1uts+bdq5f2jqzxj63sXSIFiWJG/FKWY0XxsLpw00C5dQJgvRJYK1aGWeLyP5rDq9KqmY
 FdbzDUqkXgaw7GqRJOV8X9PHvBRQjBv6Um5R+d3cAZpy7cAu8cTWtGPQAgv3b2gfw7s5epZ6OnC
 2hghg3OqFGgd0BA8kA1s3EE31bnU6w==
X-Proofpoint-ORIG-GUID: 08-qhEnIt95wbA32X8I4YAzg-tIN9_43
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-26_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510260176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_112338_595105_95977BA8 
X-CRM114-Status: GOOD (  14.19  )
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

Currently, vdev limit check is performed only in
ath12k_mac_assign_vif_to_vdev(). If the host has already created
maximum number of vdevs for the radio (ar) and a scan request
arrives for the same radio, ath12k_mac_initiate_hw_scan() attempts
to create a vdev without checking the limit, causing firmware asserts.

Centralize the vdev limit guard by moving the check into
ath12k_mac_vdev_create() so that all callers obey the limit.
While doing this, update the condition from
`num_created_vdevs > (TARGET_NUM_VDEVS(ab) - 1)` to
`num_created_vdevs >= TARGET_NUM_VDEVS(ab)` for clarity and to
eliminate unnecessary arithmetic.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: 0d6e6736ed9f ("wifi: ath12k: scan statemachine changes for single wiphy")
Fixes: 4938ba733ee2 ("wifi: ath12k: modify remain on channel for single wiphy")
Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 86b79deacf03..931aff85d35c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9753,6 +9753,12 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 	if (vif->type == NL80211_IFTYPE_MONITOR && ar->monitor_vdev_created)
 		return -EINVAL;
 
+	if (ar->num_created_vdevs >= TARGET_NUM_VDEVS(ab)) {
+		ath12k_warn(ab, "failed to create vdev, reached max vdev limit %d\n",
+			    TARGET_NUM_VDEVS(ab));
+		return -ENOSPC;
+	}
+
 	link_id = arvif->link_id;
 
 	if (link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
@@ -10112,12 +10118,6 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
 	if (arvif->is_created)
 		goto flush;
 
-	if (ar->num_created_vdevs > (TARGET_NUM_VDEVS(ab) - 1)) {
-		ath12k_warn(ab, "failed to create vdev, reached max vdev limit %d\n",
-			    TARGET_NUM_VDEVS(ab));
-		goto unlock;
-	}
-
 	ret = ath12k_mac_vdev_create(ar, arvif);
 	if (ret) {
 		ath12k_warn(ab, "failed to create vdev %pM ret %d", vif->addr, ret);
-- 
2.34.1


