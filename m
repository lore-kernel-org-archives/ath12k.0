Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5638A606A69B
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 09:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fmj/O8kA;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TMC2UZC3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGW+c225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7dXCZqzkXmwN+wFfCdS/ByK9E7Gk9Xnhivu9BJqco3s=; b=Fmj/O8kAdNJXjz
	Jkv9x1dv993DMscYVvLhG9AiB2trnTsGQm2xcSNb1saobhgFAsJoTGGqQtBaVNp7VzwOPpz0tCv+1
	3owARJvr3i53DrkHFCeTltE6sYnyDAOaTmGRafTNSfYbXLqP0Ru7DhxRHDTh7qyBxnU8oAR/xp9qt
	KaeauVe9Fj1YNevQOLPTYDvSihSRpIqm0WLO+7Ydrkn52+oG2qO24Pc4FCJ2jqMJ6pyrmMO9I9Y+m
	nFL6F66k8OeT/E8X+p6SynMMZT07WPbG/6IFjJuuXqvrGN4y6gPT65YmVPGXZx+Z8tkx6ei9Ox7hb
	bQECGNZXrzh90HwOjB2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVf8-0000000CX2V-0HH4;
	Thu, 26 Nov 2026 09:21:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVf2-0000000CWyS-0Rca
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 09:21:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8NYpi2860076
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 09:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7dXCZqzkXmw
	N+wFfCdS/ByK9E7Gk9Xnhivu9BJqco3s=; b=TMC2UZC3pbrDgsvqamkhU2BsIlQ
	1poJoRoNy4OwI8yuL1akUK2zn9laq1yp+o1rYqcUazcGrq0bCrrExETNRR/ZEDl3
	q1XFINkM/bSHmdFkDa12kTl4DqB4jgWkrJv32vGLlqMGlSm7uEMcq7o9gYksRNdG
	Vrx0CUVxiOwwObpD+uG8a5KQh/BqAIZCT0QKMFUzlE99pJRw8i3dZ5lhA/4Lwbgg
	tYwcbXZtMCDsmDPTKhHQaRg6GqNquoNEETCoAJQB16ILat2Y9LxKREI/D/i1YXVD
	F1rV8Be4an3Z7i6itjaXECFEbDGAJmY28TgJi169/HWVQPAawKMWPQ9cHlg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g87xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 09:20:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so4146658a12.3
        for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 01:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795684858; x=1796289658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7dXCZqzkXmwN+wFfCdS/ByK9E7Gk9Xnhivu9BJqco3s=;
        b=jGW+c225UpEXMwRLUoFZ7/oOQH9vEl2FrPx5sNind3TUVTmLZRfRywWbHYSN99NTXd
         h6iVpAPnSIKeJSNc1xly5CKUm7r16F10iGvwrVSYgaWWWsbA8pAZMnZiVa78AEZSdXsv
         SbfIFw6ZqFGNYpbcOlFKiiFk11TodriK7q2ckkv6JiTaG2rWScdao2+nNc7JGtFhEvB1
         3kYNEdX2JgAbmrEgWLee2Tzo+W8ROEEkcrQYNJs8nV6qQnmRoVJkE4uVHSInR9YBrCHu
         kP9oCno11bg/MNE03jet9D299OU+nyjUg8i39qM/zfr5nn2ttWIBVWgBFF+Y4+BOrW69
         xYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684858; x=1796289658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7dXCZqzkXmwN+wFfCdS/ByK9E7Gk9Xnhivu9BJqco3s=;
        b=Kj/osC0vLfo7XSfgsJMgaidjgkGVZrz24buQGfA/+ba+bcdG0StVl7CnwUgufuGb7v
         Xyz8Cf5cBYVwL89ef3emRPeuGLVcBqAKimiKIRmb3Peatk3HCkaxHnosKvkSkGTKsnwu
         cPhuH0/BYI4GP15FbYRR2OU719JST3epvHONmrwq3ro6puTybtWmoYXKyddkWpOtRsHm
         mZehOK5LUIUTzPSi5ilzPOiDxUDgqXgGwDlY5gLcAy1OEvOMIJMMbJMDQ0yBPD3MPAMZ
         FdYVzPgdMfFJg785hJhhMAohcOLf+iPjjs5Cv8uPPTqifadtV1bWufgRCxC+E9929zoc
         eGZw==
X-Gm-Message-State: APuU4Z+F9l8qIPW2ZJjxZ7/El7wHQX7FMVMi9TV4n0ADs/qeBlgvVvtj
	4Dn5hm61fX5Kr3FWd4bKUNeXsmJqS3+PjSKiZxJA+jYeiYqMDnM8gQZ+xq0uY6BmoMbMsV+++fA
	IPv/oVSll6otRDZTT4TYrJAWtH0/pbMJCSvqVhShJHiCksL2dUY1JBpM/6IugPhgm
X-Gm-Gg: AZFdTZccSt8337CT6fdRQFvVtkb/eY0wy8usmHPk1eos8NDqOvYuxVjS19HG9XkyL7J
	2Ff1C1SJ0Vel7SjBKVIiCDQQXoOr92G++OxqkItDSxN9EL7TKq9XRQ1kjc95L83WqwZ4rrmkiC6
	/6T5ifYDJRdY4aFxI/6FYrtT2QMdSOvXc/Ao5tzR4C525GCgt4wfxX+7J6aLicfssoJPXcF0P96
	5N+fvJ2ntc+/ElmcrnpkdoRPqz1HY+LA14jnKsEnvkLSyE+7+OoyrsS4oIztCShFgJJ1JviQfWk
	s9prTfA8y+6KxjSey7pOFe9kKJS2PJpoNpr4EedxrsqvBGKsZ6MCp+fYCQ1P/gWEUb5sWkEM5wH
	XtV+GT/V734DWdhdrGJcvWM3jHwB1DnJza8GcTcWhMKng+fzv+cQAmgyEjihsWC9zq5JupTjZRl
	Pd59RNlDsQd17tvYTq/wK3GYsieDM13Vc=
