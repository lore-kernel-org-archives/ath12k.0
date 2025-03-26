Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023BDC36008
	for <ath12k@archiver.kernel.org>; Wed, 26 Mar 2025 21:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wTpmiNrvScDshMA2Xa6+2A5oFuulYighfjGSBQgXOLY=; b=vpm5rFjP9Y0ac2jOPD2EWC4i5+
	Ulhwx3RjBLZrLN1mMl/2H1B8JeLHYM23p8vZ9ZSQtrQZalxYpGq+vz4JaI32ikZpP+C+yhjQa09jE
	p9yhx5nP7KUxbgsdo10YA38fF48uJdZe1jF5138JFNhUmdlvVbqcqt/ASNMsJuf4Hs7OoB0qN3kzN
	dstST39Wc/4tdNQIBb3NdVplE7PjLbpmMz7/1QFdQ6inv7R5H5JYK5vpFmPVqPu1HT0xoYicA39mr
	sGfIVlJWvE+VoW/+HsVQhXrVlWBEqBvTkhQ5LsN5YSnEHzpQCyjgPpz2BysN6zkV7XL6MVJXWGZNu
	MgL7vzig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txYPc-00000009ecy-2faG
	for ath12k@archiver.kernel.org;
	Wed, 26 Mar 2025 21:35:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txYPZ-00000009ecb-1SGe
	for ath12k@lists.infradead.org;
	Wed, 26 Mar 2025 21:35:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QFH9Zv023554
	for <ath12k@lists.infradead.org>; Wed, 26 Mar 2025 21:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wTpmiNrvScDshMA2Xa6+2A5oFuulYighfjG
	SBQgXOLY=; b=lkNrU57qivuAar3a/GMXvckn21JGPhxtPgx3j66yn8eLlDqoBE/
	Gt7eRC9+hVJ9LbG8AgCzAlYf31SKWb3zqVmBTrPXNAJlyeLsrlXmsL+iTK+fp15I
	ArdWOUKUq1LFvdWxEVLgZB7PGG+wMRtI78ciiHIPvlZ3sD7XmxGesqYFEdBiGhEN
	hrhutgL37rSLIxURi93Shd/X9/jOYwB83QKrO+22eBUmcM6yk4Y9AiOTrNPvfTcf
	pddPa9wmf6KJHAxvwn6j8W9gNHHYjgg417/d2hEsfYK07vh4bQZfbkqM9tl92UbN
	eMc2/epZVr507PzmAyLea5I6NnFJZt3DuIg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m7nf370t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 26 Mar 2025 21:35:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff55176edcso600360a91.1
        for <ath12k@lists.infradead.org>; Wed, 26 Mar 2025 14:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743024943; x=1743629743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTpmiNrvScDshMA2Xa6+2A5oFuulYighfjGSBQgXOLY=;
        b=UjtQ+l2LztDSrNiR2K0LSmanuPE/I2Ujtwag+nGqkrxeV0w2MnoFehqchrthj7lryz
         f6F47zZXnc+vs+m8/8RSbGnvxaGVerwVoIeunTZ052xN+AUsp2jp9ZFIF87us18K6FRA
         PLmj48HREBvjm+vPsAtxZ6P3RaLEf60kL51nfP8vl1fSxjXsTJHIayGTSzkFKQqkOTvz
         4/4GBQTIh1OBgBdMegituSKwCx9d6eizOhlJ7slxg2XUjJsLQw4A5MzkqGwTm2r2O86s
         5HzQVsph6idK+jaRwuCS7FU2iFHVfP+uu7tjCdfyMxf6Sr5ns9/WeU+krsIATpPCzJ0r
         y8PQ==
X-Gm-Message-State: AOJu0YwAl592Wju/rR03Ox3IGISKQPzNKpmtmBftDtCmae7XD2+Psp5E
	RhP0H/e9yUgiH3Lhb88tuUdc9bCciOBVSm4tlu5jD5yBf3Df6CzGiL6qNHH2LaCdJrav14xz+X3
	FUyeWEMEmQVzSB5GbgkZZveF0QjCR1Z7uwWKwSKbzfd05C7RD8uIBSjcG+grRICHV3jcH
