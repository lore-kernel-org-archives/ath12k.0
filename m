Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39650C88E5C
	for <ath12k@archiver.kernel.org>; Wed, 16 Sep 2026 06:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xDh+kY0qmXtiEmiZZVj2diTcpt9RQlrVZATeQZcObc=; b=1GnJnGJ/GZziBvrzqRXftyL8J5
	qj2+QjRmZqJ4ePfypDX0GcqXHpUIJjGxqt0wkSPpzP0HbSDzMB5fvhAlVRE2wRcIYL9j8e2klFUzH
	ep7wDnjKWNaf/aXS6zY6Xx9SkGyLnqux1SmCrOvvWY8uBCp7D87ezwZ4Kxz1w/rDjzrRKkrqhQNlE
	5Yej6zDSRBb7ovGWJMIj5jj5ww/FpWgv//HZqyALBmrTqalbCiEgSRCBYs0gNpw18FBnvXZzTosqZ
	2kGmO40QQ3jSvAuudVc8fLBHm8iHe+zUqDNy+qkjHYOtz20S6WMEkNdkFPTtfFXiG0EBlcNARgV/b
	sn4KXQpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ikh-00000008RZh-3upy;
	Wed, 16 Sep 2026 06:04:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ikf-00000008RZ1-1ZcK
	for ath12k@lists.infradead.org;
	Wed, 16 Sep 2026 06:04:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G5kHkX3680425
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 06:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6xDh+kY0qmX
	tiEmiZZVj2diTcpt9RQlrVZATeQZcObc=; b=KiQeKjE7px+sbWTQ0BtRyh0NP4d
	flxBovjF58lue4dFIw/qeoQlnat1ag49XcNFoNeilna2hiYS8wOATr5TBjpwSNzr
	68ky5vLnwWSiePPX5AHoeFUziYQnsqd+1LLV//GnvTIx6QvLkDfueII88yvwwwy2
	JnfmCTGja4XssOgWoq1sSwMkUvtu0/cW8DwXmHC8rhXjvUBSCUGKcQ0thM/FmtvN
	mjF6bHylC+efjil/23M3gnUOI1NgIAR0za1RRyEJldhijU5btF9kk/iiwwcSO1u4
	1pXPofvbGXcH/D4pxoLDxNYUqO7FqSTaKmQaOxXuLMJ3hZGFsrOy+DLkO9A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqe1r9m89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 06:04:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d959904658so93919195ad.2
        for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 23:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789538652; x=1790143452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xDh+kY0qmXtiEmiZZVj2diTcpt9RQlrVZATeQZcObc=;
        b=L/WNu1FZYmZBrqshBa4pq8fuhQXIgZfujT8uCIPkubRfm8yhQRMa5gYrbMv6/sMJhh
         YJMWwV2/qAfiSR0FHqD6NTTHmnUCLDaEBgie74KYiWm30Kf2Kr7QAmstL8VpEPBPlhvb
         +wM0AenhvxLP2lN1wkXOGQ/kioudIwm0zGXS49NeDd4DI2aBhejn/RMA6qPPnf1zl2GJ
         Hmx3x10ZGoxNUkd12ejtkmHU5X1JThOYypJc9Y4vrD+Rzq/65izdsI0SYw3wj9uqmWdn
         /ZDXpftz876qMe90H/vPEyItUpFicSxgeBZs24iRlTwLIl3Jno53jTGsaYwZIBbvYZt1
         Hy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538652; x=1790143452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xDh+kY0qmXtiEmiZZVj2diTcpt9RQlrVZATeQZcObc=;
        b=Y+boAj/ofuvR/POoarakneWlv59JM4aPDj/QelbauT9Vz3dSUP+bHhHh3+hg/XLHau
         2454EKtAQg0cGoPj4l1NzT/kj75PvZMVCuaviV6oGp0BhGHnoayRqeH6CM8sMK6p+LdA
         reQjUUGurzLhi4yNMaAjYoZ1x4YZbJKPSmWEUTVX8shMiHnNgE7WxmiQ9iWomRMYfNfC
         dSaT1lGH7pYbqBfl38d8nShKajd4KV5hGt6h3L2FHjQ7spwv1VEBlWraai4m7Au9U+x0
         bjXuWuE7sEFS6jLrjyzni5iV79GITd2q0o4Hfq5KmH0awqWCmlM7DgR7QYRzGkDO8QYb
         15pg==
X-Gm-Message-State: AFuF++k4G61ptxkdZaSPKHhVK5jsUea55dzh56vKRgmuxUKyX83RwMXj
	4ma4ea5x2Z1GuhnufVdhToGIRf4mppcmv3C9/k5wGa1Er67Fyv0ChVddTiUJDtpm+q8BZl7dqNp
	MWrA3JxzdzUNqW2zZ24yKxyX6G90W4we4tIRgjs0d2tfocuMx/YRwMXIe8CIifmNk33f3t77d
