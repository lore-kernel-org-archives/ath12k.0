Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A619C021B1
	for <ath12k@archiver.kernel.org>; Thu, 20 Feb 2025 09:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5Ha66MvqNoZqX/Zen8LYEqzzHd5YQENJb7yj1q/J5J4=; b=fwQVMkZf6poLS2/9QHAiLsINLy
	BnBVmyu6t7CROtiz19jsRqMWho1SD3U6P5Kqs9vRfwfF7Ij/jQa9jQaLsjd/NfKuwWbA84hjbe5Ef
	Xx9HPJfQIts/foajjJpKTC80IB6ik3dnADrg5JbMcyG0ZcjrOZiH5LySarC47NAAvWt5PNNxGREzu
	d9t4pkBmL9sYpz8hK8m0icereWohgqSQ/99GBIuKZjl0e8XHwj+7LAvB2dKcxDohkjlqgKGLTzlkn
	j2/UcCYtd6zMlAOJ+fwLSgi/0+phcjhbs/RdlNfBu4ZddmeLSICdVvi0BQV2gQeIIABhOa1Mx0Sjl
	5MSyNDGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2zJ-000000003xA-00L0
	for ath12k@archiver.kernel.org;
	Thu, 20 Feb 2025 09:36:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2zG-000000003wH-0mOR
	for ath12k@lists.infradead.org;
	Thu, 20 Feb 2025 09:36:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K7dS52020402
	for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 09:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5Ha66MvqNoZqX/Zen8LYEqzzHd5YQENJb7y
	j1q/J5J4=; b=ZFHkYaPeJyeKBb6XePEGz20ZEZ31tJQ6BXK0VoeZl49/1spZTi8
	gSDsm20SKjnoKPZBgARjNUJPH0pYp+iF/t65lyiV3MWAu6G5Sn8Gqi3a0PkRhF+3
	qjUrOtQexYoAVR7Ye+yNa5Tnsr3mQV41SfF7LWdnliXYK8y5Zd0cICEsZziV7PvW
	gHmCZHE5TA+QT83ZAYbEf5mfVIPuow61k47PEICmClkop48XrvS6mmo6wj8RgnoH
	sLNvthrn2Mg82/Z/vMxEAYqNX0BglPO16RRJsO1CmwSSHXH+YAxo2+xiaK6LTumq
	cEVyv3jYJ5eEM7h+zow9oqK9EDKGqndOgyw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x06t0b4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 09:36:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2210121ac27so16570025ad.1
        for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 01:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740044212; x=1740649012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Ha66MvqNoZqX/Zen8LYEqzzHd5YQENJb7yj1q/J5J4=;
        b=iNfVp2j/G2stBkgTVO+Q+IpO8LQ82pqErZIBMMB4h8qtfnBP0r5SN5dzZ5ENh32j9/
         ITiPAJOU0xResilm1PwSTr7LhlAWs3VXU0GFWOWeKxS6NenB5W+KhGQ7TJmol0OeO7pC
         J7ib8EHarpRnTIh36J91JE2ZzIOmITY+kfqPD/Eak2/w0Yn94VQrdW3CBmAbj0Di+eWM
         gL/Bp0388HAA4rMFraKneJWznsziG9wgihBD8YFY/aQCDBZDcEiF7V/UkNuK+7hCrZ4+
         FbTEaJLPGAzQEw6Knk/oZp3nmVC92uP2vvV2VEkUDY1qswIiWKKFJVXUHhfYlkL82VQg
         V5ow==
X-Gm-Message-State: AOJu0YxiUgrkySI2bbjpXEfSxLTicZJEqhnUt6Ct5M2jcvnsmpanZLWr
	47hEh2hYJ4rr+wbYJ61bZzN/D2A+0W1RqaI92LQakT4IycJ8lAr+NMWVuDZF49e7pmmTV/vKqyd
	xHsFumm5mJMqz30mwXJ8JAHldSfdHDdvp6oDcsrAsWPiiXj1IhaoJgqpXnto428Stwhx9
X-Gm-Gg: ASbGncvjGzi8+CC3q1pV3Yfkc7J09XReWkbCE3xcnBP7tePtH9k6tZoZs6Lz1bJ4o5k
	NHpekMMWXdtNpaFYJ+vgV14ktUibZnLWE8DAVh+t7g3cOfUvlsr++v4CiuaJQXHXyd/uR/hfM49
	W0G3PFsTZ/mVgBqaaIunZd1KIITRoz0JQhHVx6K2c94MQyPt+jgzxBYUFidqL9sJOPlhSNPBZwd
	u0xlCApR0ztAnFGd4RsjeOclyJ9KqqqJ692QGPsOOmIR+XB2eiJxfwY7q3yMMFHb+etJJtHXgHz
	do+KJu0qmHh4T5Zp8CUj37X5EOKNbUeq4bC88s+BacBKaUTGXSgeAicl0LgoJjv6TqM/zYEkxRr
	z4wljrOM3sbRsXNsTkHdULL8=
X-Received: by 2002:a17:902:ea08:b0:220:c9e5:f94e with SMTP id d9443c01a7336-221709894d6mr114473565ad.23.1740044211745;
        Thu, 20 Feb 2025 01:36:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZvK6bQGNak3Ju4bplSXeaPuAiVc8U3pDH2U8/Vn9gthyHRkWoWIpa++hddU3Ck7T4Ge1xnA==
X-Received: by 2002:a17:902:ea08:b0:220:c9e5:f94e with SMTP id d9443c01a7336-221709894d6mr114473265ad.23.1740044211356;
        Thu, 20 Feb 2025 01:36:51 -0800 (PST)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220dacfc769sm115440265ad.201.2025.02.20.01.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:36:50 -0800 (PST)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath12k: Fix double budget decrement while reaping monitor ring
Date: Thu, 20 Feb 2025 15:06:40 +0530
Message-Id: <20250220093640.2443907-1-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nCoXEIXc8aO1tjkk4GZ2S8glAoj4BkyI
X-Proofpoint-GUID: nCoXEIXc8aO1tjkk4GZ2S8glAoj4BkyI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_013654_296579_282247FF 
X-CRM114-Status: GOOD (  12.14  )
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

Currently, the budget for monitor ring is reduced during each ring entry
reaping and again when the end reason is HAL_MON_END_OF_PPDU, leading to
inefficient budget use. The below mentioned commit intended to decrement
the budget only for HAL_MON_END_OF_PPDU but did not remove the other
decrement. Fix this by eliminating the budget decrement for each ring entry
reaping, ensuring the driver always reaps one full PPDU worth of entries
from the monitor destination ring.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: 394a3fa7c538 ("wifi: ath12k: Optimize NAPI budget by adjusting PPDU processing")
Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
v2:
	- Added base commit tag.
	- Removed empty line between Fixes and Signed-off.
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index d22800e89485..6d1fa6a6c9bb 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -3259,7 +3259,6 @@ int ath12k_dp_mon_srng_process(struct ath12k *ar, int *budget,
 	ath12k_hal_srng_access_begin(ab, srng);
 
 	while (likely(*budget)) {
-		*budget -= 1;
 		mon_dst_desc = ath12k_hal_srng_dst_peek(ab, srng);
 		if (unlikely(!mon_dst_desc))
 			break;

base-commit: f22471c17f5849b2f20e2c56ec9fcd9dd8d5bf28
-- 
2.34.1


