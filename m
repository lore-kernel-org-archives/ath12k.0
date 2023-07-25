Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CC8C001E0
	for <ath12k@archiver.kernel.org>; Tue, 25 Jul 2023 09:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3X3/q3YFPoWLLoFPGx5rvhXzvUKJCoTU0DdTzOwvUmk=; b=byAhJxD/lFeCIG
	RbEt3gpUV1xxAWq/RBj7v05yeF6xDIslNpe4dY9aPLv+E1AwC8jESeTUDMwjHKd0BGNZBCgjZHRqi
	rXPmYXhLs34bpQjVr/a+VoT8a1alf6oY+1umBY+hiXhPzU6KDPC7D7D7Yoa1+rFLUoj6Uh5aYp1Dt
	IOmud/sBbS6+R/GtxuNSo0o3/cOwyKJbyk2kN9jT/61dlwvb0YtPqueR578nXRbGKnTs45V7Xy1ko
	rYy8FQ/nFI9O5tOn2V20Cm6S0O/UwNypKyYObtivK0UNHXLL2fPsokzxv8Cxxk1KVReyKhyaRtYHd
	IVgu+sEi3IaKufe1mCnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOEZE-006zEK-2J
	for ath12k@archiver.kernel.org;
	Tue, 25 Jul 2023 09:42:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOEZA-006zD4-2d;
	Tue, 25 Jul 2023 09:42:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A84D615CD;
	Tue, 25 Jul 2023 09:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A08FC433C8;
	Tue, 25 Jul 2023 09:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690278171;
	bh=K0q3hxr2miXWjf12Pi9Tt2qxj8zRYXBEa4bLBHdyHdo=;
	h=From:To:Cc:Subject:Date:From;
	b=VvPakJ031k8agtqJmw1+tACFRzv63eN0DodmonkFf31Hn71eN4UZGIvbgg5oV/nIp
	 LnSMFHWWqR1oaQhMKwcJ2ov+hAbfQaWUarUk9MOsAG8tmyXPINherpdbtbnPufjJBQ
	 IO7RbEtEWSybShflByL35Rb1Xp/9E4cX4bna884lBgl3cBIMzKMBYnM6Au9LRY1Fzb
	 cqKgUFGvEQDz/2KOw03beRRIrB1Jekobx/HPDISC3RDfmPaqJRVHN7rdxJbuVSvvtF
	 bdnXXONAdvDz8G6EtS3TpZ/QYVO8tIL+IChaN91cnRVrLClsBVAiNwKnoZQjCK+OtH
	 skjdEJxzNvCbg==
From: Kalle Valo <kvalo@kernel.org>
To: ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add Jeff as ath10k, ath11k and ath12k maintainer
Date: Tue, 25 Jul 2023 12:42:48 +0300
Message-Id: <20230725094248.3205486-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_024252_897263_D005BB70 
X-CRM114-Status: UNSURE (   7.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Jeff will now start maintaining these drivers together with me.

Signed-off-by: Kalle Valo <kvalo@kernel.org>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42e78a696be6..292910ef17d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17433,6 +17433,7 @@ F:	drivers/media/tuners/qt1010*
 
 QUALCOMM ATH12K WIRELESS DRIVER
 M:	Kalle Valo <kvalo@kernel.org>
+M:	Jeff Johnson <quic_jjohnson@quicinc.com>
 L:	ath12k@lists.infradead.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
@@ -17440,6 +17441,7 @@ F:	drivers/net/wireless/ath/ath12k/
 
 QUALCOMM ATHEROS ATH10K WIRELESS DRIVER
 M:	Kalle Valo <kvalo@kernel.org>
+M:	Jeff Johnson <quic_jjohnson@quicinc.com>
 L:	ath10k@lists.infradead.org
 S:	Supported
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath10k
@@ -17449,6 +17451,7 @@ F:	drivers/net/wireless/ath/ath10k/
 
 QUALCOMM ATHEROS ATH11K WIRELESS DRIVER
 M:	Kalle Valo <kvalo@kernel.org>
+M:	Jeff Johnson <quic_jjohnson@quicinc.com>
 L:	ath11k@lists.infradead.org
 S:	Supported
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath11k

base-commit: a2777be03236c00466326acba8d39ac4f9c3e971
-- 
2.39.2


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
