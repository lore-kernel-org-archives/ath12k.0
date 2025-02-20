Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9BFC021B2
	for <ath12k@archiver.kernel.org>; Thu, 20 Feb 2025 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LR2M3r4Qw3jzfTGn7g1ZdStQCqlIY9oK4gLMTdorMp8=; b=QTQPMqog5ItwG4KG7KZAEKGLKQ
	iitxKEhsYDpvGbGktP1FvlPjz1YnE1g7g9ThHK85UPMWcfjm+FQ76q8cS5tWQApPnQzl7UgUUsUEk
	Ed7hJKqqXkDfdLRP07lmZyaM3qdhQ048SGV8bK8D6ZlBWY84mGpRHWVMvlCkBkKOecuuq4iir/PFb
	LrAvaZyCfUgCu2ObNAhbWjI9sLhcieVICX1H7xa4Vqtiv/U7KcdLRo/6AjeSrCW7bgfl9+9338P1o
	eVIviB4RoKki98EP30POOmItwW/RQmjCJHl3KS696a3wyMzASQKA/mPfwwnIiN367jRwf0yOz09Ye
	eAlbs07Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl3D9-000000008ka-3LTZ
	for ath12k@archiver.kernel.org;
	Thu, 20 Feb 2025 09:51:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl34a-000000005X8-09hq
	for ath12k@lists.infradead.org;
	Thu, 20 Feb 2025 09:42:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K7MUdA026872
	for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 09:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LR2M3r4Qw3jzfTGn7g1ZdStQCqlIY9oK4gL
	MTdorMp8=; b=XKxfOPPktzeR2AAjkyOpbhKl+ii09V3//JRQvH2W2nLUl6BA2b8
	fIikqNiHGSmkRKaJV3JTZ3/nTi23zgEqXHwGBKCx5GjSDOR0t5u/7jR8lpaUADka
	FtfcBPiTviKa249eECoyWsgjV8Q8DDGgsAUU/AGKSdU5Nxv2NoVC3ILQxost5Ba1
	xvah5o0M91rxuEa/Ot2jALe4kTCN3jBxhPVgg2jCOYiSSAMIprhhPc9NX/wy5Fjx
	7A0pkqYmKXb/J8Uq65oYUXwhm8UDKcYMiBgqyvOb7UzQjHHIN1hLUR4cJli6wyv7
	ug7tkkaV3nlQCxj838P4Fd5oQlQVP0ztpug==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy0np31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 09:42:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22119b07d52so11590945ad.1
        for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 01:42:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740044542; x=1740649342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LR2M3r4Qw3jzfTGn7g1ZdStQCqlIY9oK4gLMTdorMp8=;
        b=FSUht9QOxi+DdTKT9pfHgFmBmv4lW3w8GKD2oAMKitStKXSuzJIjBFy2KpOdS2pFiH
         U4Vo9HYypLwkg3MOp+eBkH+HQ8u0uXj0b51Rnmi0gzDJM2z4Jz3i2BTf1TOaxIouIug2
         zZ1tiIbDUnonhjGHATvGYGEVsGHh8eZg6j4u/pvewwTsWSm6JEWqbANRnMZfPDU/aZ6v
         1wTyLEoaWJ5G+HqIY0SxEb5/kPAXC7HECtZ0fVMQw1F8P0xgI2UX/rWzlR2u1r0791Mw
         pLppbaQTKjuhiU5cGN6xi81vGJVR0Jfpvl32Ivqn9ZatJEnRSpLoYx11E3012yItgtE4
         v2BA==
X-Gm-Message-State: AOJu0YwB4k10zxiDiygGZbg6uVMTlJnAP/2c2boZmKxKIFFSof60cuXj
	6aSwhDsPjpWDEF9Sti2vcR4NNdkHTnwAB5sLFJNTRtLtWQ+hYXGu6EbwspZ6LrluGz5VW7bdTtT
	r4yj3jHtU8oJxhZNij+TIasBdMvX98KG+DUuw1Hi1MDfFRZ9YhS1HDbQk4y16sgYUNsu3
X-Gm-Gg: ASbGncsgfGfvoIrkth3uUUBk0Z30Hy0acGmRw9ZlENkkDsHlPVOu/wDVUDBhywsA181
	9hlkPaKUUQ3IfevFvcmGeJG9vA5HtWTpUH9ctkn4v2JdSH307xVhQ8+0jgMvXIwHUBEpxKOQxWh
	qsKppD4qye+3q7wVBTijNFDMwKLrRXKXVxvmnYOjLXjWc/D1jwF0bIyszsdaQOeO8HIxlfyYzpU
	HRonsK20W1Zpq6Na7m8oUOqcb5dyLZ4PTHcdg/ViSMSaj+3GO7YpsjeDwELBLc2aSIqurDCJwyu
	Z4wxX3tpS8wunLlC35G5AWHrxAWiIcHhENbrTvg4fD6spu1wzQdgnduq/rf8shczQ8nVAlUrfsK
	t1/DXSbaDdgdlucwhGItN0HA=
X-Received: by 2002:a17:903:22c7:b0:216:6901:d588 with SMTP id d9443c01a7336-22104034f22mr362288265ad.15.1740044542632;
        Thu, 20 Feb 2025 01:42:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHAFrsQCsrhnXkXShXrGtgzKREm8ND/PlDw2E4ELTjPoILnIMyAHV/W9gwhM2IKoy/z/ryxg==
X-Received: by 2002:a17:903:22c7:b0:216:6901:d588 with SMTP id d9443c01a7336-22104034f22mr362288025ad.15.1740044542231;
        Thu, 20 Feb 2025 01:42:22 -0800 (PST)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220dacfc769sm115526905ad.201.2025.02.20.01.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:42:21 -0800 (PST)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2] wifi: ath12k: Fix double budget decrement while reaping monitor ring
Date: Thu, 20 Feb 2025 15:12:11 +0530
Message-Id: <20250220094211.2445395-1-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LCgeVZfbgPXJDURzB3g0J3Xz8nLIakRE
X-Proofpoint-ORIG-GUID: LCgeVZfbgPXJDURzB3g0J3Xz8nLIakRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_014224_077239_99BCB53D 
X-CRM114-Status: GOOD (  12.24  )
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
	- Corrected version log.
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


