Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E341D606A321
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 04:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o6bJl5mv;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XFWTzLfa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7zOgXiaHhlEwWC6Yfc1EB6/zxOl2FQ3wcptFbEXmBUQ=; b=o6bJl5mvfwH4Y4LbKBLm42xtuC
	k0OtTjQA1qoLA96+488xWKfjzgz47Z0gQaAMnX5B9nIyqO3EsXz2nS9dH/lRxMo3GI08PkxjwuDUr
	f1pOnXmdrMIMgHbKMDILhlGH1/OVRq28H9x0zkM/ADH1HRW7ESeuQ1ikOFmY252j90PdQo+wMO75Z
	Tzk/fud5NuvSJqMzP+qdfiMgd9+XkbvHvI8VYq2Z730ZrlIGnduRqwvg8pgM7OlG3TOIAuuJdzrvP
	PynscWdfGVYtiRVn+eb6FfHR/kU0t9BnDTW2OO+mgaA9RTzzrbSNLmds4mdvueuzuOpLOwoCyg+Lz
	1yOK2tPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHat-00000008IdM-1TrG;
	Thu, 29 Oct 2026 04:18:27 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHap-00000008Ib8-2Wd5;
	Thu, 29 Oct 2026 04:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=7z
	OgXiaHhlEwWC6Yfc1EB6/zxOl2FQ3wcptFbEXmBUQ=; b=XFWTzLfa5RrY2BMNe2
	fVwV+NS6jH3cLfWlswU7TRzytNb8MZ3ZxTqRpmuywJs8MUPdqdK0H+pDQ/qVXzEb
	vdGe8arjL1PIDLXB9phQTjsAU1SGZ4vrc6eb4j3mMy2bFlW6YkHFHBmCgj3urKjL
	cuRBZaZiTOrIMj3CLbeGiyDNs=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3nzIDyeJqQW5fDg--.62716S2;
	Thu, 29 Oct 2026 12:18:12 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v2 0/5] wifi: ath11k/ath12k: validate capability TLV lengths
Date: Thu, 29 Oct 2026 12:18:06 +0800
Message-Id: <20261029041811.2379878-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3nzIDyeJqQW5fDg--.62716S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWDCryUuF15tF4rKF45Jrb_yoWDAwb_Xr
	Z5K3sFvw47W3WUta47Kr17ArWSyrWkWF18GayjyFWjqFs7ArWY9r97CF98ur10yaykAr9a
	9r4DWry8Zr1agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb66zUUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wTGAWriyQTt3AAA3Y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_211824_025656_4FEA69A5 
X-CRM114-Status: UNSURE (   5.68  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Several ath11k and ath12k WMI parsers copy fixed firmware TLVs or count
nested TLVs and later consume them as complete capability structures.
The generic iterator validates that a TLV fits in its enclosing message,
but these tags have no minimum-length policies, so a short element can
still cause an out-of-bounds structure read.

Add policies for the DMA buffer release, hardware mode, DMA ring, and
extended MAC/PHY capability TLVs used by these paths.

Changes in v2:
- Validate both the fixed and nested DMA buffer release TLVs in ath11k
  and ath12k.

Jiale Yao (5):
  wifi: ath11k: validate DMA buffer release TLV lengths
  wifi: ath11k: validate hardware mode capability TLVs
  wifi: ath11k: validate DMA ring capability TLVs
  wifi: ath12k: validate DMA buffer release TLV lengths
  wifi: ath12k: validate service-ready capability TLV lengths

 drivers/net/wireless/ath/ath11k/wmi.c | 10 ++++++++++
 drivers/net/wireless/ath/ath12k/wmi.c | 14 ++++++++++++++
 2 files changed, 24 insertions(+)

-- 
2.34.1


