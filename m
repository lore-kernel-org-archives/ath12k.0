Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC69606A325
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 07:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IFoiJ1/8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=PWY1FkAT;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CkWWPHAy;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YMy2m+QA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=; b=IFoiJ1/8AsJcSf
	IYMv99aWdKSFFTVF9Lh3uRiEGxZ3jC3UKh2q53tSN237dpR6OhxON/GcR5aD+0JK4UggMTdefNFFO
	CNN8cCy8eAkYvlz5kOvxg9iY3DTP2130sLZNrYJ4dQi+XBg0bK+zILwwF0FFBQb4ziWzIL4SF9yDC
	/l76AyYQYYHV/tQhjgg5yN3+/Jfi8xKTxIZEC6aZFTGk7PYAXD3/Gb0dXdrgXL+w/iJM4C5I7X5od
	Me72DPTqh/sSLW4IHkvLqnLTVD549SCLXvMrO9VDWLkFLdMAly73YEnEt+JUPygoGLq/CuOgv/V6U
	Mxavu9TG7bQQ9saXXZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9IP-0000000Fh6k-2kdF;
	Fri, 23 Oct 2026 07:02:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9IO-0000000Fh50-1zWE
	for ath12k@bombadil.infradead.org;
	Fri, 23 Oct 2026 07:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=; b=PWY1FkATVV3Hmc0bgUD4iS+pSO
	r04LsZHdjISDlIoeBCy6/Wm48CYPKjG6bKOv1CyT6Z5Cq8B3HSaZBxIezI/MIfQjuf2kHBEn3TY6X
	g2Kc8mUF6goVVRyeVREQE3pSgsgNupM/VTsG5xPPhTzkxM6myewvrI8BLxDI972sOLqCo91X4iMxe
	jcrYWpyvQRv/3Ex+QAMPVFjpwJcMezgZ8L1lzkheVRgJLb+T8PG/s7jFKZI0wFCXLbxoqsDbNiXJW
	5drKTr8Kzy+ulL10ZSi4ogoBch/eg008ztaLSwAMn2G4RSBGUThmd0B/b6wQ0yoZK+VtZN4pLWkS7
	2YSCvw8w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9IH-00000009w3B-14fQ
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 07:02:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F9JU988705
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=; b=CkWWPHAyDYD1bpsB
	j5Ru1/0ODhwtBUAhbwHf3AbGnqRap6yVn+9A/bvySg3tneSkbhIDxFaDcI8KdFY7
	WM8fahZOQyKWXHg4HnMHuhiZLD2W2XDSNkPfyJWpIxtYfKkfAlf7I1xGVBl09TxU
	HkFk+7FlMg1f7UZ02BZIOertxVSNSnhPi+k+8vsddcaWNSz3kKEhc0ossFMlYyes
	7iZfVEtGjRuDH7CmvpNPlS/fOotlNCiUc8+5BqSiB0/3dHvMvkU/okhtSjZzhvBj
	yaoJD/N/e3EBnQ8IW82AknBgUp1DxVHQSqM8zPSIEdaYjTEX1b3ny65koxzhs77P
	IIPtMA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahtsx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:02:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so517378a91.0
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 00:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738943; x=1793343743; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=;
        b=YMy2m+QATr12xwJbXC9dbeCmED1EI4egJr/ATO0G45cJvMRh7cPYF8I79Nh5yTKdTT
         KsFrcz7+VEJvcCqn6HIWcL62IlelqbAHq4yGc5HAmuI/wLSwogS8l6mjZklEU8E/rasQ
         r7/rpx1yE8OEpYiAWO/NKQnY3wSImyK3jX35RmrA1t18qT077aXNdkS9c4pOXfGE8Pnv
         ptN5f1VjPatLexVOCrz5mRaYLFRqLCp9w7j3qO6q5MuE5c1QFD2Z8YCof4afuTPb/q6B
         HSR0WiLx2XsW23bYL3UXNH584UBMq3lETqK5MO/UeulV/MLTG6RDmvuhlnH6fH4eJfqK
         C7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738943; x=1793343743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=;
        b=FVXWkNtmNVzliluta9Ai9up4C+XN9sPkxQ+BNYNYgJdlBeOb+TVvqVIfGdlo8lEuSq
         +IGR0BdFrXOLlHc39gS3HKoHXzcMyXOEWHiqiweyyklA5qROrERFBTS/BoHD8IJCOrDB
         lSJxEBQdgV31iwpiovaVxJOQDOh+7oeSu1PP3rQLId5iwhV8qScaNBgE7NYnHLUwmZ8i
         ehMzaBP64qxB2BZLZqYNihZG6q5RNMf12KK3KD/mQfbbnK83PZ9IvV9xdsRF6j1doAVL
         WT8tiqcxMxwLKnlhBTfuvPvVuIR+UIUJypUTARtf6jFCgklRHMMY89RfjTdhwzS5Lh69
         LAZg==
X-Forwarded-Encrypted: i=1; AKwUvBxRwzXctJdmMpKYXUHCz/bfRd+X5EDyQ4G2RAfTbhlG5beaS211+jts/x+sAdVGDZppXLyE7hM=@lists.infradead.org
X-Gm-Message-State: AFq9FYIx21qC171rZn8i8fZLPp2XCS03uDvgSRZPllQpyLxYAfHZK9R1
	P203RskgeK0ML+qHIMTJve9brXvru/Bq7aoB/6bsOftz9K+W2un4QeYsMjtwYldUmKcAQwIUmX/
	6rm6FdMbZufNr92MpPsKSlIWYv2Qo0IbLOPeggbZL3W+p21/X5QuVePnJWvZwE3fV
