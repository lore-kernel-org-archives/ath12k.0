Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA4DE77182
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 15:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tGx+3iG4SL866xCa51JlmVucqYinFuoMLvtItQ6sH64=; b=OjVtdzlPBZ541D8YdBXsmksOyk
	4NyfldtsVrSE2NcKs2Ex7BHpyUetShE7EbmrX6khUPfpBQvyrhKPhhJPXQZZ4Yxb7IMGhteJeytbc
	jZifxFGwoH4gmuPUdRC7PAO1w8Y7dQNGlbitwSHKk8KiUC/TqF34MQQSAr+T3btXbEKYagSKQ1pjv
	t3361pNPAlPm7nCjhAeLzPq8w4CFPucOFwp/f4lUl9RFnZSs5AN7+jw31zCEgBJzHeht83rC+EhUn
	YoeUHtuS4JDIXmEoPhuJ3F0M2isIW6lBm8N8dJjW6821X7KwI48DQVchf1iaREwspjfT/cVwq6nh6
	ViSZ0FlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOsf-0000000FIxQ-0wXb
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 15:44:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOsb-0000000FIuu-2krt
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 15:44:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA4035C5846
	for <ath12k@lists.infradead.org>; Wed, 11 Dec 2024 15:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474B0C4CED4;
	Wed, 11 Dec 2024 15:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931840;
	bh=aG4RgDRyRpZnGIGsKaAiH/8JkR1fnpa+sxx5VzyOkYw=;
	h=From:To:Cc:Subject:Date:From;
	b=e7UpIfdx6IQfXC0j0W8bE8BCtKFoiOtGi3ahegwId+YidmJa4DMVfXtBBEZJRKriH
	 h0j8eFFeFzDMo1zU1me22krP0xHrsP4gQGLNHry5Ablv3iv9tulG4in1jeLU4nqgx3
	 yClnzHTYBrt2Y0oHPAEmqXvbVODQ548hPre+8yNdfWSoixlBXKZM/DRF33uYkPII7i
	 vt2Ot5taJd+g6klnLxqfyqnNTNbN31rhzibWJqhpyuyyf9C9bQR1lO863Smce9rmjk
	 LX+QR0MXfsb1HhXK+Y43rtG+O346Vp+sMgqsFt5EsE1lugzSac5vhOwru588BuhjX9
	 mLhZRFubVFxFA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 0/7] wifi: ath12k: MLO support part 9/9
Date: Wed, 11 Dec 2024 17:43:51 +0200
Message-Id: <20241211154358.776279-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_074401_742969_1A3B6AF6 
X-CRM114-Status: UNSURE (   5.99  )
X-CRM114-Notice: Please train this message.
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

From: Kalle Valo <quic_kvalo@quicinc.com>

The last patchset enabling MLO support in ath12k (only for QCN9274, for now).
All are small patches adding the last minor features before we can enable MLO.

Please review.

Kalle

Depends-on:

wifi: ath12k: MLO support part 8
https://patchwork.kernel.org/project/linux-wireless/cover/20241209185421.376381-1-kvalo@kernel.org/

Aditya Kumar Singh (6):
  wifi: ath12k: symmetrize scan vdev creation and deletion during HW
    scan
  wifi: ath12k: add can_activate_links mac operation
  wifi: ath12k: add no-op without debug print in WMI Rx event
  wifi: ath12k: remove warning print in htt mlo offset event message
  wifi: ath12k: add ATH12K_FW_FEATURE_MLO capability firmware feature
  wifi: ath12k: assign unique hardware link IDs during QMI host cap

Rameshkumar Sundaram (1):
  wifi: ath12k: advertise MLO support and capabilities

 drivers/net/wireless/ath/ath12k/core.c  |  34 +++++-
 drivers/net/wireless/ath/ath12k/core.h  |   7 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c |   6 +-
 drivers/net/wireless/ath/ath12k/fw.h    |   3 +
 drivers/net/wireless/ath/ath12k/mac.c   | 156 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/qmi.c   |  35 +++++-
 drivers/net/wireless/ath/ath12k/wmi.c   |  26 ++--
 drivers/net/wireless/ath/ath12k/wmi.h   |   7 ++
 8 files changed, 234 insertions(+), 40 deletions(-)


base-commit: 400568fb3b022247c1603fdbdd6444b3ef14ffce
prerequisite-patch-id: 4f0c25ed9cb858bbe89fb5eb0edd226596e2234e
prerequisite-patch-id: 99576487c570edbaf46b35e8ba6b9e20ad9bf85c
prerequisite-patch-id: f0a242859176e986640595256e7f488561683309
prerequisite-patch-id: 532325a3a8da40d6b43ef643f38dca5389750820
prerequisite-patch-id: 1a0adfd0f7ad52c7d0ddd6466659e7a8a229013b
prerequisite-patch-id: e1a1418434e24374ef1ad04a49249436de602dd8
prerequisite-patch-id: 8847add439503b799079f8cfa043b15b57691d7f
prerequisite-patch-id: 017994ce11ee18d218464d1bb5ffb50ac8d941a5
prerequisite-patch-id: 8160e50b27670d195fb48f365e48e9914aed35f5
prerequisite-patch-id: 2a828218167edcca737a6400145c48e99be1dab0
prerequisite-patch-id: 960a34375824886cfadeff20afe1152290d285bd
prerequisite-patch-id: 6ed64d739660c590f3a891b675ada69ff71db858
prerequisite-patch-id: b71fe3eca5e431636785abf669d55eb600e3a212
prerequisite-patch-id: 066f114094ed84600304fbb2dd113a153b48b253
prerequisite-patch-id: b14fd74db0c7979aaf7b22c70b53f3b27730ce8e
prerequisite-patch-id: 3b8dae9159662edaaf64d144f0c0796737c3b77c
prerequisite-patch-id: d26a06c418d308111a55f1a1b8f03250c17ba6c5
-- 
2.39.5


