Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB8B606A33F
	for <ath12k@archiver.kernel.org>; Tue, 20 Oct 2026 06:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C8i9HBFe;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bzviSe7p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DKhUrp9q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jysg3UmDk9FTjMu2P0SUUwTrEQM4YhK98PUt0MSaa74=; b=C8i9HBFe1d0tnSwMGMCQ9+a1mm
	uGUqAdSkGS4ScrxCfsQ2RG/nAF4dA/F3DbeFLv9ZvXT1h0qWvo0Dmc2mspuzjt6OoBuQ+17N6oo08
	ocwyihQnVctFGbqw2hIkG0IklKa12/Vy9WL8gmGrV9qb3FdbJptzDn3gsO1BUlpAryjHGYd14ocEB
	3zUA/FPMRDHfXVrcdLy6IRjmWovM2yb4cKDLx0JAJ1x/wvL6YC19LzjcnzR7Z8lh25Gy2zqvd0/l0
	T8iEM4beqJDX5XD6anPGNdRByGGZF8CHDvJt1CXc33JEoU6fpK8jlqsIQEHqGyNz1G59Eu4PnfcVn
	xriS+7VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3TV-00000008vxV-0h3x;
	Tue, 20 Oct 2026 06:37:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3TS-00000008vwr-3623
	for ath12k@lists.infradead.org;
	Tue, 20 Oct 2026 06:37:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K5hdE51320466
	for <ath12k@lists.infradead.org>; Tue, 20 Oct 2026 06:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Jysg3UmDk9FTjMu2P0SUUwTrEQM4YhK98PU
	t0MSaa74=; b=bzviSe7pmEptALkpPGd0lvM3NL1SvYkEoR9LZOf3CLzbO4GnM4T
	cmh9KgiK0L9bOYaef5BsVOM5uUC5Qo0ANL3sQwhySJhDJUO68KQ1KLQVsFu0hI1A
	9FosSglTEG0RMqaOrOyg/IFDqz6hVciXmyn1Fvksg/xku54cy7Lqb8KrbhxE/x7C
	7RVGHHyEA7nBPWyTD4UqkfkzBEXc8OtZaQ0o1HwwAYQhsgQEYGY2si0HmdtkAGeB
	RTr0tcm+znrcAgyeXh5whqRpXHfwGROuSHQB7aEp3KkWcv55WCPRNmZg6IQEQP+K
	0vCVjgoz/Jwqi/I3Ww15OIcATxLaT6N3ESQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ph8ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 20 Oct 2026 06:37:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab868fe362so3038043a91.2
        for <ath12k@lists.infradead.org>; Mon, 19 Oct 2026 23:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792478244; x=1793083044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jysg3UmDk9FTjMu2P0SUUwTrEQM4YhK98PUt0MSaa74=;
        b=DKhUrp9qnDPXxgRshM60mMXTcSEQQ4mpqVGIy/eCrbVBC4Am1QXlyD8Q3HfDqddJYm
         RAS/r4z0SOeaF5+Ep7RFlER1fc8iZ7MTLijlq0YwhG/cHhC/pju/0NP0SI+bj3kQrTY+
         b9WkTAdAHgnrTB3iWgZZfPzTKGVuihZlzHfXyEP0XToznuDCxJxnjTAh9UAVRa53Hu8T
         7CYCSB+XCfW1fPnKfkmnBTL6grwDnxUbnJOifl+psI7d1ZUuxDLHxoXZFVG7Iob+Z/ou
         ddCEIWIjIaBATMBpnSZ2mla3tJ0ruy2L4YxwJ+vKnYRBmb0A4QrPtEuagQiwkW9BTfII
         5t3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478244; x=1793083044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jysg3UmDk9FTjMu2P0SUUwTrEQM4YhK98PUt0MSaa74=;
        b=rlfP1TE60YnNAcdpNu4WS+qhwHm/e5FH0J/58/vF0NWWgLeAU+evJScitLDlc9dz6I
         3zZavTd3mnjUqe0QbE5+inbbezlHQR0jMMplIf0r47FYvkcPFvEkXSom+VyPExmjuKsK
         025QD/1/adlm5uoU4+nJmbVn1l8ZQv9N4VOw29q37Ayq2DQTGRvfDIMyLh9GphnjGjj9
         WeHUnlIunDZ8dyuFb+rRCE9YQrjR0hC78Bi922qvSf3A/YT559rsWbKqQ90JkektV+a+
         rfs1bc7lpvshDOJc0T/RYdSgSQ5rrEV1vi6BRnnGiHQmi4g7dg15/hjeOKjtrOALsTVa
         oA+g==
