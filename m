Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5916AC369A1
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 06:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5ujiX5TN5af/Xz2nXtG8TY2vWPEQMb7zUFnh+HQG/4=; b=oI+4pxCVXcmOhjegEKeKv1TA3k
	8DrjQ6w4+cDDFtGL9INpX/+Nt0Lu9/kQ7Py15WkX7ORRrTtpHnw4qv5YyWvRY1bVQ5DcEVUK2I7pZ
	sbgEp/RkYQrQNS57OTCt65XtaD/EpCjO36wV3Z3JlYf6Py++vy0C37fk1xgyFtDRYG86H1KQq42ch
	lMiV3kt7RhgsqWV61tNDSc4WzUutT5yEeh6x20cusIPWXRjez6SDdt7mHEbVuldpzd1/2hW0Tevz8
	O+VMm5HzPYABBMZ8Oz48m1VJBsVK4N2fVKAhhlAzBksSX9OYPZpqljyfdYFye4TGDlJHNY+CGZa/J
	idrDjZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u228U-00000002r4b-0LFc
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 06:08:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u226k-00000002qjl-1J7b
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 06:06:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382JwoT014460
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 06:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5ujiX5TN5af/Xz2nXtG8TY2vWPEQMb7zUFnh+HQG/4=; b=ABiyXUcnVozxCzRN
	ilaS22toGlAQCHZOvqc4gpBzy08p0nwqiAw9ANTcGb0Fi3QVO0UDM2ak6z7Zq5T8
	eXdNEGV5fywsdYiEZhP79GLA7jFoLgSBQhZYYY2zEfcVsogKFkU9ps6AAQb3l9cR
	Hz6LSwuRn85DY283HvU+gjzqpIVPEwEBn2a/gT4r3Vp/oCAiOWL1sXY55QAdtFCp
	rE7gEwh80AflKT5uiFU9/DUB8eZ+qRDOfGD7Jeig6arQPH9/xAjatnR5kP+PEfSU
	w1e6r/5b95aSUg4uh6epbcFRdCDxnk0JuvpM8iMpYP93AXnLLdt9duwcZw9usYoL
	5l17UA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm6nge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 06:06:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af53a6bc0b6so2027765a12.1
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 23:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092409; x=1744697209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5ujiX5TN5af/Xz2nXtG8TY2vWPEQMb7zUFnh+HQG/4=;
        b=dlCfZFEISDGAnM8mLgLzmzLnUo5vORjg/EaLCdrjAWJy8WdZyHeElxWwT7Nss1y4Ix
         YukClkx9lOd1mSYN4NPWCxkFXfWhbDXrY3J/ooUEp9wxbhjAfoclXNpN8WKd2filHJWy
         gcYeMWM+bY+HK9iReetb38HQa9cb0SN7uqVhglOidrK4qzx/MojXcjZ2441XfKuTt0t6
         U7XdCeIv0h76+R37dYF1cSYy6tmKq1De6buWrGV5xYOksajE/2n8GttM2LpNMCdXvzkW
         p6JTB2ed8yjHulOCZD+BrdUomgg1m+7/DMOschQBzeD+kxaGwgLk0CU7VuCNZexvEPux
         na0g==
X-Forwarded-Encrypted: i=1; AJvYcCWmciHi3xPHpuSdni4bp/SJRjsqEe5qfvvwxCna+dYILcTP2RHG1lz0sWDXAO4EWqNa3ew4O7w=@lists.infradead.org
X-Gm-Message-State: AOJu0YyrfqqNhgiFZjjhntJnKS0rxpH5Udv30dNJYgRYwi+5agw0vZ80
	FqcgS9UcnQxKGCWPRLRfoRxbeJRJNIL1zcXxTZUfPxKKxFMPAerC/8M79O2V6+sAvsYk2hptWoO
	08Hs6De/wc4h/gBSA2CSapBxAEduuX3y8tjfZ1IK0zSeCRGded+mzQPlkHIMwOxgoaIWa
X-Gm-Gg: ASbGncv/CCx13vpwp2qK9gY8y1T7alxTcv3qSVXkA082z6eMEqOZbQu4A9+cp3XO5jc
	+kKbcB9oXilbJP/cBj66mI1VidH7C02E1Kdat43aQFgKzwr0w8rRKUhtDUyAOwlA65/Pl7DB1Oa
	3PGNk+zL1yhH3OVtTRIQ+N5CiX5tns0rVFjQkCtGY95KW3T1c0+nNoVrbEHzgx5TqcZencDGW+J
	A5ONqQg54Bg0RFSp0nfD5rtKuVABFIm6JFm/efd04O9ZZ31KBrlvJg/DfNu1v4BKRPNoU3JvQz7
	t9lGOJ/MLhE7GFXIsyDIjk5fLxs7b2kP1PYp8fpPOU+1URM6rpUVxRKwyEODYMXKgxlqjSQRyzL
	A0ybVLozxkgIK1AW+qsHxS4ko4IgcRMWwuGkCJtcj
