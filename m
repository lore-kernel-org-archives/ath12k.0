Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40162FD8FD8
	for <ath12k@archiver.kernel.org>; Thu, 26 Feb 2026 16:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gEpFjzTnc+F8w1dVkBjPp738EGLCJBVQ2zn4pHy55V0=; b=nMIWyAEmSkIRNDUgTFjkxu9O/y
	SbCaW5HopZNShmaNoChd5UKiSes3WQBZduf4pDTS8EPJQrOJ4vDzS4PeuNpDCR+IEHk5cdWdlIogb
	hmnOpWH/hL2X/fbx55xBBjgac0kvVtBMF8vpURRYMusI1LZfvXx7phAYztSmNfhck63FfTb0PozEW
	SqBBw7njHnmhaI2Sq1wwQCA34gZoQtH8kOp8jdvOAOkpQTTNji02sSHfmfVRulOzXDwe+JW48+/sg
	uSvNTQstRcAZOmtZr2U1K1djklZs2beiET71OPiffy2CvN1qaTUScmeKvJTP8/UU27X7ZZgL9ANQj
	Whg7fV2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvee2-00000006muf-3giA;
	Thu, 26 Feb 2026 16:55:22 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvee0-00000006mth-3IZM
	for ath12k@lists.infradead.org;
	Thu, 26 Feb 2026 16:55:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48374014a77so12160435e9.3
        for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 08:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772124918; x=1772729718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gEpFjzTnc+F8w1dVkBjPp738EGLCJBVQ2zn4pHy55V0=;
        b=kJyo1HecxesFQcdc6GrxaQh8Io3X47bDfy+x4tmn5hCUniqoQTKG+t6BMekcntP7I9
         lMrkZQCzd+Vb5IQJLL4C3WR7gb9y7rc5ZtTNqihf1GzO27Z38//K/pDHytIj8WF8Fx+n
         VBppTSjCX4On1MLZhxdzO2/pPWK4okAbZ8NBrZx7WFtiaGSy4JlbGOHZKsGpiyq4EwDk
         /J7ss2Ktp6sloTud+AVX0uUin4FwKVpzo1Q9+Aj2c1GXATX+rGvEFFMh6VhW7VmP+pLL
         cB80oss3qOwT6oOrD++zFw06EIXM1vT/9EqmM8mBqbFPdppKL2F4EYSPsp+vxtGiZU1S
         EZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772124918; x=1772729718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEpFjzTnc+F8w1dVkBjPp738EGLCJBVQ2zn4pHy55V0=;
        b=iIUV2mN/FExlgkCwGmN7MOntyZa2jvIOK9snDdcdbR1a/xXAbJJgZBO94QGAeqEr8l
         IBaXhhzJEERknp/LjyheoLzD9JySpNd0Mb0CCrHARalIzLipWjEuEYwYs1D2DXbKczER
         SetJpwr/yOYmsvtgqr52MJrGx3grTT/PD0zhMRo8hW6rsv8p08OU1K677k/nRiXnYQ+T
         A4NX5tLQ3eCHtKerdnwNtJ0NDFzIxNh7eaWGK4EGsHW+UOJe6hvXlRs/L5s+z235WFiP
         Rv8Lpdmz0LAioH3cIkPL/1HSlB3e8n8B6ZkO3CcgwaDj3Lra4e8C8eykvl2TGqzDBjkQ
         EGnw==
X-Gm-Message-State: AOJu0YxeyT5cNA6Bl935R/wsynv7W+5r6l+sV7WsvSe4dqHdCJ/c4fNq
	TXSoCk/K8HZkJZiZ74KPQ4GoO9XAvk1K7e0GBO8Bp5+K1SpeaR7GBDdrxjF/2g==
