Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8744CC982C5
	for <ath12k@archiver.kernel.org>; Wed, 16 Sep 2026 06:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFosAaz6UPx9OA6FwJ3No1+Iy0gVjIHm51A34F9fnWc=; b=a9o0R1963wyJeHgOWyZ6BRCG3t
	4YPhFM3ejMOv9FQFJljqvMzILKj79UveL0rwuEhxE+5xyD4pYG24WnmPplcvI9TXusyW31mrbBqKB
	x6nklqLx8O5/NeOqVWxRvv2HfMgVscVOxtXt1w2QCVxbj+QFoL+2gY3vpqFfmQ47fYFVLM/FTy1Ri
	p6eSW4MYuqfkQ1dtsW4bvjQPkm5iO1gBZcaqBEBnISN3tRae6wNOkGHRK19++enFa68IBUNCkHxsw
	urGbVwDeSI7utfFL14aa9NzT8HKPln9t6XCKTzy+BpQnxZsjl2J3qIhg4zYUZONSkl7+W/WpHT3Nf
	E6uJbQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6iks-00000008Rfo-0NIP;
	Wed, 16 Sep 2026 06:04:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6iko-00000008RdI-2A5A
	for ath12k@lists.infradead.org;
	Wed, 16 Sep 2026 06:04:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G5n0GJ080114
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 06:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mFosAaz6UPx
	9OA6FwJ3No1+Iy0gVjIHm51A34F9fnWc=; b=i8PJSOiPc03mNeRLLwe40gJdqJf
	NUA4K48K8z3xo0wPSs1rpZMnuiFQdaIL8wjm5QsuIK31O/Xz/a3sk0woB0UWizkE
	4YTHTgmv73YgI03drjRCeUTnjo6otvSR7cUVDLiX17/0hWmM8xgzREgJZ2zmr/Gs
	FmkrQBlq8VDrmqqktdqEEmE1/+6j0kZCYUCrBhYipmays1WwnT1Z9MVz8wZnVIJQ
	9/WS0il8OIlcFz+VOh3+yRmHQttKTGakgcPx/FUXMMDAuycrVCySd+fQXabcIl2E
	RWDD/3U+AZC+eZktF6aqnlXORWqKxGqoTCuL577CsFJlDlykr/8zIsl1Sig==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqagejmsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 06:04:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b8088202so4701609a12.3
        for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 23:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789538660; x=1790143460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFosAaz6UPx9OA6FwJ3No1+Iy0gVjIHm51A34F9fnWc=;
        b=DmrlW7oHZYlcsciNzVHzALEMV9ObMUIClP4KHaqwU3DUbi6fue8HwJ2SI/M3n+psCe
         O41NBuqTi62m0oMCtlJ/ALYXxRMKRfHHZkB9JSY2CA+lX9pzC+x+57jD70GioA/LAaAQ
         y3LcTR/0KIwARBUAwlDj9J/nzFbdNPv2cwPCfWW0fJVdo7JOGeUtZoI08ZBzmb/yTea/
         +0ZR44qeicNDs0eFhrHThdAuvYlOTWzf4ee7RwFeZkZRY+69OrGVdHKrahj/gN0s1SLx
         53qqBcxA/Nq/1DMNaI218hR3Bk/W9CGPIZIEu0gommTyEWZGVfxBITk7fL/o1ybThw4n
         0ntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538660; x=1790143460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mFosAaz6UPx9OA6FwJ3No1+Iy0gVjIHm51A34F9fnWc=;
        b=bltUzRwGSWzb6ZGmymwUJZdEEZ5zzJhXqCs5TJosf0YmllqfbfE16EHqbq7yMkOhzF
         H7yhW47ER05IAYvrcCtLzqj7eF+ZGaafHhq37XOobtIHyOsbzoz84ztcvi4UwCNRBYJR
         YcNH4ijLvgcRbbNzn1g6232V4MmU+Vij6LNuCbz6wK+F696/G9K6T6Y8J6YyYBqfFUjg
         njeIkZsiyVTEnfznznGbnyREhsrjpY7/wq45DzwQ+gjhVOzV96lT3qtV783P2sY/qDB3
         HIhHc3Wm3YdVlYCfQWIEyaoufX8h/L2J7aqwvWrQy5TGuCIzfpqyJfRos0J6IyK0fT4k
         U0QQ==
X-Gm-Message-State: AFuF++mHY8cHDiz9qywm6OiGIA0kC5BWV23epZ38rjUNTIIEj3flUqTI
	JEQbrYCiHMg1zo6jNuixwCBYZvLYBoPUlp01PgP+4V7DqLhkW6HhiXs5ABY9HAAKfEwoXY/rgsh
	z5CmBdXahXujgAoh1eAQGzgM3iU7Bda800/KmlBGIzXeYB2VH1xblypeSpL99W/wWuGekeIPl
