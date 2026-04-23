Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B38BFDEE21
	for <ath12k@archiver.kernel.org>; Thu, 23 Apr 2026 16:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CTQ4RAv+u3NA76KBzNTfx7cj8+ZcpCfmAabBKswfn8=; b=TNpg8/zGB+pjdprjgvjX2XBYXc
	4Q6VUYu8a7giJtlzX02PlkFCIKaIJ/j9+iDjbmVPTUNwJNmJG3TLXvniEOCItT/S21DuKpyysDtWO
	acq+jffW7W9DCTIfbdx4ZDHwxbhmnOMwDWwVdhNEKVEb6QGof47IdJIJymuSSSB4fIGFBeK8q6704
	AVCwZ3VUGcDDGN65ZH+bEP3gHVtBIWCS2pOZUrc/xpuQyjoaEMuHDH/RvpYXCyMXGHbOETWRdvExu
	hPlftEtA14l6LbMqDUbV6MfjjjfFHIboO+z2so1L2AtrbGgEqyUjFCM97BokeHL95sS6RZIx/LpGN
	rq5p0TSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFwha-0000000BxLb-3zKb;
	Thu, 23 Apr 2026 16:14:54 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFwhY-0000000BxLH-2CmU
	for ath12k@lists.infradead.org;
	Thu, 23 Apr 2026 16:14:53 +0000
Date: Thu, 23 Apr 2026 18:14:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776960887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2CTQ4RAv+u3NA76KBzNTfx7cj8+ZcpCfmAabBKswfn8=;
	b=DMteiUAAVXDXQ/cR2GcUwc3gsNlo5X3lAy4BWFbtBZ0DcE3Ek3lqs1mq3eqlDOo2HBqTKz
	QZKo7FCRmfLgCTX5wP/wrmbtcInMBAQhWB/1EusEEnnGifQTiAXGlv/YxLviXaHfMY0Vc+
	4KAd3pmbBiqmQ1VoMfiEjhsvraNWy46bSCpkcyJvFG7yoxHv+zLs1BI8Fa+h13BwN1yMgB
	vrlzI9kx7XSdxL/i+aFLNK/xGVpAELrjqeiM9xNMKZNkGtZcOTXxk2+JA02PsfuK6Xd6lf
	6dqz6wnY9o5ihpvj1wVXsl5Mmsqqie7AdGYXxwlRNSgIHAkGHW8EeqtJPSlxPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776960887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2CTQ4RAv+u3NA76KBzNTfx7cj8+ZcpCfmAabBKswfn8=;
	b=tbZY+vnrzHQBW5hJE3HA/YoIDWKjQZ5ZIS5hkZL7iVKAR09XRbWOcVJrj2jCD+9Yo9ksZy
	ngalhiVcVdokGgDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Yu-Hsiang Tseng <asas1asas200@gmail.com>,
	Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3] wifi: ath12k: use lockdep_assert_in_rcu_read_lock()
 for RCU assertions
Message-ID: <20260423161445.10FeXYSb@linutronix.de>
References: <20260422180814.1938317-1-asas1asas200@gmail.com>
 <20260423063020.NAero6Rz@linutronix.de>
 <caad3b9c-2c14-4e09-b8f8-840d2ec111be@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <caad3b9c-2c14-4e09-b8f8-840d2ec111be@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_091452_705722_843EB16E 
X-CRM114-Status: UNSURE (   5.74  )
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

On 2026-04-23 08:24:46 [-0700], Jeff Johnson wrote:
> On 4/22/2026 11:30 PM, Sebastian Andrzej Siewior wrote:
> > On 2026-04-23 02:08:14 [+0800], Yu-Hsiang Tseng wrote:
> >> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.=
0_SILICONZ-1.115823.3
> >=20
> > This could written in plain english as in "Tested on =E2=80=A6". Not su=
re what
> > this "convention" is but anyway.
>=20
> FYI this is a long-standing convention for the ath family of wifi drivers,
> dating back to at least ath10k:

I see. Never mind then. The previous comment read like "don't use
non-standard tags" and the change was to use a blank line.
Anyway, not my department.

Sebastian