X-Gm-Gg: ASbGncuTSST7O/8pig1LDuic6ZB+FQU+Kqs1usc6DMVgYmKZOx1tSy7nSwMhHhee7XH
	jVnsaZuWNTBkrq6e1i4976VtBUyhYutHFysZNQFcOcOlt1klPQ7+K4whuI+V5Icz7bfAxv7WFne
	nJ+q9ZBlM8H2YZ7wA5mDygVZ/YHJaPZtVGNTK8RIu0sUpTwC/PwWoOaJbI2U/eeL2ZNcPCxmUFt
	xoN4rxb/jWkDAmSdpN4e5VPZi6izOr1NHPcSKe0NUqpX7jNVukLtzjouSqaTJWp45VFuMtvBED+
	xtign8ZEydpd1peNx+Ccx5v8bPn6puvRE1Bfgn830vxmME405UfO3VKnaTCwn33g5TI70qkB
X-Received: by 2002:a17:90b:39cc:b0:2f1:2fa5:1924 with SMTP id 98e67ed59e1d1-303a85c19dcmr1426659a91.26.1743024942672;
        Wed, 26 Mar 2025 14:35:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3PTRmySKpMHkK8ePn89GyLRspSje27x86TVoVISqp3TJAN1rvFxOOocWxhn/FGmNWbuHlhg==
X-Received: by 2002:a17:90b:39cc:b0:2f1:2fa5:1924 with SMTP id 98e67ed59e1d1-303a85c19dcmr1426629a91.26.1743024942067;
        Wed, 26 Mar 2025 14:35:42 -0700 (PDT)
Received: from msinada-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3037c8de90csm1099902a91.0.2025.03.26.14.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 14:35:41 -0700 (PDT)
From: Muna Sinada <muna.sinada@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sidhanta Sahu <sidhanta.sahu@oss.qualcomm.com>,
        Muna Sinada <muna.sinada@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Fix memory leak due to multiple rx_stats allocation
Date: Wed, 26 Mar 2025 14:35:38 -0700
Message-Id: <20250326213538.2214194-1-muna.sinada@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iX1_Nc5K4sfY2e9v0IY5nAUcyHgA6dLg
X-Proofpoint-GUID: iX1_Nc5K4sfY2e9v0IY5nAUcyHgA6dLg
X-Authority-Analysis: v=2.4 cv=IMMCChvG c=1 sm=1 tr=0 ts=67e4732f cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=R-JEC9_UMzOm0rXJ7CcA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_143545_391919_FCB8FB5D 
X-CRM114-Status: GOOD (  14.27  )
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

From: Sidhanta Sahu <sidhanta.sahu@oss.qualcomm.com>

rx_stats for each arsta is allocated when adding a station.
arsta->rx_stats will be freed when a station is removed.

Redundant allocations are occurring when the same station is added
multiple times. This causes ath12k_mac_station_add() to be called
multiple times, and rx_stats is allocated each time. As a result there
is memory leaks.

Prevent multiple allocations of rx_stats when ath12k_mac_station_add()
is called repeatedly by checking if rx_stats is already allocated
before allocating again. Allocate arsta->rx_stats if arsta->rx_stats
is NULL respectively.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sidhanta Sahu <sidhanta.sahu@oss.qualcomm.com>
Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 842eda56c8b1..f157a85111d9 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5663,10 +5663,13 @@ static int ath12k_mac_station_add(struct ath12k *ar,
 			    ar->max_num_stations);
 		goto exit;
 	}
-	arsta->rx_stats = kzalloc(sizeof(*arsta->rx_stats), GFP_KERNEL);
+
 	if (!arsta->rx_stats) {
-		ret = -ENOMEM;
-		goto dec_num_station;
+		arsta->rx_stats = kzalloc(sizeof(*arsta->rx_stats), GFP_KERNEL);
+		if (!arsta->rx_stats) {
+			ret = -ENOMEM;
+			goto dec_num_station;
+		}
 	}
 
 	peer_param.vdev_id = arvif->vdev_id;

base-commit: c0dd3f4f70918cbcdd8da611811036a91b7dce33
-- 
2.34.1


