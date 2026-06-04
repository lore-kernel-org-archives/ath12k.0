Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00529CD6E57
	for <ath12k@archiver.kernel.org>; Thu,  4 Jun 2026 09:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=muhimI+VyPQWL9gHHLyisz5qiD0UZSwxGEQf6ZfTf2s=; b=AaTuyiXzZo/ZbG8o/xM8Ci5gkk
	M41hOV4Aezb9F9Wqr/GUktxpLQNfJ9NdiA/8ZR4d6vxlgEzd1unZhg2qneal808R1S7+Zoz2UQjJj
	jSNO7pJLSTb1iAma95C7+hxIjmLcuXJKFwIgVduMzD5+c1RY+SUNIzgML3En+VOt+cpcFgfq7ZrC5
	KqCBn9nEuBh56xIo2D2F7Gt3nVx7ItDZSoVnmU3yC+iS+oC71impomfU4Fvm/PdI8peUHqn3XfZwb
	abks8EFixBQxqnZSej3x4iZX4emc78KcYAkGs2KEeW6J3zW0i/p2y/IziDCmKues4wD5JTOWE/BhF
	5BH1wgrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4qq-0000000GXIC-1czi;
	Thu, 04 Jun 2026 09:59:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4qn-0000000GXHc-2ZWA
	for ath12k@lists.infradead.org;
	Thu, 04 Jun 2026 09:58:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65488u2V598077
	for <ath12k@lists.infradead.org>; Thu, 4 Jun 2026 09:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=muhimI+VyPQWL9gHHLyisz5qiD0UZSwxGEQ
	f6ZfTf2s=; b=cSD8pd4tqEovszlXqIUWCZ73ExCvICtcNM5DFEanOnoL0AFPyTf
	U4Ti3KctpLGmOXgG+x1jLVwecCNhhbMjVksYMl+kruJlQflcVeISqFWp9ofOiY8z
	jhgz1s/bRef1rJrQBKm5I9JS9ezAHjFinW8dqqsEhfwZ0cpvZu9jlNW/9yCzJ7dL
	UHhCOV3MJcCxjC7u83i23wmoCmh2BBMYc+ZNSHuHm/XbDPvgGEdBnwM9Y6HLymo3
	bD9ve/wq7r2Pm4TkMUwFxGoC94F7WQfHY3luEBUMX/gYu3ZVAy0SDlpBpYS9tUFh
	MWlAczkcpWeZNid2Ke0H0vJ8+BHBNLsMiXw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy8m1rbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 04 Jun 2026 09:58:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8592a62f32so319476a12.0
        for <ath12k@lists.infradead.org>; Thu, 04 Jun 2026 02:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780567136; x=1781171936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=muhimI+VyPQWL9gHHLyisz5qiD0UZSwxGEQf6ZfTf2s=;
        b=UHJ+RrdX6/qMOi1kH8kOJn1UFU4n0cRIyfMQSwcsxjc8i1ORCiIYkfp0ehsI/pi4kX
         e7iKqbCxl4LYLitGGA3rn4DuM/iGLp/f+DVdCbkTK90nBJ7wgthMd53FmnQp4F8jP5aM
         5lHnBgKdUm0SIJasWPBMvmEFBftKGCX3g/x/l6emK0P90iLg4a1SbJy7R+dIQTWRzuOk
         JkUBUmlkCdS5sdHUKSL5eNOv/h9B/RAM/ouZDIGesDRDZZp09RmHBYbMMmMUjf8wk4ld
         jwkF7UdiY+FX+rz46L6gTKwDOczoh2ICpkQuqIffkUHeCYVXrYoGjFCxN7RjohCON2G1
         mxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567136; x=1781171936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muhimI+VyPQWL9gHHLyisz5qiD0UZSwxGEQf6ZfTf2s=;
        b=b3ik3t2Sv4pfgMqzHN6hFzoIxnDd7LjXNAHlSkvwRSu2o9yXkKRnvl6Pb1fMZT6X+c
         Zr87p9FvP66dflfHEBCIzN2V+aBsoWkuATs2VWWNypPtd9DOIyskryju3k+SG1c9YrYU
         TAliPaSjEXgPcREJ5pZ+pURREtELVdXXSky81mE5Etpwkockqv9vyHM8wwT/hznLS/jU
         aTkAb6oxX8tmrU0AHWczt7Q1Mra5cQu4YaXtYRw8ezzu2QsFhkWTt/qCY7Y95sIKYB6B
         wfHVQg/hsLokJwS6B+9PzyjZ+igi4Qj7jsfwcmsYAtye7c3nRHyvYrI6IK2zdAHzWesX
         uk/A==
X-Gm-Message-State: AOJu0Yx3xKeL09nmn3D/tcS82EFHKq98WP+oymanBlpRBnOCWW2HT/IZ
	buT8r9FQ3ZKJ42fj9mv9UYDx83u92JmKnax6jE0FvRsy+1Wi7Kc321glGqWUOWJnkinwlbCCqW5
	L4PsS5YJ6N87+Kp9fY5TLRVLibffH6wTnQVsT4e84IBuD/ZMhyBgLrI1rOGwEK6xGvMyImtiX
