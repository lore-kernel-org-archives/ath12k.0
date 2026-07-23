Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE148C531CA
	for <ath12k@archiver.kernel.org>; Thu, 23 Jul 2026 12:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8vCpuwFlIE7J68gbfeaPjuoEMsKTxTMOFUwfz2f10NQ=; b=Cv1at7dYLQWxOB3Ki2SvDMM1d3
	wFx9Ejc30/PqypeRj3SOFcWdHUcQrxVMhiw40fSYyNx2zsSIpq8IYQCqHPFilDaNda7HcZS31WkWz
	HG+qlcVsMccZbsiwekVDRK50/focnp/jxwl0N1nb7FLKwX31V86WgPntweKJF8NFathE6A1yUEpul
	SbQCn4fsuzrTChAg1MlcLFhuZYLdamXo6jQxyti6vXd9axdiED1rKgkTA3ekuTFcM/e5dksjMcvrQ
	zdHOc6gZBb/0rAMjaQxa1Jm3NsGC9T6VY9vhKtjZZMVZacfFtSTegaHtoOtzG70TelMyDnY3Ybm78
	3ltYMmzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsxA-0000000EHae-28Mt;
	Thu, 23 Jul 2026 12:55:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsx7-0000000EHZu-3fNH
	for ath12k@lists.infradead.org;
	Thu, 23 Jul 2026 12:55:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NC67nJ3833476
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 12:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8vCpuwFlIE7J68gbfeaPjuoEMsKTxTMOFUw
	fz2f10NQ=; b=ZxDW5iMpNTDK71+QEAGAzq2BBiaFlApDBa9jbYYQYMmgC3bAjXu
	MhJZQ7ggFZf0Cop1/dBp2yrqdvoEGuSzE2HqcnlzmAEvsxDo17uuMPKrl2d7ouOY
	LBilYi8feOi9eB+u55qveFmsgbslmVYM1m9a9vf8c33TG7cVYHe1y2I76COx5ymg
	OPrkMeC4U/BH1RcrmPRN83GnvzejfnPEE81gSIYZILVQNyjkyVXZxhIvM69Be8Ai
	Mu8yVSoJ889vCqz1q6Espks0kr+XkOD2fFo4/znvhwfQekHmjNAda8oai3RRI6nV
	Lsj1LV2CKNZ7qxAChlWugGJWC3ry2iSvuTA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnu869f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 12:55:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc88e22f92so16007155ad.1
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 05:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784811302; x=1785416102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8vCpuwFlIE7J68gbfeaPjuoEMsKTxTMOFUwfz2f10NQ=;
        b=UlwXEm+U+X0efyiXtpaX2iAEBu3/N5TNWvvu8l7z21a7WBvD8ZRp3dIs/01J/deyjJ
         30UqoOHP8KIodUM22gY1pYZEV32iqoeR1ZRKxVh9h0KO/j64bpLpQvBpn6EKvHZQehtL
         ciBJdNIlneAJRYwtgj8agIL8LDA1YGoEzxXYlmwYHZhLPUU7BY6+Zcy3ObEaZdQUV5p3
         w3PUv21wAFtY9+X4lCxDVqjsCOY2vG5RPsPeqOXt2nRA5eqV6ZcekkoGES/vco1WdMwf
         9gvI8JcSVDvaF11N5eevtqTlCnm6ytqyJlKTBXy1+e3FEayMdRoWiCbj0Rm/V6FdC130
         67rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784811302; x=1785416102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8vCpuwFlIE7J68gbfeaPjuoEMsKTxTMOFUwfz2f10NQ=;
        b=FpHsdh8ma9albMNYpeQASdwAXBpyvQn+zTdW4eu9IDaBu6YCCFhhhflGT7UO1fBInv
         jd3K3oYAwRLX8QbK+4OmxxhUqhzfTG6RQXXEZWtVVkHkqxKAB3mpP+rcbsDA1aWSkWVD
         g5ShYX1YLRNwOFqsRdzS9GYOL4yTFaGAMwpncR/v025I+xZbGMvOSL3M2e1+Mmi07sWQ
         kCVZaiM1WC/k497NJHsIVOZTLpKoW6QT/gWC0FJSkhxO6P38LmFN1bxVE90/EsZRUDfc
         1n3zVUZZNE2qxcNInO7TcOa/uzur6SOJg8WM9OrzbeTXS+qYEKqOS53HtcMb+xBX/evY
         +qAg==
X-Gm-Message-State: AOJu0Yz39P3fMvKdyWWFaHUdNVV687o8bvn1dcrzn2wgFgqHpJgT/kXA
	cdQwJPK5eU+GpWIQGiVO3D9QAka2Eb3nt9P3lWo8hKa6uOrGZ/op9ZSCoZqE2MB8SgSK1ig6tHX
	3NBvs1L62/cSuCI89K3kgLCutwsqX/sFFcnrGbn2feQ+IvI6UwzuK5V1u0t+qLdq3B6rNY/6j
X-Gm-Gg: AR+sD10h71T58fPhRTjbcLj1vEyGr96wCEfBZpOzRViLgQiG75eJ+uA6xQtekKqjrmZ
	hnXuDqokNbg5egXwqtndOvQ44+fsBw+2vyixqgMnvCtrB8TCFc+VcdRJlTfwnyCo/r2ntHEpm/N
	vNbWGHif6LexlRNiNnc/GuRr1eSpAugpn9F9c62ttAgEIox0Abpo/vA4sUHkrGnytHjAyVQeuSn
	pY007c2nqFYzxfmN1qMmCXYLNhL1OOVkMwU0W5w1juruJOsfrXPf7EGiz+CWu//tLIjyH2eM97t
	b32ZsKF27gHsJMiQZgCH3bvvtA0UEg6X0dlQV2i8rgK9TKgN/sHp/gKClMNjAPcMKFObyVbOqo1
	XRz/7LtfEu7EZdSvwdu4pRqWQAAhauT8UDh//QE8QiQFYHd/rw0N6
