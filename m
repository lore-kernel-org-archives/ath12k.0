Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF48CD8C8C
	for <ath12k@archiver.kernel.org>; Sun,  7 Jun 2026 18:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dk5utpCcHYq7q8GwcnreEiUanj8Y4L/sEzsjQLz9HHk=; b=fpmegS25C5fTSg+JlRbB85pusZ
	5kweJ1x+/qU/bLlM2PI1mEIbQj5AM02THO1lViUBk7DwcLe8bUtJMGsMgX2PNU96so7jReQLMmHan
	+tRePW7n5ZHz8LimoKea5FD50WQMAERhqjGtoCtAbr/f3p2hKgnGxDVfC4rJG2Hzpm2v0y3jz1T9x
	iRmpOdlDoisGNsHR97ycocvALO1H8AzcRHiA9EIqHGWnHR2hw32IBa/VqlKnK0VP0PPKsw0Wz/tlR
	mZDfISJE5ng2TpDOs53oizWI/FIlHqGVS3NVxLx+CergwTq57XgXHKZWhh9LoTRXC9j8wt5reD9Tz
	78wCGHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHmx-00000002OC1-3f7I;
	Sun, 07 Jun 2026 17:59:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHmv-00000002OB6-3qwJ
	for ath12k@lists.infradead.org;
	Sun, 07 Jun 2026 17:59:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Ejsdc441388
	for <ath12k@lists.infradead.org>; Sun, 7 Jun 2026 17:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dk5utpCcHYq
	7q8GwcnreEiUanj8Y4L/sEzsjQLz9HHk=; b=RkkwtjgDF6TzatAa8JNhEbOFo+Q
	5qWmN1+IDvAZk8cLaKBtxs2evT2Nkfb1gIhfXIikQww213HJSO2upIPD06w2UBqY
	0/iIRKf7ZC4RTT4WlRwk0yV7aCVpG3NZrpqG8UwCrVUqYNT0SJa9xHZ+xjmGRDfp
	qzUgS6akqQK5rlCC3I/aolK7QdEjKPvJ15G3nJ+miuJyH8yh8y0a9U96jU62eDNA
	yoQhiZCtQ/wLyTfqMhSEs8TBURDbkSQndwqmbgsb9Cq/eNvwa33uDftyMX7h3Xqs
	XZyM2CtV5fEDMn1hDusiKqfrXgsGhX5E/wdWFJYTiD46Mtk2gHrbIuHq8AA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1cau8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 07 Jun 2026 17:59:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf1dece2ecso36107105ad.1
        for <ath12k@lists.infradead.org>; Sun, 07 Jun 2026 10:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780855197; x=1781459997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dk5utpCcHYq7q8GwcnreEiUanj8Y4L/sEzsjQLz9HHk=;
        b=MYMzeUwcQDZbHrzg4+W9P/M5y7f4tUBbelz1oL1ENm8RUf6ekyzTAFVnhs9HxEldHx
         qdlGCGlnSOlQEKwfwOvOwFk5VzGeTzNn5otBgyc/XJebthJYgBE5SyAbaNZQs3Y8zfo7
         UyTUA8V5pY2YGjCvTuSX/E9HzDhCoUVz4taTJui5ilUB7n/edBQ9C+LeYNBuXNQ3mw0O
         98hJpPuxtkd404fJPCBCMXQTGBzCMLN6FZKXZlqphSAhExTmUBBtTJAZPI9JK2u7me6A
         SALkZ+Rwfi4BiobvFQPdQJWmUMy11ssqBphNS2+pRoNNr5rOdCmM2isiew9gT9YBP41k
         hb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780855197; x=1781459997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dk5utpCcHYq7q8GwcnreEiUanj8Y4L/sEzsjQLz9HHk=;
        b=EpdCb9YgBpzige3JOwnWDj7hufD0RIgvaR8mcbJZTExWYLo9ZGS7JUWcpXpcB8aWZQ
         JOmUrdoXlP3h9f5sdj3L2nGwvPbPgZgiKDE8LHzy0HNSYodELIrGQXb5QNpBRrzl6K5v
         xeHTIsye7B5Jhm7gFy+3jDhrG6wqcGfvOd3YSPlhxZy9Yrv5QWHkD+2Q2c5Gp8CVvbPA
         Yq5qp4EfcTnZp5QoboQIIOD4yCL9ptyGfeSkcd+Hkda2v6k89Y9DoyXHZMpDUBNTdRVj
         G3guBIZZDQvrAVrBlkAj0bUvGQtSsQnrgbUYQvVgxmeecH/wEqHV9WWggdnnppnuFU0f
         gC9A==
