Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FB6C44524
	for <ath12k@archiver.kernel.org>; Thu, 23 Jul 2026 05:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l3uW30kCIOs6Eb/LpaF0etfTCQFf6lMp8xug9C7mWkA=; b=q3UZ8PAX4F5Ddae0GJ298u8JTU
	q2uNl9ywKK3tMPNyKKAldiSY7IY8AKtVHk70u76pAyJmRtD2JONCFYhj1LWq98TMYV842nesvp/WX
	0g19rhcwl4Mpqh8XuW3qJWSLfgvylq5q0W1XEEKs64Lv7BEWq8DII33Cqdy2jCQISWvb0+XdU84M/
	Qdl32CbvvYM0FM13CWkLmtp5peLa/xHL/2gQ95Y1N/EmrSaMHm4X5nxneZZImaX9Gn/1Yd+ozZHzl
	5Vs15LEnCEOASdgWmeq55bAy21RirvqqjSw22T/UhEkPrdnbW4fJopguh+JarGmg6yDTmyhX8dcdq
	uczcYbWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmGu-0000000DV2p-0ZTV;
	Thu, 23 Jul 2026 05:47:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmGr-0000000DV2B-08qx
	for ath12k@lists.infradead.org;
	Thu, 23 Jul 2026 05:47:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N4vS5D3246437
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 05:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=l3uW30kCIOs6Eb/LpaF0etfTCQFf6lMp8xu
	g9C7mWkA=; b=K+0n5YQDyto6YsEVhonRt+F9aHOm/hSLvMYpRWcVfg0+j62OQzm
	bHmrEufaEoQfWX1dTmp7KrqKFAeCQfdwX/4CNcHlXVMX9z/x2Il+s8shlCr7svWw
	MxROWSdBihDXsr/2pPHWfobDogVR5fDWpli+Biu7aye1RUQvdeweIAQepIvytOUp
	vdljWGutQxjOaLZoEyhAQSbKt8QPI5mEDJivJ7EM0CwhK/4ovtgJh9MGcmFxx5v2
	5POVO3au6h5bYggxsB8DGLt4FMCs3BxYOgwpM7OWdN+fL9xO089jMlk5gY2YVnCe
	ewmSlDI3OzMFSxl4eo7hWMmFmZ0Nr+6o7sA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b5177y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 05:46:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so515526a12.1
        for <ath12k@lists.infradead.org>; Wed, 22 Jul 2026 22:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784785618; x=1785390418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l3uW30kCIOs6Eb/LpaF0etfTCQFf6lMp8xug9C7mWkA=;
        b=j77RUv4Do05XrZmRaOtL9OXYTsXDq9BXlrw7xm79HkjdGLUnPg1syaT38Lvn6E9UUE
         z6DvEI4vBKIgvWstrcVZLXdMo5ps3n3PpIkSItzj9Va/jrZv/biO8miz7f9QjKKTd532
         hdI4CcKVHdq3LYE7F8BBDZrvwbFMT+PwbyGSg2zi0UuqzJN7N7QZfPBoOdYj5bRdHSX6
         PRIb3oqWAhawTgrtGFA9NrWKBvQcgK3TxyLlhnnQ/cGNWSkps+bwpQTyJrH1AylOB3t/
         n1uH9vrXUuDowcc9l5a4D7VmdCfAOHa/m0LGSkExFf0um8nfV04c+FrVeAWE0ouqU5Sh
         YZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784785618; x=1785390418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3uW30kCIOs6Eb/LpaF0etfTCQFf6lMp8xug9C7mWkA=;
        b=gEBw/XvxlLrykTWVBdH7Vw8b9i11mt+XviuVxW1af1nVNNQlKaSsm6cyCTJyBxKu0X
         TObKN6IsGHHP+YG2DXxE/Dt/mnKCC0blOw45ubivix89N9FFyw+DBOPhJYD+ZQ5TzkRh
         Ujly6KKONCnH4RsBKVBvzBzOH9YRw79NK3Tv6j9mLrSTfcp1num+4OUZefJ+PiTOmmGr
         zAh89OR6VZfQNJ76k2eiwePUCZpB45rVUv1VVq7dXvg70aZ168IbxkaobiHTWZtN1Jmp
         baZP2kWrxEjV1lggdvzYGZtvBFwoIEQwJcb+7tvuon4k87ugS7Pk/f94AeOwAJ4ivRSV
         WMiw==
X-Gm-Message-State: AOJu0Yy8jDRuyMvBhqLjRndKBcYShQK3Xe9/6oZyftaAzKxgsft3zttC
	K/wOrx0qSJV5AETMIfmIkKg/VnuG/ndi2BzI+3EIr4N6wawV+MBC/j35qH44OvBpM0/wayI8R4r
	6c4rxAAAPPTdgmZ6ErhazYlGYDHKqcmS9rCJKqpZdwhmCh3g/tcICgyeT1qazEkHLnUaDu1gw