X-Forwarded-Encrypted: i=1; AKwUvBzf1JcAFSKjPBqiuwK+mzIyeQDV+BD0RH0gjVTDZdHO/ABcsgymgnohYG68fEU6Wl8fcwf27lA=@lists.infradead.org
X-Gm-Message-State: AFq9FYIzdoHK1wBzeGK6nX8S2/zBUkYxWTqQYmZaj7COV3vNP3m8lwRZ
	TI2CHa7NB85slHYSqEO7XpV4YWqD69jkbogtw8XwtlcRdihDATfrWi7FZBrDLS5O0jk9fDwBVt+
	5yizxmLPoKre/IUVvZ+LRGSRj+t3khbyHUrAG1XEHvSXT7U87U42DAFPe3z+P7fRN
X-Gm-Gg: AYBFou36zdTup1KPXq0eG2RjFZuKCfK6cwxtB+YUjrFSptaVCEK5OMbDNbik3zmrgzT
	ceGQh/A6hlbawaxIeZKU18qLDCpmfcHECh4PPHwRMnHRAOqRUvTDQfVMhSv12o9C0fyXEDlhJL/
	0V2qHKh5TNdLelHGZAi0zsaK5tFSmtVszCBs+g0nFalXj+eahjyHqnzSgUyu47VYOFjJK1gvoJV
	khTPLiELbU9YbtI0EseWjRMHP8RaYMJ9/trvQxoUN89Cw9kThCjEZQlLwqp6ZCWVrE1zAq0ox5Z
	b3RM9qg5DUSuLjbZDp5a851eL8LrJJ+TWVntrjT/LwWkChfFLADO4ylvYvxlvX1awFjkmdmmqZD
	yUwCYEYtxM+y6QfLVfCiYwgTY5bDPEk4GXwR00421bcdCO5quDDNFIlAIKg6CJYY=
X-Received: by 2002:a17:90b:4b92:b0:3ac:4e18:238c with SMTP id 98e67ed59e1d1-3acef52acdbmr8657022a91.49.1792478243769;
        Mon, 19 Oct 2026 23:37:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4b92:b0:3ac:4e18:238c with SMTP id 98e67ed59e1d1-3acef52acdbmr8656997a91.49.1792478243126;
        Mon, 19 Oct 2026 23:37:23 -0700 (PDT)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549eea48sm4770140a12.19.2026.10.19.23.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:37:22 -0700 (PDT)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: keep ML mgmt tx on active link
