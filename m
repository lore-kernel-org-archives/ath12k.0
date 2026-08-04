Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4FBC561F8
	for <ath12k@archiver.kernel.org>; Tue,  4 Aug 2026 17:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJeNAJHrN9oQZwhJNPweXx9iOGIgQoj+dUI//LdBdWo=; b=4ddjE8nAwzaJC2P+Q8Zn4SaIIb
	NYfvAmBr5dnLoUFSWvcZfi6unPtvNEC7SIZCOSDNouM3rxQlfY93RQchVavskkHBECcMj6SFfOFAV
	00dufAujVb3sapCmetk6RWC71fhJvZ/3fHr7IrxXSF8xnYPgTyrIT21zQvBD7mqoNFIbHR2X3uWai
	SNePjsDL5W27pElsf9i17eVD/t8ufIgJ5ZFs61FA8wScVr4O1BwNMaf+1UPIo3xUXHHfaWdXf2ahP
	D2KLx81fQUf3Jw3hFsgzLtkF0Qg5f5sBJa+0MtVXxsF5oTvnHw3vZnZcfjtfVUikg4A/4WmFX1NBX
	L5DDC/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJHY-00000002Wp5-3uGX;
	Tue, 04 Aug 2026 17:50:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJHW-00000002WmX-1LgV
	for ath12k@lists.infradead.org;
	Tue, 04 Aug 2026 17:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785865825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJeNAJHrN9oQZwhJNPweXx9iOGIgQoj+dUI//LdBdWo=;
	b=esU/mT5IMsTUv5xtxNub9jlbJCgQgdfEfDhV66xib39S+7+DPIfVoeDiVWndwlRSr2rkdJ
	y7xr3J525tw7x0tk0cUY9OJmV3vrsSUh+lSCnzYNcPIpEvyhqBK28yCocq2DrZ1ELUwfPw
	C7035nPncF/Z8Cf8BT+299yaq+z47qE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-336-afvGNtrLPp6T9LOWV6ORog-1; Tue,
 04 Aug 2026 13:50:21 -0400
X-MC-Unique: afvGNtrLPp6T9LOWV6ORog-1
X-Mimecast-MFC-AGG-ID: afvGNtrLPp6T9LOWV6ORog_1785865820
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8956118002C1;
	Tue,  4 Aug 2026 17:50:20 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.70])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 77459180044F;
	Tue,  4 Aug 2026 17:50:18 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v2 3/3] wifi: ath12k: skip connection_loss_work for MLO beacon miss
Date: Tue,  4 Aug 2026 19:50:01 +0200
Message-ID: <20260804175004.1761075-4-jtornosm@redhat.com>
In-Reply-To: <20260804175004.1761075-1-jtornosm@redhat.com>
References: <20260804175004.1761075-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: bmRzsoBDKbHs2Rw8sGYPZL7p7Tj2zRrnWsUkKPgh29Q_1785865820
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_105026_442180_6E507279 
X-CRM114-Status: GOOD (  10.85  )
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

When firmware reports a beacon miss, ath12k queues connection_loss_work
as a 3-second backup timer that forces a full VIF disconnect via
ieee80211_connection_loss(). This work can only be cancelled when a
beacon frame arrives through WMI in ath12k_mac_handle_beacon_iter().

In MLO, this mechanism causes periodic spurious disconnections because
the firmware does not reliably forward beacon frames to the host via
WMI, making the cancellation path ineffective. The result is a full
VIF disconnect every ~16 seconds during normal MLO operation, easily
reproducible under heavy traffic.

Skip queueing connection_loss_work for MLO VIFs. The mac80211 AP probe
triggered by ieee80211_beacon_loss() is sufficient to detect real AP
unreachability. Other MLO-capable drivers such as mt76 and rtw89
similarly rely on ieee80211_beacon_loss() without adding a backup
disconnect timer.

Tested on WCN7850 with MLO (Wi-Fi 7).

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v2: No modification
v1: https://lore.kernel.org/all/20260727162748.963275-6-jtornosm@redhat.com/

 drivers/net/wireless/ath/ath12k/mac.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index af09153ad9d9..dfd69822c5ce 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2008,9 +2008,16 @@ void ath12k_mac_handle_beacon_miss(struct ath12k *ar,
 	 * (done by mac80211) succeeds but beacons do not resume then it
 	 * doesn't make sense to continue operation. Queue connection loss work
 	 * which can be cancelled when beacon is received.
+	 *
+	 * Skip for MLO because connection_loss_work disconnects the entire
+	 * VIF based on a single link's beacon miss, and its cancellation
+	 * mechanism (beacon reception via WMI) is unreliable. The mac80211
+	 * probe triggered by ieee80211_beacon_loss() above is sufficient
+	 * to detect real AP unreachability.
 	 */
-	ieee80211_queue_delayed_work(hw, &arvif->connection_loss_work,
-				     ATH12K_CONNECTION_LOSS_HZ);
+	if (!ieee80211_vif_is_mld(vif))
+		ieee80211_queue_delayed_work(hw, &arvif->connection_loss_work,
+					     ATH12K_CONNECTION_LOSS_HZ);
 }
 
 static void ath12k_mac_vif_sta_connection_loss_work(struct work_struct *work)
-- 
2.54.0


