Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229FAC02194
	for <ath12k@archiver.kernel.org>; Thu,  6 Feb 2025 22:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AVJ8WuxC4yXkdDdbjZk8+oDzRdxvNMJrvKPxyZ0bnBc=; b=YVYeLMvpohDJfAdyhyfCPjnpDZ
	Yt74MDiVUW+tZkCIX9cMZYKKc9JeaIeQw3p8CkzXy0rwHKJorXS4RgokRCfGVM9clCZ+p0B3MxJwb
	nUJh7/gQseG6seWOTDpsWLqrpG44TPZzIOx4gd5oxLLiRuBFBcEtb3s9ZTuHfSjosuSlbO84UcWkD
	eYYkc4Ip5kOZNBEG/KNN8w3UWkPvjXvUN5LAuuBiR4njc/LeIAPX6WBtP8Oifhzi/TCvdqB2p3nsl
	BI5LSFcAxG9sIusU7nH0SXVJEL9H55JkOizutyleADxVPE/TmhbVjdNsQKfLrEmGqgzeHBoJfRgJw
	+StlS1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgA9i-00000007fQD-3MfG
	for ath12k@archiver.kernel.org;
	Thu, 06 Feb 2025 22:15:30 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgA7l-00000007f7T-0pmZ
	for ath12k@lists.infradead.org;
	Thu, 06 Feb 2025 22:13:30 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4Yprw85mfVz6CmQyZ;
	Thu,  6 Feb 2025 22:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1738880005; x=1741472006; bh=AVJ8WuxC4yXkdDdbjZk8+oDzRdxvNMJrvKP
	xyZ0bnBc=; b=CRgD98VGQDwWffd9T0v4Um+LYNODVCReMXS7YsVSophJMkqwQFi
	/pfVIBwOfF8cb9cpIjdGpkpUYwZ8rvJBzn23yZa5lOZ/jkhqgLJyb1rGO31FBpN3
	hzujUCs/goG861cNYblh+iD5ir4TIPe+bJ2OahOrVwZ4kPSmPqrXnlM05uIu1VZK
	Qf8uplYU/JbABcyBnnSfjM/JXK1S3wR11wjxcU2Y+2j78/IvRh9yyfIFM2VVXJzu
	xe20IDeZxath4pTA1YxfCycKLukV2Qr9z7pljiwL+vOlNGxk0alQ+ZjiZ3Sre9B0
	BRrZPQPhuDR1rwCzMd3wFnGRipuIoNAcwRg==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id rkzGGjQIbGhL; Thu,  6 Feb 2025 22:13:25 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4Yprw23XScz6CmQyT;
	Thu,  6 Feb 2025 22:13:21 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH] wifi: ath12k: Fix locking in error paths
Date: Thu,  6 Feb 2025 14:13:17 -0800
Message-ID: <20250206221317.3845663-1-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_141329_242912_6EA1BCB8 
X-CRM114-Status: UNSURE (   8.23  )
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

If ag->mutex has been locked, unlock it before returning. If it has not
been locked, do not unlock it before returning. These bugs have been
detected by the Clang thread-safety analyzer.

Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Fixes: ee146e11b4d9 ("wifi: ath12k: refactor core start based on hardware=
 group")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/net/wireless/ath/ath12k/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireles=
s/ath/ath12k/core.c
index 0606116d6b9c..212cd935e60a 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1122,16 +1122,18 @@ int ath12k_core_qmi_firmware_ready(struct ath12k_=
base *ab)
 		ath12k_core_stop(ab);
 		mutex_unlock(&ab->core_lock);
 	}
+	mutex_unlock(&ag->mutex);
 	goto exit;
=20
 err_dp_free:
 	ath12k_dp_free(ab);
 	mutex_unlock(&ab->core_lock);
+	mutex_unlock(&ag->mutex);
+
 err_firmware_stop:
 	ath12k_qmi_firmware_stop(ab);
=20
 exit:
-	mutex_unlock(&ag->mutex);
 	return ret;
 }
=20