X-Received: by 2002:a17:903:b0b:b0:2cf:9f0b:b560 with SMTP id d9443c01a7336-2cfa748ca31mr36991655ad.29.1784811301983;
        Thu, 23 Jul 2026 05:55:01 -0700 (PDT)
X-Received: by 2002:a17:903:b0b:b0:2cf:9f0b:b560 with SMTP id d9443c01a7336-2cfa748ca31mr36991305ad.29.1784811301425;
        Thu, 23 Jul 2026 05:55:01 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f350475sm32998385ad.70.2026.07.23.05.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:55:00 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next 0/8] wifi: ath12k: extend device DP stats for TX and RX observability
Date: Thu, 23 Jul 2026 18:24:40 +0530
Message-Id: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jRA8U3M1EHdzqafPSnInJ1jmnuBgU6rc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNyBTYWx0ZWRfXxf+hjO4f4kae
 zapouPOnCNNrjIceeqxkngIgoojzGnQNi+tPDECQymEPmUBOUenHkHxo8aWEaQQ8hnm5K3ZIUDK
 9YWOYZ4FKiboVm/ewE3iLoHY5JOQ3Jf51LdJzkN7ybfA+q85fpPKOf55abnXjDuH/K3i8J5taDQ
 UJ75Fu4ZFcWECkVx6lPAqYpiDfN6cFX6BrPd/NVYWrbZoHpPzjwOupsQD47KlnjJWQ5ZjbIzZ/i
 EFurpkhcMLZmUK5Sr0yPJ6XtRE8g/4X1mZc6JjEccDESDkk0vQqbGEC5N7v+D/gEZIvqYeu7z/A
 vDhQXnJBY89kfHalijGVX+0hVPdY09y9BcvfA7nSCqGqHBhyVuCr5Ju4sk6nqDzZ8qwJg+vgK+U
 5Z+FbojSIaS9eheGRBbJbNmAr0j/gfZnLPZMtjy+sk7aGa0RfRLSmAkgS4jARTwmgWLtkF/aPoK
 iJG6J2LFoJYOHezX/uQ==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a620f26 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=XRJRJbIxxDQRkIj6_doA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNyBTYWx0ZWRfX2zywgmCE1UEl
 RF3n7CoEtbh2gYJ9Jvdgiw9dLBQ7bYVMZDvyZZ2q0WEhjaV52xd3JYbBBWMtX/1K9qL2OASVyCs
 En7kW+3jUVGWWjmdJnwr+wCXrsY+WDE=
X-Proofpoint-GUID: jRA8U3M1EHdzqafPSnInJ1jmnuBgU6rc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1011 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_055505_921996_E04D51F7 
X-CRM114-Status: GOOD (  10.34  )
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

From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>

Extend ath12k device DP stats for TX and RX path observability.

Patch 1 fixes out-of-bounds array access on TX stats arrays
fw_tx_status[], tx_wbm_rel_source[] and tqm_rel_reason[] by adding
likely()/WARN_ON_ONCE() bounds checks before each increment.

Patch 2 renames the local variable wbm_status to htt_status in
ath12k_dp_tx_process_htt_tx_complete() to accurately reflect the field
origin, and simplifies ts.acked to use true directly.

Patch 3 adds a per-TCL-ring TX buffer allocation failure counter
txbuf_na[] to track how often ath12k_dp_tx_assign_buffer() fails, and
exposes it in device_dp_stats debugfs.

Patch 4 adds a write handler to device_dp_stats debugfs so that writing
'reset' clears all device DP stats counters without reloading the driver.

Patch 5 introduces a new dp_stats.h header with the
ath12k_wbm_err_drop_reason enum, adds per-drop-reason counters in the
WBM RX error path, and exposes them in device_dp_stats debugfs.

Patch 6 adds a per-REO-ring sent_to_stack[] counter to track successful
MSDU deliveries to the network stack, and exposes it in device_dp_stats
debugfs.

Patch 7 fixes the REO Rx Received debugfs output to use 0-based ring
indexing and lowercase "ring%d:" consistent with other ring counters.

Patch 8 adds a dedicated sw_desc_fallback counter to track how often the
WBM RX error path falls back to SW descriptor retrieval when HW CC is
not done, distinct from actual packet drops.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---

Aniruddha Mishra (2):
  wifi: ath12k: add WBM RX error drop statistics
  wifi: ath12k: add WBM SW desc fallback counter

Hariharan Ramanathan (4):
  wifi: ath12k: rename wbm_status to htt_status in HTT TX completion
  wifi: ath12k: add TCL ring TX buffer allocation failure counter
  wifi: ath12k: add device DP stats reset support via debugfs
  wifi: ath12k: track per-ring RX sent-to-stack count

Pardeep Kaur (2):
  wifi: ath12k: fix out-of-bounds access on TX stats arrays
  wifi: ath12k: fix 1-based ring index in REO Rx Received debugfs output

 drivers/net/wireless/ath/ath12k/debugfs.c     | 74 ++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/dp.h          | 14 +++-
 drivers/net/wireless/ath/ath12k/dp_stats.h    | 25 +++++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 52 ++++++++++---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 29 +++++---
 .../net/wireless/ath/ath12k/wifi7/hal_rx.c    |  5 +-
 6 files changed, 173 insertions(+), 26 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/dp_stats.h

base-commit: 32f39e331f889a0424f7a0a82893f628e2705727
--
2.34.1


