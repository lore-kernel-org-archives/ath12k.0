Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281D8C61DD6
	for <ath12k@archiver.kernel.org>; Wed,  2 Sep 2026 01:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mIsvf/pMgFR1o4nDemQvggnheWLtStmBokvR+GjxbWU=; b=ZoRZ1574jtxCpX4OSO7ZKpvbyu
	6cECrRYfGLzU9Zd64zY9OD2Sona9i3s/Pgza7B8G5gDj0V6nrskxqaFxqY3LO6lRqxOTTNMMPgCyN
	67wmP6RCJb2PuOqsuEDwMlX/LJNUSIdJVIKpj7X1HYj7iFrbT4z042BRtREffY7GTyPHJpfIoVORr
	Uj56+gz3AfLxY0tHQ8VHxVc63kZyDGPa09m4B26Ae2OAdHt0LYQnOlnDUVnWKvt3QQ/7+CTa0rd0A
	um84P9Y30BvCo0MkCT8mACGW+LPrQ7mUhqZPmidLGm0XEu14KiRuug8s1GqN+gXE9lbq6Fb/VOYBz
	W8kao9aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ZLy-0000000Dc4a-3VyG;
	Wed, 02 Sep 2026 01:01:26 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ZLv-0000000Dc3O-3gZ6
	for ath12k@lists.infradead.org;
	Wed, 02 Sep 2026 01:01:25 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ceab75934dso5151215ad.2
        for <ath12k@lists.infradead.org>; Tue, 01 Sep 2026 18:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788310882; x=1788915682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIsvf/pMgFR1o4nDemQvggnheWLtStmBokvR+GjxbWU=;
        b=TqwFK50Fmvsg0eKRpo2z7zYlsdFBqu1sCkXX1Y+LyU6gUtojZVK+DMTupGgNVRWE5g
         kVLU4v8kCsT8Ca3t/0zcvVD5eP2gdMNDb2mc1a3+O4dugGvultXrSZAbT08pyD3qwdNj
         zsDumoWdINTfvV66PAe1j5ioH/A96AmG242KHR3F57cxbfHe7ESZcm4qEfpYybwX4XER
         CFoQEGeWVdy7hqlDPISaLftptzFoVCh2DptZ0FXWU+hWV5j20441VsudVxmb5iTSgrjz
         U3LQUnZPXr8IDRMk2IVFrHyE9EN2XG6ndinD/t77sHEq9RX40gFbZrAm8wNd+fgjJOTj
         7SAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788310882; x=1788915682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mIsvf/pMgFR1o4nDemQvggnheWLtStmBokvR+GjxbWU=;
        b=leqivoiigGm/m1gbfFCiwpNbGOICPeulL/vej4O+S/jluXTdOdp/GdvpK83LrpCYdD
         bgqVUjH5+vmusQor2moGvXQGQ87/DOp73ABolC5nHKfiRH93mNuDRznPJ4M6GRhlsFp4
         UvwKxaFAsOP6Kr6w0vbpJ5XyqPq3OIocxtujcQK43rcJ8oHQsvQJjHoOywgv+FJpj341
         MWbkntoZ3paJY8XsyCTJdakerB7mefrqOeSUO1ConXQIh9xdZRonLh/l7SfH/VygXftc
         ILUYZu5FxZIcQWXWNbZ1IzQdaB7IrMztt7vxCZiWKB2ipWehBYmsip6qi6hRHxYgDSjv
         peiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQoyjSbELJBYr2/LkAK8Vcjh6TIWY9BuGbQY/gBv+khzBuoNRO4fsxb0JSYpxwreagHH2dHcA=@lists.infradead.org
X-Gm-Message-State: AFuF++lALU1dSeRPyOOQHaJM0+y9ctOB0E2Jy7d3GFAQFCyss2n4WImH
	en/agC02kP/f3XnC6eSNy4PZymcjT2T9Zr4SDsCNyYNaa+cyVfqKR1/O