X-Forwarded-Encrypted: i=1; AFNElJ9/yU+fTcYDIQ6qL2Z5WPPD42xAj/Uz85UJRJPGoPhE9RuOi5iuLjZ2GpwW+ahv2e3fTOBxGI8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKgiX+KK3GwJlMiAUXc5KdjpGzl3mQM5BFimyA5rsoXpXfu1CH
	eNZfZesXy7ao590G8C9CH/rCEPPu0HQJDu/PC8MYZBn9Wzd/CjtUMXEUzyPjOdzWwIzdLElReNI
	9aOqKz5l6Fq6OGlheKtZi/kyiEeCm8j+Ce1TvcghsmebJq8yL6MCFyg1RPnLex4m4
X-Gm-Gg: Acq92OHAP7qpLURhy4j2ao5ZWpIS9CQL15m80e4IQU68/a8/syyqS9iB3n63ezgalF1
	qijXVLinanQOBgX31LIarwD6pc26BXX/l2Pdjx3GG+luNsO9KI6FDsSzXVXS5FkCf9FjqatbNg+
	S+Ra7laYVkDfMdB7Bji4rD1NBTjX1wME219lSIhZ0t30HZ/dTw6GDjF2IzLldxA1Qv4GBvzlmhe
	+qIBSPBYPHxpH9Q7lH34CwrQi8ugdTkf4qMSNRKZ0lCmvTVa88+UT1a4gxcZD9ovFbryihwuHTi
	T7WUDUjwvfixjg9UZdR7z9FhAOHuRle5uYvpkAIn2/UNWaOVSnkY4dgwWp8EJ8FucHS6y2pFrzP
	PT9QSvBBQHq46gc3iaIYGJkU7h7Yv5tSK6ME1zFcwU/MJuKor0dfZlHEgFRgd8sh6XaZ3h70HT/
	BygBlne2kARq+4LGDs3vQ4Wq2ZZnP87wyqzcKjs6F0OJDAWPz/cw==
X-Received: by 2002:a05:6a20:4328:b0:3b4:7c33:296c with SMTP id adf61e73a8af0-3b4cd0a5a5dmr14105526637.45.1780855196532;
        Sun, 07 Jun 2026 10:59:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:4328:b0:3b4:7c33:296c with SMTP id adf61e73a8af0-3b4cd0a5a5dmr14105498637.45.1780855195975;
        Sun, 07 Jun 2026 10:59:55 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a624fsm13078522a12.18.2026.06.07.10.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 10:59:55 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        praneesh.p@oss.qualcomm.com
Subject: [PATCH wireless-next 3/5] wifi: cfg80211: Refactor nl80211_dump_station() to prepare for per-link stats
Date: Sun,  7 Jun 2026 23:29:10 +0530
Message-ID: <20260607175912.2266215-4-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
References: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE4MCBTYWx0ZWRfX9nXupDBSjj4C
 8I6/Y22Qmi1wnzx3eVYOJHwUEYxQ7TxGrlbo93g3DvAGG7xmFfXWhIw6MIkpbGyAvj6kaav35Jv
 KcfG1L5YqOfIMDMmKz4cEf0x1D+4YN2rWvOFY2Z3BIXTsFWJ3ZREIbLWRO7PP70w5U22At8xVJt
 B8m7GdIxPaoW+qYnwN5notO8etCnYpukc/Iy/AVxK86dgqgtzwefquudSt8fu7jY9TZM+gynQZO
 uYv7N/46lg69UfTMl9v+6iI774I/UBsXwt2Y5DCbUBk7RwZgP/kRbwKT8+0uWn3bH0O3kChQRQv
 OOOsiFrMbNFdkiNKdgxmrfdXCtBtF5VONp2jyOfEvBpYHzf5gDUOM3zJg+rJ36CIgaVoDqB6anm
 yIuFHyT62Pn2vYPKcONijaBBxqQPcfhJL8ebl5dfV6RjL7NVI8igyL0pynUvZK/ErqBkyepOXFY
 8LPJKVv5P4kxF3DGaVg==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a25b19d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=hwBch8dKHD1l83SQFqoA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: EzQdK93TdoLmY3EYxn4vcI8JwZkGmq6-
X-Proofpoint-GUID: EzQdK93TdoLmY3EYxn4vcI8JwZkGmq6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_105957_963110_D2AC207B 
X-CRM114-Status: GOOD (  26.18  )
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
allocated during the dump to track the iteration state. Move the station
index (sta_idx) tracking into this context, and introduce a phase
variable to represent the current fragmentation state (starting with
Phase 0 for the base aggregated MAC-level statistics).

