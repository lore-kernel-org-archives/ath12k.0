Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AD6CF65C7
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 09:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EOH7Bk3yi9Z5p2JrcjL3dwH84n/1qqnxNyvqF5np6pw=; b=hNd9r/QW+3Y871QAzuB6tirs7H
	IM7yrIpar8pU1eENJ/WzoJ0zF0Jf2zNLSygYrW8uMxjyqNhqtWB1EYHLRoV3dx/VsCc5ERNbb/69p
	r8Ln89J2QquWS0p3+do8tPVrtWN65XMGtdYNNhYlEueL2572IjXcnZyIoTlY/VfDp5VaXVik8p1O+
	NiU6aQ6zSO6OAGWQuFqfhnn43O2yZpEN7gPzJn5cnH45HOKzVYrY6jJ1dNsq72j93itPEte/CjgAZ
	MoJmecvtNrm8s25s2d1BXWaAd81f3GfmwTuj62XnEScS/6WpskKrOoSRdXMl/po6n8PZePkYQ50Y3
	7fphKuoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJHH-0000000CEfC-42AD;
	Mon, 26 Jan 2026 09:52:59 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJHF-0000000CEer-2rZ8
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 09:52:58 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-353576abcfeso1636030a91.0
        for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 01:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769421176; x=1770025976; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EOH7Bk3yi9Z5p2JrcjL3dwH84n/1qqnxNyvqF5np6pw=;
        b=hZ8yhbmV8qYE1HFu/4FeDtq/LRXnSGvmt0cpKd6aZYhayDtrVO6LKbK9jAoFEA/VXn
         GTb+3s70lAc1pPj7Q5caYpdBA5sG8sB1Z2Ix3ERlQ145/ejBjR2P82gzlQxWPQEKqb6N
         96snfwjeyPxf1h+F7Y4Bacv365dVg+53VVYgV41AuRQUOWcXC+1j7UTH+UCcSAEY0rWL
         gqA1TfSTmyxHDOBBLOFgteWYAo/doyYCjuTI9s46i2v6tv845AWd8ZZ9uH4fzYbe9Dnz
         1hXPxKIWwNL7Z1d1YYpje79OyuLxxfMyGSveVkGOOfyg6Yi5ovbMiuGlXzxo9dNsH0K6
         C19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421176; x=1770025976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOH7Bk3yi9Z5p2JrcjL3dwH84n/1qqnxNyvqF5np6pw=;
        b=LSU3hl1XNXMD2OopWhbfjqQOGG3niDEGm6/J0cMU10vrIXoTl2cBh6oJei28QBjogR
         xMYd7aEGd3sNAnrWexkq3rmVPndOfeve0jDrDYDOtUi7fKaB2p1sHhjhZ+53ZkjZz1iz
         mUAwpLs51/KcsRqw1mNvQEHV9xJKalsGZo+MCF+YNvn3gMorl1KWr74B9JWjg6UzOK8u
         j6zl0WRrlGH2P1wO3KhYzeWZjx2q/Q8iQyvtcCMNKRFLrpPsH4d5g2TgrJ/sq22eqsOX
         hSerTjQkWWej16ZvcW19cu1lRbwqeDzZD9PXaAW6Afp6vXSz9sVwm2GFnKB6R/oaCnDZ
         k3lA==
X-Gm-Message-State: AOJu0Yw0S5DJcqfW9VRuqI/w5MenaYBc+nOTh1ryZAzW6/lkqlQOSnTp
	9q3MCnz5vgA0UFXCSYJTYQLokJm5xLUdihWoANWD4ZX/FAt65JYuz+NPCN5jyqvX
X-Gm-Gg: AZuq6aLc4aj0/zPfqVvfcplgjBsb4vsjUpepwVkt599E46c62RRp6rf8ouSoT/ZGZeI
	sprp3/igTLEJNpDu1hS1bb9uR0H1YlexgzaaB2lo7trle8jvAQR92NO6zfUQTFnbTVAwKeRIlvD
	Md2Db2u2emhxbK4Q2jcGiAr5J15TGjbzwPc443puKQIw2ugBqQ+oBya8tiPsbw5Tew7aJZjdNVv
	FW7CdPNmVNq7w/CeZSmo63KKEbpvQP7oqnMUkPp4osmpjzq4O/At9iGz3mAtYcOdUNG+Wmely1O
	TCoKmauCGEcl++7ps7CP5VFdzeHo9GwWcRC010bo6SebNd5pKkY7Ev0A6w0O0Xl2uWUPkiQqy6V
	0cnUaIgGgBDSRe4V+bPwNg+cORjnfIG9RdM0KgjjzgscuATmpQAPwBxTd3QEP/O+H22eGL1I7vf
	R1FKvpDe45mcGQI6VdkuObIs+TU1QTscAgD6DJ
X-Received: by 2002:a17:90b:1b45:b0:339:eff5:ef26 with SMTP id 98e67ed59e1d1-353c41a6b36mr3065299a91.30.1769421176499;
        Mon, 26 Jan 2026 01:52:56 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:1d59:cd47:36b6:dec7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536f359950sm3187627a91.10.2026.01.26.01.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 01:52:56 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	kvalo@kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH v2 0/2] wifi: ath12k: Fix 5GHz issues on WCN7850
Date: Mon, 26 Jan 2026 15:22:42 +0530
Message-ID: <20260126095244.113301-1-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_015257_759342_21028230 
X-CRM114-Status: UNSURE (   9.33  )
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

This series addresses two critical issues affecting 5GHz WiFi functionality
on WCN7850 devices, particularly on the Lenovo Yoga Slim 7x.

Changes in v2:
- Patch 1: Simplified approach - remove frequency range filtering entirely
  instead of trying to work around race conditions. Testing confirmed the
  filtering is fundamentally incompatible with single-phy devices.
- Patch 2: Refined based on maintainer feedback - only reset stats buffer
  when pdev list is empty (not on request failure). Improved commit message
  to explain why reset is needed even with empty pdev list.
- Dropped 3 patches from v1 that were either unnecessary or already fixed
  upstream.

The first patch fixes the primary issue where all 5GHz channels were being
filtered out, making 5GHz completely unusable. The second patch addresses
a firmware stats buffer leak that could cause communication failures during
scanning operations.

Both patches have been tested on WCN7850 hw2.0 PCI with firmware
WLAN.HMT.1.1.c5-00302 on the Lenovo Yoga Slim 7x.

v1: https://lore.kernel.org/ath12k/20260123155750.6007-1-bjsaikiran@gmail.com/

Saikiran (2):
  wifi: ath12k: Remove frequency range filtering for single-phy devices
  wifi: ath12k: Fix firmware stats leak when pdev list is empty

 drivers/net/wireless/ath/ath12k/mac.c |  1 +
 drivers/net/wireless/ath/ath12k/reg.c | 13 -------------
 2 files changed, 1 insertion(+), 13 deletions(-)

-- 
2.51.0

