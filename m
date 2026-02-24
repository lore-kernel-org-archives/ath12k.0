Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DB4F3C9B2
	for <ath12k@archiver.kernel.org>; Tue, 24 Feb 2026 16:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7s68uXsBpn07ISulnoxeZXviiuIzaCDqnb/9BfZd+0=; b=c4N6abWsz6cQfX7EtWYmtPeR0Z
	Kk1X/7qDKWRuShyDGVoDb/UPtDB8oA2bCekzhoAdoex5x9DHdfVAyyvX8VSs5J0mwvsmQonVYoXrD
	KoRrXKjvngxAn2tLr+69e8e4H43hLKyxHrqMHX9hHN/a90goFmzOeki1DW2E5i5S771TW3GG0yBTN
	0ASf1FsGvpyNGCvnHide3etCn1YbMiHDXn5IQpWFE5FWHvyZcy3XfoG0ixfka0+p9X1eF9Zl0dq+Q
	E4DX7lzAZfkatnfbWsLKKTLgtHUGOEXBf+oYiY5ZLVsKJ+eIqdndCkXeT3rctOXL1qiZmY2uorqh1
	bbx807lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvLB-00000002PG0-28Lp;
	Tue, 24 Feb 2026 16:32:53 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvL8-00000002PFM-3SRE
	for ath12k@lists.infradead.org;
	Tue, 24 Feb 2026 16:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=I7s68uXsBpn07ISulnoxeZXviiuIzaCDqnb/9BfZd+0=;
	t=1771950770; x=1773160370; b=uDNF1S/gUIiPvnyesgzpl/ytFctklwOFtyOb5lIlfNIoM3L
	ctnsXDwuRbvRD+gpi4SIRc9XyMMzbSe1uDP9YC17Bhwz/eIeXkcDJo8nlWaFQwrJS+lhy4iC5I05h
	ghu+br5d4q5VFhNqQCnVvdtN5YGIoDXSfjwPN9WqNfJuJgqCz/ChS7aSfwx09rHr6FIvCQRu/WgCr
	JLShOHLCDKE5dFFLhbbCwJ39H6iXS0n+hSzcQKGlzhez7fwAweBJcKhh9dZvXAPyM1UFzz+2NbRec
	V1znJNl3zRfsiGxSlCixGjK9bcibS9WRppb7B8BVgx4dwMu7K8jdaUjcqbbmpMOg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vuvL4-00000000a0T-1BiD;
	Tue, 24 Feb 2026 17:32:46 +0100
Message-ID: <6cec588857a8fa5866b3aff323c367b0096e613a.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 1/2] wifi: UHR: define DPS/DBE/P-EDCA
 elements and fix size parsing
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Tue, 24 Feb 2026 17:32:45 +0100
In-Reply-To: <20260217054731.3667600-2-karthikeyan.kathirvel@oss.qualcomm.com>
References: <20260217054731.3667600-1-karthikeyan.kathirvel@oss.qualcomm.com>
	 <20260217054731.3667600-2-karthikeyan.kathirvel@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_083250_862839_47644779 
X-CRM114-Status: GOOD (  18.39  )
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
> + * Refer to IEEE80211_UHR_P_EDCA*
> + * @p_edca_ec: The P-EDCA ECWmin, P-EDCA and ECWmax

that seems unclear?


> + * @p_edca_params: The AIFSN field indicate the AIFSN value that are

"indicates", "value that is used"? I think it's one? Or "values that are
used"

> + *	used by a P-EDCA STA during P-EDCA contention.
> + *	The CW DS field indicate the value used

indicates

> + *	for the randomization of the transmission slot of the DS-CTS
> + *	frame. The value 3 is reserved. The value 0 indicate that

indicates

