Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65083C369C2
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpuwoWN6mbA9oZ2QFKD0MvRa4oPxeEBdptFek4pK4S8=; b=HAyx4T1SKu3pP2Nu/P0q3uwYQJ
	9Sz+DYxMZt4Th6pVut+qioZO4kHWMXY8ea/zbVdtwGUiH5/XVgBlFr7tOavGnFrPF5rqOi9s073cF
	EogpOs9E/CXoQAzwDZ9xhXwrGX6kNQ5KobqKyBDTvqSRqr71KTQxtMRkYf9GXb7GsbKogUjLrPTeY
	cGgYZzcDYGm7VVuA3Tf+EXzos2UEG47kX3oRrRA6aIluC9rtXLRsyPIMqXgTTUkai5GAuq5zF+dAE
	xonGCl0OxgRmaqS4NouNi7bJQiGPcbEeiYAGnQGNzU1VsaYXa3HwFnrg8gOedhDzPzngj+O2VOi8E
	uC4t5lEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PAl-0000000D7VG-0eTg;
	Thu, 17 Apr 2025 13:20:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PAQ-0000000D7JV-2vVJ;
	Thu, 17 Apr 2025 13:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qpuwoWN6mbA9oZ2QFKD0MvRa4oPxeEBdptFek4pK4S8=; b=fVWKjPKgtJbZXQ20G6Pnx7++X8
	pyH5hkmFh1QoMlwB2Rlvsgya/MYZ3atfPyHKlTWTUI/Y/AqMjCGhQ1b7+eoNJL4wD1dIuqawhn1bG
	f840CRvq7UdArwaWLvW+xM3LmSVU+8PZu4XOVfvFimcYj63ha8XWgSY/v8mTNs1D9N/b00WmQMG5T
	iZKL9+U/GrS7rg7XF3q1c1D4ZlKDDGo32Cd7zQNZQG05RNsTOmGxQR3nVnOs2qS81KJahlBBcsr+C
	EyUfl7i9EPDHiGPDo+VufM0kqTEXomZwdyfwirUbz1Z7VFQKTQKc+SXGMITpTE2KkxbsoUKRUk3cM
	oJPvn6JA==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5PAN-0000000AIdG-41Mi;
	Thu, 17 Apr 2025 13:20:33 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744896030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qpuwoWN6mbA9oZ2QFKD0MvRa4oPxeEBdptFek4pK4S8=;
	b=YW4dexUMujxhI9RsX4x7e2elK1th4IpqxAipylBDIV8u2vFkCMVaIfxqtpk8zJw4WPsavJ
	ziKnj1Sbwm3E1hTnPoKpj6QKTdUltTha+HxCoX3crpuzS9JR7W7Qctl6JCQcu/iAPFVaXO
	eoOYsLpRVZ2hHJKzoyVj1lEiibuynlJWF2AtBMMjSiC4e5uEPGbnyHn+Kte2ItStvnQm/2
	9wWY9buEPv0qsuiPXKPy7+MaFBx/z/QuSHjRUAz+gpVt5so8GU8DNun3Jzool9P82lww/R
	FCfRLs0Hqj1Ai9bt8qMiWkVn1zC9TzBh/k7d5O3VIfQu3Y0mrp7Gt2RGP/uD+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744896030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qpuwoWN6mbA9oZ2QFKD0MvRa4oPxeEBdptFek4pK4S8=;
	b=XWjWBKcpMSPa61yH7fgPD2/6e0pH02J06KeHixSvn25XVLO2gDia2o71gDihTb2qbHsnug
	pKfiNxqb8/2EUwBA==
Date: Thu, 17 Apr 2025 15:19:09 +0200
Subject: [PATCH ath-next 3/4] wifi: ath12k: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250417-restricted-pointers-ath-v1-3-4e9a04dbe362@linutronix.de>
References: <20250417-restricted-pointers-ath-v1-0-4e9a04dbe362@linutronix.de>
In-Reply-To: <20250417-restricted-pointers-ath-v1-0-4e9a04dbe362@linutronix.de>
To: Jeff Johnson <jjohnson@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, ath10k@lists.infradead.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 wcn36xx@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744896028; l=2078;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=TTY0OdEts5CMGR4SkSsgwcX6nSC4Z23DkwaOHjZ9iIM=;
 b=6r1KIK7Old+1LXqWuk2M0JkIPIqBlAOJFQOpKm+FhYnzMqaj1nT3xp1900DFyDmWDfN8V3Ldn
 RvGlN9nendpBnJSC4wnuynbmYXclbpbLGsH4bQB3ZUZqyPxMHr1BgZn
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_142032_136355_344BEE09 
X-CRM114-Status: UNSURE (   9.08  )
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

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping looks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.
There are still a few users of %pK left, but these use it through seq_file,
for which its usage is safe.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
---
 drivers/net/wireless/ath/ath12k/testmode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/testmode.c b/drivers/net/wireless/ath/ath12k/testmode.c
index 18d56a976dc74c4f6eab87e358c14d4faea648e2..fb6af7ccf71f44ae4bd01cde53fba3527eed0d2d 100644
--- a/drivers/net/wireless/ath/ath12k/testmode.c
+++ b/drivers/net/wireless/ath/ath12k/testmode.c
@@ -97,7 +97,7 @@ void ath12k_tm_process_event(struct ath12k_base *ab, u32 cmd_id,
 	u8 const *buf_pos;
 
 	ath12k_dbg(ab, ATH12K_DBG_TESTMODE,
-		   "testmode event wmi cmd_id %d ftm event msg %pK datalen %d\n",
+		   "testmode event wmi cmd_id %d ftm event msg %p datalen %d\n",
 		   cmd_id, ftm_msg, length);
 	ath12k_dbg_dump(ab, ATH12K_DBG_TESTMODE, NULL, "", ftm_msg, length);
 	pdev_id = DP_HW2SW_MACID(le32_to_cpu(ftm_msg->seg_hdr.pdev_id));
@@ -227,7 +227,7 @@ static int ath12k_tm_cmd_process_ftm(struct ath12k *ar, struct nlattr *tb[])
 	buf_len = nla_len(tb[ATH_TM_ATTR_DATA]);
 	cmd_id = WMI_PDEV_UTF_CMDID;
 	ath12k_dbg(ar->ab, ATH12K_DBG_TESTMODE,
-		   "testmode cmd wmi cmd_id %d buf %pK buf_len %d\n",
+		   "testmode cmd wmi cmd_id %d buf %p buf_len %d\n",
 		   cmd_id, buf, buf_len);
 	ath12k_dbg_dump(ar->ab, ATH12K_DBG_TESTMODE, NULL, "", buf, buf_len);
 	bufpos = buf;

-- 
2.49.0