Utilize the existing nl80211_prepare_wdev_dump() to safely parse the wdev
attributes on every dump iteration, ensuring proper RTNL and wiphy locking
without caching dangling device pointers. Furthermore, move the
NL80211_CMD_GET_STATION command definition from genl_small_ops to
genl_ops to natively support the .done callback. Implement
nl80211_dump_station_done() to ensure the newly allocated state context
and its deeply allocated sinfo payload are safely freed when the dump
concludes or is aborted prematurely by userspace.

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

Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 net/wireless/nl80211.c | 201 +++++++++++++++++++++++++++++++----------
 1 file changed, 153 insertions(+), 48 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 88232c323d9c..d146d6af6e48 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -39,6 +39,39 @@ static int nl80211_crypto_settings(struct cfg80211_registered_device *rdev,
 
 /* the netlink family */
 static struct genl_family nl80211_fam;
+/**
+ * enum nl80211_dump_station_phase - station dump fragmentation phases
+ * @NL80211_DUMP_STA_PHASE_AGGREGATED: send aggregated (MLO-combined) station
+ *	statistics for the station entry
+ * @NL80211_DUMP_STA_PHASE_PER_LINK: send per-link statistics for each active
+ *	MLO link of the station; only used when dump_link_stats is set
+ */
+enum nl80211_dump_station_phase {
+	NL80211_DUMP_STA_PHASE_AGGREGATED = 0,
+	NL80211_DUMP_STA_PHASE_PER_LINK   = 1,
+};
+
+struct nl80211_dump_station_ctx {
+	int sta_idx;
+	enum nl80211_dump_station_phase phase;
+	u8 mac_addr[ETH_ALEN];
+	struct station_info sinfo;
+};
+
+/**
+ * struct nl80211_dump_station_cb - state stored in netlink_callback::ctx
+ * @wiphy_idx: args[0] - wiphy index from nl80211_prepare_wdev_dump
+ * @wdev_id: args[1] - wdev identifier from nl80211_prepare_wdev_dump
+ * @ctx: args[2] - dump station context pointer
+ *
+ * args[0] and args[1] are reserved by nl80211_prepare_wdev_dump().
+ * The ctx pointer must live at args[2] to avoid corrupting those fields.
+ */
+struct nl80211_dump_station_cb {
+	long wiphy_idx;
+	long wdev_id;
+	struct nl80211_dump_station_ctx *ctx;
+};
 
 /* multicast groups */
 enum nl80211_multicast_groups {
@@ -8279,23 +8312,72 @@ static void cfg80211_sta_set_mld_sinfo(struct station_info *sinfo)
 	sinfo->filled &= ~BIT_ULL(NL80211_STA_INFO_CHAIN_SIGNAL_AVG);
 }
 
+static int
+nl80211_send_accumulated_station(struct sk_buff *msg,
+				 struct netlink_callback *cb,
+				 struct cfg80211_registered_device *rdev,
+				 struct wireless_dev *wdev,
+				 const u8 *mac_addr,
+				 struct station_info *sinfo)
+{
+	void *hdr;
+
+	hdr = nl80211hdr_put(msg, NETLINK_CB(cb->skb).portid,
+			     cb->nlh->nlmsg_seq, NLM_F_MULTI,
+			     NL80211_CMD_NEW_STATION);
+	if (!hdr)
+		return -EMSGSIZE;
+
+	if ((wdev->netdev &&
+	     nla_put_u32(msg, NL80211_ATTR_IFINDEX, wdev->netdev->ifindex)) ||
+	    nla_put_u64_64bit(msg, NL80211_ATTR_WDEV, wdev_id(wdev),
+			      NL80211_ATTR_PAD) ||
+	    nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN, mac_addr) ||
+	    nla_put_u32(msg, NL80211_ATTR_GENERATION, sinfo->generation))
+		goto nla_put_failure;
+
+	if (nl80211_put_sta_info_common(msg, rdev, sinfo))
+		goto nla_put_failure;
+
+	genlmsg_end(msg, hdr);
+	return 0;
+
+nla_put_failure:
+	genlmsg_cancel(msg, hdr);
+	return -EMSGSIZE;
+}
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
+	struct nl80211_dump_station_cb *cb_data = (void *)cb->ctx;
+	struct nl80211_dump_station_ctx *ctx = cb_data->ctx;
+	int err, ret;
+
+	NL_ASSERT_CTX_FITS(struct nl80211_dump_station_cb);
 
 	err = nl80211_prepare_wdev_dump(cb, &rdev, &wdev, NULL);
 	if (err)
 		return err;
