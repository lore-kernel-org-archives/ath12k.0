Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2487C606A32C
	for <ath12k@archiver.kernel.org>; Tue, 17 Nov 2026 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p07s1KnW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COtmK6K5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IP0GW2wit1DG5jrtVXntkzGkK3XObCmCGO6fI5J3Kv0=; b=p07s1KnW34yaSKDGiXbMwSjVfU
	jrBkMEey/y/iiOkfZ55ELrXv9nACiWeShoIoQxOciW7AYm4nhSKVq9n3eGC9xaz8ny0IHuLgcTlzc
	2VDcEzz/aUDDAoI/nqu3Z9OKNOVnBsL/DgBMBcXLh81yNASzNyONn+3WARAHEk8aS+QmhciMFNwTJ
	3mq8/oJTq4Hu7+4xheT9gPLBQBu30fk2yEDvs3vGIDnpeyBvNIuwU7/ShE9o6uBbdg5U+S4mB55B6
	cnEJTdZfjm378jotOd0FVo48Bs9k5ZUEPW+8AANmNsPN6q79ggM9r56HTaLPwBV5CmQPsZkgrfvyN
	qrv2HfWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKaA-00000006E5t-1RCc;
	Tue, 17 Nov 2026 14:54:50 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKZy-00000006DxR-32cR
	for ath12k@lists.infradead.org;
	Tue, 17 Nov 2026 14:54:48 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so2414482b3a.3
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 06:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794927277; x=1795532077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IP0GW2wit1DG5jrtVXntkzGkK3XObCmCGO6fI5J3Kv0=;
        b=COtmK6K5vVgZJcsyRWMBJmxXIkZc3e2M3yap3jybt+mtwBB/ZUIu6lnZvx0I2R8WHZ
         qVE64/xnuk3LwPplWWLtruQuwel3pqhdeeYc+E3/BE5curXcz1W/qFwLWjF4ErCO+NDC
         ahGNeQ6RxgxMUD2ksizdD5F9J2ZgYHz8oTnbhdpYP1BcPNdcgrnMPzsD7ZFGrRCQPMbI
         T956N0i2c3kjii8UqjYgTbq5+pc28YfwtSYV5/covQ4LOAA0uaMyuHvkkJtBMcZFix2d
         ZYhf6mTsu5cy2biThZl9EvbMF6vVSYTPFmRD9Cd6KNzonTDoSsBiI7H2g4bBssViPcx4
         bX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927277; x=1795532077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IP0GW2wit1DG5jrtVXntkzGkK3XObCmCGO6fI5J3Kv0=;
        b=FSNwMpor4ftSTshBG+eFEUGOlOETTpePJPLjQhUdOiRFdQ7JBb+xFzBkBWXLjjb+oV
         aj7C+0H86tpzgUCzegmSrZlvnUm9z/MLg3Q/tBHKsDY8HJreNL7EQNV6rLmmpA7EhCaH
         2oT6oLblj5xFOjCF9FTpJZZTUIj8bKYopWOE3GdykPa49Z10gV4E9lOq1VWeDMhBxP2x
         LtNg7IkWQarDy/J/s0IhIAZLIlfSiUV552dEGGy2wm5bZtn+3zvEnf9hbjlqC6hsliAg
         QqpvkAD2xtx7Pbp4be87GoUFb7SXhKvr9pA8p3Y9K4ViwJH8ZcbQUcBbtw94shpJYH9v
         Bjqw==
X-Forwarded-Encrypted: i=1; AL+hErHcKsbBLaKlgxfKQ1yuO7emxSIBq4a4T1QW7+OgSbPVp4O3tkSJ2/uyScRnHdOMHElD+7+wB4U=@lists.infradead.org
X-Gm-Message-State: APuU4Z9mMlSlZ9AlyxOKyCH28iChkLA3Y4PCfjtR/TCESSxoGcs6JkUO
	ViX5BSpAWefOPpxZHn3tz0ji7DZV88lEFsY9zjqS2SnGJFj2vmJ/1ujc
