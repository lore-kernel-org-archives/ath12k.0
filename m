Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376BFCD98D8
	for <ath12k@archiver.kernel.org>; Sun, 14 Jun 2026 05:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPExHvGqdSaYvMfJOkGIJdqnJt4PaGoq4FO7HYaZ2Rg=; b=rm4ETAxGK+YLhOfSFLsWLss5RO
	I1/bOPRwSvd/jN7Q9TeRjH/SyslDA/tjNtpwlHJBdCtxgfrxSKGKE5uhDKuiumK60YMqF/nmu8Rzi
	h3Z8+oypVr6XSUhngDyF2UxcZ/of889xZz7dO0N2YHXBGAtpgblZ6ee455C0HpqsdyzDBRdm7ZW+B
	3YhluuTKBhpSEUHNrQhTsoI2XiDJZtUPuy/VnQyWZmZKIi2ysrt5c3Sx4UjQgIqZnFvtHdLkxkIZE
	wOeEL/E+uH4G5dVz+p59i05NFaddFHuulvbqpbTkpQ3DFoB+z1LCUXXreuupUfSLdFyyISA11R1SL
	7+JtSsxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYdEu-0000000Ckb7-2Ezz;
	Sun, 14 Jun 2026 05:18:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYdEs-0000000CkaR-0Yso
	for ath12k@lists.infradead.org;
	Sun, 14 Jun 2026 05:18:31 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E49qF1126511
	for <ath12k@lists.infradead.org>; Sun, 14 Jun 2026 05:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kPExHvGqdSa
	YvMfJOkGIJdqnJt4PaGoq4FO7HYaZ2Rg=; b=VtKXGxfy+gliYcLId919ByvIzA1
	dBTdQ4lkG0YvUe6VwVxbi9I6bjY78MKiSKw2BXUtNqJ5kwYHqC8/veDwKO2su/XA
	PjJzYRpn3lCP2T/av8gsddREZMtNhbzcbRcq8BB6y0gweRAE7hY3rTosXt3moNxT
	pOhX/IL9zo1r1BHscaAY3nG7tpssxyZ6mgumzIihJyjaGy7elU9H5343+G2ky3r5
	27SI/zULsb1vzoOk5qCRPq2ZWQNVfxIMlP1wdi/w00EcKYCQsIfGxY/OqKXcwxtp
	nILyTsD/sJM9OoWk5M0cdMnmRGsniSeccNRvY8JKiWODbccrHO7W9w7VUWw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9fathk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 14 Jun 2026 05:18:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a2f19558so1186606a12.2
        for <ath12k@lists.infradead.org>; Sat, 13 Jun 2026 22:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781414309; x=1782019109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPExHvGqdSaYvMfJOkGIJdqnJt4PaGoq4FO7HYaZ2Rg=;
        b=AVar/LnIERvvJrfWp4jzzf+1VksiTsWeHbFEEjFEyS3U2XZ7wrygHgNqhfv8rI93Mr
         EomFiz1cH+FEYOrKKqGslSL58Sc0wyriiotqS9AKSldzfK5F0b9qjBMc8vOT/GtBXKyo
         FW8kvZFTr/TIfdWdQu7WMDVeeaziotfdFqS5ZORtqqd8NE7Ti1/UhU65XNLUAcfTjT74
         JhjGqdW6CVXpKe4bSwLmsledsn7RL9azJgMi4mdUirLnFklnnL6Ol0S7LAMvQidtRNTg
         nyKxpTI5kkVi+ZxGptw5toPa+iIvPoTgs6yetzTAKP4L5ZV+B3iq+mCpsfFVKkv8E+E1
         bA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781414309; x=1782019109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kPExHvGqdSaYvMfJOkGIJdqnJt4PaGoq4FO7HYaZ2Rg=;
        b=nKtlrxe2j4RptaJBCIHd792ObtKh3KCSbF3i031bUOBwUU5M15Q9pl7YB0PL6CoHDZ
         VHRWevuf2qBkTtV1D9g7uej/7m9KyEVT/C08d8rFODMq9r9Sa/pUJRZEAGvhI+bvu1m8
         IZzWvxCLORtqhRDcL31FgDt4f/A+3N2JECdPvSLbWxZfQJ+NIjxCSG2F8mazQ3vh+ilX
         4WGw7ZVaJoKcldZhYlJkvXM4YOOADi1f9LxWwO3hj90bDXcAaYMFaNB+XSKOHsngOrej
         y+A7Rb7cDZehT9qL1Pi57l5JFDIq2uyWCN6u3O4QzCOTQxHrrjdZpRG9w3SpLJzK3hqT
         6UUw==