X-Gm-Gg: ATEYQzwU2vTSHQlk99IkbYZv2bgVahCn5PhZArX0Q5GYFbLmwAn7fLgMd9626ylq5GO
	VWb3jLNM+CxofRGcErfJ0yczcrLxeWc6PdQiG9lT4kyVwORi2+P/xSE4DIjBppakq88U0Mbz62X
	UGaO4NkLgg63B5EzzvbIU90P+MKpQWmA5mxMgm1rYMLE8wsVufqKMZAL/P7VNLZZHO6uaNVfb8D
	G6XXqOiKYE16AfOhRQO32YGxsRzjwSpz3iiVGqwiIAdSH4seJayWVYejkmNgzgzSisKpnK5/DRq
	+OubvMJsXc9dfKubA3Jyh7l2MsNCjhjd/7KireaPahCHUDsR0SFRP7jsWHSqNVpffFPJkf3Me5O
	YwWSTgXsotgyBkbW1bUwgxEaBcm2PfJp+yO4qsx7OR0bK+x9O6VAfQzV9tgbu7+NzHub4ItuXvF
	OLkLSzgj8HWA7St+QxsLsrzil+B4Vquts/zA76c/V75PRSVii36XZzbfu7mD8E3Ub8iqs=
X-Received: by 2002:a05:600c:8b02:b0:47d:5e02:14e5 with SMTP id 5b1f17b1804b1-483a95a86eamr360724685e9.5.1772124918278;
        Thu, 26 Feb 2026 08:55:18 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb85c58sm39488595e9.9.2026.02.26.08.55.17
        for <ath12k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:55:17 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Subject: [RFC PATCH 0/1] Avoid per WMI message tb allocation
Date: Thu, 26 Feb 2026 17:55:16 +0100
Message-ID: <20260226165517.1899045-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_085520_873364_8382E6F2 
X-CRM114-Status: GOOD (  10.45  )
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

So for a bit of context I have devices that have memory allocation
faillures when parsing WMI messages such as bellow: 

	[73277.177015] swapper/0: page allocation failure: order:2, mode:0x40920(GFP_ATOMIC|__GFP_COMP|__GFP_ZERO), nodemask=(null)
	[73277.177035] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted XXX #109
	[73277.177040] Hardware name: XXX
	[73277.177043] Call trace:
	[73277.177045]  show_stack+0x14/0x20 (C)
	[73277.177054]  dump_stack_lvl+0x58/0x74
	[73277.177058]  dump_stack+0x14/0x1c
	[73277.177061]  warn_alloc+0xd4/0x150
	[73277.177065]  __alloc_pages_noprof+0x688/0xa10
	[73277.177068]  ___kmalloc_large_node+0x64/0xf8
	[73277.177072]  __kmalloc_large_noprof+0x10/0x20
	[73277.177075]  ath12k_wmi_tlv_parse_alloc.constprop.0+0x24/0x90 [ath12k]
	[73277.177095]  ath12k_wmi_op_rx+0x658/0x2624 [ath12k]
	[73277.177111]  ath12k_htc_rx_completion_handler+0x464/0x660 [ath12k]
	[73277.177125]  ath12k_ce_per_engine_service+0x2dc/0x3ec [ath12k]
	[73277.177140]  ath12k_pci_ce_workqueue+0x30/0x50 [ath12k]
	[73277.177155]  process_one_work+0x154/0x2e0
	[73277.177160]  bh_worker+0x1dc/0x228
	[73277.177164]  workqueue_softirq_action+0x74/0x80
	[73277.177168]  tasklet_action+0x10/0x40
	[73277.177172]  handle_softirqs+0xfc/0x240
	[73277.177175]  __do_softirq+0x10/0x18
	[73277.177178]  ____do_softirq+0xc/0x20
	...

So it seems that parsing a a WMI TLV requires an array of WMI_TAG_MAX
(void *). This array is then populated with pointers of parsed structs
depending on the WMI type. This alloc happens on a per WMI message, in
softirq, using GFP_ATOMIC which puts pressure on the kernel allocator and
can fail.

I'm not very familliar but from my understanding of the system_bh_wq, we
can have at most one work item per CPU running this code path. So the
following patch aims changes the code to have a per cpu array instead to 
parse the WMI msg and thus avoiding dynamic allocation.

What do you think ? Is this the right way forward ?

Nicolas Escande (1):
  wifi: ath12k: avoid dynamic alloc when parsing wmi tb

 drivers/net/wireless/ath/ath12k/core.c |   7 +
 drivers/net/wireless/ath/ath12k/core.h |   2 +
 drivers/net/wireless/ath/ath12k/wmi.c  | 170 ++++++-------------------
 3 files changed, 49 insertions(+), 130 deletions(-)

-- 
2.53.0


