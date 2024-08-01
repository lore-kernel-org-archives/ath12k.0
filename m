Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A154C3DA64
	for <ath12k@archiver.kernel.org>; Thu,  1 Aug 2024 00:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDN9c/cWUI3Lev7JfqPRIgjTTD/g3aouq4HZJYZGeZQ=; b=xwMUkXtHFUfmh7cQTaZSFA8DPA
	Cfj2kN9htulFj7pF5bvJyTV79DuDONqLfcx5a+seZxy2icmL8/4YTT+QdjGmwE/zaGxlBQ5U8/+Kl
	wom7CdemnJoD3A5i1vcJgvL3EtXz37+wbGn/M/FXjpavU5A8CZp1gxLvsK9gB0LhfMk1n8EehSHKr
	IleKrZONTtcBAjg78c2FHMamF3JVsZb2hoLCr/q+9vUsr0DWnAMuAshwAaDJzciYOAz9eT/ju4K0+
	p/ge58KVZb+n8fqFkGmYKKQZ2zgvC6YTyEMDb66FtJTJZe7JHOfUvsN4e7DxbVVKUIHay7tYmUd7f
	uIY21ZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJbV-00000002ySz-0UWa
	for ath12k@archiver.kernel.org;
	Thu, 01 Aug 2024 00:23:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJbS-00000002yR4-18PP
	for ath12k@lists.infradead.org;
	Thu, 01 Aug 2024 00:23:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 87136CE17D8;
	Thu,  1 Aug 2024 00:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4324C116B1;
	Thu,  1 Aug 2024 00:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722471810;
	bh=gCtdOBVdkeOxjKIgW/YqDd1m0sYcjNkmBDF0L4l7fPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yx1Ldlp690nCJY1vFhQzxuaCvlnuc+f2C2qqywmIxkIB7fEjRQEjNz5/Qwcto3DBH
	 w1kO5jY82vAlXNS4+v3JRmJUpssDfpFnzguSTV1AXo5VE2TbJO6KSpf9RzryNsVwCp
	 ri9Yx/E8KeP1kl5pFC0WdAiI6tSC76vBqVWBsI9eEKE8/JerYiW6/elNkLymMXhNiN
	 PAZz1nWErbETEk5rzhN1n9EPHcWAcuYs+So+voOQJOhUMt9PY+E9xGCKu8aFQQf/TN
	 Yyii48cVrj4UlIzgh6vkE6lX7EHXgjsDIO+2Tlsq5th05lYinsppWDU/DcqzBGNZCO
	 NrBDF/vUwM4Cw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 28/83] wifi: ath12k: initialize 'ret' in ath12k_qmi_load_file_target_mem()
Date: Wed, 31 Jul 2024 20:17:43 -0400
Message-ID: <20240801002107.3934037-28-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002107.3934037-1-sashal@kernel.org>
References: <20240801002107.3934037-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_172334_513008_904FC113 
X-CRM114-Status: GOOD (  11.20  )
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

From: Jeff Johnson <quic_jjohnson@quicinc.com>

[ Upstream commit bb0b0a6b96e6de854cb1e349e17bd0e8bf421a59 ]

smatch flagged the following issue:

drivers/net/wireless/ath/ath12k/qmi.c:2619 ath12k_qmi_load_file_target_mem() error: uninitialized symbol 'ret'.

The reality is that 'ret' is initialized in every path through
ath12k_qmi_load_file_target_mem() except one, the case where the input
'len' is 0, and hence the "while (remaining)" loop is never entered.
But to make sure this case is also handled, add an initializer to the
declaration of 'ret'.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://msgid.link/20240504-qmi_load_file_target_mem-v1-1-069fc44c45eb@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index e68accbc837f4..a132600427718 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2308,7 +2308,7 @@ static int ath12k_qmi_load_file_target_mem(struct ath12k_base *ab,
 	struct qmi_wlanfw_bdf_download_resp_msg_v01 resp;
 	struct qmi_txn txn = {};
 	const u8 *temp = data;
-	int ret;
+	int ret = 0;
 	u32 remaining = len;
 
 	req = kzalloc(sizeof(*req), GFP_KERNEL);
-- 
2.43.0