X-Forwarded-Encrypted: i=1; AFNElJ+NNGts9kgYOYXbXHc4NuJ4+tnJ1hJyU+nJT3LuNscQjSg8oIfItWRUdVeqU2tx4kI0m860IgM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWk7rDD0hzd710I75ADEc2uoVtx3XeEk7AE4k3vGB099fxfYlu
	X7/2aLmPDbyKDgWPmuNQnt0n8uf6uZ773bJlYLiArMRGvA1y/TCM5qoAulKyFzPimHMVPJEHnEf
	cjEvs7JOJqc534UPDX2MUhnzyWXWonWdqw6ns7864UOP1tkHfi4bYyd/a/O5p2sviDiDCuw4y
X-Gm-Gg: Acq92OH/PdvD5t+mMqS6gRv3LCmujWvwEHREsFeNWodLKtPuG46LqcJ07+dO/IZi11H
	oKkudmoR0cTtHGgdkDXLKNFQSRRWMw0ZgfR9uisMAhFiikR1wOxsWJh9vzca9wByq9CIgXWjXMN
	2lNKAIKRsimuXdWi9UayoJ3xga3sKMg1JiRzQNfqOH/2TirC9NyljmL+J80EnZrh75aJLEFI9j3
	t+Fh2xrMJY6bz0KW8WN1yuFUIJ1ZhK7VMxGw+ZhhOtBVt6Wq0s0/DZgKHX1r21TNkUXtjtGSu3n
	ZSsu31GZ1HVn6G002j+/tbYiXXYkGm5IHE5fh85TCsnSUmmLZbxTsfobCsOC2OPjx8iVuWTvf/t
	RvBZJ0knKHaPisAyHoH1Y88hnyimK3T3dvN0J7rJx8q2xWL9iNN9AXPdaFcNusYj+GXpkf/Gm3A
	xc3e+jk5LjISYsy6dwJYydC9M0Wi/6Q9OHUEN1QzI=
X-Received: by 2002:a17:902:da84:b0:2c0:d9b7:b7b0 with SMTP id d9443c01a7336-2c41216fae7mr111460055ad.31.1781414308882;
        Sat, 13 Jun 2026 22:18:28 -0700 (PDT)
X-Received: by 2002:a17:902:da84:b0:2c0:d9b7:b7b0 with SMTP id d9443c01a7336-2c41216fae7mr111459865ad.31.1781414308376;
        Sat, 13 Jun 2026 22:18:28 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c651dsm64456705ad.26.2026.06.13.22.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 22:18:27 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        praneesh.p@oss.qualcomm.com
