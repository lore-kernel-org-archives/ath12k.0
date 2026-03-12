Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29206105A593
	for <ath12k@archiver.kernel.org>; Thu, 12 Mar 2026 12:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIvP4MBs3pIkVDcI62tjt2naMEia4i4a0qMpSIQlY5Y=; b=PSqI+Uclne6qkqaPPSomSHIHCy
	3wwqK/64L3fAhMdiyfefXiJBzz5/87io48Tofw6JAG7kpBYpr5hh0Vsui4NyWIS8KB9E7GoCQb2/q
	0LmMb/wMw4zz7JtTGGOU8VG4ORZfwA3lRQGCrBytyd0mzEr8VktSjhoH38SkBlZnBlxpTGNx6Y9YN
	ta3VkAP3PWb+xsBCilWxeIQ1a+B10OcqjanHuaOlQCkf9Wv6kikds0upcNGmeNb270F3gsm07H55J
	0bdjgcbqL6qrvl4GwLyU+EaP+Gfpg/w7yyfUoY9OvELEigLnWJvkpr1JR/MV6PFo37gSDQ55tqgWd
	g212peAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0esD-0000000E0Pe-3Brz;
	Thu, 12 Mar 2026 12:10:41 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0erx-0000000E0Od-3R4B
	for ath12k@lists.infradead.org;
	Thu, 12 Mar 2026 12:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=nIvP4MBs3pIkVDcI62tjt2naMEia4i4a0qMpSIQlY5Y=;
	t=1773317425; x=1774527025; b=svQHp9c7lJ1KeUCArL1LyTjjD8vkpyvRh5bbPJwa0lT8Kns
	CtktfcRrcfevd34xPCi/pc9vZRjoiSePjzimSUp1etckjllqP3Nkqd3RAK9BFwVX2Q6RkDItjMzXj
	Ht3pFRUl/XrqWU5BzIpzP5f8tNno1c173fdbbK+nDgDk6AwTDGxJFky2DlmRtLpRBKd52ieuOavgy
	30yKPU2kK1LW4Jnz3OHMPr2CzPGA9FSMC0GqBfh5LA9xD6OMZB29uSAyTqosLHaT/d3bVdnz1r8pr
	ybrclS0USUb9X/kuBwUpW2Ndcxch65hjTQWW2SMrDYngCnuyvri4Ag4T37uAzc/g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1w0eru-0000000Fq0Q-04U7;
	Thu, 12 Mar 2026 13:10:22 +0100
Message-ID: <e8960517faf04ed4f1bf331e23a95c477113309f.camel@sipsolutions.net>
Subject: Re: ath12k: handling of HE and EHT capabilities
From: Johannes Berg <johannes@sipsolutions.net>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 12 Mar 2026 13:10:21 +0100
In-Reply-To: <40b4b959b2ea5afd55381e6ae2d0c1908456734c.camel@sipsolutions.net>
References: <abKBOp8Jc7f7U0T8@FUE-ALEWI-WINX>
		 <b7f4c8f1a251ea9cccb32f021828896371953143.camel@sipsolutions.net>
		 <abKbLNK0YrT6dr96@FUE-ALEWI-WINX>
	 <40b4b959b2ea5afd55381e6ae2d0c1908456734c.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_051036_335657_E375D6E3 
X-CRM114-Status: GOOD (  10.15  )
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

Wait ...

> > I don=E2=80=99t see this in the function. For example, the MAC capabili=
ties are a
> > `u16 *` in CPU endianness, which is simply memcpy=E2=80=99d from the pa=
rsed
> > `NL80211_BAND_IFTYPE_ATTR_HE_CAP_MAC`. Later, they are treated as `u16 =
*`,
> > as shown in the following code:
> >=20
> >     printf("%s\t\tHE MAC Capabilities (0x", pre);
> >     for (i =3D 0; i < 3; i++)
> >         printf("%04x", mac_cap[i]);
> >     printf("):\n");

That's incorrect for sure. But iw code now actually reads

        printf("%s\t\tHE MAC Capabilities (0x", pre);
        for (i =3D 0; i < 3; i++)
                printf("%04x", le16toh(mac_cap[i]));
        printf("):\n");


which is correct. HE PHY capabilities are printed as

        printf("%s\t\tHE PHY Capabilities: (0x", pre);
        for (i =3D 0; i < 11; i++)
                printf("%02x", ((__u8 *)phy_cap)[i + 1]);

in my version of the code, and it seems to me the +1 is incorrect either
way?

>         printf("%s\t\tEHT MAC Capabilities (0x", pre);
>         for (i =3D 0; i < 2; i++)
>                 printf("%02x", mac_cap[i]);

This was also correct, not incorrect as I stated, since mac_cap is u8 *,
and EHT PHY capabilities are cast to u8 * first.

Maybe your iw is just really old?

johannes

