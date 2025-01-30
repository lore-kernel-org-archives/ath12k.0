Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376A8C02190
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 09:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afQFLMl7wInWi5WtK7EZbylobdl4JHueQ7fuYCzCP3E=; b=tIlnwReVjijP+j/2/O5owFiasi
	E1d318cNNK5VXy3/KVhRANqqJNLsha2UGo9kDkMXTZnF2tT8jmZ1hdzHAqieLraqa68yZLge8eVCs
	5Bf5kHxK8no2kK2DjdV/haV9JSmORy5qBxbb31zXB1H87MaUcpwPF32N18vMGbWysI5D1Tqu3y7Z0
	p2OQO/iYTXtZ1wl+md/fSlscdhQIAGeQYpHZam3BNKwnki7CyBZc27pZIsrLg5yTsLgpbDZVMBpWH
	nuZ9mfJm1S/tGBE87cVSEraQdCUjZ+0f1ugiuTA6j0/dRIFz05nXmApWqTSN31b6AIsReVTCpArcX
	0wlh1U1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRJ6-00000008YXt-42UW
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 09:57:56 +0000
Received: from ns.iliad.fr ([212.27.33.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRJ3-00000008YWO-1gCc
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 09:57:55 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id B4ADD20166;
	Thu, 30 Jan 2025 10:57:46 +0100 (CET)
Received: from [192.168.108.70] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id A5511200CE;
	Thu, 30 Jan 2025 10:57:46 +0100 (CET)
Message-ID: <1a6316872ecb6b49cbaab70d5e8fd01e78fe0ba6.camel@freebox.fr>
Subject: Re: [PATCH v9 6/9] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
From: Maxime Bizon <mbizon@freebox.fr>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Muna Sinada <quic_msinada@quicinc.com>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Thu, 30 Jan 2025 10:57:46 +0100
In-Reply-To: <dedfdb8e-c5b4-42fa-bd76-ca866ab1cf41@quicinc.com>
References: <20250114003813.2783550-1-quic_pradeepc@quicinc.com>
	 <20250114003813.2783550-7-quic_pradeepc@quicinc.com>
	 <f5c6d874e9d7682d52c5ed107a0ede952b5cf53f.camel@freebox.fr>
	 <5861c953-436e-4f36-ae8b-5ef52fceb3b6@quicinc.com>
	 <2aba18dc3448b5a60a1a06b33fa591e562927693.camel@freebox.fr>
	 <961df6e7-0b5c-4972-9324-5c4d430cb172@quicinc.com>
	 <54d456f00aa8a806768099df55dc9f2ef734209b.camel@freebox.fr>
	 <dedfdb8e-c5b4-42fa-bd76-ca866ab1cf41@quicinc.com>
Organization: Freebox
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_015753_577447_06E2C23F 
X-CRM114-Status: UNSURE (   6.46  )
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


On Wed, 2025-01-29 at 11:30 -0800, Pradeep Kumar Chitrapu wrote:

Hello,


> Yes, your understanding is correct..

So your patch actually does two things:
  - add support for fixed rate
  - fix default value sent for GI config to the firmware

> If peer support SGI, param_value 1 is sent to firmware where firmware
> switches between SGI/LGI based on packet error rate. This param value
> 1 corresponds to NL80211_TXRATE_FORCE_SGI in nl80211.

Is this what we really want ?

I understand the nl80211 enum like this:

NL80211_TXRATE_FORCE_SGI:
 =3D> if STA supports SGI: use SGI only
 =3D> if STA does not support SGI: use LGI only (or SGI only ? IDK)

NL80211_TXRATE_FORCE_LGI:
 =3D> always use LGI

NL80211_TXRATE_DEFAULT_GI (no forcing)
 =3D> if STA does not support SGI: use LGI only
 =3D> if STA supports SGI: implementation defined, most likely SGI/LGI
chosen by rate control


Assuming my understanding is correct, should you not adapt
ath12k_peer_assoc_h_ht() to match this semantic ?

--=20
Maxime