Subject: [PATCH wireless-next v2 3/5] wifi: cfg80211: Refactor nl80211_dump_station() to prepare for per-link stats
Date: Sun, 14 Jun 2026 10:47:33 +0530
Message-ID: <20260614051739.3979947-4-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260614051739.3979947-1-praneesh.p@oss.qualcomm.com>
References: <20260614051739.3979947-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDA0OSBTYWx0ZWRfX4qH1istssb57
 YkWBF2XbZneUzcXTxSCtEDfP5icFv1Sh/co5m1v9Gh5cGeHX7iarBi8XwwGxsJG0IrvprftyWR4
 RmkLUEojUdC6dK8LGcr5C3rKmT3MYgVrvy6gUZtg0gtaS30Lk9llQlytWDovMAoVC54dQDa6OGT
 DGusmScOaT8QdixyBY/4boRKXcuNE/PSCzr5k9BqIaz2K/uRyB5IVrzeGzMRYlKO0vHlciHIC2k
 Z+iO6AFs2AMPmxUFgyNFswFkMzHOHn4i/CzDWhlZailZzX20JlKFaEsRyuDSCOjGOL39y4p3Zd+
 rk2I9Ov9zSWzHLLmy3BaBbgoTdtb9+VyGJ3iw44oDcZHKLXFkg7gpFFPHekBfIeyJl5ndJTdvp4
 dKQv6c3mjOMwlOPpug+8sJO2nWn6qLy8L+HPmNiW6ieiFEh0oLv4f2uZ6e883PMszW87Y6JlWq/
 QVnpDzHqu92DKpOvi1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDA0OSBTYWx0ZWRfX6hE8r83QkUCo
 IgjCpzdY86zV3JITtNezBsNY19UuiWX0FYNbXVw5nteW/sc0vanTW2RntWKmyaSkxY8ZvhxCFQq
 tn4aBohZiQ9Cde48KiCleqM/3c7bI2w=
X-Proofpoint-GUID: zANZCqdLTecLYKoQg6AxjyLrVJtruemN
X-Proofpoint-ORIG-GUID: zANZCqdLTecLYKoQg6AxjyLrVJtruemN
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2e39a5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=TxQvnd6P1TTKPCFIUNUA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_221830_180274_6525DF37 
X-CRM114-Status: GOOD (  23.47  )
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

Currently, nl80211_dump_station() relies on the netlink callback's generic
args array (cb->args[2]) to track the station index during dumps. It also
processes the entire sinfo structure and transmits it to userspace
immediately in a single pass.

This approach creates a bottleneck for MLO. When an MLD station has
multiple active links, the aggregated station information, combined
with the individual per-link statistics, can easily exceed the
maximum netlink message size limits. The current monolithic dump
iteration cannot pause and resume mid-station to fragment these large
per-link statistics across multiple netlink messages.

Introduce a stateful context structure (struct nl80211_dump_station_ctx)
allocated during the dump to track the iteration state. Store the context
pointer directly at cb->args[2], following the same pattern as
nl80211_dump_wiphy which stores its state pointer at cb->args[0].

Move the station index (sta_idx) tracking and the sinfo payload into this
context. The per-station netlink message is built inline in the loop:
common header attributes are assembled directly, then
nl80211_put_sta_info_common() adds the STA_INFO payload.

Furthermore, move the NL80211_CMD_GET_STATION command definition from
genl_small_ops to genl_ops to natively support the .done callback.
Implement nl80211_dump_station_done() to ensure the newly allocated state
context and its deeply allocated sinfo payload are safely freed when the
dump concludes or is aborted prematurely by userspace.

Note that the previous dump path used nl80211_send_station(), which
included NL80211_ATTR_IE and NL80211_ATTR_RESP_IE. These attributes are
not carried forward in this implementation. As documented, association
response IEs (assoc_resp_ies) are only relevant at station creation time
(e.g. via cfg80211_new_sta()) to notify userspace about association
details, and are not expected to be part of get_station()/dump_station()
callbacks. Aligning with this expectation, these IEs are intentionally
omitted here.

This refactoring maintains the existing netlink batching performance while
laying the stateful foundation required for per-link statistics
fragmentation in subsequent patches.