X-Gm-Gg: AYBFou1dO04osZJePEkS+/hg66IEcRoyjU+rnwc8kDQ/O9ZkdOOsMAlDJ6Aa319re16
	0CkXkQueSpXQOVn9CCIdIhtTQS7FSFL2+D6LLXsh/li0fdHCT74Qtc+FBDxe7BuQ9lhqNj+agQE
	JPLemHHrM6A5MpArOandRghQ2pqPD6lepH7AKCLfZ/YrKdCRswZqFXyasVkhre9vJvF3z2+DUfR
	3lz4D8QBq542LChpxYP4i4rXJO4KsXADQlOnuhs9DYotSkHyPe+kSYPDmm/6I0CmC13MYtjGp/O
	f2ZOQ8T2lIrOYpzthP5v3A7gquVLQ5t40q1/ICUUsLvP/abpOTnWv+SJyC6ggYlTF3nAH7Mcvda
	KFGsOZB5g5uWm0yTdEdB77H/TiNHRe4Twdxn6Ebw1Xz6bkJ/60yZ5dA8BAiahKao6apxLKsLjZC
	HhDLmgxJeLlmlqq6ljQSznLXfw3XjBdMogDDSV2U0/7I8KveuwiLLk/zai1WSl3OgDQjYD4v+mH
	PQSAUy6hn6cVHs0S7UwJt9g3fjQmCNV6g+6kc47cz/F8nh+gZkupwxcZ43mWDdgwB3ap2GJbfbn
	CP4spYZmdOR9MOyGnFZG4F8YYOyLWn8YjIfRsrlYEYxgbwJOjbKwqj8nFHoGfNSxftvcihMdnPf
	IGSJuG43XtLv9QBDjh3hm+IPUr4kP2Njmcq08N2FG9g==
X-Received: by 2002:a05:6a20:4127:b0:3f9:357c:bb82 with SMTP id adf61e73a8af0-3f9357cf962mr5712893637.52.1794927277048;
        Tue, 17 Nov 2026 06:54:37 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm5270513b3a.13.2026.11.17.06.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:54:36 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath12k: hold dp_lock when updating monitor user stats
Date: Tue, 17 Nov 2026 22:54:31 +0800
Message-Id: <20261117145431.1092736-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_065438_773898_36B22E1A 
X-CRM114-Status: GOOD (  13.38  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_dp_mon_rx_update_user_stats() looks the peer up with
ath12k_dp_link_peer_find_by_ast(), which walks dp->peers and asserts
dp->dp_lock, but the monitor NAPI path only holds rcu_read_lock().

Peers are not RCU freed.  ath12k_dp_link_peer_unmap_event() takes
dp->dp_lock and calls ath12k_dp_link_peer_free(), which does list_del()
followed by kfree(peer->peer_stats.rx_stats) and kfree(peer), so an
unmap arriving between the lookup and the use of peer or rx_stats frees
the objects the monitor path is still writing to.  The lookup itself
walks a list that the same path can be unlinking from.

Take dp_lock around the lookup and the statistics update.  The update
only performs arithmetic on the peer, so nothing that can sleep ends up
under the lock.

The affected code is present in v7.0 and later trees.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Prepared against v7.4-rc1-1969-g666539eecdf4.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.

Testing: compile tested only (x86_64, gcc 11.4).  No ath12k hardware
was available.  The affected code is present in v7.0 and later
trees; v6.18 and earlier do not have dp_peer.c.

Locking: the monitor call chain holds no other lock at this point
(ath12k_dp_mon_rx_process_ulofdma() and the rate-table helper take
none, and the monitor paths never take ab->base_lock), and dp_lock is
not held by any caller, so the added lock introduces no inversion.

No Fixes: tag is given because the introducing commit lies outside the
fetched history of this tree; the code has been present since v7.0.
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index ae14e118fe36..edf7a8142998 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -955,9 +955,12 @@ ath12k_dp_mon_rx_update_user_stats(struct ath12k_base *ab,
 	if (user_stats->ast_index == 0 || user_stats->ast_index == 0xFFFF)
 		return;
 
+	spin_lock_bh(&dp->dp_lock);
+
 	peer = ath12k_dp_link_peer_find_by_ast(dp, user_stats->ast_index);
 
 	if (!peer) {
+		spin_unlock_bh(&dp->dp_lock);
 		ath12k_warn(ab, "peer ast idx %d can't be found\n",
 			    user_stats->ast_index);
 		return;
@@ -966,8 +969,10 @@ ath12k_dp_mon_rx_update_user_stats(struct ath12k_base *ab,
 	peer->rssi_comb = ppdu_info->rssi_comb;
 	ewma_avg_rssi_add(&peer->avg_rssi, ppdu_info->rssi_comb);
 	rx_stats = peer->peer_stats.rx_stats;
-	if (!rx_stats)
+	if (!rx_stats) {
+		spin_unlock_bh(&dp->dp_lock);
 		return;
+	}
 
 	num_msdu = user_stats->tcp_msdu_count + user_stats->tcp_ack_msdu_count +
 		   user_stats->udp_msdu_count + user_stats->other_msdu_count;
@@ -1038,6 +1043,8 @@ ath12k_dp_mon_rx_update_user_stats(struct ath12k_base *ab,
 
 	ath12k_dp_mon_rx_update_peer_rate_table_stats(rx_stats, ppdu_info,
 						      user_stats, num_msdu);
+
+	spin_unlock_bh(&dp->dp_lock);
 }
 
 void
-- 
2.34.1