X-Gm-Gg: AYBFou2x41qnLYgzqdmgu8/u7gMl6v2I8ianmdSR7ZIUUJ3q9fHi6xMc6YztIxLXFbP
	pv13DhtOY+aCMygjwRe9zn4wVj0PLDiWXunB41T+9UWavXYCAw4fmRSfdHNcQ/Y5SKDLNjkUpQe
	JzaNkyBUj8TOSSdTzfWNPdVdkh6TtFLCWfkzetv/hvmQIT/swFAdS4l+0K90cjahGhygW6tmVTK
	IyloGzuFGnGD/wwH9jk/4QYDBdKrh8BVzQfMC0PMJpVX4BAnMfJPU+Y8b8vVgPEYUp73cWcJm7s
	tOrqk/KFE0Zy1NfjFFwIi7Ir7Yp7f1XBGRmbz82xXPD19qQ/2H5cPPKr2gOQANKPDDiQKGbpZx0
	082dm1ICv2LoAnISMPua0IcZlJf76XBFXlZgnLB5fVlsBBOGSKWSii1eA8ZsB8l1jYvIxo9UT4l
	Y+jXrAW22TLnhAwQ==
X-Received: by 2002:a17:90a:d407:b0:39d:fcbe:fe00 with SMTP id 98e67ed59e1d1-39e1e52242amr3911462a91.22.1789538651995;
        Tue, 15 Sep 2026 23:04:11 -0700 (PDT)
X-Received: by 2002:a17:90a:d407:b0:39d:fcbe:fe00 with SMTP id 98e67ed59e1d1-39e1e52242amr3911369a91.22.1789538651450;
        Tue, 15 Sep 2026 23:04:11 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7a7a1csm2661491a91.15.2026.09.15.23.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:04:11 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 1/6] wifi: ath12k: fix skb leak on paddr mismatch in wifi7 mon RX pop
Date: Wed, 16 Sep 2026 14:03:20 +0800
Message-ID: <20260916060325.854-2-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
References: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX7JmNWgrCP5g6
 eTM7qvZzphdN3vjbdsgEzXz9lszNokN4O4eS8XtMl1P6sn2bLqCk0F1dVWc4M30XB98dDhiMXfk
 bqfw91571kZafUd2Rkkcd2MXTDb5p9w=
X-Proofpoint-GUID: 8qUSvT7Mm5O2pWb_VL6UIYUzNjcpGF4u
X-Proofpoint-ORIG-GUID: 8qUSvT7Mm5O2pWb_VL6UIYUzNjcpGF4u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX81KjYFpkk2XW
 2/Mh93bN9jWqcLITgPpTGzce/vagSghyHvo2iR26GrEEE1vMe6FTDr1VcRwMoCCRL5cWV8LiiMu
 K0E0uTlcy/jKJat3Jj9A3gLIY1zkiSsQ/Du2NDvTKH60vxetmKCCfGbvbT2/YA9BqLaL3einX74
 Smw57ysh6xo0NaceCzWv00ah1SUNghCxNJPlQV0oeVWHUmqFAniRpxJp+DrvkbhP/v7GNWuf09z
 ZA8Ap5XuakWmpxlzUNFzvurW7NcDv/05ZPYUbiw+5/Y0I6zZ6nmwQUbtBd8rGGaRwlrJHa30Xl2
 cnjWPQMC2MJTDrwMtQwvP1t+dEVYXId11ijs7JbxfBEB7npHd0QoLuUdP8aWr3COzlJSn0kk9t/
 IWpgWQgQ8dn0yZh8xUGdiEwrV+3lpXpE701tRE8lNXpbGZxFcu2uFPWLDo5sktC38KA7FeHuyil
 f5Q+Stoi9b41M0dSZlw==
X-Authority-Analysis: v=2.4 cv=ZIhCCn7b c=1 sm=1 tr=0 ts=6aaa315c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=BY1CvHwyOBe5klBsCfUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_230413_419245_8526D59A 
X-CRM114-Status: GOOD (  15.90  )
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

When rxcb->paddr does not match the MSDU-list paddr reported by
the link descriptor, ath12k_wifi7_dp_rx_mon_mpdu_pop() sets
drop_mpdu = true and continues to the next MSDU. At that point
the skb is still attached to the descriptor via desc_info->skb;
the local msdu variable only holds a copy of that pointer. The
continue skips the rest of the loop body, which would normally
DMA-unmap the buffer, free the skb, clear desc_info->skb, and
append the descriptor to used_list in the next_msdu block.

The descriptor therefore stays in_use with the skb attached
forever. The skb is never DMA-unmapped, delivered, freed or
replaced, and HW does not write into it either because the
descriptor is no longer posted to any SRNG. The descriptor is
also never returned to used_list, so
ath12k_dp_rx_bufs_replenish() cannot allocate a fresh buffer
for it and the RX refill ring gradually drains.

The skb is still reachable via dp->rxbaddr[][].skb and is
reclaimed at teardown by ath12k_dp_cc_cleanup(), so this is not
a kmemleak-style unreachable leak. Nevertheless, both the
descriptor slot and the skb memory are wasted for the module
lifetime, and under sustained mismatches monitor RX stalls.

Remove the continue so drop_mpdu remains true, execution reaches
the DMA unmap and dev_kfree_skb_any() below, and the descriptor
is returned to used_list via the next_msdu block for replenish.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 72bfbf19b7da ("wifi: ath12k: add support to reap and process mon dest ring")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index ded7d56cd79b..ed6686746605 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -2718,7 +2718,6 @@ ath12k_wifi7_dp_rx_mon_mpdu_pop(struct ath12k *ar, int mac_id,
 					   i, (unsigned long)rxcb->paddr,
 					   (unsigned long)msdu_list.paddr[i]);
 				drop_mpdu = true;
-				continue;
 			}
 			if (!rxcb->unmapped) {
 				dma_unmap_single(ar->ab->dev, rxcb->paddr,
-- 
2.34.1