+
 	/* nl80211_prepare_wdev_dump acquired it in the successful case */
 	__acquire(&rdev->wiphy.mtx);
 
+	/* First invocation: allocate ctx */
+	if (!ctx) {
+		ctx = kzalloc_obj(*ctx);
+		if (!ctx) {
+			err = -ENOMEM;
+			goto out_err;
+		}
+
+		ctx->phase = NL80211_DUMP_STA_PHASE_AGGREGATED;
+		ctx->sta_idx = 0;
+		cb_data->ctx = ctx;
+	}
+
 	if (!wdev->netdev && wdev->iftype != NL80211_IFTYPE_NAN) {
 		err = -EINVAL;
 		goto out_err;
@@ -8306,55 +8388,77 @@ static int nl80211_dump_station(struct sk_buff *skb,
 		goto out_err;
 	}
 
-	while (1) {
-		memset(&sinfo, 0, sizeof(sinfo));
-
-		for (i = 0; i < IEEE80211_MLD_MAX_NUM_LINKS; i++) {
-			sinfo.links[i] =
-				kzalloc_obj(*sinfo.links[0]);
-			if (!sinfo.links[i]) {
-				err = -ENOMEM;
-				goto out_err;
+	/* Phase 0: dump aggregated station info */
+	if (ctx->phase == NL80211_DUMP_STA_PHASE_AGGREGATED) {
+		while (true) {
+			memset(&ctx->sinfo, 0, sizeof(ctx->sinfo));
+			for (int i = 0; i < IEEE80211_MLD_MAX_NUM_LINKS; i++) {
+				ctx->sinfo.links[i] =
+					kzalloc_obj(*ctx->sinfo.links[0]);
+				if (!ctx->sinfo.links[i]) {
+					err = -ENOMEM;
+					goto out_err_release;
+				}
 			}
-			sinfo_alloc = true;
-		}
-
-		err = rdev_dump_station(rdev, wdev, sta_idx,
-					mac_addr, &sinfo);
-		if (err == -ENOENT)
-			break;
-		if (err)
-			goto out_err;
 
-		if (sinfo.valid_links)
-			cfg80211_sta_set_mld_sinfo(&sinfo);
+			err = rdev_dump_station(rdev, wdev, ctx->sta_idx,
+						ctx->mac_addr, &ctx->sinfo);
+			if (err == -ENOENT) {
+				err = skb->len;
+				goto out_err_release;
+			}
 
-		/* reset the sinfo_alloc flag as nl80211_send_station()
-		 * always releases sinfo
-		 */
-		sinfo_alloc = false;
+			if (err)
+				goto out_err_release;
+
+			if (ctx->sinfo.valid_links)
+				cfg80211_sta_set_mld_sinfo(&ctx->sinfo);
+
+			ret = nl80211_send_accumulated_station(skb, cb, rdev,
+							       wdev,
+							       ctx->mac_addr,
+							       &ctx->sinfo);
+			if (ret == -EMSGSIZE) {
+				err = skb->len;
+				goto out_err_release;
+			}
 
-		if (nl80211_send_station(skb, NL80211_CMD_NEW_STATION,
-				NETLINK_CB(cb->skb).portid,
-				cb->nlh->nlmsg_seq, NLM_F_MULTI,
-				rdev, wdev, mac_addr,
-				&sinfo) < 0)
-			goto out;
+			if (ret < 0) {
+				err = ret;
+				goto out_err_release;
+			}
 
-		sta_idx++;
+			/* Reset ctx for next station */
+			cfg80211_sinfo_release_content(&ctx->sinfo);
+			ctx->sta_idx++;
+		}
 	}
 
- out:
-	cb->args[2] = sta_idx;
+	ctx->phase = NL80211_DUMP_STA_PHASE_AGGREGATED;
 	err = skb->len;
- out_err:
-	if (sinfo_alloc)
-		cfg80211_sinfo_release_content(&sinfo);
+	goto out_err;
+
+out_err_release:
+	cfg80211_sinfo_release_content(&ctx->sinfo);
+	memset(&ctx->sinfo, 0, sizeof(ctx->sinfo));
+out_err:
 	wiphy_unlock(&rdev->wiphy);
 
 	return err;
 }
 
+static int nl80211_dump_station_done(struct netlink_callback *cb)
+{
+	struct nl80211_dump_station_cb *cb_data = (void *)cb->ctx;
+	struct nl80211_dump_station_ctx *ctx = cb_data->ctx;
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
@@ -19319,6 +19423,14 @@ static const struct genl_ops nl80211_ops[] = {
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
@@ -19418,13 +19530,6 @@ static const struct genl_small_ops nl80211_small_ops[] = {
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


