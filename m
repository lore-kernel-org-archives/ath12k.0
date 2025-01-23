Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415BCC02182
	for <ath12k@archiver.kernel.org>; Thu, 23 Jan 2025 13:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RALYaAlmkLMQJ5p7Ay6GQ11StjHMypmTYMxNsJ9wiLQ=; b=CfqIBmSGGXDbcupGkQNG+2d8zt
	MxMCbuNugwcv+6SxbtefRFZoRXzzLudmWipRqJReLUVIYA1RUgo848blpbq0LNLiVjyPGkxiZzflq
	Tooo45uzzoRQMoLfUQbmSdUlIKPJepztX2YLNWfF+8OstzG0jfjn4tkSFTQoGMAqki0S+nl7htTUK
	7soq7WOTUq+tQ1RyiIqTgpbTJoHyfSZwzsjMTpJYKbZ2iWyOB1IkiR3Hb72NGrHC+lGNiwMPcJNQu
	P9lO4TRX9qIiKOA2KpY9iXf1sWwA52ifwbEUAIyjVmWSzKm3Cxe/kou5EuO/aEMbxV9hqLK2ftoDv
	3YClty6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taxLP-0000000CXPD-03t4
	for ath12k@archiver.kernel.org;
	Thu, 23 Jan 2025 13:34:03 +0000
