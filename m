Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39710C88E77
	for <ath12k@archiver.kernel.org>; Wed, 16 Sep 2026 06:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgG/G9lC5KY80n1GDmC0kSRTyio6uYTz9hujgM4SQxg=; b=w45WIlswWg1V3zjT57EAEUG+jk
	7N4Y+Ql63tSBlmhQeN2C5Nhwuo/q+82rBqiSXhz/948DLOImC9b4AVMVPYeDFfZlY7gSVG0Zdf69i
	G5phXa+KJM4G8SgfnT6AoTwYL73uzc/rF5O7Lnv5hnplmtREqIAK4SZ0mW5QHj8DZUF2evt9WUxy9
	1TuNNZg8MygCyZVLm3a7DnK8EYYOq5xP2HyIYINapHQwmNa9FyCGhRP7zIYWNELfU2HGSMMfkKDm5
	uFBX0dFo+BaQgCafpj3S69eWP1urYjaeIe1V0+vGsARe/frG5LdtZsxwVS3lnW+5kSOBYnH7om3eO
	IFlyqBig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ikp-00000008Re2-3oDt;
	Wed, 16 Sep 2026 06:04:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ikj-00000008RaF-1gNI
	for ath12k@lists.infradead.org;
	Wed, 16 Sep 2026 06:04:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FNcgrA1579746
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 06:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RgG/G9lC5KY
	80n1GDmC0kSRTyio6uYTz9hujgM4SQxg=; b=RBzz5Zn6ORBPmrdv0WLbcUQVa67
	/R6YFn/S0+fnL6yb3OPPU9jNOv8ltNhLizX/f00dJ4rlEucVE4bgWgVXcy+iOAR0
	Yd8NooaWTLWelOIiWRLyXhOgRFjk3IAW/sjANnl9WIMa6Cqlxx3W0kyJjK4OAYRc
	u2kFXkAPU8ZUdafBIhyKtXazxpMouozLUIuqu9Ql6QSaQNEzUvnveGSkJtv/hrxd
	hwnxnnudEG4u4SjEylskdz56MzjsYdxKRirih54af3kAeCwCG90tt7UXqWp8AMae
	CocFxdYmXCPN6G+6JTgO7ReuyBMn53THc8MJ8F2HXoV6dcOFet1aGV+kuaQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfh6xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 06:04:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb92868263so4373977a12.2
        for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 23:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789538655; x=1790143455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RgG/G9lC5KY80n1GDmC0kSRTyio6uYTz9hujgM4SQxg=;
        b=Yz24sarIUM08bqVbS7krUAwRG466ri95zYv86059exYd5VmaZszsvdCJU5Vmcv+wez
         OGYc+cQFCtgB1UTOWZhoCIYpfmMNyLklgups5DCp0RsK54/fuKSG94LqfwT9/NAFIY84
         pURr1Hs3Vkph7rdOuF44NrP8EhT56C/vLDPc3svpaminMfQLNN7Td56jLVkiIOSUPqMd
         Rv5jA2Uhf8yMhRxrXVWWC6FZakuSRqY8ZO7qTyDBkgrV1+7r1N8lGxmk/7rTB9UlMtQi
         XvV+FHajIyTsLF4IxSjC+g2yVcy3YHnW2zsGxPYr+UwkFCg0yz4N1UaLyze0pBMAsI93
         JLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538655; x=1790143455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RgG/G9lC5KY80n1GDmC0kSRTyio6uYTz9hujgM4SQxg=;
        b=gxkOBxLA0psivWJ0/d7Hrbf45vUB0VBv0dwvm6nNG599bZf1RuSeUDpHU+W5A4+7RS
         XgXsQo7q+psieTpAcCr2judLF1UNiBq5Ru0z9jdDP/N1z/vipKrpjJF/5MJiygcID2/V
         SLQjIgVtmU4Q708f8iP1sCZbsCAw6202bUZ42G1Veu4WIZ18NfIMIUc5s58MuPoanwJV
         tKZKl0gpzC0IsmS0mR86vQW3KLLll/xbi22ORNU3r2/cQcTzMqikzox0iM7c6gAeszJa
         Ai6N3vwBQSZS1qtC2+fHH4MA4v5vlEgvTdvx1U1ysNtV3jfDuCwheBtSHZcl/AOxdpz+
         JU0g==
X-Gm-Message-State: AFuF++nVxiwDAZVcak4ilc/kUgsr7dTreZhuxZvQyw0jmFR7+9/t2vpB
	CUhvGEAP4q0ducv7CCsSzZxs4oZEuBXGp3Bxi7h8tbhZM2Qq7RMxec0aWR7oA5IkTuqqDgiWw1W
	e6fVY3Wmv+OqaALx296SSSzXrM4mJihl6U2wsbwl2+QoBNI05sEoElcGdZrhhjt5IY8Y2iHRs
