Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E5EC4828D
	for <ath12k@archiver.kernel.org>; Mon,  5 Feb 2024 19:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AxT1CX5XX9APMPXO5Q9+yCVBQYgFsVT1eDUs+7WzcOc=; b=XRd2uelCUXkDfxM8xgR1fUwXii
	ouWUOW8Yv/JhseTCIDbRR7QQUIegDlSjW9tgLOkV5qIcIA2Grp3Qs7dfre0i1sesZn5GolXS4/eO6
	Vpgrb+PH1xExsPC+Y2YXNGzXEjtS6SZTVQvc/okqnDfT5cXEx6flF60x+kUxPcwH5nTRUP6OaFEuZ
	qMeZTsfk9iIrNgKCmkH+wE+TvNc5/kWrXrIOazYvdu1m6dssWELO0btq2FBhQci+XJSh5qcn0G9vF
	Utrp+jVemuXqzGE+7Qiy3aACRhfomvSgFQA6zo0XO1VvZBl9QMoeESW/iRen+OzxxQLThOl8iLkuX
	7OQytHtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX4yr-00000004t2E-3JOi
	for ath12k@archiver.kernel.org;
	Mon, 05 Feb 2024 19:50:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX4yp-00000004t0H-2Zio
	for ath12k@lists.infradead.org;
	Mon, 05 Feb 2024 19:50:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 84400CE0EE4;
	Mon,  5 Feb 2024 19:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E5BC43390;
	Mon,  5 Feb 2024 19:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707162605;
	bh=XGZvM8CnVOoEcpJ+1Zp5FZhnTkRISZtwEBoyYdZSJXk=;
	h=From:Date:Subject:To:Cc:From;
	b=kZMiUd+oD1Tv/xggEn4Lna0z0P144GIQCIwpGyd5Rk9ThIPjgN0P3f6WX5oCRUjeZ
	 HJS4nnSFmw1cbxDn0y6E5fbiWAMWg4Yhk46SkdpEK151wmBYBBR7mvT32LbytYJ0vb
	 DXVGFGDrE4rUjGNJ6GfvUlhSJj33bx53mssoxs5e6Q3dmMTXgbJ7WqNQSvELXvn2/W
	 2TGSDHojrsdBqRRyPhc8EJotFPMtmmbhqFX2dL+DSHOE+2Dzhus2xVesfHrfWhwDTR
	 VMmlcoWVLPreAbJ96tRW9OgibK5GuxabxPvagAly4XULG+an5byPV3vwM6itHJdofX
	 VLM373Q2j2lUw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 05 Feb 2024 12:49:53 -0700
Subject: [PATCH] wifi: ath12k: Fix uninitialized use of ret in
 ath12k_mac_allocate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240205-ath12k-mac-wuninitialized-v1-1-3fda7b17357f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOA7wWUC/x3MQQrCMBBG4auUWTuQDC2iVxEXYzKxP2qUpLVi6
 d0NLr/FeytVK7BKx26lYm9UPHOD33UURs1XY8RmEie9EzewTqOXGz808DJnZEzQO74W2V/CkDT
 5fZQDtf5VLOHzf5/O2/YDFLS4Q2sAAAA=
To: kvalo@kernel.org, quic_jjohnson@quicinc.com
Cc: morbo@google.com, justinstitt@google.com, quic_periyasa@quicinc.com, 
 ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1729; i=nathan@kernel.org;
 h=from:subject:message-id; bh=XGZvM8CnVOoEcpJ+1Zp5FZhnTkRISZtwEBoyYdZSJXk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKkHrd/6PGEP41x5dM4eL5WyqzX9xV0Wu7/8Kgir5mjL8
 7w65//7jhIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRn/4M36s0uX8kFF4v8qj8
 ZMC4iJ3p7C8W+ULRE1fDmacKCe75zvBXaqJA6WTh8DXX0+8HOVw+K6YSnHLiX5xv3UI35k+/i+K
 5AA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_115011_878377_6F4488D6 
X-CRM114-Status: UNSURE (   8.30  )
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

Clang warns (or errors with CONFIG_WERROR=y):

  drivers/net/wireless/ath/ath12k/mac.c:8060:9: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
   8060 |         return ret;
        |                ^~~
  drivers/net/wireless/ath/ath12k/mac.c:8022:9: note: initialize the variable 'ret' to silence this warning
   8022 |         int ret, i, j;
        |                ^
        |                 = 0
  1 error generated.

Commit 6db6e70a17f6 ("wifi: ath12k: Introduce the container for mac80211
hw") added a completely uninitialized use of ret. Prior to that change,
-ENOMEM was returned to the callers of ath12k_mac_allocate() whenever
ath12k_mac_hw_allocate() failed. Assign that value to ret to make sure
it is always initialized when used and clear up the warning.

Closes: https://github.com/ClangBuiltLinux/linux/issues/1989i
Fixes: 6db6e70a17f6 ("wifi: ath12k: Introduce the container for mac80211 hw")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/net/wireless/ath/ath12k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index fb5bf500ed87..4b0521e8fb26 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8038,6 +8038,7 @@ int ath12k_mac_allocate(struct ath12k_base *ab)
 		if (!ah) {
 			ath12k_warn(ab, "failed to allocate mac80211 hw device for hw_idx %d\n",
 				    i);
+			ret = -ENOMEM;
 			goto err;
 		}
 

---
base-commit: b82fb7ef690bd929b88d9aab1d191ff502ed9029
change-id: 20240205-ath12k-mac-wuninitialized-1bc5faf17d29

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