X-Gm-Gg: AYBFou2+lGbilI541o7J80tURnpzOQHMgbkm3OU1FUKyq04VphImd5TMYVR1rR1Ql3k
	yWEecLIJNNQ2JlhFDhI64CCk3iw70J4FcLV0mSda1tSWLPSgKL1l55mtbMd7bwtmIrxvsNZKQyl
	DiNkjKdHIBQ/gnZBB2a4FaUSt60Ll8ZBpiD95L60fzxoH57pEZxyzivKh5gmJsxvLiAERJvfAsC
	nmaprKwCllssIt2U8Q31e2vZnCZOW1qmPHz3w5AoNV04ArNuN0mZ+yxy3FEYcYFKPiMdqcP+bo1
	iep/PDJvQqFFBoGR4wIZGNyGultfCZhYEk0scJviUCgA92STgwQjxgMw7rPWE4FL3U2waWRKD3M
	EUYTAoYjKk5ZAIPpMNjPvtF8doasfEisW/2Smqyqv445AUWfHeu3qg7IUs9dE4xYNnXsYJtaWeS
	gQuTQnwsEG1NlwOvyrdgI6Wg==
X-Received: by 2002:a17:90b:3f8d:b0:3a7:9e3d:b3 with SMTP id 98e67ed59e1d1-3adce7f0654mr926872a91.66.1792738942636;
        Fri, 23 Oct 2026 00:02:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3f8d:b0:3a7:9e3d:b3 with SMTP id 98e67ed59e1d1-3adce7f0654mr926860a91.66.1792738942184;
        Fri, 23 Oct 2026 00:02:22 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:02:21 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:19 +0530
Subject: [PATCH ath-next v3 16/17] wifi: ath12k: Resolve userPD ID per
 device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-16-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX1gxJ/s65aSH2
 I/9gOiGNovg8Bdgp+pDQ0M9U8t+LKQkG4A/v0XDDnCMWIdAUoKgVlDibFlemjHgu+ft/iP5tdoV
 4qh8GQTScKZdhet5YbU1q/UbeKwM5Ms=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX+Pm7lV+KEMlT
 sbYxIVXo46eCAsfM6ckY5cY/lvCTA3w2rmbnGqO7w5f3JfMYPM3zZ5Wm8afMjiIe3z1J7ozNHhH
 7ZTKum9Y/oSe/lB0aGveGHDU8qIHVStYBl6ISW9wZBsjlI1v2otNuoKYnbzvZEEqX1WM9pCauoU
 JISdOm3NbylWy5OblbK+8ySJFvZHICVfduh9H+4HQryvYadzamwEd3hrjA+Q/dYG8cquqm/tv2w
 LjESq6xxWbiVnr5Ox2tWXm0ox09xk/GNwdDQqUIlgNudKYO9KAhX2a6eAU+kfvI6Avs9ZP9Qk6a
 bJKmwKdf6n9Ueu3bdssIur1ZorpkgCoK8xtC4MgL3gy+S/5Q9k86AJmHdnYBlQU2Y62BqJbeKuk
 UcN9UnEUFl+oh9n+1hx8fp302Z6JiC4Wms26fH4UZ1XeBn0Ax9pSTW+KAaqDnOg+gsbYjrV8Eo+
 O5jLicCb34LMGRb/86Q==
X-Proofpoint-GUID: gKfOFzSxxLLMhuPizbEzxXZBvNgnyh6-
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb067f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OMOyA7uMCkrHFcBVPHAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: gKfOFzSxxLLMhuPizbEzxXZBvNgnyh6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_080225_534268_CC65293D 
X-CRM114-Status: GOOD (  16.74  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently, the userPD ID is hard-coded during AHB probe. This does not
work for multi-PD platforms where different devices can have different
userPD IDs even when they use the same compatible string.

Resolve the userPD ID based on the device address so that the correct ID
is assigned to each device. The userPD ID is used to determine the
firmware name and PAS ID for firmware authentication.

Also set the multi-PD support based on the AHB device descriptor.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index bff48b2fe124..889361e637af 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -16,6 +16,10 @@
 #include "core.h"
 #include "hal.h"
 
+static const struct ath12k_ahb_userpd_map ath12k_wifi7_ahb_userpd_map[] = {
+	{ .io_start = 0x0c000000, .upd_id = ATH12K_AHB_USERPD_ID_0 },
+};
+
 static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
 	[ATH12K_HW_IPQ5332_HW10] = {
 		.hw_rev = ATH12K_HW_IPQ5332_HW10,
@@ -43,6 +47,26 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, ath12k_wifi7_ahb_of_match);
 
+static u32 ath12k_wifi7_ahb_get_userpd_id(struct ath12k_base *ab)
+{
+	const struct ath12k_ahb_userpd_map *map;
+	struct resource *res;
+	size_t i;
+
+	res = platform_get_resource(ab->pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(ath12k_wifi7_ahb_userpd_map); i++) {
+		map = &ath12k_wifi7_ahb_userpd_map[i];
+
+		if (map->io_start == res->start)
+			return map->upd_id;
+	}
+
+	return 0;
+}
+
 static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 {
 	const struct ath12k_ahb_desc *desc;
@@ -60,7 +84,8 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	ab->hw_rev = desc->hw_rev;
 	ab->hif.ops = desc->ops;
 	ab_ahb->scm_auth_enabled = desc->auth_enabled;
-	ab_ahb->userpd_id = ATH12K_AHB_USERPD_ID_0;
+	ab_ahb->supports_multipd = desc->supports_multipd;
+	ab_ahb->userpd_id = ath12k_wifi7_ahb_get_userpd_id(ab);
 	if (!ab_ahb->userpd_id)
 		return -EOPNOTSUPP;
 

-- 
2.34.1


