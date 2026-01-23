Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37CCD74EEC
	for <ath12k@archiver.kernel.org>; Fri, 23 Jan 2026 15:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=om9q+srifk+m3/ipW1COktkWxrQuXTLgvLJtU2pt4s0=; b=yI0kzNpj/ZFd0Iq+3hiRaLEU52
	ysliAS0zprFR9swBOH/xm1vQjJJlIZeSxNo/H2TiU7tU3Rsq14WYQln0DU6OGmdMG2fgMK714oziQ
	SLmKKPo/VpfWxERB1Bd2u8fAG+kFM0xqUv8hGJLCsdUShcPUTqaS8xstyKtYl+s188tc5JaUQtx9K
	+T2xQ8KqckqUnhTyhadO5AllN5+mB2a47+65CDLgWJFAXG70BrkUCSiiYgg57/mlK+WjVBSyQylhc
	b5iPoqG3Az72BcT+FDsJlgVZDlD8HhYLGQITO761LaORpKW1sbFIjbMp2AbpMvvpktdEYaF278Aen
	V8QjJieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJY0-000000097xp-2ISa;
	Fri, 23 Jan 2026 15:58:08 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJXy-000000097w6-0I0c
	for ath12k@lists.infradead.org;
	Fri, 23 Jan 2026 15:58:07 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso1577287a12.1
        for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 07:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769183885; x=1769788685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=om9q+srifk+m3/ipW1COktkWxrQuXTLgvLJtU2pt4s0=;
        b=kNimCOdn8OOz1Orw0sPBoBtDiYDn/Z2EMFBQJHs3pIIEr9O8vtJrxgDMKyX/u6Bkz7
         eFLTiDy0gyFRnQA/xIbLVtFrMWMF5USa6Kof4TRViWpCL9ZAtJZjBJhIExFx7mcDMPd6
         h+QCrE1+ZFDlkll3mGi+35a5k6SEsWE6CGaoftth5irl7w93YiztYeD+SiVgOq4R1xVx
         yg/Cjof1I2uA1SEYwn6Ze9SPWzHBxRThsNWCMghC6Lk/RP5sVSN5uZup25LoLD5cL8Jj
         T+kNMLM6OafOprIXxSsjViZsFa8xIY04vjFgi+vWMka+6b3s2bNBU13dY2HB1FKeqO+t
         7NAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769183885; x=1769788685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=om9q+srifk+m3/ipW1COktkWxrQuXTLgvLJtU2pt4s0=;
        b=qGkb/Ghdqa3CiW2rENuBI6ZA010HYsOux7k2jBS8R5QN9kbPtJDwsMv3liq0ixmKN0
         LYKJlZZqTqCtveZdWQkQGcGS5ec6MrsrjeLsx3/ATFHtEC0fxjeMLjsnPYUtEMi3Jzb6
         NLfYa+L2f/tHYOD/WsmcVTHfsbyViptd3PT/KYnEs86xykYUszTACfKsHr4nkGcf9bNQ
         fAmkkicaxdtq8BZbn22podCyf4klzASy4vxQQIVz+AAcuiwlu2ZkmiLn/BAroPKbr8nD
         e/DfgfE6zv+j3REOGnGVw2aYy/gLMqZu+afUMhaAyyNclStIGesByTtRynYAiOTDt7c8
         Jtww==
X-Gm-Message-State: AOJu0Yy0RO7+9NBiKWfD6Q3gOXriL/gx6Qj9HaxeczuDgEbKr+W4Vxos
	1uKsRWXAfvt3BK49+rTbqdo88S3V8gaCo8vk+jbRT5lTQqDTLBB0ybHxW4R7oCB1