Received: from ns.iliad.fr ([212.27.33.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taxLL-0000000CXNg-2jZq
	for ath12k@lists.infradead.org;
	Thu, 23 Jan 2025 13:34:02 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id B5B07201D5;
	Thu, 23 Jan 2025 14:33:56 +0100 (CET)
Received: from [192.168.108.70] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id A7552200F2;
	Thu, 23 Jan 2025 14:33:56 +0100 (CET)
Message-ID: <653484cd0984e12dff094e5f9436ae4170509976.camel@freebox.fr>
Subject: Re: [PATCH RFC 3/3] wifi: ath12k: add EHT support for TX rate
From: Maxime Bizon <mbizon@freebox.fr>
To: Sarika Sharma <quic_sarishar@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, johannes@sipsolutions.net
Date: Thu, 23 Jan 2025 14:33:56 +0100
In-Reply-To: <20250122133424.1226555-4-quic_sarishar@quicinc.com>
References: <20250122133424.1226555-1-quic_sarishar@quicinc.com>
	 <20250122133424.1226555-4-quic_sarishar@quicinc.com>
Organization: Freebox
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_053359_830246_AE43BCB3 
X-CRM114-Status: GOOD (  10.28  )
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


On Wed, 2025-01-22 at 19:04 +0530, Sarika Sharma wrote:

Hello,

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case WMI_RATE_PREAMBLE_EHT:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0arsta->txrate.mcs =3D mcs;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0arsta->txrate.flags =3D RATE_INFO_FLAGS_EHT_MCS;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0arsta->txrate.he_dcm =3D dcm;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0arsta->txrate.eht_gi =3D ath12k_eht_gi_to_nl80211_eht_gi(=
sgi);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0tones =3D le16_to_cpu(user_rate->ru_end) -
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0le16_to_c=
pu(user_rate->ru_start) + 1;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0v =3D ath12k_mac_eht_ru_tones_to_nl80211_eht_ru_alloc(ton=
es);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0arsta->txrate.eht_ru_alloc =3D v;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>=20

The logic to set arsta->txrate.bw to RATE_INFO_BW_HE_RU or
RATE_INFO_BW_EHT_RU like in dp_tx completion is missing here.

How about something like this ?

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/at=
h/ath12k/dp.h
index c3c607eae476..de2095ed8863 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -1506,6 +1506,8 @@ enum HTT_PPDU_STATS_PPDU_TYPE {
 #define HTT_PPDU_STATS_USER_RATE_FLAGS_DCM_M           BIT(28)
 #define HTT_PPDU_STATS_USER_RATE_FLAGS_LDPC_M          BIT(29)
=20
+#define HTT_USR_RATE_PPDU_TYPE(_val) \
+               le32_get_bits(_val, HTT_PPDU_STATS_USER_RATE_INFO1_PPDU_TYP=
E_M)
 #define HTT_USR_RATE_PREAMBLE(_val) \
                le32_get_bits(_val, HTT_PPDU_STATS_USER_RATE_FLAGS_PREAMBLE=
_M)
 #define HTT_USR_RATE_BW(_val) \
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless=
/ath/ath12k/dp_rx.c
index eaec3949470d..c8d377544422 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1370,12 +1370,12 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
        struct htt_ppdu_user_stats *usr_stats =3D &ppdu_stats->user_stats[u=
ser];
        struct htt_ppdu_stats_common *common =3D &ppdu_stats->common;
        int ret;
-       u8 flags, mcs, nss, bw, sgi, dcm, rate_idx =3D 0;
+       u8 flags, mcs, nss, bw, sgi, dcm, ppdu_type, rate_idx =3D 0;
        u32 v, succ_bytes =3D 0;
        u16 tones, rate =3D 0, succ_pkts =3D 0;
        u32 tx_duration =3D 0;
        u8 tid =3D HTT_PPDU_STATS_NON_QOS_TID;
-       bool is_ampdu =3D false;
+       bool is_ofdma, is_ampdu =3D false;
=20
        if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
                return;
@@ -1403,6 +1403,9 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
        mcs =3D HTT_USR_RATE_MCS(user_rate->rate_flags);
        sgi =3D HTT_USR_RATE_GI(user_rate->rate_flags);
        dcm =3D HTT_USR_RATE_DCM(user_rate->rate_flags);
+       ppdu_type =3D HTT_USR_RATE_PPDU_TYPE(user_rate->rate_flags);
+       is_ofdma =3D (ppdu_type =3D=3D HTT_PPDU_STATS_PPDU_TYPE_MU_OFDMA) |
+               (ppdu_type =3D=3D HTT_PPDU_STATS_PPDU_TYPE_MU_MIMO_OFDMA);
=20
        /* Note: If host configured fixed rates and in some other special
         * cases, the broadcast/management frames are sent in different rat=
es.
@@ -1479,6 +1482,16 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
                v =3D ath12k_he_ru_tones_to_nl80211_he_ru_alloc(tones);
                arsta->txrate.he_ru_alloc =3D v;
                break;
+       case WMI_RATE_PREAMBLE_EHT:
+               arsta->txrate.mcs =3D mcs;
+               arsta->txrate.flags =3D RATE_INFO_FLAGS_EHT_MCS;
+               arsta->txrate.he_dcm =3D dcm;
+               arsta->txrate.eht_gi =3D ath12k_mac_eht_gi_to_nl80211_eht_g=
i(sgi);
+               tones =3D le16_to_cpu(user_rate->ru_end) -
+                       le16_to_cpu(user_rate->ru_start) + 1;
+               v =3D ath12k_mac_eht_ru_tones_to_nl80211_eht_ru_alloc(tones=
);
+               arsta->txrate.eht_ru_alloc =3D v;
+               break;
        }
=20
        arsta->txrate.nss =3D nss;
@@ -1486,6 +1499,13 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
        arsta->tx_duration +=3D tx_duration;
        memcpy(&arsta->last_txrate, &arsta->txrate, sizeof(struct rate_info=
));
=20
+       if (is_ofdma) {
+               if (flags =3D=3D WMI_RATE_PREAMBLE_HE)
+                       arsta->txrate.bw =3D RATE_INFO_BW_HE_RU;
+               else if (flags =3D=3D WMI_RATE_PREAMBLE_EHT)
+                       arsta->txrate.bw =3D RATE_INFO_BW_EHT_RU;
+       }
+
        /* PPDU stats reported for mgmt packet doesn't have valid tx bytes.
         * So skip peer stats update for mgmt packets.
         */


--=20
Maxime