X-Gm-Gg: AYBFou2UJyhyE7JNcrfYFKpWIX8A6tmJwlURLneOvSQXNGlLjYnoOKnFrbBwkpeZgpU
	xenB4BLIDf2ZtV5Corck1AEQ4aF5izQcF9r75XaDUfI60ReWm3x/3DVuYR6rGbHWlw30ZPLZe32
	oeRA2GBu7FBEWT+thEXy2YuM9gu7RQ8JoEQOOciPXIJixFhFDkZcozuJmQ1DOs9Y2wA+EJrzFug
	cP8TmOJDC6kye86AvByE7OOszy5XrshbPBGKCPqAdYyzgtNFpeo/Jp/garNWe2sQxGa03oOlNsy
	FUdZZhv7jGF1RGU98sdPCJlm50UbDsI7EIMNShhch16vSrTsAhI6FFg5TNrFF+AtgwpnF8CvTya
	0FDvsxY1rinxRqXJ8If/46I+B7WtAUOpm2QulDoiXqZwA6zvgFMzpi34rgivPqFo9eysKuusTJV
	hu2bT0PG1VPiVauwuWu6eBTAdNJfwRA4xptruFLNbJJolFHwTL8Ia+H+nnXfdqaeOkbNxUvsv/C
	hIh1ZmK3D4R3+8z
X-Received: by 2002:a17:90b:17cd:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39aededf539mr1313470a91.6.1788310881957;
        Tue, 01 Sep 2026 18:01:21 -0700 (PDT)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0dfe6b6sm2164002a91.1.2026.09.01.18.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:01:21 -0700 (PDT)
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Vignesh C <quic_vignc@quicinc.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Mahendran P <quic_mahep@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath12k: fix NULL dereference in hw scan cleanup path
Date: Wed,  2 Sep 2026 09:01:17 +0800
Message-ID: <20260902010117.3225320-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_180123_920052_0EDA8E73 
X-CRM114-Status: GOOD (  14.20  )
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

ath12k_mac_op_hw_scan() walks ahvif->links_map in its abort path to
tear down the scan vdevs it may have created. It skips link vifs which
are no longer present:

	arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
	if (!arvif)
		continue;

	ar = arvif->ar;
	if (ar->scan.arvif == arvif) {

but it does not check arvif->ar, which is cleared in several teardown
paths while the link remains set in links_map. When firmware crashes
and the reset worker detaches the link vifs from their radio, a scan
request arriving in that window fails, enters the abort path and
dereferences a NULL ar:

  BUG: kernel NULL pointer dereference, address: 0000000000001508
  RIP: 0010:ath12k_mac_op_hw_scan+0x170/0x8a0 [ath12k]
  Call Trace:
   drv_hw_scan+0xa0/0x160 [mac80211]
   __ieee80211_start_scan+0x305/0x7b0 [mac80211]
   ieee80211_request_scan+0xe/0x20 [mac80211]
   nl80211_trigger_scan+0x610/0xa20 [cfg80211]

0x1508 is the offset of scan.arvif within struct ath12k, reached from
a NULL base.

The oops happens in a task holding wiphy and rtnl locks, so it takes
down the rest of the networking stack with it: subsequent scan, netns
and NetworkManager operations block indefinitely in D state.

Check the radio before using it, matching the existing arvif check
directly above and the arvif->ar check already used elsewhere in this
file.

Fixes: feed05f1526e8 ("wifi: ath12k: Split scan request for split band device")
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 99bf5cf79d102..64a636f3ae3c6 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5821,6 +5821,16 @@ int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 				continue;
 
 			ar = arvif->ar;
+
+			/* The link vif may have been detached from its radio
+			 * while this scan request was being processed, for
+			 * example by a firmware recovery running concurrently.
+			 * The link is still set in links_map in that case, so
+			 * the radio has to be checked before it is used.
+			 */
+			if (!ar)
+				continue;
+
 			if (ar->scan.arvif == arvif) {
 				wiphy_work_cancel(hw->wiphy, &ar->scan.vdev_clean_wk);
 				spin_lock_bh(&ar->data_lock);
-- 
2.53.0