> + *	randomization not enabled.
> + *	The P-EDCA PSRC threshold field indicates the maximum number
> + *	of allowed consecutive DS-CTS transmissions. The value 0 and
> + *	values greater than 4 are reserved
> + *	The P-EDCA QSRC threshold field indicates the value of the
> + *	QSRC[AC_VO] counter to be allowed to start P-EDCA contention.
> + *	The value 0 is reserved.
> + */
> +struct ieee80211_uhr_p_edca_info {
> +	u8 p_edca_ec;
> +	__le16 p_edca_params;
> +} __packed;
> +
>  static inline bool ieee80211_uhr_oper_size_ok(const u8 *data, u8 len,
>  					      bool beacon)
>  {
> @@ -47,19 +232,52 @@ static inline bool ieee80211_uhr_oper_size_ok(const =
u8 *data, u8 len,
>  	if (beacon)
>  		return true;
> =20
> -	/* FIXME: DPS, DBE, P-EDCA (consider order, also relative to NPCA) */
> +	/* DPS Operation Parameters (fixed 4 bytes) */
> +	if (oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_DPS_ENA)) {
> +		needed +=3D sizeof(struct ieee80211_uhr_dps_info);
> +		if (len < needed)
> +			return false;
> +	}
> =20
> +	/* NPCA Operation Parameters (fixed 4 bytes + optional 2 bytes) */
>  	if (oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_NPCA_ENA)) {
>  		const struct ieee80211_uhr_npca_info *npca =3D
> -			(const void *)oper->variable;
> +			(const void *)(data + needed);
> =20
>  		needed +=3D sizeof(*npca);
> -
>  		if (len < needed)
>  			return false;
> =20
> -		if (npca->params & cpu_to_le32(IEEE80211_UHR_NPCA_PARAMS_DIS_SUBCH_BMA=
P_PRES))
> +		if (npca->params &
> +		    cpu_to_le32(IEEE80211_UHR_NPCA_PARAMS_DIS_SUBCH_BMAP_PRES)) {
>  			needed +=3D sizeof(npca->dis_subch_bmap[0]);
> +			if (len < needed)
> +				return false;
> +		}
> +	}
> +
> +	/* P-EDCA Operation Parameters (fixed 3 bytes) */
> +	if (oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_PEDCA_ENA)) {
> +		needed +=3D sizeof(struct ieee80211_uhr_p_edca_info);
> +		if (len < needed)
> +			return false;
> +	}
> +
> +	/* DBE Operation Parameters (fixed 1 byte + optional 2 bytes) */
> +	if (oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_DBE_ENA)) {
> +		const struct ieee80211_uhr_dbe_info *dbe =3D
> +			(const void *)(data + needed);
> +
> +		needed +=3D sizeof(*dbe);
> +		if (len < needed)
> +			return false;
> +
> +		if (dbe->dbe_params &
> +		    IEEE80211_UHR_DBE_OPER_DIS_SUBCHANNEL_BITMAP_PRES) {
> +			needed +=3D sizeof(dbe->dis_subch_bmap[0]);
> +			if (len < needed)
> +				return false;
> +		}
>  	}
> =20
>  	return len >=3D needed;
> @@ -72,12 +290,15 @@ static inline bool ieee80211_uhr_oper_size_ok(const =
u8 *data, u8 len,
>  static inline const struct ieee80211_uhr_npca_info *
>  ieee80211_uhr_npca_info(const struct ieee80211_uhr_operation *oper)
>  {
> +	const u8 *pos =3D oper->variable;
> +
>  	if (!(oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_NPCA_ENA)))
>  		return NULL;
> =20
> -	/* FIXME: DPS */
> +	if (oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_DPS_ENA))
> +		pos +=3D sizeof(struct ieee80211_uhr_dps_info);
> =20
> -	return (const void *)oper->variable;
> +	return (const void *)pos;
>  }
> =20
>  static inline const __le16 *
> @@ -131,6 +352,25 @@ ieee80211_uhr_npca_dis_subch_bitmap(const struct iee=
e80211_uhr_operation *oper)
>  #define IEEE80211_UHR_MAC_CAP_DBE_EHT_MCS_MAP_160_PRES	0x08
>  #define IEEE80211_UHR_MAC_CAP_DBE_EHT_MCS_MAP_320_PRES	0x10
> =20
> +/**
> + * enum ieee80211_dbe_bandwidth - DBE Bandwidth
> + *
> + * As per spec P802.11bn_D1.3 "Table 9-bb5=E2=80=94Encoding of the DBE M=
aximum
> + * Supported Bandwidth field"
> + *
> + * @IEEE80211_DBE_BANDWIDTH_40MHZ: Indicate 40 MHz DBE bandwidth
> + * @IEEE80211_DBE_BANDWIDTH_80MHZ: Indicate 80 MHz DBE bandwidth
> + * @IEEE80211_DBE_BANDWIDTH_160MHZ: Indicate 160 MHz DBE bandwidth
> + * @IEEE80211_DBE_BANDWIDTH_320MHZ: Indicate 320 MHz DBE bandwidth
> + *
> + */
> +enum ieee80211_dbe_bandwidth {
> +	IEEE80211_DBE_BANDWIDTH_40MHZ =3D 1,
> +	IEEE80211_DBE_BANDWIDTH_80MHZ =3D 2,
> +	IEEE80211_DBE_BANDWIDTH_160MHZ =3D 3,
> +	IEEE80211_DBE_BANDWIDTH_320MHZ =3D 4,
> +};
> +
>  struct ieee80211_uhr_cap_mac {
>  	u8 mac_cap[5];
>  } __packed;