X-Received: by 2002:a05:6a20:9f8e:b0:1f5:8c05:e8f8 with SMTP id adf61e73a8af0-20113c73e57mr17364075637.25.1744092408635;
        Mon, 07 Apr 2025 23:06:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGadxRg+Aatc3BVZKnOOTHXj5Tb2ipywTu5R8ckJegG5HqK4rmz9F5E/4Lt9SmzvAPVlzUrng==
X-Received: by 2002:a05:6a20:9f8e:b0:1f5:8c05:e8f8 with SMTP id adf61e73a8af0-20113c73e57mr17364052637.25.1744092408234;
        Mon, 07 Apr 2025 23:06:48 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc35079fsm6863981a12.41.2025.04.07.23.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:06:47 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 11:36:30 +0530
Subject: [PATCH ath-next v4 2/9] wifi: ath12k: add reference counting for
 core attachment to hardware group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-fix_reboot_issues_with_hw_grouping-v4-2-95e7bf048595@oss.qualcomm.com>
References: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
In-Reply-To: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, Harshitha Prem <quic_hprem@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: xsITe9kNu0CAil_Qs4E4Aw8DLke34BIY
X-Proofpoint-ORIG-GUID: xsITe9kNu0CAil_Qs4E4Aw8DLke34BIY
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f4bcf9 cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=PROE_fPfuV2Hua9vZMcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_230650_363625_065DBFBF 
X-CRM114-Status: GOOD (  16.32  )
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

Currently, driver does not manage reference counting for attaching and
detaching cores to/from hardware groups. This can lead to issues when
multiple cores are involved. Or with same core, attach/detach is called
multiple times back to back.

Fix this issue by using reference counting.

With that, it is now ensured that the core is properly attached or detached
from the hardware group and even back to back calls will not alter the
count.

Additionally, add some debug logs during the attachment and detachment
events for better debugging and tracking.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 47 +++++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/core.h | 15 +----------
 2 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0e71935b272033c5322e76a01e931087ced875ca..8a571a615313d2f1190fe9afae02dfd385ede7a3 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -640,9 +640,49 @@ struct reserved_mem *ath12k_core_get_reserved_mem(struct ath12k_base *ab,
 	return rmem;
 }
 
+static inline
+void ath12k_core_to_group_ref_get(struct ath12k_base *ab)
+{
+	struct ath12k_hw_group *ag = ab->ag;
+
+	lockdep_assert_held(&ag->mutex);
+
+	if (ab->hw_group_ref) {
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "core already attached to group %d\n",
+			   ag->id);
+		return;
+	}
+
+	ab->hw_group_ref = true;
+	ag->num_started++;
+
+	ath12k_dbg(ab, ATH12K_DBG_BOOT, "core attached to group %d, num_started %d\n",
+		   ag->id, ag->num_started);
+}
+
+static inline
+void ath12k_core_to_group_ref_put(struct ath12k_base *ab)
+{
+	struct ath12k_hw_group *ag = ab->ag;
+
+	lockdep_assert_held(&ag->mutex);
+
+	if (!ab->hw_group_ref) {
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "core already de-attached from group %d\n",
+			   ag->id);
+		return;
+	}
+
+	ab->hw_group_ref = false;
+	ag->num_started--;
+
+	ath12k_dbg(ab, ATH12K_DBG_BOOT, "core de-attached from group %d, num_started %d\n",
+		   ag->id, ag->num_started);
+}
+
 static void ath12k_core_stop(struct ath12k_base *ab)
 {
-	ath12k_core_stopped(ab);
+	ath12k_core_to_group_ref_put(ab);
 
 	if (!test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags))
 		ath12k_qmi_firmware_stop(ab);
@@ -879,9 +919,8 @@ static int ath12k_core_start(struct ath12k_base *ab)
 
 	ath12k_acpi_set_dsm_func(ab);
 
-	if (!test_bit(ATH12K_FLAG_RECOVERY, &ab->dev_flags))
-		/* Indicate the core start in the appropriate group */
-		ath12k_core_started(ab);
+	/* Indicate the core start in the appropriate group */
+	ath12k_core_to_group_ref_get(ab);
 
 	return 0;
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index e8d2a0c859f6260d48c4c636793cf3a24c1c61b6..75fb4a99af9442e3c3f042602cc5b26842aa5231 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1121,6 +1121,7 @@ struct ath12k_base {
 	struct ath12k_wsi_info wsi_info;
 	enum ath12k_firmware_mode fw_mode;
 	struct ath12k_ftm_event_obj ftm_event_obj;
+	bool hw_group_ref;
 
 	/* must be last */
 	u8 drv_priv[] __aligned(sizeof(void *));
@@ -1375,20 +1376,6 @@ static inline struct ath12k_hw_group *ath12k_ab_to_ag(struct ath12k_base *ab)
 	return ab->ag;
 }
 
-static inline void ath12k_core_started(struct ath12k_base *ab)
-{
-	lockdep_assert_held(&ab->ag->mutex);
-
-	ab->ag->num_started++;
-}
-
-static inline void ath12k_core_stopped(struct ath12k_base *ab)
-{
-	lockdep_assert_held(&ab->ag->mutex);
-
-	ab->ag->num_started--;
-}
-
 static inline struct ath12k_base *ath12k_ag_to_ab(struct ath12k_hw_group *ag,
 						  u8 device_id)
 {

-- 
2.34.1