X-Received: by 2002:a05:6a20:2446:b0:3dd:85aa:452a with SMTP id adf61e73a8af0-4014b5659d7mr23101905637.37.1795684858014;
        Thu, 26 Nov 2026 01:20:58 -0800 (PST)
X-Received: by 2002:a05:6a20:2446:b0:3dd:85aa:452a with SMTP id adf61e73a8af0-4014b5659d7mr23101877637.37.1795684857511;
        Thu, 26 Nov 2026 01:20:57 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm10752089b3a.7.2026.11.26.01.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:20:57 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 3/7] wifi: ath12k: fix ath12k_mac_op_change_vif_links() for active-link updates
Date: Thu, 26 Nov 2026 17:20:33 +0800
Message-Id: <20261126092037.462830-4-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
References: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YyUbK04JlPOj0jVT5Q2ROC13dVZObYNP
X-Proofpoint-GUID: YyUbK04JlPOj0jVT5Q2ROC13dVZObYNP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX+yQpNyCrKwhm
 GSowCcZ110mtNo2mp796BbDNRppQaIJZYuWQDwXWQcYfXoi3MKzWuxVv2dIine7ybyJQ9+01dCD
 Lvrm2glpR3qwyw8WJeqD/3YCo+66NvF/WKAws5mv83EEAo36V5/9Wl1eM5sCT8D6/p4PHv5LCbA
 CcWvyXddfIFMuPgvgnBKOIZLLvABLP/WlWvJr9hL2lULuocRDjnjCGP4hBFe2b5D5DpWAio64YA
 xmg0Rav5ZyIc+WuReG2AR2N3aeo4Fvhsso+Qgxzk0YHjQNSzkP6dzuz0GDg+XphScQR9YQjCNTi
 0ANBLHMo6AeNlwYlcfWvqbJSbtLTbOHUjD7ActggamWZWWiMqhpjKfX6O45VaVIPHTafbVWzKKt
 6LRPQvoKqvt2U3gUW9iWt9JclfxMpAVz5o2YPJ9/cKau0J7YoAxPDXW3N8Yc86iDLK2zQCRlvrA
 FoodVLqIyGIQcc7lr3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfXxQKr1vrfNJ8V
 obkkcB4Sjqqk5A009ICshGGOQJD63Ip+jRion+OcY0w0WFZc4FlsL9LC0MP5E+iiVlR75ADeflA
 dAvh21vApQOQpiM7IP1Hlpel0JWxR2Y=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b07f9fb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Ns_Jbl9W-MFJWGn9c5UA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_012101_308751_8E0FF57A 
X-CRM114-Status: GOOD (  17.97  )
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

Currently, ath12k_mac_op_change_vif_links() derives the links to add and
remove from the old_links/new_links arguments: it creates a link vif
(arvif) for each link in ~old_links & new_links and frees the arvif of
each link in old_links & ~new_links.

However, mac80211 invokes drv_change_vif_links() both when the valid
links change and when the active links change. In the first case
old_links/new_links are the valid links. In the second case they are
only the active links, while vif->valid_links is not modified. A link
that is deactivated is therefore reported as removed, although it is
still a valid link of the MLD.

To fix this, derive the arvif lifetime from vif->valid_links, which
mac80211 updates before calling the driver and which an active-link
change leaves untouched. Create an arvif for each link in
valid_links & ~links_map and remove those in links_map & ~valid_links.
A link that is only deactivated keeps its arvif. On disconnect
(valid_links == 0) every remaining arvif is removed. The WARN_ON() for
adding a link that already has an arvif is dropped, since links already
in links_map are not selected for creation.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 315d80be304a ("wifi: ath12k: allocate new links in change_vif_links()")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index cecd634c5f7f..d7234ef9c025 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4388,9 +4388,8 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 			       struct ieee80211_bss_conf *ol[IEEE80211_MLD_MAX_NUM_LINKS])
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	unsigned long to_remove = old_links & ~new_links;
-	unsigned long to_add = ~old_links & new_links;
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	unsigned long to_remove, to_add;
 	struct ath12k_link_vif *arvif;
 	u8 link_id;
 
@@ -4400,14 +4399,15 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 			   "mac vif link changed for MLD %pM old_links 0x%x new_links 0x%x\n",
 			   vif->addr, old_links, new_links);
 
-	for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
-		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
-		/* mac80211 wants to add link but driver already has the
-		 * link. This should not happen ideally.
-		 */
-		if (WARN_ON(arvif))
-			return -EINVAL;
+	/*
+	 * Link objects follow vif->valid_links, which mac80211 updates before
+	 * calling us. old_links/new_links only describe the active links and
+	 * must not be used to decide object lifetime.
+	 */
+	to_add = vif->valid_links & ~ahvif->links_map;
+	to_remove = ahvif->links_map & ~vif->valid_links;
 
+	for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
 		arvif = ath12k_mac_assign_link_vif(ah, vif, link_id);
 		if (WARN_ON(!arvif))
 			return -EINVAL;
-- 
2.34.1


