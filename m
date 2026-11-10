Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDA9606A325
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 06:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JOVhyYEU;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ALmbT1OP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GGFGiBEz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IBNOzrCG8K+RyTkgjeaTUrpJlaUmYgwFoqpoWPMCVJc=; b=JOVhyYEU/xVPeZ
	twmWf/xEWOS4cvWRH6rffOrZpMfGbXBcUcLvizikPB7hA4c6DFJx93nLzPARUhVAbku59zZUgE0wY
	/14vr6iaACUQvDVBSvytdOw4ipjFOvWIa9YC8kvdlQMSbOx0sNY7W3tjpWyYP6PnXcgAiWzpyP6OV
	Io3JLEy8TXUzkuoaVxa9PCJyKbQ23sd7HJWAlOSRflvgmUnoUG0B9SJlD3QR5jPyHfR8KYu/fpk2A
	TwrMMylC6Od8CjgHHgMcluxe2kUmPTjn2Dlml7Wmhq8p15+IFxaf/l/MO+zp/m9inDcCM224dHCtq
	3t7bhkxrGY9RMLbXfhlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfX9-00000002fk3-1rjI;
	Tue, 10 Nov 2026 06:40:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfX6-00000002fi0-3Pax
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 06:40:42 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A5Mu2275475
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IBNOzrCG8K+RyTkgjeaTUrpJlaUmYgwFoqpoWPMCVJc=; b=ALmbT1OPf/GnsmVP
	YbiQUhh6yk6uC48o6Fv0ePzw2S+r29lR+4j04NoGWJoautM7UnKSRIkEwrcZWELK
	ymXavlubWSIA3CsLuK9S1pyAZOs68PeksI2TLVrWsq9yY0P99m3L+zWPA8O6aVgG
	AQ8g4N7rXK1Vxr2sq9ao228Ynp3B28ttfvsA2xUxjdtrtY1V9XQO1tHrd2ac81V+
	k/lkoJsx0AYM1wJ8AgTR7JgnsYPMbLcGdCBTAF2TqMq4TvubKAn+4E3wProaDfvj
	HhWWumUIv3ecFGCfQkpVQ3uLu5OU63izvRYo65eVv3HrUM8H4h47S30p98dYKAK+
	pEtlxQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf5bx0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b15e47e57fso662835a91.3
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 22:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292839; x=1794897639; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBNOzrCG8K+RyTkgjeaTUrpJlaUmYgwFoqpoWPMCVJc=;
        b=GGFGiBEzeJj0880i91rVTJAjT2vG8sQ+gyC19wK18ZULrQtC+W1PE2M2iYFNZLkO3H
         FFoA62qXXVKQrj1WKfOwPwcRG7C5hiQ0U4WqfvLm+NdctSbZT8BdndaXNDjE+/yR6KES
         heRAfn4vlmvtFz5YlYpmBPTpiUIN/mSE3Cb6/gL81FuoIFeJkLOetXURZqGty/YsU4HH
         b3cJ3m9ycO6NgZ/0U6UGIwxlXes1a0aqmQmKCtUxDjPxZDYqfIPm6eE2MzbyjSJBuG1C
         969lppPf0ifTzs33hpFLyK9hkkPQOjx/UrXtAw22FhyX9Z4otLj47LlzmsDCvJ4hd89i
         UwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292839; x=1794897639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBNOzrCG8K+RyTkgjeaTUrpJlaUmYgwFoqpoWPMCVJc=;
        b=CUirKlvxIsYmeNj+hhkKkOX7euNsJJOjamx2UsrkMogRohqYBvnA5vCgscBkPAUU9Y
         +QmJ+rTXwxHHfTPmkBDIjyVHhUU+W53ZAxgUlT4M210AKcoCnu7sqFilfO6MesYcl1Ti
         9jqGYcu2eVipS8qQwtSqQxFaTC3Dc4leqdQ6wIr1ff0S8DlB1z/q8Rf2lJnbE0Febhy0
         AQMDqUi3OMutaf1kkqT1Ufn8KRUn+sOD+ZHaFjMFsv9Hb/6OYcA5S5+tmalqwgH+zz+S
         Q1Y0rBGmLFbqXlohtbLYRfIhR/VtMZUYf+rrBbl7UwSPsckg89FlKcxwEnvbAEZAx/kt
         KUUw==
X-Forwarded-Encrypted: i=1; AL+hErGnGoIEb+Yo9HUncBvdmSLIsZlUNbGGHDr3b0cJdJrdNKTwusv0Q9czn9RRifLVKNQfa2pXqwE=@lists.infradead.org
X-Gm-Message-State: APuU4Z+D+p8OrdFmybc+pb7k+/H8DSMAmYbpZrls0rXj93JUgCmke/5R
	HzsDz9NPL3LKRgCiF3RwVRL/nTo/o0cDWktBTZRCpKPjZJtIrYnOnFlPJESj1pDDDSJBVrL9tZE
	rsQYgnT4DB2YUVCXTfsxC+EL0Xq7qSIH53cHh7+JW9m0qpZl0B4HDPg6z4rN5saG6
