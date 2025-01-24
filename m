Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46188C02181
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 08:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yj9L6/5GmTnYd1zONc/SNFmsm/sBGPHg7/sgJkSZCJc=; b=IDaaEjiMZwvwon/ApFl7ezD7b9
	ipVPDPRPzpc34QWFoxIobFn2KFTH8rvgAOCKgICGtTB5REtergxf+7U8zbnbcYpxAs7u0oNoRFkJH
	BEIZ9tBCGMXr5SFPSQ/HEGQvuxPYEomqQxuUV/gOd3vHKjqH+DiUkRLFki/8W8OPrcPMMn0z/HnHl
	VmZBtRsRF4t5HIU/2aLi97ahvOoWBY1g6yhcM4kC1RGwBBpk43ZlxyMESCd9BTWAZMVo7kR0SlrKc
	Cw14MQ+483v0G1wfBijhyN0OrTUGv+iF2mOc3VpRMQxLXalp6G+j7IT9LH8ybVQljJtPvAItdqS75
	cYHPOUZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbF4E-0000000EFYq-07k5
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 08:29:30 +0000
Received: from ns.iliad.fr ([212.27.33.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbF1s-0000000EF2H-1lXS
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 08:27:06 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id A5C362008D;
	Fri, 24 Jan 2025 09:26:59 +0100 (CET)
Received: from [192.168.108.70] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 977A42004D;
	Fri, 24 Jan 2025 09:26:59 +0100 (CET)
Message-ID: <2aba18dc3448b5a60a1a06b33fa591e562927693.camel@freebox.fr>
Subject: Re: [PATCH v9 6/9] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
From: Maxime Bizon <mbizon@freebox.fr>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Muna Sinada <quic_msinada@quicinc.com>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Fri, 24 Jan 2025 09:26:59 +0100
In-Reply-To: <5861c953-436e-4f36-ae8b-5ef52fceb3b6@quicinc.com>
References: <20250114003813.2783550-1-quic_pradeepc@quicinc.com>
	 <20250114003813.2783550-7-quic_pradeepc@quicinc.com>
	 <f5c6d874e9d7682d52c5ed107a0ede952b5cf53f.camel@freebox.fr>
	 <5861c953-436e-4f36-ae8b-5ef52fceb3b6@quicinc.com>
Organization: Freebox
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_002704_601926_A6CDFE25 
X-CRM114-Status: UNSURE (   5.19  )
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


On Thu, 2025-01-23 at 17:09 -0800, Pradeep Kumar Chitrapu wrote:

Hello,

> I believe, this is default GI based on device capability of HE for=20
> ath11k or EHT for ath12k.

Your patch alters the behaviour of this code in
ath12k_peer_assoc_h_ht():

        /* As firmware handles these two flags (IEEE80211_HT_CAP_SGI_20    =
    =20
         * and IEEE80211_HT_CAP_SGI_40) for enabling SGI, reset both       =
    =20
         * flags if guard interval is Default GI                           =
    =20
         */
	if (arvif->bitrate_mask.control[band].gi =3D=3D NL80211_TXRATE_DEFAULT_GI)
	        arg->peer_ht_caps &=3D ~(IEEE80211_HT_CAP_SGI_20 |
				IEEE80211_HT_CAP_SGI_40);

	if (arvif->bitrate_mask.control[band].gi !=3D NL80211_TXRATE_FORCE_LGI) {
		if (ht_cap->cap & (IEEE80211_HT_CAP_SGI_20 |
	            IEEE80211_HT_CAP_SGI_40))
                        arg->peer_rate_caps |=3D WMI_HOST_RC_SGI_FLAG;
	}


I don't understand why a patch adding a feature to force GI would alter
the current behaviour without any actual forcing ?

--=20
Maxime




