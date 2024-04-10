Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D6BCD11C2
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZyEb7uiN481wBR3oC8sUMfe+NR97MSLzHpHTssFaHA=; b=VXDLC/OG0KtNNlm/FQUouFkplh
	PI8TBMsZv4c/w0r37UPV0pglgsjjyv3KSe3lDkWi/IHk1A45mx3FZQ2BHbnyiN/ZKIygpYSyMt47B
	8cr7vLWiR0o1ekjbjv6vH1E0TUtvYioUKiPC353XzVL/X1wasAUt2Cl9fKbRndLAnFT/BLQbmCRrd
	3yWrAtZeh3jCzx+RLzO+2x1y7F+VtHUu24+NxNPNNFwIEfHeeGiNDpA4OUrrEiFcrLkZ65WU/M8GB
	lUsVJYgLKiFAOMr1LnSxuJZ9gn8+kYOToLSUEPW0oDqHX5OiwkiJBrbxMv/VKBu+Z9ChF6wpEzSaW
	DgXHb/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucG4-00000008Oac-2a7l
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 18:01:16 +0000
Received: from ns.iliad.fr ([212.27.33.1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucFz-00000008OYf-3vQo
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 18:01:15 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 29D98201B7;
	Wed, 10 Apr 2024 20:01:05 +0200 (CEST)
Received: from [192.168.108.70] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 1A29C2018E;
	Wed, 10 Apr 2024 20:01:05 +0200 (CEST)
Message-ID: <e5f0c5babb5b0b6c2dbe69b440f93b363a9055ae.camel@freebox.fr>
Subject: Re: [PATCH 01/13] wifi: cfg80211: Add provision to advertise
 multiple radio in one wiphy
From: Maxime Bizon <mbizon@freebox.fr>
To: Ben Greear <greearb@candelatech.com>, Johannes Berg
 <johannes@sipsolutions.net>, Vasanthakumar Thiagarajan
 <quic_vthiagar@quicinc.com>, Karthikeyan Periyasamy
 <quic_periyasa@quicinc.com>,  ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 10 Apr 2024 20:01:05 +0200
In-Reply-To: <aa9e1d54-bb5f-37cc-335f-c9970ab13789@candelatech.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-2-quic_periyasa@quicinc.com>
	 <e36599d3269496de59505b36be46f873976f8706.camel@sipsolutions.net>
	 <033185b0-f878-a50b-d0d9-57fa79439bdf@quicinc.com>
	 <ef6b6a7a4a9d3b01c0eb6abf0991e7e27425e102.camel@sipsolutions.net>
	 <80fe5786-f764-455d-ac44-22adf7aeaf94@candelatech.com>
	 <31f30c0e318904f3a082c7f213576ceb1f407141.camel@sipsolutions.net>
	 <20b56e52-a5e2-70cd-a62a-8c4a3526c2cf@candelatech.com>
	 <614bb8a8f1d9174ad7d87cf7636f657cda7b1ef9.camel@sipsolutions.net>
	 <aa9e1d54-bb5f-37cc-335f-c9970ab13789@candelatech.com>
Organization: Freebox
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_110112_547150_6A729BD8 
X-CRM114-Status: UNSURE (   5.27  )
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


On Wed, 2024-04-10 at 09:23 -0700, Ben Greear wrote:


Hello Ben,

> How will you allow all three bands/phys to host bssids that can talk
> to wifi-6 and earlier stations if there is only a single phy seen by
> hostapd?

Unless I'm mistaken (I did not try the patches), the single-phy becomes
multi-concurrent-AP capable (described via netlink iface combination).

So you can still create multiple devices (AP type wlanX) and have the
same behavior as previously.

If I'm wrong, then I agree with you, the proposed solution is a
regression.

--=20
Maxime