X-Gm-Gg: AYBFou34PSCFCIX/MfRv5YPGPvJqxbR7D4LLP9W32Cqtgb5YjoRUAMeuAun8wICEzom
	Z2V+Y7IS0rhUu3w/5eqbYrRQJxMWnsFXkQkxbKenbzyb38V3srdXE2ULZHyWLWtirJ8lnnUPyV3
	LgKsnjEclM+vOUWs8isVIc9jD277ra6KxFVQPWjXZMh7Yt3R/tUcHt4wRcNRwx3Nde+wf1HfGE2
	MTWfo/IucsgOS29koq9A2hk2xfRu3E0+0WaraLN6z0fjI452mIqDLzkI9zay4GGM06HOHhqFQ1U
	s32tCHPZrQhiSI5AAfILQ52Kbp3hHk2db8WdNhDwB1oREFVYZHZMvgs3LStH2ZeyHjwaK1BKkzK
	ZIi3hz8eBHztJfUow0+T/OKbLovJk2TU+d8DgpYg7KrULhHA9NQAM6RUVb+hZCxk49bBkYM2lOx
	A/fwyJoTmGZ9nX4A==
X-Received: by 2002:a17:90a:d407:b0:39e:b7:cbe8 with SMTP id 98e67ed59e1d1-39e1e55f7b0mr3519806a91.5.1789538660520;
        Tue, 15 Sep 2026 23:04:20 -0700 (PDT)
X-Received: by 2002:a17:90a:d407:b0:39e:b7:cbe8 with SMTP id 98e67ed59e1d1-39e1e55f7b0mr3519746a91.5.1789538660030;
        Tue, 15 Sep 2026 23:04:20 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7a7a1csm2661491a91.15.2026.09.15.23.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:04:19 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 6/6] wifi: ath12k: avoid double DMA unmap of held monitor RX buffers
Date: Wed, 16 Sep 2026 14:03:25 +0800
Message-ID: <20260916060325.854-7-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
References: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfXxEZVV4CuOOZV
 26kj0Vk5fSis+zlarCTS+mPe3BwJb5fEpYaUopj9K5hBjcNb40MD3KoIfVJXVodcfPdPrYnAKeb
 4Nvztw6+Qrxsyu+d5w9xvATPWLars5k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX/6yzp4k5VnIm
 mA7jy2UMoit0muQOlTcstepqeTftzijrxiKnpKpOHW81cpAbO2bLpjDBgjLHz8wq+e+y+b0Dxdl
 XtM7M6jK1iWXH4XhcJKgTZxwOupWhIRVs05rVeFzKWrmrDRkQD2l6TAAdXY22EDgIKKpOmo+Oh6
 CvAg4Iz+kKrName8PvJNl8halwbkWPNmD8uL/6OL2UMXvCqzgE9VqZjWqmmI4M/9AGXSBohVER9
 abPWlT8euj1QaFV4nconj5dRcG3x54RzEdtEcLcByv7JmzAngvKND7yYxiN7ug9wuHh2bPQlDlc
 bj0j9kt9M/xMBK/aXox+AZdhVQmBQs2BtEDpKwdto9UAgOsN5C8rgN9VvJ0zIbkFG9WsgcDkg/r
 7kSMwXOQ1oOL/28vauXujolySqFMCk+fhY8weLaxspv2Ky9yEur6eqWqBCse56SzQNjWDcaN63+
 W+bBUAyRf6N9CTdUp8g==
X-Proofpoint-GUID: wi2Qg_6xcAHIdtKrxOxAObzrbTHTsTqq
X-Proofpoint-ORIG-GUID: wi2Qg_6xcAHIdtKrxOxAObzrbTHTsTqq
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aaa3165 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ylsU60PWf4TVeRcojBcA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_230422_698278_4A72F7A1 
X-CRM114-Status: GOOD (  11.93  )
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

ath12k_dp_cc_cleanup() assumes that every rx_desc_info entry with a
non-NULL skb still has an active DMA mapping and therefore always
calls dma_unmap_single() before freeing the skb.

This assumption is not true for the monitor RX path.
ath12k_wifi7_dp_rx_mon_mpdu_pop() may DMA-unmap a buffer and mark
rxcb->unmapped before returning early to hold the MSDU for later
reprocessing. In that state desc_info->skb remains populated, so
module removal can trigger a second dma_unmap_single() from
ath12k_dp_cc_cleanup().

IOMMU reports the issue as:
  dma_unmap_phys()
  dma_unmap_page_attrs()
  ath12k_dp_cc_cleanup()
  ath12k_dp_cmn_device_deinit()
  ath12k_core_stop()

Skip dma_unmap_single() when rxcb->unmapped is already set and free
the skb directly.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 72bfbf19b7da ("wifi: ath12k: add support to reap and process mon dest ring")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index ef9601152f81..92278ac8f633 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -998,10 +998,11 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 				if (!skb)
 					continue;
 
-				dma_unmap_single(ab->dev,
-						 ATH12K_SKB_RXCB(skb)->paddr,
-						 skb->len + skb_tailroom(skb),
-						 DMA_FROM_DEVICE);
+				if (!ATH12K_SKB_RXCB(skb)->unmapped)
+					dma_unmap_single(ab->dev,
+							 ATH12K_SKB_RXCB(skb)->paddr,
+							 skb->len + skb_tailroom(skb),
+							 DMA_FROM_DEVICE);
 				dev_kfree_skb_any(skb);
 			}
 
-- 
2.34.1


