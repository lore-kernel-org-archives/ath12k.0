Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C78C5B572
	for <ath12k@archiver.kernel.org>; Tue, 18 Aug 2026 01:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DZJPMdAf2aJ2i7TTToYX/9lIGOVh0S21MWfOzc2u+io=; b=hAWx5+leDX7AorVd8aykMBPcAc
	PsyTAqPZT2b0xLtEG+ITjMw5Tvy0eUZr+/KtCxLuWOKW1gA2lKahSBhim+mGOAOpMpPbezyMGOy9S
	EOkvvkRWTBgkCnTGDczCCdnhupAjGhdmdrYFUjFMBLGAmkLsw+mtOQsHETPtOcWuKNJ5anEnNi6Uu
	jhmqiM4bRXLhQHh+J10pvrZd5o/3LTrMziKCUsS5Ljzk7OhYXW/yWcMFAM7ftxPSiHkn/t57I7jCq
	WtKabA+kFe0nryoAMyi9ez9DqzlHupNACjneofAEXTfjyiLTHxKLBbHj9Xxdf1qXCRxlPFasdgqSE
	IQtXQn3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww8sy-000000074DM-2sqI;
	Tue, 18 Aug 2026 01:45:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww8sv-000000074Cf-3CtJ
	for ath12k@lists.infradead.org;
	Tue, 18 Aug 2026 01:45:02 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLlYDm3129097
	for <ath12k@lists.infradead.org>; Tue, 18 Aug 2026 01:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DZJPMdAf2aJ2i7TTToYX/9
	lIGOVh0S21MWfOzc2u+io=; b=ictfL4zRsc9ou3M6rkZBu/OXHJ7M16xWUrB6gA
	Xdlgf0396pdRMQYfe35AOYqiofX7E5ZaDeHFE39mPqumMoOlUWoJuUBRz+JodSV0
	QSkYZL5NI6CLo/CHpcWf1WgKSnSl04CngbmBMRj8s0NVVdxkbQOyH0jpujhjXVJv
	erEvjsS7KQ4CW3X8uts7HBFVwIXmG1ll3GHN9weO5xJybkSH8sPSEH0Mw3pKr496
	PnanBArV75f5MALEHw4+A29CWm30js4fEtEWFZxiTQYdTIcW2EcJIhOTo3BNT0z4
	a0q+GW++ZiKAsTzy3x/dpHlcWJVRNXL/a51hTQtu8o1zX9wA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xb1kx4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 18 Aug 2026 01:45:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8485d853b08so6388228b3a.1
        for <ath12k@lists.infradead.org>; Mon, 17 Aug 2026 18:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787017500; x=1787622300; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DZJPMdAf2aJ2i7TTToYX/9lIGOVh0S21MWfOzc2u+io=;
        b=UTp2xNAoMLaH6AthK3b/rfNUn4w/JRuTv7SagiSJpcy0kUD6tda2mtCeCmZksWEvza
         OS42TCEioopw1U3ddjdHQ2RYa6VAQpxm7+RSizwdyK1wGo4vD5kvPDa/4xm0oBDcTITx
         r5MwdChoyOhFtSWm+kuJx901SYd6lTjrAiHyFoomYC0J3630pndzz1L7uamQ+L0kf559
         aCj78ATnqdm4oeBiFAVpw75zl+xgPpUJAxAcjPcMo5Te5c466vbxq/9Nv55e5j+IQOJq
         ubXt7pJMZDpMjNZoJflEPAS43tyOajI6aSQQyVB3iSiZtRYpv8VbXoRDtAYwf8AcmNyo
         qzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787017500; x=1787622300;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DZJPMdAf2aJ2i7TTToYX/9lIGOVh0S21MWfOzc2u+io=;
        b=g95gtBZQB8DRCU3SUCtapg6bEyeEzNc2dT2itXV1Yx3DTrxLGQsKBCv/753ChohHel
         pHEQsD/DSm6RUIe90D6vNeFW0li5xHz0cTQH8DZ1AfJCVyE6KeZQNKYEXjOLNgB0FdJE
         73uo5HX5uGIDaIg4fbDc3qZzRPnN3GRwVPiiwjUrwOu5kuu/zZhc1zOMGshu+MhoFOAz
         Vtdts78nOqn8m/s0PpBJUXgH1B/y+PLe3gA8CcvsBWFAMeRzAKwCKkjjk9UwciOhQlPD
         bM0x/TGsNG9hUxQ7xcInem+1UQFkkUm53P3L6JKiJuqc5mKXnp8THUKKCQK7hZkbAw1v
         /qsA==
