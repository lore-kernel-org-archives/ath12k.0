Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1955C606A32A
	for <ath12k@archiver.kernel.org>; Mon,  9 Nov 2026 22:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g/YO/z2I;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cQLGrtOv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8YKt/mxN51KEu82BTf2/x4XlarXoVG+PCXLXKuY4w3c=; b=g/YO/z2IL9ZQPYug9fsIW6jKFL
	g2i205ICor2MNVb5lvYlW+GeCdSgCVK3MJN3PS/CdiiQynB5PLuqaQlvGMWuxOb9CtTjaSm251cEw
	tSWnHWIoM6SlVZmXZPOlQeBcnvfU5JURTAkxpU3adMKxi+cjR0Sh9WetmI6+NVgagtu8VKt3AvbRu
	arhlsj/FSkCbgyJdRi1CJXfKtr9EnED5gnJxgq/quhqmaoInOhSl1di74cPtbdSt+p6Lxux5IXqFB
	T6jCjUyvF4BQiFHjJ3OqVsmGUIfoZviZNfNajs/lJV1uUbQrmkruMVKk8rwRRW/1+nVmSSl43H+FB
	bUak+BwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQYFf-00000001ult-46IM;
	Mon, 09 Nov 2026 22:54:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQYFd-00000001uky-37Dl
	for ath12k@lists.infradead.org;
	Mon, 09 Nov 2026 22:54:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso8413205e9.0
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 14:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794264847; x=1794869647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8YKt/mxN51KEu82BTf2/x4XlarXoVG+PCXLXKuY4w3c=;
        b=cQLGrtOvR/YzAedGGqzDG9Ie0RxySf5N6FFEfM7z6HDsrZXqjwrY6QGNqiFL+CHsjm
         PPoSpHnObTOx8cTPd/RnkcWWBxeSaz245FD6PT3V+Slfes2OqyW6w56/wfHOcCJatBUm
         sE42e+LTikrHeX5a1lyWlElaWmjnJ2KDiQ04t66xTZ+5+3jG9ZmZJgYnjazAQ98ZPJ7a
         nTEuW1RU5a0bNl4zCGiEvf4jo7/HQa2EjqY1/8XhH8bwrEZHQXoIz1oTHg9sQmDfes11
         m/+FH/GxMIBWOFp1FdX1sZpZK+XlBWSGlvFcVhBCBA+lWGUDEDrYlQJbJ/a43lKzhu3x
         FEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794264847; x=1794869647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YKt/mxN51KEu82BTf2/x4XlarXoVG+PCXLXKuY4w3c=;
        b=VMlspmYllOafHoeU4wq9tAeGrAjZoUZyv0r9D0JsBa5RHTspGV7Wr1Wmy+JMJMtMbl
         9/p5RVcWa5+L619pKVkSI2X4fg7HKVev0RTJ5rfLlbh/2G0ukCviDKG3CdfRJfL5nvSi
         HNK237YO73lvwONqQ061Em3G571mafWwaSzNYwSIHAgwunSOn2sHN118tIj+docSNQFW
         2F+cVNtQXtrKpGtzOEpFQ9rSYDggXrUIWvwC6osbY5Kq8X1V9kuM2AC07POQAYRxvlLj
         aMwYY2uHe+RHmmhA7RDxX0V7zOihbel2jICPLwkxLbXksZ4jNZU8iNkioucp/jSEwQxO
         mfGw==
X-Forwarded-Encrypted: i=1; AL+hErE+Y8kLc9EKPq2/hgYRAh/lv7uM2wcCmxB16vwPh7xGrcKHyMS/Na3xpjrG6YBqEEdZ6lxYJ0w=@lists.infradead.org
X-Gm-Message-State: APuU4Z+7+vktSNCDMNVi/Cbr+cRSoyK7rz9VAvuK9/5mjMpoYjteT4G1
	etloImcTdRCLdAVNrDhAP66Ef/n/Fb6KGFiSR7EtyM8OfH49YTpfwL/6