X-Gm-Gg: AZuq6aJpgY8kajXLuyEGLgnVpyFqCL/ZT1Jyt4r9N9SGqokUsp09wJ3YIBd+ij0QOhi
	ULpqwPeWB7Wf9XRx26aAUi4tJ6Wax+cc0IoR+emKtOnDpZnrCQF/4nhYDVN9cjtRosPXTYhJWwx
	TXGD0+W9B2MfywEV8SWxb9kny6fgTTsjMZDNraEhhn+ntfQPXu1mLHiWjNL353jm6Zmbh0a3gvR
	gmyl+CU83Apyl36hofxcpjeSRc3M1ylR8wBqn0sMhQt6mUwZFY5rfxA+OytoI2Hzm/eHQ+mtVN8
	TMGbY3VLdlj+dmTYSpM7YZoGo8hxwM/w1Sp7csQjGav+JXzWJ9FAhJRvsu1t3TbAzUruFalZLhE
	aOVZYrC7FSNWkvjZeZHycuMCn+963tt9T96IVnFqn4Z25OUmh0X9DOoa66R0KvZV9K9gZP8Isa+
	P9U1SbKlh9rCgpzV+LdZCHSL0DLlUJhMEt4YA0
X-Received: by 2002:a17:90b:5625:b0:343:5f43:933e with SMTP id 98e67ed59e1d1-3536894d3b5mr2930051a91.19.1769183884674;
        Fri, 23 Jan 2026 07:58:04 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:dfb6:6b31:aa17:2446])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35335206b23sm5489305a91.3.2026.01.23.07.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 07:58:04 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	kvalo@kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH] wifi: ath12k: Add fallback regulatory domain for WCN7850 without SMBIOS
Date: Fri, 23 Jan 2026 21:27:48 +0530
Message-ID: <20260123155750.6007-4-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260123155750.6007-1-bjsaikiran@gmail.com>
References: <20260123155750.6007-1-bjsaikiran@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_075806_112913_39E3280E 
X-CRM114-Status: GOOD (  10.23  )
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

When SMBIOS doesn't provide country code data (common on some Lenovo
X Elite laptops), initialize with world domain (00) and skip sending
it to firmware to let firmware use its default regulatory settings.

Without this, new_alpha2 remains uninitialized and firmware receives
invalid country code, causing repeated regulatory update failures.

Note: This workaround doesn't fully resolve the regulatory failures
seen on WCN7850 hw2.0 with firmware WLAN.HMT.1.1.c5-00302. The firmware
still rejects regulatory settings during early initialization, keeping
the device in passive-scan-only mode for 5GHz channels. Further firmware
debugging is needed to resolve the root cause.

Link: https://bugs.launchpad.net/ubuntu-concept/+bug/2138308
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x)

Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index cc352eef1939..4121dd14bbcc 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -800,6 +800,18 @@ int ath12k_core_check_smbios(struct ath12k_base *ab)
 	ab->qmi.target.bdf_ext[0] = '\0';
 	dmi_walk(ath12k_core_check_cc_code_bdfext, ab);
 
+	/* If SMBIOS doesn't provide country code, initialize with world domain (00)
+	 * to let firmware use its default regulatory settings
+	 */
+	spin_lock_bh(&ab->base_lock);
+	if (ab->new_alpha2[0] == 0 && ab->new_alpha2[1] == 0) {
+		/* Use world domain - let firmware decide */
+		ab->new_alpha2[0] = '0';
+		ab->new_alpha2[1] = '0';
+		ath12k_info(ab, "No SMBIOS country code, using world regulatory domain\n");
+	}
+	spin_unlock_bh(&ab->base_lock);
+
 	if (ab->qmi.target.bdf_ext[0] == '\0')
 		return -ENODATA;
 
@@ -1522,6 +1534,12 @@ static void ath12k_update_11d(struct work_struct *work)
 	memcpy(&arg.alpha2, &ab->new_alpha2, 2);
 	spin_unlock_bh(&ab->base_lock);
 
+	/* Skip setting country code if it's world domain (00) - let firmware use defaults */
+	if (arg.alpha2[0] == '0' && arg.alpha2[1] == '0') {
+		ath12k_dbg(ab, ATH12K_DBG_WMI, "skip sending world domain to firmware\n");
+		return;
+	}
+
 	ath12k_dbg(ab, ATH12K_DBG_WMI, "update 11d new cc %c%c\n",
 		   arg.alpha2[0], arg.alpha2[1]);
 
-- 
2.51.0