X-Gm-Gg: AYBFou3X2ILbKZPplDGc4Yhtm4Abgzg0862n+ueipSSCotJRgMMupJNtp7682pWjzZi
	vaBhyoSzSE0/+HoSTQfWVm3VYI3ENYwanT+v0NwvGslSKw48929QyGxnSQQqrXeoIlsLrYW7Xfy
	QFl2kw5imp4HZu9BLv/1bEj5o1fuC0bWD3d1gtBEWGa//Sa5JXpEksVc7OThH7VSBq899FgKP8H
	h+64J13tLmJsIyj2aQ8mMi26w3FhEaLNH3XF5BLqtAY07ErDZCXvOvC/hRDStI5uC6bDBbkpFoU
	xZMsJVQPC3oMC177sxTnPel5ct03mUhaJgG2wgWPupEKemtD6j4ZhaeNqV/sDLjE5jv6aCSZmcG
	TKgoynLzkuSZJiU514DTaEF7lG/HPUpAxB9ShS42sMwuPYSom6i2/EFCmNom2xGpCeb265upKfQ
	Uq/fQMHWsTkVhgbYoR0TlCoNvhN/47NA==
X-Received: by 2002:a17:90b:48d0:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3b166cd69a5mr2060382a91.13.1794292838816;
        Mon, 09 Nov 2026 22:40:38 -0800 (PST)
X-Received: by 2002:a17:90b:48d0:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3b166cd69a5mr2060362a91.13.1794292838183;
        Mon, 09 Nov 2026 22:40:38 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:37 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:22 +0800
Subject: [PATCH ath-next v5 01/11] wifi: ath12k: fix potential OOB access
 due to unverified hardware link id
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-ath12k-logical-link-id-v5-1-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: dpC3Xff_eblw7z5Xof7_q1SFDF7aUEMN
X-Proofpoint-GUID: dpC3Xff_eblw7z5Xof7_q1SFDF7aUEMN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfXxGZJlMGBAdF9
 DAIdfMpHObB2+ajv1oVe9J9iYqbgyyW7esum3NT+GXWdGhIotBXaiv+ZgGDLSf2vpeH5V2PZBlr
 +2ZFeLD8aBWKP4t3ps5UyD+dRqgqwTA=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af2bc67 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=qtqQsJB7fzTjSEb7W4QA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX+Mqxe7HEkmEg
 T2IKIUvd7c9woEJClLfcDXjwG309ubFWwv6Mwm+lhqQKPH0lYW6i+TyFW5rLGP1/dL0EiJWHFf5
 yCBEIuWYiA3AfCgZx2sounNcGV3Oqb8NgjzNnn1YfgfEtv8rTW8Is+izKQETIRb5Pyk+sOD3VzU
 ddSaOMUWglOYtnSkyJ4oExD4SmWPZw+zZ/vl21DZ/Iwx3U9n/4Oi3620T7EfPKZ0phvUVSrvndC
 F0guLl0g3SLl+ky9GwNAUZjwEx3M5+1Gs9NTzTM2kQKyhiML82/2pMLXUCHLDpB+vrJzm/IV7Rc
 7esJSZBf5+B6QGZ39MfTWO9XM5AFGmxgTuU4Otw9SeUSIQ9tsuQ97uTHMGD/9H8jf5rQ/XqAuwp
 WIztI2fEvGpVXD2z2lG92ddHULBOZ0SKEXe+D3cZ4UXiDISe6WoLE8CMQpXoW5X1iSxY9sXivAO
 gkN/jCKwAVqMhZQ5d1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_224041_000239_891C3CCC 
X-CRM114-Status: GOOD (  14.36  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In ath12k_wifi7_dp_rx_process(), hw_link_id is extracted from
hardware/firmware descriptor and directly used here (and also stored in
rxcb->hw_link_id which is used later in other functions) to index
ag->hw_links. ag->hw_links is an array with size ATH12K_GROUP_MAX_RADIO,
unverified hw_link_id could lead to out-of-bounds access.

Add the boundary check before using it. If the check fails, continue to
process next descriptor.

The same applies to ath12k_wifi7_dp_rx_process_err(), fix it as well.

This is found during code review.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a32c804403e8..c8e590e5e250 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -705,13 +705,22 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 		cookie = le32_get_bits(desc->buf_addr_info.info1,
 				       BUFFER_ADDR_INFO1_SW_COOKIE);
 
-		hw_link_id = le32_get_bits(desc->info0,
-					   HAL_REO_DEST_RING_INFO0_SRC_LINK_ID);
-
 		desc_va = ((u64)le32_to_cpu(desc->buf_va_hi) << 32 |
 			   le32_to_cpu(desc->buf_va_lo));
 		desc_info = (struct ath12k_rx_desc_info *)((unsigned long)desc_va);
 
+		hw_link_id = le32_get_bits(desc->info0,
+					   HAL_REO_DEST_RING_INFO0_SRC_LINK_ID);
+		if (unlikely(hw_link_id >= ATH12K_GROUP_MAX_RADIO)) {
+			if (desc_info && desc_info->skb) {
+				dev_kfree_skb_any(desc_info->skb);
+				desc_info->skb = NULL;
+			}
+
+			ath12k_warn(ab, "invalid HW link id %u\n", hw_link_id);
+			continue;
+		}
+
 		device_id = hw_links[hw_link_id].device_id;
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 		if (unlikely(!partner_dp)) {
@@ -1469,6 +1478,11 @@ int ath12k_wifi7_dp_rx_process_err(struct ath12k_dp *dp, struct napi_struct *nap
 
 		hw_link_id = le32_get_bits(reo_desc->info0,
 					   HAL_REO_DEST_RING_INFO0_SRC_LINK_ID);
+		if (unlikely(hw_link_id >= ATH12K_GROUP_MAX_RADIO)) {
+			ath12k_warn(ab, "invalid HW link id %u\n", hw_link_id);
+			continue;
+		}
+
 		device_id = hw_links[hw_link_id].device_id;
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 

-- 
2.25.1