X-Gm-Gg: AYBFou1btxp2mfDWz9mWwDli7WyEKBtOpOR/6MpAn4ceweTU67r93UxEK8/yL15ihHP
	Y9aAmlMJIX/Hf5rrBmoo1dx/REMGV3nNK3yOQj8/qTp8x5LCrgHlGdlil4KIBcgYZf1mT7x/fOP
	tjuDo4Af8UlHjZ+vVHQFC4uDja8mtqbBwjKRcgQ9JbWsAm7OuqwefcLQM7wUPY6+Zkw4GgHKt/s
	Kl92ka/XDyhzK8imnWqAKm3lTAO4/NMCPJL48SwXGL5ajzqG4n3aOLtjzKM4VZeVs2v0AMZBzKn
	RJFQYX8pFK4qbVmH9kRVd+Q3WnB+izgbk8qwMm2T/aOqKp2gIgsTtectpgRJh7YkECgNG9YKQUd
	3PGHl7LwT+7pwbdw/tS9L3ZJLqYWAIGUUalVzkWjTOESROi2h93se/pWDRpamdUK0GgWdHw+l6D
	joCbuBLejgvWasLbdkJMPfdm8oAs3UJzgCMgVzCKOQSnb9NCD8TgtcuBnbOcvQnxjHoX4CYZxWU
	o1Ri8Qppk4fqfkKi+ztLovVWlAnAXoVu3iafkJXuYit/4pAx4saCkA32/wimObkp/o8ohj/ZDVC
	YdLmfwAiB3YSS3+1xm/s8XZV6LJxWV9a6+QTYuspAHqKIUqcbX334x+9WsLDDksvk1DJVPc+GiK
	CTt/q4R46nn1qoyRhIuRZMe7m4rNhxImsrSwjhu3n+4owy3/YHOP7uotE7GSbTvPWW3Tniccini
	WlxUdYh60ez3XX59hvIneIEDE=
X-Received: by 2002:a05:600c:b90:b0:4a3:5991:719 with SMTP id 5b1f17b1804b1-4ba02350f77mr10169475e9.31.1794264847422;
        Mon, 09 Nov 2026 14:54:07 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204342asm21435365e9.6.2026.11.09.14.54.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 14:54:06 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 0/2] wifi: ath12k: PPDU stats user count fixes
Date: Mon,  9 Nov 2026 23:53:53 +0100
Message-ID: <20261109225355.23161-1-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_145409_797933_EC1DCD23 
X-CRM114-Status: GOOD (  11.28  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_htt_pull_ppdu_stats() rejects PPDU stats messages whose common
TLV reports num_users == HTT_PPDU_STATS_MAX_USERS, although that value
is in bounds for the loop the check protects. QCN9274 firmware
WLAN.WBE.1.6-01243 sends it in BE MU BSRP trigger messages addressed to
two Wi-Fi 7 clients, which makes the warning fire on every such trigger
and fill the log on a two-client AP.

Patch 1 corrects the bound and keeps the warning for larger values.
Patch 2 fixes a related off-by-one: the per-user slot finder and the
per-user statistics update skip the last user_stats[] slot.

What the data shows (diagnostic build on an AP MLD, 5 and 6 GHz, two
Wi-Fi 7 clients, 2026-11-02 to 2026-11-09):

- Every message with num_users 7 or 8 was frame type 25
  (HTT_STATS_FTYPE_SGEN_BE_MU_BSRP) and carried user TLVs for exactly
  two stations, with up to four user records per station. num_users
  equals the number of user records, not the number of stations.

- The same firmware advertises max_user_per_ppdu_ofdma of 8 in
  WMI_SERVICE_READY_EXT2, so 8 is the largest value it produces.

- Rejecting a message has no functional effect beyond the warning: the
  user TLVs are already stored when the check runs, and the per-peer
  statistics are applied when the entry leaves the list.

Changes in v2:
- Keep ath12k_warn() (Jeff Johnson); only the bound and the text change.
- Add patch 2 for the slot finder and update loop.
- Base on current ath-next.

v1: https://lore.kernel.org/r/20261101203718.60679-1-gsustek@gmail.com

Goran Sustek (2):
  wifi: ath12k: accept num_users equal to HTT_PPDU_STATS_MAX_USERS
  wifi: ath12k: use all HTT_PPDU_STATS_MAX_USERS slots for PPDU users

 drivers/net/wireless/ath/ath12k/dp_htt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
-- 
2.56.0