At out_err_release, cfg80211_sinfo_release_content() frees any
dynamically allocated sub-fields inside ctx->sinfo (including per-link
pointers in sinfo.links[]). Without the subsequent memset, those
pointers remain non-NULL in the embedded sinfo. When the dump concludes
or is aborted, nl80211_dump_station_done() calls
cfg80211_sinfo_release_content() a second time on the same ctx->sinfo,
which would free the already-released link memory. The
memset(&ctx->sinfo, 0, sizeof(ctx->sinfo)) zeroes all pointers so the
second release call hits kfree(NULL), which is a harmless no-op.

Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 net/wireless/nl80211.c | 129 +++++++++++++++++++++++++++--------------
 1 file changed, 85 insertions(+), 44 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 66f19bfc030a..b4c4406d77bf 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -8464,16 +8464,19 @@ static void cfg80211_sta_set_mld_sinfo(struct station_info *sinfo)
 	sinfo->filled &= ~BIT_ULL(NL80211_STA_INFO_CHAIN_SIGNAL_AVG);
 }
 
+struct nl80211_dump_station_ctx {
+	int sta_idx;
+	u8 mac_addr[ETH_ALEN];
+	struct station_info sinfo;
+};
+
 static int nl80211_dump_station(struct sk_buff *skb,
 				struct netlink_callback *cb)
 {
-	struct station_info sinfo;
 	struct cfg80211_registered_device *rdev;
 	struct wireless_dev *wdev;
-	u8 mac_addr[ETH_ALEN];
-	int sta_idx = cb->args[2];
-	bool sinfo_alloc = false;
-	int err, i;
+	struct nl80211_dump_station_ctx *ctx = (void *)cb->args[2];
+	int err;
 
 	err = nl80211_prepare_wdev_dump(cb, &rdev, &wdev, NULL);
 	if (err)
@@ -8481,6 +8484,15 @@ static int nl80211_dump_station(struct sk_buff *skb,
 	/* nl80211_prepare_wdev_dump acquired it in the successful case */
 	__acquire(&rdev->wiphy.mtx);
 
+	if (!ctx) {
+		ctx = kzalloc_obj(*ctx);
+		if (!ctx) {
+			err = -ENOMEM;
+			goto out_err;
+		}
+		cb->args[2] = (long)ctx;
+	}
+
 	if (!wdev->netdev && wdev->iftype != NL80211_IFTYPE_NAN) {
 		err = -EINVAL;
 		goto out_err;
@@ -8491,55 +8503,83 @@ static int nl80211_dump_station(struct sk_buff *skb,
 		goto out_err;
 	}
 
-	while (1) {
-		memset(&sinfo, 0, sizeof(sinfo));
+	while (true) {
+		void *hdr;
 
-		for (i = 0; i < IEEE80211_MLD_MAX_NUM_LINKS; i++) {
-			sinfo.links[i] =
-				kzalloc_obj(*sinfo.links[0]);
-			if (!sinfo.links[i]) {
+		memset(&ctx->sinfo, 0, sizeof(ctx->sinfo));
+		for (int i = 0; i < IEEE80211_MLD_MAX_NUM_LINKS; i++) {
+			ctx->sinfo.links[i] =
+				kzalloc_obj(*ctx->sinfo.links[0]);
+			if (!ctx->sinfo.links[i]) {
 				err = -ENOMEM;
-				goto out_err;
+				goto out_err_release;
 			}
-			sinfo_alloc = true;
 		}
 
-		err = rdev_dump_station(rdev, wdev, sta_idx,
-					mac_addr, &sinfo);
-		if (err == -ENOENT)
-			break;
+		err = rdev_dump_station(rdev, wdev, ctx->sta_idx,
+					ctx->mac_addr, &ctx->sinfo);
+		if (err == -ENOENT) {
+			err = skb->len;
+			goto out_err_release;
+		}
 		if (err)
-			goto out_err;
+			goto out_err_release;
 
-		if (sinfo.valid_links)
-			cfg80211_sta_set_mld_sinfo(&sinfo);
+		if (ctx->sinfo.valid_links)
+			cfg80211_sta_set_mld_sinfo(&ctx->sinfo);
 
-		/* reset the sinfo_alloc flag as nl80211_send_station()
-		 * always releases sinfo
-		 */
-		sinfo_alloc = false;
+		hdr = nl80211hdr_put(skb, NETLINK_CB(cb->skb).portid,
+				     cb->nlh->nlmsg_seq, NLM_F_MULTI,
+				     NL80211_CMD_NEW_STATION);
+		if (!hdr) {
+			err = skb->len;
+			goto out_err_release;
+		}
 
-		if (nl80211_send_station(skb, NL80211_CMD_NEW_STATION,
-				NETLINK_CB(cb->skb).portid,
-				cb->nlh->nlmsg_seq, NLM_F_MULTI,
-				rdev, wdev, mac_addr,
-				&sinfo) < 0)
-			goto out;
+		if ((wdev->netdev &&
+		     nla_put_u32(skb, NL80211_ATTR_IFINDEX,
+				 wdev->netdev->ifindex)) ||
+		    nla_put_u64_64bit(skb, NL80211_ATTR_WDEV,
+				      wdev_id(wdev), NL80211_ATTR_PAD) ||
+		    nla_put(skb, NL80211_ATTR_MAC, ETH_ALEN, ctx->mac_addr) ||
+		    nla_put_u32(skb, NL80211_ATTR_GENERATION,
+				ctx->sinfo.generation)) {
+			genlmsg_cancel(skb, hdr);
+			err = skb->len;
+			goto out_err_release;
+		}
 
-		sta_idx++;
+		if (nl80211_put_sta_info_common(skb, rdev, &ctx->sinfo)) {
+			genlmsg_cancel(skb, hdr);
+			err = skb->len;
+			goto out_err_release;
+		}
+
+		genlmsg_end(skb, hdr);
+		cfg80211_sinfo_release_content(&ctx->sinfo);
+		ctx->sta_idx++;
 	}
 
- out:
-	cb->args[2] = sta_idx;
-	err = skb->len;
- out_err:
-	if (sinfo_alloc)
-		cfg80211_sinfo_release_content(&sinfo);
+out_err_release:
+	cfg80211_sinfo_release_content(&ctx->sinfo);
+	memset(&ctx->sinfo, 0, sizeof(ctx->sinfo));
+out_err:
 	wiphy_unlock(&rdev->wiphy);
 
 	return err;
 }
 
+static int nl80211_dump_station_done(struct netlink_callback *cb)
+{
+	struct nl80211_dump_station_ctx *ctx = (void *)cb->args[2];
+
+	if (ctx) {
+		cfg80211_sinfo_release_content(&ctx->sinfo);
+		kfree(ctx);
+	}
+	return 0;
+}
+
 static int nl80211_get_station(struct sk_buff *skb, struct genl_info *info)
 {
 	struct cfg80211_registered_device *rdev = info->user_ptr[0];
@@ -19504,6 +19544,14 @@ static const struct genl_ops nl80211_ops[] = {
 		/* can be retrieved by unprivileged users */
 		.internal_flags = IFLAGS(NL80211_FLAG_NEED_WIPHY),
 	},
+	{
+		.cmd = NL80211_CMD_GET_STATION,
+		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
+		.doit = nl80211_get_station,
+		.dumpit = nl80211_dump_station,
+		.done = nl80211_dump_station_done,
+		.internal_flags = IFLAGS(NL80211_FLAG_NEED_WDEV),
+	},
 };
 
 static const struct genl_small_ops nl80211_small_ops[] = {
@@ -19603,13 +19651,6 @@ static const struct genl_small_ops nl80211_small_ops[] = {
 		.internal_flags = IFLAGS(NL80211_FLAG_NEED_NETDEV_UP |
 					 NL80211_FLAG_MLO_VALID_LINK_ID),
 	},
-	{
-		.cmd = NL80211_CMD_GET_STATION,
-		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
-		.doit = nl80211_get_station,
-		.dumpit = nl80211_dump_station,
-		.internal_flags = IFLAGS(NL80211_FLAG_NEED_WDEV),
-	},
 	{
 		.cmd = NL80211_CMD_SET_STATION,
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
-- 
2.43.0