X-Gm-Gg: AYBFou0YLkbd+08KHuZ1olQMmZdTYhb6hATrckSXh9kRJi83tvOKkhokLC5bJ7metQ5
	3bZAkrw/LGkTbXqonR10gLXLrwX6bfz3EuvM1w5EuLoyTjpZCyqRI8ClF+GnC/ZH5po4Mys029m
	g/hgCrJfCq2+6hMbK7pTdR5oHztJW6VuiyWwef6NjTlQe95UMvmgmHcIFAddbKaLa/wXYchlrrD
	OuxfQHRUy5D9QfsiIvAqaV5ndiwixbCAGjLDRSqE8RVG4siXmmZ/hZyapHUotOXwYVtzjJUQGqK
	8cJkMLfLa7wxdgcZAqBZ7E7bLlMDRNXJUicOzVaopKU6ORk+PNDQ7JKIJs7yKfX5VHbbnPWc55b
	EyHGDHIs1TTP9VdjmuWMGL7T+FKsUKbp5XS2y/fjsTc38ehwlWe6HYx9Fd+YgBx0myGGbKllBkM
	lARZRm6p9Jf06wCg==
X-Received: by 2002:a17:90b:38c8:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39e1e3005c7mr2611424a91.8.1789538655264;
        Tue, 15 Sep 2026 23:04:15 -0700 (PDT)
X-Received: by 2002:a17:90b:38c8:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39e1e3005c7mr2611388a91.8.1789538654842;
        Tue, 15 Sep 2026 23:04:14 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7a7a1csm2661491a91.15.2026.09.15.23.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:04:14 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 3/6] wifi: ath12k: fix stale tail_msdu pointer returned from mpdu_pop
Date: Wed, 16 Sep 2026 14:03:22 +0800
Message-ID: <20260916060325.854-4-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
References: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa3160 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=INwfhUETP9GVDNSjyDIA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX1omg8lg+QLwJ
 h5O92T+HlBoRuzyN+s1lz5LkuvV7aWFkMJnvNNPWfPuWJUjNf6QBROLtZxihPG0oWMcKyBs91Ho
 YzhedCJTN3dRCCZIWeVhrAx93R52Df3t+3l32M/s9wZK3vofF3v5S9yfUUVYjzQiEk1EoPip+P6
 EOsGjmy17GnHLHQoz2mfwMQiLBpvPihmXBjHHfEvL87Iz73fj0ZUIcf1SR+pFJY8An5+UylMTOp
 qPT6WsJc0PXZ7XTPLWtjeNT09Zg7RGfiPTLP4RhlL88SzGdrqVZKXSFAP1z3mnogo/ZImusbW7Y
 deHaWKTIqSVI/o3jqdpyP9W63UqX9cJxFv4L1XxJMc4iWaEdJjHSOTGHKbHgQg+r5a76zFClqHM
 hoZ9rb5C5HS7WG62nHN4vTOA7i/G0wkh1iBovX6gzF4VaFWReZEwV+PgwKuWkJdRqh19iQsETeP
 FmzlBD/hzT/aJIqplIg==
X-Proofpoint-GUID: 40VRNL3-skUij_7ENFANzb6W8MREeQ57
X-Proofpoint-ORIG-GUID: 40VRNL3-skUij_7ENFANzb6W8MREeQ57
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX99A9W9LBcdEW
 YBXKTtbarCDCVHC2n0z2z340oA83YFF+xrSwDMa9DY5fCRaAAq5w1emiWEPwEwbmLszp1KzeaB5
 exdQS7pCGCTazK0nLQuY1gxundiOgEo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_230417_565657_1B76A108 
X-CRM114-Status: GOOD (  16.47  )
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

ath12k_wifi7_dp_rx_mon_mpdu_pop() assigns *tail_msdu from the loop
cursor msdu at function exit. That cursor reflects the state of the
last msdu_list entry processed, not the end of the accumulated MSDU
chain: on next_msdu paths (invalid skb, drop_mpdu, first-MSDU rx_desc
invalid) it is set to NULL, and on the set_pktlen failure path it
becomes a dangling pointer to a freed skb. When these occur on the
final iteration, callers see head_msdu populated with a valid chain
while tail_msdu is NULL or points to freed memory.

The chain end is already tracked by the local variable last, which is
updated only after each MSDU has been validated and linked. Use it as
the source for tail_msdu so head_msdu and tail_msdu are either both
NULL or both point into the same live chain.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 72bfbf19b7da ("wifi: ath12k: add support to reap and process mon dest ring")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index 08f2fba3e680..8fca777041d1 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -2802,7 +2802,7 @@ ath12k_wifi7_dp_rx_mon_mpdu_pop(struct ath12k *ar, int mac_id,
 	if (last)
 		last->next = NULL;
 
-	*tail_msdu = msdu;
+	*tail_msdu = last;
 
 	if (msdu_cnt == 0)
 		*npackets = 1;
-- 
2.34.1