Date: Tue, 20 Oct 2026 14:37:19 +0800
Message-Id: <20261020063719.3486519-1-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad70c24 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=bOrBbOSleF1CZgbF08wA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: cr8PLp5vVbp2MOHJcnt8s2S9_uO_bLCF
X-Proofpoint-GUID: cr8PLp5vVbp2MOHJcnt8s2S9_uO_bLCF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNiBTYWx0ZWRfX5D/ga1qv4zhg
 lhuMZaoA2RNSucgVRsMdM86A2ifsKOHewCXy6XWTBjd081kdC2FLpr1J3/VnNKEzpTE0URpveTy
 dBfxlsXEjHrzmIktb0DF5bdnHrtI4lIZstDOUEqInzpfm0C2gJgKZyTmk1bjyHD7B5AjvpuSaI8
 28pfmmpdFzhPx9mMYvzDZ1LlMgbYH62XPnXvV2nGjgMafnoMaOPu8Wprx4D1OodTkbKHvO1YJC2
 a3h5DefjFJ9r259NQAKsCQnQuLsyleCJvIgaCqzmyKPxnavYZaqubW6ME6oRY/eeTVY8Z3ilNYU
 OgM+QzIJplzkIVvuyn/JeBp0uvdnX6aNPl59VNfxyIv6P2H99RRrO3pM6CFZiamPcae9ws9DLW+
 IvMD0ZT5PXScWyNrM5thfoPCRkgcVpeOyderQ5rC/B5/uAPbA1wVDc+Vm/tS1F/h9iCRnD87q7K
 G/SPKRMXZFgLn1BReFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNiBTYWx0ZWRfXw7WDS1RG5TdM
 SEhZ7Dcb3UaMT/0Bk5SwNQp6Ef9FYAWu2eHIhEasfnUEIwkrMyS1085AJHCthtjfwPG35XIvk3r
 G588w3cHeM8o+xWkUKzl5T9lgBqlzHA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_233726_893268_A9063B0C 
X-CRM114-Status: GOOD (  17.01  )
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

Currently ath12k_mac_get_tx_link() may select an inactive link for ML
management frame transmission. This happens when mac80211 passes
IEEE80211_LINK_UNSPECIFIED and the resolved deflink is inactive.

As a result, ML management frames such as deauthentication are sent on
an inactive link and Tx fails (the frame gets dropped).

Fix this by reselecting the Tx link only when the requested link is
IEEE80211_LINK_UNSPECIFIED and the resolved deflink is inactive.
Start from vif->active_links as the candidate set and prefer
links that are both active on the vif and valid for the peer
(sta->valid_links). If that intersection is empty, fall back to
vif->active_links. Use __ffs() to pick deterministically from the
candidate set.

If mac80211 explicitly requests a link, keep that link and do not remap
management Tx to another link.

This change is limited to ML management frames. Data frames, HW-encap
frames, and non-MLO paths are unchanged.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 01f8c6572f65..14cffba3e354 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9600,6 +9600,7 @@ u8 ath12k_mac_get_tx_link(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 	struct ieee80211_link_sta *link_sta;
 	struct ieee80211_bss_conf *bss_conf;
 	struct ath12k_sta *ahsta;
+	bool req_unspecified_link = (link == IEEE80211_LINK_UNSPECIFIED);
 
 	/* Use the link id passed or the default vif link */
 	if (!sta) {
@@ -9645,6 +9646,33 @@ u8 ath12k_mac_get_tx_link(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 	if (!ieee80211_is_mgmt(hdr->frame_control))
 		return link;
 
+	/*
+	 * Keep ML management Tx on an active link only when mac80211 did
+	 * not request a specific link and the selected link is inactive.
+	 */
+	if (req_unspecified_link && !(vif->active_links & BIT(link))) {
+		unsigned long tx_links = vif->active_links;
+		unsigned long peer_tx_links;
+
+		if (!tx_links)
+			goto out_keep_link;
+
+		peer_tx_links = tx_links & sta->valid_links;
+
+		/*
+		 * Prefer links that are both active on the vif and valid for
+		 * this MLO peer. If no overlap exists, fall back to vif
+		 * active links.
+		 */
+		if (peer_tx_links)
+			tx_links = peer_tx_links;
+		else
+			WARN_ON_ONCE(1);
+
+		link = __ffs(tx_links);
+	}
+
+out_keep_link:
 	/* Perform address conversion for ML STA Tx */
 	bss_conf = rcu_dereference(vif->link_conf[link]);
 	link_sta = rcu_dereference(sta->link[link]);

base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
-- 
2.25.1