X-Forwarded-Encrypted: i=1; AHgh+RqwrSUQSFirU419DGzR9EmaC19MkX8V1dUBYzIPEDR1UGO3Ny48S9Q5/0YBYrh9G8ACox87bgs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6YA0JyUhRzCnchQejiUpPDRTv5zIiIprUDtASot4qlSmtngkD
	xNJWuHMzMVcI1G2vEwrlFP8hud+yqzT760WQWE/N7JGBTXi89gulnFdsZDX+ACMgv85JfRdqDMR
	BNFGeMDwO3pdXA2J1jtLHmk6bLWYwnqkAXjLUBGoPrvXjiA9YrJTe4TfNFS32XDpYtSpGQNg8
X-Gm-Gg: AR+sD1253ru7eYbzbpPZzF+JllcyF3DZ3BVzQG/8dmP/BT6F5vOt97d4Cqgs3R+s3i8
	w7DRfxVKEbjBCd+euqhpsn1vmSrpXVknhJv7jWDUr09SSt5e36iz+Xqh8ITkmRQvENsBOFB4O6m
	DprcERpJRWKkji4T91p/t6BIqTrW0Vxa/NEjb4ydf3Cd9/LPxzBTGrEGPVHs8wQL+FF/BCGRGeM
	F/h3fCfnkJnm6yYaCdVqo/rXPLjBB2vl+DyHUMCEs0qxXb5EWJ+z7oMuGbROgOC1cruuj2jTpJ8
	vASVTpNT0YZyQqDj11PVFuAa1RCXwxvkeU0WPuBEzfO+gsMAfzv+iFSV3gYJ5babwyjgrXqMF4g
	CGXqTsf98ke701NPTLpdayDw51c7OBbufnYzzZoXLanOxWjQmirYxNQ==
X-Received: by 2002:a05:6a00:3cd1:b0:848:411f:3969 with SMTP id d2e1a72fcca58-851b882e6bfmr4626398b3a.20.1787017500238;
        Mon, 17 Aug 2026 18:45:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cd1:b0:848:411f:3969 with SMTP id d2e1a72fcca58-851b882e6bfmr4626353b3a.20.1787017499782;
        Mon, 17 Aug 2026 18:44:59 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b6fc20dasm933240b3a.46.2026.08.17.18.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 18:44:59 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 09:44:48 +0800
Subject: [PATCH ath-next] wifi: ath12k: fix stale skb pointers after
 aligned TX payload shift
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ath12k-uaf-for-aligned-tx-v1-1-d6ae195b15e7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAA+5g2oC/43NywrCMBAF0F+RrB3pJH0krvwPcTF51Aa10aSWi
 vTfDV25UHEzcLncM0+WXPQuse3qyaIbffKhzwHXK2Y66o8OvM2Z8YLXhUQEGjrkJ7hTC22IQGd
 /7J2FYQIqamlFqbEqJcv7a3StnxZ7z/IMejcN7JCbzqchxMfydMSl/8MfERAUWUtKFEZzvQspb
 W53OptwuWzyWfCR/w3yDIq2rI1FoZuGvoDiHRS/QJFBqZTUylR1U1YfwHmeXwj6tkJ1AQAA
