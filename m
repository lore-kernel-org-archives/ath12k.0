Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDD6F3C9A8
	for <ath12k@archiver.kernel.org>; Tue, 24 Feb 2026 16:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIFQlVSlTgnXmCkaiWifcQLXjUeCGQFD8pNpt7I5+Z4=; b=aUW9x2E4+O6BEmgRN8hGcwFk5E
	oUwNTcD6+DRD+CWVv6hEecDm5MdlwZyxcA0VteF/LSHIX2NB4EgW6oha9AJhLvZGGjPf9oO86UpXB
	BiSh4bcgy9Jkn0MzEIIVhrW0gS8kotGudTQ/8n/sUoVT7jJXlpMGhRVAeMEi95h1IpUj0eXY44aF5
	luAYjWQFHQjEJXODC3KJbcFphkXV+R/0oUXwNA6+Hl4EEg/5R6b7oqFa0OoXi4L9M9gDfQQf8Ikq+
	oGNVm/VWEo8fUW0CELylr461cy5kSoYtNVunlVpksjxghyD4GlYeLm4910ZEfFwtH9YzxIzNz1k8r
	mzl8E8rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuv9A-00000002Oc9-0tOb;
	Tue, 24 Feb 2026 16:20:28 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuv98-00000002Obi-12q3
	for ath12k@lists.infradead.org;
	Tue, 24 Feb 2026 16:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=CIFQlVSlTgnXmCkaiWifcQLXjUeCGQFD8pNpt7I5+Z4=;
	t=1771950026; x=1773159626; b=O1pXkTDBcFoovRHEvg6L0JjRio8DtMOvxvu8yacNs1dFcal
	2Tuig65zKBze5taBnSbrktCRFemzR+UtgJlwG//32AsQUVV4fMVZrHqnc+RdEYoByZCB8fLCXtHrP
	+wNzqHQvRle1zpaafKmyJwk1pFunROn19Uiy790wDJ3JYSBy/2Udg4226d76ytojpQpUE93tYOM9Y
	JVOeHtAGIBJuE/4DEY31lem7+qFk8DOlh5hVEOB7WdsCucZfjCp3nbVWnjRs3UgI8I5IEHURFzeZG
	TWVZgLI0JIzuhNfmI39kQtJOQ8k1k5FORTmbVC5qfrmeoZi5rmtEKJUNr5Bhtvcg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vuv92-00000000ZlD-1CWF;
	Tue, 24 Feb 2026 17:20:20 +0100
Message-ID: <d52fdbe5d9a483b5746b7253b512958d1460a9a1.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 2/2] wifi: mac80211_hwsim: Add UHR
 capabilities to the driver
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Tue, 24 Feb 2026 17:20:19 +0100
In-Reply-To: <20260217054731.3667600-3-karthikeyan.kathirvel@oss.qualcomm.com>
References: <20260217054731.3667600-1-karthikeyan.kathirvel@oss.qualcomm.com>
	 <20260217054731.3667600-3-karthikeyan.kathirvel@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_082026_334127_FC0A4CC0 
X-CRM114-Status: UNSURE (   6.92  )
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

On Tue, 2026-02-17 at 11:17 +0530, Karthikeyan Kathirvel wrote:
>=20
> +		.uhr_cap =3D {
> +			.has_uhr =3D true,
> +			.mac =3D {
> +				.mac_cap[0] =3D
> +					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_DPS_ASSIST_SUPP |

I'm really not sure we should claim all of this, e.g. DPS assist, right
now.

Also, I think you really mixed this up - a regular AP shouldn't claim
DPS below (only mobile AP), but this here station should probably not
normally claim DPS assist?

Just as examples! There are other issues like this such as:

> +					IEEE80211_UHR_MAC_CAP1_AP_PUO_SUPP |

I don't think the station should claim AP PUO support.

Certainly not an exhaustive list, ELR also seems wrong, etc.

johannes

