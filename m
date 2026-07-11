Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC34C43458
	for <ath12k@archiver.kernel.org>; Sat, 11 Jul 2026 15:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klSAWJ+LyVat8IJ5fTR83Bg1CYUQhCsmSF+iDHUXRZU=; b=3LPuEHH6nAtgr5iy0BJOuKjDzq
	J7+ZzBd5r+Ff2yFrNceP2K0EVdf6SQ9xm1b5+qXkzAeOwNQKnZta7fZy701eJvcwygwHUFw0HlsM/
	6yqmeZyx9WeW1lCvkNRl4SffKfDgLBXRQyCDcZTVlAahCc7EQv3roEBZ5Bl5ADPQdUdxEjPQxXsxo
	LSmenBFmrfgJpATTm/Xzbr+bwP5L78FXcdB6yN2VBc6zXfXr16hO74aFywhrTu/tvbofTeAdRljXI
	Dc/TtLUbJhlwXxlHN9Z6qdrfyhdpf0dxolP+O/AzZhwWxZ+oiszh4AY4MZXNyz56AD4CtX26pohiH
	LsAYozig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiZi8-00000006ewY-0kAy;
	Sat, 11 Jul 2026 15:33:48 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiZi5-00000006evq-0OSQ
	for ath12k@lists.infradead.org;
	Sat, 11 Jul 2026 15:33:46 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cc891373e0so17899935ad.2
        for <ath12k@lists.infradead.org>; Sat, 11 Jul 2026 08:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783784024; x=1784388824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klSAWJ+LyVat8IJ5fTR83Bg1CYUQhCsmSF+iDHUXRZU=;
        b=cE/VpUvKJPnGLS4nAMJa4ipMXkIQq65zWoGddHplvX+Ef0JaJlJoGB/C9U9wKrZBtT
         QSdC3GhI8W1X0PqQjVEqGsxs1KL1k+tk1Ljrz0wtZWOAwvGqlJqtLb0G4d/QjQXkUWbO
         f3Zcg9++IhWMkmbYnx+qMvD32zzBdPdr6B6POPZh1gpN0sIM1jmr/Ev85TdP7IRe27vi
         zihlF77mR6Y8RUy4hrf9WV702iMsqXXqI0wzFrt0zydTJ3IkTaT0MUEUhc/CH4SXjLrA
         B0UGImYslBrJz0LMm6/jXARFtvukX6e9tlPDcxVEkV/XSu75vvJmaAHmeuies8nrTy9L
         2Twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783784024; x=1784388824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klSAWJ+LyVat8IJ5fTR83Bg1CYUQhCsmSF+iDHUXRZU=;
        b=peVUsRvsWQxH7drBQCidn/S7M6J5S1lYdTU9q+nY1rzlBv2DeHGy04SkusWA/vVMKP
         0sM7gCzrc4+nJSHyliFavyDiG75TjFRZ7g1Plalec8rXeaCn0ifch8wGrSwzjCyHUGjw
         k40ZseCTs3doSc3NPDnDac/zqIS+0KU39a3OCMSDU88f7CTDFvt5/F+Xs2/6AU2RF0RO
         sxv9nIwDDO85g8PLFamBsZ9++HIfZw//pU1mzZgp5xiVYywKdfg/pt9MO+tZVG/L6va4
         hZWFoeSTEntkficHKfNFQeYEU1VEobi/yDVITiWf8wC/W8hUb40TBTMvwqRRS832ecjM
         BtvA==
X-Forwarded-Encrypted: i=1; AHgh+RpCaxLKkhHv6ikywbwb8iFhr+wzkV76AxqnNnkJNFqF3JK+3UFPh5FXWkGLuxJUGci9ALh8rKQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOxbU1AxcXkarr2+CwPiwfGZ/MRkqR2Yh2rqh+B5CYOUQxrQ/6
	ODWHxoD5R1p+QsbJ8L/L/fKDUMjUis3OFshLz2YcHpry3WEWLnv+QAsy
X-Gm-Gg: AfdE7cl20a5dZUqjFTUrCmPU+DJPTgJIUpp0XeDIgJ043E4RFYP/4LtVvXJCsRMq3x6
	qxIR/Ds0mTtlXh2EGm24fjhm0R2DdBnZTTHTkihWNnwtEnjdNhCRBRjYfvJJivwYPZ9Us0f4g0Z
	wo0KWpbf1GjWZJamo/CUaUv0YaxUC2bF/cM3Eib+a1onFAUpegiYEDx1pGwrnrqV+Pgq39pAj9l
	IX7IgXFIPlmRqiF5XmMlzZBdu9cX5E9w0g2Z0csmmAR83YWFP6PBSOIz6DEDQWxGyiN3tmgWHgq
	+5DQdEcTiInCdC93dgcX2z1xICBnwRoAsffLx95pC66/DkJf5COTNjn5Nc9wPD4YOOfo+KHxSak
	AM2DZ3CZScEEnNh3znKSDiGARIJbbHqjoW2X5xqhukGLoXn4ZKA192voPbYMCnbp0Q7JL1TzI0k
	6jQY6gmiO9CMxNqVrUoASZ+hDTmhhPsbpOrIKpY7IEVrtvQgF3nB8uuWaUqgmu3wff
X-Received: by 2002:a17:903:b08:b0:2c6:a172:55a6 with SMTP id d9443c01a7336-2ce9e7a5d20mr32200805ad.9.1783784024060;
        Sat, 11 Jul 2026 08:33:44 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ce95e001b1sm18256645ad.66.2026.07.11.08.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 08:33:43 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: jtornosm@redhat.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	hujy652@gmail.com
Subject: [PATCH 1/2] wifi: ath11k: implement custom wake_tx_queue with flow control
Date: Sat, 11 Jul 2026 23:33:36 +0800
Message-ID: <20260711153336.542-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710155443.1761760-2-jtornosm@redhat.com>
References: <20260710155443.1761760-2-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_083345_133474_9CF7587E 
X-CRM114-Status: UNSURE (   4.45  )
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

Hi Jose,

In wake_tx_queue:
ring_id = txq->ac % ar->ab->hw_params.hal_params->num_tx_rings;

In ath11k_dp_tx which is called by ath11k_mac_op_tx:
ring_selector = ab->hw_params.hw_ops->get_ring_selector(skb);
ti.ring_id = ring_selector % num_tx_rings;

Are you sure ring_id will be the same?
Also mgmt frames use a different path.

Best regards,
Zhi-Jun