X-Change-ID: 20260811-ath12k-uaf-for-aligned-tx-a068d34b1548
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Ua9hjqSN c=1 sm=1 tr=0 ts=6a83b91c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FUV8liJ-HANJxdjaZr0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: dtGaMfLtMSHyvmK00lB5e6bLNxBg0NzT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAxMCBTYWx0ZWRfX7Pmr0lIbNIit
 KsSj3HF1G2N2iiusNnJSDRRj77MCZxzyBm/tE3wenBtK388kHKxqiCfzzKWgYnlMCOOGisA1Xcn
 9SfGQ1Lut4TT5qUU6srjSulQ0eEUUtLcRHipqUmMQseuGOxULpSfqpk5lNnUMEYNVHAdCZFzcV6
 hiCwQQj9EKl6ctp+BUnDEEguB8oKQf1s3dysu0rzPDl28J6xVjau14I82XBqEosoYHmc6D9KWxN
 onszsrebSACOv3JFRLEb048Ko+bdMuJWdH8zxKclCfhonh2qNeau56Pum2opTqrX6g7wr5GKZ3+
 G76+ew6FHqzQuBiXz9swt/ZquNkoXT0q1S0y3+hxyU+rqfKlGFM+MxgLAxtYjKMhB26SeK5g1LX
 ZJP4PyN0HDTdD8n9izNwyY27B5jCpSj0q0WTXMgbomcn4weUGGsz8TGpqearSYCaay19+kUaUJC
 h+u5Uc0sBa+kr6UHmXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAxMCBTYWx0ZWRfX8IHPtJRXrOUV
 2ce4D3SdEBbn2IiaDEMt5tG2lh9zbre6PVciVhw8RIo8nF2MELbc+k8jd934YediFyGEI4m4MWm
 4MbWSVxhM6IPaUFhp4NsEVSvynLkquw=
X-Proofpoint-ORIG-GUID: dtGaMfLtMSHyvmK00lB5e6bLNxBg0NzT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_184501_822636_50081D9B 
X-CRM114-Status: GOOD (  11.98  )
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

ath12k_wifi7_dp_tx() caches hdr, eth, and skb_cb from the skb before
calling ath12k_dp_tx_align_payload(). That function may shift skb->data
in place (when headroom or tailroom is sufficient) or reallocate the
buffer entirely via skb_realloc_headroom(), freeing the original skb.
In either case hdr, eth, and skb_cb are left pointing into stale memory.

After alignment, only hdr is refreshed, leaving eth and skb_cb stale.
skb_cb is written immediately after (storing DMA addresses), and eth is
re-read on every TCL ring retry via the tcl_ring_sel goto, so both
accesses are use-after-free or stale-pointer bugs depending on which
alignment path was taken.

Refresh eth (conditionally, to preserve the encap-mode distinction) and
skb_cb alongside hdr after ath12k_dp_tx_align_payload() returns, so all
three point into the live skb for all subsequent accesses.

Issue found during code review, compile tested only.

Fixes: 38055789d151 ("wifi: ath12k: use 128 bytes aligned iova in transmit path for WCN7850")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index d2749de44553..6b8430260238 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -251,10 +251,15 @@ int ath12k_wifi7_dp_tx(struct ath12k_pdev_dp *dp_pdev, struct ath12k_link_vif *a
 			goto map;
 		}
 
-		/* hdr is pointing to a wrong place after alignment,
-		 * so refresh it for later use.
+		/*
+		 * The payload may have been shifted or even the entire buffer may have
+		 * been reallocated for alignment. In that case, hdr, eth and skb_cb
+		 * are stale pointers. Refresh them now for later dereference.
 		 */
 		hdr = (void *)skb->data;
+		if (eth)
+			eth = (struct ethhdr *)skb->data;
+		skb_cb = ATH12K_SKB_CB(skb);
 	}
 map:
 	ti.paddr = dma_map_single(dp->dev, skb->data, skb->len, DMA_TO_DEVICE);

---
base-commit: 4fa10e991f77b4c929d1959900a6ed422b9e2ac5
change-id: 20260811-ath12k-uaf-for-aligned-tx-a068d34b1548

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


