Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C20C54E5D
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 16:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SImOeAnTaQXjHzU48ELqSSVJTwXG5901RooOWXq9JU8=; b=dyporxHcVmu4oBE3cQmaJU27sl
	lXUVyc41pcsUykzcGmRXTa+i8tU44f8y/JnGk+cR+RZP/zariSKI7J/f54QUfVqyn9dxVTtSxqIv7
	tdONqtC6ndm6upK2EThlqMea+PgJ5x8lNXL/TLD3+JkdNrTrtqogTYOq/M8mSawTx+967Cgwha3W+
	MdS2V0lBPtCuuR7p4g5NK+OMlMpMkQ7HRLf3rSh7cp1HlX/xAAy5p36qiy/SlPRIWELSudAmJqMf2
	JSHEQjartx73xXpihZqTCdxGP4gBgYMstWyJwxuBqbmODPg6BSe3e7lBYTCxRtbLCjiz8JjfFthfd
	T3TnZ8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rko83-0000000F28S-0dWJ
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 16:40:27 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rko80-0000000F26u-1tF6
	for ath12k@lists.infradead.org;
	Thu, 14 Mar 2024 16:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=SImOeAnTaQXjHzU48ELqSSVJTwXG5901RooOWXq9JU8=;
	t=1710434424; x=1711644024; b=hhYYYWiKgZxdN/qmIXLYagT7BIAgUBHucz3LaVaC6l2YdBJ
	YLvqO+TKqxhNi/HMBRXbygqoQaCkSPJDwZhUxSok4wq+j1lXXtIy8f+zwua+MoJljm2DAGHr4bpDx
	qgqtT5dZXAT1P9/jBSRrJEZWh8fJDTUIlFI9Z/u4yhsGWZ2h2U86X4ihIMM6LhP45YowcVJPYsL0f
	fBP0cD939t3g2g8UyxvEHCiCvENS/WdRNVYsIy85NG2cyMOLZ33Hqyn8UAE5PGuXaNcsJtIk/OB6Y
	vwiyeYLDA7CJPa3Rn/uJmE2g1lk38P+BOZNjdrWi3QZ/a/6Cph7XGEFCpT4nIjBA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rko7y-0000000GgVH-0DOV;
	Thu, 14 Mar 2024 17:40:22 +0100
Message-ID: <db6a60e0dbd66f307a5890d958f67029ad5bcb4f.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] wifi: iwlwifi: mvm: disable MLO for the time being
From: Johannes Berg <johannes@sipsolutions.net>
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, Miri Korenblit
	 <miriam.rachel.korenblit@intel.com>, ath12k@lists.infradead.org
Date: Thu, 14 Mar 2024 17:40:21 +0100
In-Reply-To: <87plvwepjq.fsf@kernel.org>
References: <20240314110951.b50f1dc4ec21.I656ddd8178eedb49dc5c6c0e70f8ce5807afb54f@changeid>
	 <20240314110951.d6ad146df98d.I47127e4fdbdef89e4ccf7483641570ee7871d4e6@changeid>
	 <87bk7g4x08.fsf@kernel.org>
	 <09ca997159333980a168051a2a49c675a8ad5eeb.camel@sipsolutions.net>
	 <87plvwepjq.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_094024_652814_5EE25A80 
X-CRM114-Status: GOOD (  12.15  )
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

On Thu, 2024-03-14 at 18:39 +0200, Kalle Valo wrote:
> Johannes Berg <johannes@sipsolutions.net> writes:
>=20
> > On Thu, 2024-03-14 at 18:08 +0200, Kalle Valo wrote:
> > >=20
> > > > -		hw->wiphy->flags |=3D WIPHY_FLAG_SUPPORTS_MLO;
> > > > +		hw->wiphy->flags |=3D WIPHY_FLAG_DISABLE_WEXT;
> > >=20
> > > I think we should add the same for ath12k, right?
> > >=20
> >=20
> > It's really up to you, I think. I'm hoping to even get this into stable=
,
> > FWIW.
>=20
> ath12k doesn't support MLO yet but I feel that disabling wext already
> now would be consistent from user's point of view.

Ah, you're in the situation where wext is still enabled now, but will
disappear when you enable MLO.

Agree then that it would make sense to disable wext right now so it's
not a software upgrade for the same hardware that removes it.

johannes

