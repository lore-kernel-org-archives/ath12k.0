Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38342FED2F7
	for <ath12k@archiver.kernel.org>; Thu, 12 Mar 2026 09:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWyIkvOFf1wPgGGSCnpAqsN4f/t5t8iIVdsRu5KdwmU=; b=pyfALKRYZXUmtPoEU8R+8ouVYR
	DiSS3rAJ+IrM7Ev5zilciWT76//dYyZtufbpYcpk7FpMg6fYeO0iwtl+eC1LEnZSEvDy4zYw/mPai
	jVhRynCJS1HLVNV+tMR2DdgDpMxy2ukF+/PEFyHKFHMbu1nAw/kdXlhbsSXvIkmcUK5WAL8yZp0+y
	QMuRX89myhFLUxSO7cSqo7u/SOJSLKODCpWN0/7+QwqmXtK2XmzV6gLQmoB7dm+nLBc3S0tUfS/kO
	MZVitjnPXes1Z3g/WJgXljBhz2HBFQu5NjSGC1OKOOP44vz+YYbN+hKWXdBb9ODgM8cYn4Z0rTGB1
	afH809hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cUK-0000000Dn3f-3kku;
	Thu, 12 Mar 2026 09:37:52 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cUI-0000000Dn34-1h97
	for ath12k@lists.infradead.org;
	Thu, 12 Mar 2026 09:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=GWyIkvOFf1wPgGGSCnpAqsN4f/t5t8iIVdsRu5KdwmU=;
	t=1773308270; x=1774517870; b=K/FA5zxMKreNO7Sutp9DFwfX5Sl8uX2B1ytk+3FqeDZv75y
	4DgtneOqaELl8NaQ5oBOs87SxuWT/UjXZ5glQkfDKItkgFz0fXcnk0gqZRXa/BAN8W46TqnHu/yEV
	sObmeg7VWDK9cB8MZ/toSKelaG26nGADPBI1cKbv/PTIdUjsUGdkYrDdBX16zvg3fZ/LQA4uPybWa
	81CBfykNNzdvOokpQJ6Zebpjc1lEfELk7c35Qo3n9w5S99p4K2ksY8xGYVBFW41EGThTlNLB/RFAz
	JxRCF9XbDvQeJXupiKzw4R5LYC4ETfz/7uQUQh6+ahBOrBsXutvBKjGnbbEMYB4g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1w0cUE-0000000FlgF-32tr;
	Thu, 12 Mar 2026 10:37:46 +0100
Message-ID: <b7f4c8f1a251ea9cccb32f021828896371953143.camel@sipsolutions.net>
Subject: Re: ath12k: handling of HE and EHT capabilities
From: Johannes Berg <johannes@sipsolutions.net>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>, Jeff Johnson
	 <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 12 Mar 2026 10:37:46 +0100
In-Reply-To: <abKBOp8Jc7f7U0T8@FUE-ALEWI-WINX>
References: <abKBOp8Jc7f7U0T8@FUE-ALEWI-WINX>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_023750_933328_CA5E0AAE 
X-CRM114-Status: GOOD (  22.12  )
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

Hi,
> For example, I use the `iw` tool to display the capabilities and their
> descriptions. The code for that has the following function prototypes:
>=20
>     * void print_ht_capability(__u16 cap);
>     * void print_vht_info(__u32 capa, const __u8 *mcs);
>     * static void __print_he_capa(const __u16 *mac_cap,
>                                   const __u16 *phy_cap,
>                                   const __u16 *mcs_set, size_t mcs_len,
>                                   const __u8 *ppet, int ppet_len,
>                                   bool indent);
>     * static void __print_eht_capa(int band,
>                                    const __u8 *mac_cap,
>                                    const __u32 *phy_cap,
>                                    const __u8 *mcs_set, size_t mcs_len,
>                                    const __u8 *ppet, size_t ppet_len,
>                                    const __u16 *he_phy_cap,
>                                    bool indent);

This is perhaps a bit unfortunate, but note that the HE and EHT __u16
and __u32 here are really little endian pointers, and the functions do
byte-order conversion.

>     struct ieee80211_sta_ht_cap {
>         u16 cap; /* use IEEE80211_HT_CAP_ */
>         bool ht_supported;
>         u8 ampdu_factor;
>         u8 ampdu_density;
>         struct ieee80211_mcs_info mcs;
>     };
>=20
>     struct ieee80211_sta_vht_cap {
>         bool vht_supported;
>         u32 cap; /* use IEEE80211_VHT_CAP_ */
>         struct ieee80211_vht_mcs_info vht_mcs;
>     };
>=20
> The structs for HT and VHT use `u16` and `u32` data types for the `cap`
> variable, matching what `iw` does. That part is consistent.

Careful. There are different structs used in different places, notably
HT/VHT and HE/EHT differ.

For HT and VHT, look at the start of nl80211_send_band_rateinfo(), which
sends themas individual attributes, defined in enum nl80211_band_attr,
and the values that are u16 (NL80211_BAND_ATTR_HT_CAPA) or u32
(NL80211_BAND_ATTR_VHT_CAPA) are in host byte order, though both are
actually documented misleadingly ("as in [V]HT information IE" is just
all around wrong.)

For HE/EHT, you have it in nl80211_send_iftype_data() since it's per
interface type, and all the individual values are just as they appear in
the spec, regardless of their size.

Note that spec is generally in little endian, but sometimes has strange
field lengths like MAC capabilities being 6 bytes in HE:

>     struct ieee80211_he_cap_elem {
>         u8 mac_cap_info[6];
>         u8 phy_cap_info[11];
>     } __packed;
>=20
>     struct ieee80211_he_6ghz_capa {
>         /* uses IEEE80211_HE_6GHZ_CAP_* below */
>         __le16 capa; }
>     __packed;
>=20
> However, for HE the types differ from the `iw` implementation. Here, `u8`
> arrays are used instead of `u16` for MAC and PHY capabilities. The 6 GHz
> capabilities use `u16`, which is also different.

That doesn't really matter, they're just a set of 6 or 11 bytes, and
e.g. the HE MAC capabilities are treated by the kernel as a set of 6
bytes, but by iw as a set of 3 __le16, which results in the same
interpretation, or at least should.

>     struct ieee80211_eht_cap_elem_fixed {
>         u8 mac_cap_info[2];
>         u8 phy_cap_info[9];
>     } __packed;
>=20
> For EHT, `u8` arrays are also used for both MAC and PHY caps, instead of
> `u32` for the PHY caps as in the `iw` implementation.

Same thing here.

> The current `ath12k` implementation always uses `u32` values, which does
> not work on big=E2=80=91endian platforms:

Yeah, that seems problematic and not really fitting for something that's
6, 11, 2 or 9 bytes long?

> I want to address and fix this issue. However, I cannot apply the =E2=80=
=9Cnever
> break the userspace=E2=80=9D rule here, as it seems, it is already broken=
.

I don't think it's broken, why do you say so?

What's (clearly) broken is how ath12k puts the data into the HE/EHT
structs that the kernel expects, but per your dmesg:

>     ath12k_pci 0001:01:00.0: ieee80211 registration failed: -22
>     ath12k_pci 0001:01:00.0: failed register the radio with mac80211: -22

it seems that even mac80211 doesn't like the capabilities, so the byte
order issue already exists there.

It seems to me the issue is that ath12k_band_cap is in u32, converted,
but then memcpy()d.

johannes