X-Gm-Gg: Acq92OEBXmwSvgm7NGIdzO0Gph7Q6BmCpycw+EAJ0E8vfQnH59tJTeUw/Rv7iBhHOJb
	bUtjYD0/JJiZ90Q2I0/2sZloz/WtnEQbWeRTBXMKY9WuMRyanrxeBOGSUSWsRsuyujy4erFh2iZ
	f7j/3Bf8tHGMXHi1pOF1YKzYRhQ1mmV4tfqeXdvLa5U6hl9vU9xOJywY+9KoC6Jxkhqbqkv2rJ3
	zwtNAnNtY4YGNAGEohn35rf8e+DFUd/ld1K2QFlkoGCOOBDJs6QeW4zGIG337F+0vZduA1JZm8P
	5+nciLtpSQS6ADIQ3mPf9jay+gNCtD8WOnNYUVlskpqGn2mZVUZQSaY9tL+QcEazNlOf2jVH49B
	vLZS2hGxCfVtPzJf2F+wQyyXbfpHI01ToswGPtmlU88FW1P9x88TDVHue69VVvCMO97zkeg8VAm
	uMJeDgVdebXhQX340GwcD5Rb54hIQn1yFmZ0awzzWHrEHcghlQ8XR6yWccpXsWapIqMA==
X-Received: by 2002:a05:6a21:9090:b0:39c:5624:ee53 with SMTP id adf61e73a8af0-3b4975f9c42mr8093038637.24.1780567135941;
        Thu, 04 Jun 2026 02:58:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:9090:b0:39c:5624:ee53 with SMTP id adf61e73a8af0-3b4975f9c42mr8093021637.24.1780567135432;
        Thu, 04 Jun 2026 02:58:55 -0700 (PDT)
Received: from blr-siroccolnx01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df03387asm4881500a12.4.2026.06.04.02.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:58:54 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Wen Gong <quic_wgong@quicinc.com>,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: enable IEEE80211_VHT_EXT_NSS_BW_CAPABLE when NSS ratio is reported
Date: Thu,  4 Jun 2026 15:28:31 +0530
Message-Id: <20260604095831.2674298-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a214c60 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=d00PuZDYcvi_FAvzKJQA:9
 a=bFCP_H2QrGi7Okbo017w:22 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA5NSBTYWx0ZWRfX+fE0kp0gkejz
 DXHN5kv2aoI28AxsRtKAAe72rFAvZRnpy7PpB2N4w7AOsLGh62DkwfFAzlCSNsxABhGGYf13aiY
 pkcXH8mYqx01MwdEnb+mSOWdoGlKFTolTBQSCfwAYQBdF4mJatg1gWLvyFj+rQbbFf3jWDAT5jT
 FQMEefGN5Gx6KYZG8aQWaEtJr2XsNluPq63McuY/lRMUcGQASFTUxe0uvoGkMTM/DMmOLmL4wma
 NLvIpxCHTv9Pe+Nert91V8Mui6UX02vETnpJoV89hJy5TMh5I3EuS4oPZy1qqiPsivbHVkIX0y+
 N35I448wcplBOGmxspO+VeVytoj+5upSN25qokrYT1Ef0D1e0XauF5wltJ0GjxioX9X7tSs9qPP
 58ZnK2OL/3FLVC+Yqesu61QZXJ3tEJ6/LpVh1U0LeNfxlH9wihXG5H3tomhDdIJV+gKSbS1/IrF
 s1PE3fWjCB9lLTuSYPQ==
X-Proofpoint-GUID: taQ88PTIjNV0dyK9xhDBmNq-8xwIVz9d
X-Proofpoint-ORIG-GUID: taQ88PTIjNV0dyK9xhDBmNq-8xwIVz9d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_025857_660222_693F8A43 
X-CRM114-Status: GOOD (  11.88  )
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

From: Wen Gong <quic_wgong@quicinc.com>

When firmware reports NSS ratio support, SUPPORTS_VHT_EXT_NSS_BW is enabled in
ath12k. However, IEEE80211_VHT_EXT_NSS_BW_CAPABLE must also be set to make the
advertisement valid.

According to IEEE Std 802.11-2024, Subclause 9.4.2.156.3 (Supported VHT-MCS and
NSS Set subfields), the VHT Extended NSS BW Capable bit indicates whether a STA
is capable of interpreting the Extended NSS BW Support subfield of the VHT
capabilities information field. Advertising extended NSS BW support without
setting this capability bit is therefore invalid.

Without this change, mac80211 detects the inconsistency and logs:

  ieee80211 phy0: copying sband (band 1) due to VHT EXT NSS BW flag

This indicates that mac80211 implicitly aligns IEEE80211_VHT_EXT_NSS_BW_CAPABLE
during ieee80211_register_hw(). Explicitly setting the bit in ath12k avoids this
fixup and ensures capabilities are advertised correctly by the driver.

This change follows the same approach as the existing ath11k fix.
https://lore.kernel.org/all/20211013073704.15888-1-wgong@codeaurora.org/

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1

Fixes: 18ab9d038fad ("wifi: ath12k: add support for 160 MHz bandwidth")
Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a6e4b660da81..af354bef5c0d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8489,6 +8489,10 @@ ath12k_create_vht_cap(struct ath12k *ar, u32 rate_cap_tx_chainmask,
 	vht_cap.vht_supported = 1;
 	vht_cap.cap = ar->pdev->cap.vht_cap;
 
+	if (ar->pdev->cap.nss_ratio_enabled)
+		vht_cap.vht_mcs.tx_highest |=
+			cpu_to_le16(IEEE80211_VHT_EXT_NSS_BW_CAPABLE);
+
 	ath12k_set_vht_txbf_cap(ar, &vht_cap.cap);
 
 	/* 80P80 is not supported */

base-commit: 565257a857690244211d85593b2cd490ce86783a
-- 
2.34.1


