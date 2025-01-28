Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070DEC0218A
	for <ath12k@archiver.kernel.org>; Tue, 28 Jan 2025 19:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zuJsGRkQsFYTiaY6imygnPrbK4A2tpmbVu0lGGjQ5Wc=; b=qlKTVIKGc8OcUHnQtpA0r3Kob8
	cC31rTwAsgcX4BohoU3lpdgIkANb6IevKyfaou6w3cQDEvPEMOohofzt2aphXV5guyIxpGg47DxWg
	YlzqcmTkRSrBdwxoADO1PRDiQHXGy6Xgpik731XiTjkX0u+LFkbBBNvHJHhZGYgUWXqXfZrO3gJGg
	ltePH7phDuWl4rZCA4hkZtdwB6fW2ZjtfQOSxsKzUC9YolvdRvUa8SLEAmxjhyRDFPinzAv00b9Bp
	bkWMN3l1hhkp9g4oidijA/+EDjnukEqSLgVG1wZX5To0+BtRQgncu2Q26yGJaiCAAztzaeGu80flQ
	sswh3+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcr2E-00000005grd-2coF
	for ath12k@archiver.kernel.org;
	Tue, 28 Jan 2025 19:14:06 +0000
Received: from ns.iliad.fr ([212.27.33.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcr2B-00000005grH-3YjO
	for ath12k@lists.infradead.org;
	Tue, 28 Jan 2025 19:14:06 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 6981020913;
	Tue, 28 Jan 2025 20:13:57 +0100 (CET)
Received: from [192.168.108.70] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 4FAB8206E8;
	Tue, 28 Jan 2025 20:13:57 +0100 (CET)
Message-ID: <54d456f00aa8a806768099df55dc9f2ef734209b.camel@freebox.fr>
Subject: Re: [PATCH v9 6/9] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
From: Maxime Bizon <mbizon@freebox.fr>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Muna Sinada <quic_msinada@quicinc.com>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 28 Jan 2025 20:13:57 +0100
In-Reply-To: <961df6e7-0b5c-4972-9324-5c4d430cb172@quicinc.com>
References: <20250114003813.2783550-1-quic_pradeepc@quicinc.com>
	 <20250114003813.2783550-7-quic_pradeepc@quicinc.com>
	 <f5c6d874e9d7682d52c5ed107a0ede952b5cf53f.camel@freebox.fr>
	 <5861c953-436e-4f36-ae8b-5ef52fceb3b6@quicinc.com>
	 <2aba18dc3448b5a60a1a06b33fa591e562927693.camel@freebox.fr>
	 <961df6e7-0b5c-4972-9324-5c4d430cb172@quicinc.com>
Organization: Freebox
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_111404_024905_7948C76D 
X-CRM114-Status: UNSURE (   3.00  )
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
Reply-To: mbizon@freebox.fr
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org


On Tue, 2025-01-28 at 10:44 -0800, Pradeep Kumar Chitrapu wrote:


Hello,


> Currently default is configured as FORCE_SGI

"Currently" with or without your patch applied ?

From my perspective:
 - without your patch: DEFAULT_SGI
 - with your patch applied, no fixed rate: FORCE_SGI
 - with your patch applied, fixed rates: user decides

--=20
Maxime