X-Gm-Gg: AR+sD12bRuYYBbJrRAUCMI0dzepa8VYsxt5jKfO0iFjT+a119kHPtfXYPqX+YIDCXKw
	IYj+yBGD61mmNgmRVDGY8OM7PFiOqnmy6tShE48o3Llb3CcxbgHDJNgqj2PpMLrFHtZgVmxqTEK
	lFFUZyi8qP0/jyF1EfT2ZJlCnZXIElA8QGAtcAdeIt5vanHCn6DRFhCH5z+tVQpRT5g45+8rdeO
	4hF8se/+T5dTbrufEXFPnRzUPNHy0WVq2VOyo5q0RLtuD82B80h6nBqtbCSGOTsQDQgMLOoD64i
	JbMQcEekUm5BfKyJRr30gZCyaaVW/P6OQv2DjhBl2jVrju7BzSsrLte6Ej+z2GwyVRJIelwr43u
	TP+hPk+TmdRlMoZ1vxBT9+eqHDVakEF/2OuXRhgndil4Ln7EMaLy8Z5f5AHyp9j1JBz9QK5nORc
	JwRGLzyGXOFhw+Igq4aHrGSmUQ05tRpo1n
X-Received: by 2002:a05:6a20:a11a:b0:3c0:9c19:65b4 with SMTP id adf61e73a8af0-3c44b2ae267mr1550615637.76.1784785618007;
        Wed, 22 Jul 2026 22:46:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11a:b0:3c0:9c19:65b4 with SMTP id adf61e73a8af0-3c44b2ae267mr1550597637.76.1784785617570;
        Wed, 22 Jul 2026 22:46:57 -0700 (PDT)
Received: from hu-pnandesh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e088d3fsm16053063eec.25.2026.07.22.22.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 22:46:57 -0700 (PDT)
From: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: skip MLO multicast links during crash recovery in Tx path
Date: Thu, 23 Jul 2026 11:16:53 +0530
Message-Id: <20260723054653.2794550-1-pavankumar.nandeshwar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA1NiBTYWx0ZWRfX9HyP9XQsP1nQ
 xMgB0zbKDYhR03+xB88xds1YNAl6f8xN9nPuBXiUw4bjpia/1TYKQOL9/1DhfBqfyooJFNdWDg1
 gACQGC6AjEXdVkAr/YXbPaTmeUNliRtFEdR/2hyWa9PP2GEeYn4vzGQElOjjXiao7z2Y3izBhLE
 IHjypUN+rU3RwUujmFkV05Np0oogvumjQb9RVez+YTxjXY3ZWH3y48gnqPNSPaHiLRvbCty5+B2
 fB0jjCr1SEMnEKzfAiW6pAK49k+LTgqPhz8laHMNIS+/urY3/cWMW+lUMFjaYjYRH5LQ/n7EAmg
 A2jrJvk6bRRT5vaT+GR8ASXmBd7Rw+vWYOGnG1ng7g8urbQdk4rdblSWfJMX0fnHHUlKRdgF4yy
 DBiGca09YT4f5J2dP6Da0FzJqBY3vrOz+hz9REAmz9Yp83qvwjr26XtEYm0N0eWknnxY5UQLD8z
 Jp201eezuMoaOZi5L2g==
X-Proofpoint-GUID: 5jRGaaD9AKMI47P7ran_CLkfhxwyDNZc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA1NiBTYWx0ZWRfX0iDuUveEtWtB
 8eQONcJytOLMR3gfIqou4CylPvXVSad+bnhH4CRqYb5ylKBu2ejX9paJq/trOwHJgjVi9oodab0
 ufGx7fE0d9mxys/XK2A8KbhtsEDy30A=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a61aad2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=BTM6Z11oJFv7UA5KYW0A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 5jRGaaD9AKMI47P7ran_CLkfhxwyDNZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_224701_086833_AC612EAF 
X-CRM114-Status: GOOD (  11.14  )
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

In ath12k_wifi7_mac_op_tx(), the MLO multicast broadcast path iterates
over all active links and copies the original skb for transmission on
each link. When firmware crash recovery is underway (ATH12K_FLAG_CRASH_FLUSH
set), the per-link copy is allocated and partially processed before
ath12k_wifi7_dp_tx() eventually rejects it with -ESHUTDOWN.

This wastes GFP_ATOMIC memory and produces spurious "failed to transmit
frame" warnings for every active MLO link during the recovery window.
The unicast and non-MLO paths are unaffected: they call ath12k_wifi7_dp_tx()
directly, which already guards against the flag at its entry.

Skip any link whose associated ath12k_base has ATH12K_FLAG_CRASH_FLUSH set
before performing the skb_copy(), matching the behaviour of
ath12k_wifi7_dp_tx() but avoiding the unnecessary allocation entirely.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 1ab1168510aa..2e17bd665dc9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -1029,6 +1029,9 @@ static void ath12k_wifi7_mac_op_tx(struct ieee80211_hw *hw,
 				continue;
 
 			tmp_ar = tmp_arvif->ar;
+			if (unlikely(test_bit(ATH12K_FLAG_CRASH_FLUSH, &tmp_ar->ab->dev_flags)))
+				continue;
+
 			tmp_dp = ath12k_ab_to_dp(tmp_ar->ab);
 			tmp_dp_pdev = ath12k_dp_to_pdev_dp(tmp_dp,
 							   tmp_ar->pdev_idx);

base-commit: 90883c513ca01e77c56b8d94be7de11420c1dacf
-- 
2.34.1


