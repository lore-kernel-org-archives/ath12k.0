Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24721CD5BD1
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 17:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Bb5+0SQ1WSt0e7KSkXzY2MHcwPs9a1pBUBUqaxnOM8=; b=M45rlH6JZTmBUCDzcLEc69s77C
	llpPGNni2SCnsQFSUerK0q7Ej7HZy6KfZlDo0Jbk4lBLG305baOP1iwLkHP6wsaR9VigYUqazxvvE
	Awqr7uvihMX0cpCyPVOiVsRJ5WDtdg14QHEvWdWzh9FcJKTUvwAaR9Kq9nJH9FlthDyTZhPRlHCkV
	xGn9LBPveLQDX0x4KcJ6/wyaWEYfsNDiDzFX2XI6HY6AnOhDyMfHVK8cZT1NrAglP8sdMLk1x4ZUF
	iP9DhK2xWaijSd0smgM257O86zpQB2e4A3dRUYs8L3QXux2iB2XSo6mKwhbOlDhWucEfmiJ0NTJwo
	2hY7x7yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU68E-0000000BYT0-3idc;
	Mon, 01 Jun 2026 17:08:54 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU68C-0000000BYSR-0grf
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 17:08:53 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49050bfe053so72740155e9.3
        for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 10:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780333730; x=1780938530; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Bb5+0SQ1WSt0e7KSkXzY2MHcwPs9a1pBUBUqaxnOM8=;
        b=V7iqYhjQnVB6FMD+//7LyifK4G7X2dSl660RN9Vunu52QqA0UlbxDNrkrFEIQW9ywN
         0aKmWyatnXIQpTr86TvzWR5QXYL+SUwW10CxAYlvJ42dFhqvA3ctVEUrwNKW4GE4CRe4
         pL1PZEl6yyrM4yO/yEZJyVcRL6aVy4IOUCbBvL6l8l8bk34l0yg2ItofzLlMjQzVnLvr
         6kWL6Rha5mpoyVI3JxSKyzrWG6XqzRfqQ/CqC15BQQS1ubypWt4wDsheLeUekZpA3wHE
         RCQjtG1DuMswIok0ogH2oewluUlZ3NfPas8IgcRLCswJIW92xu1qZtqbw6E7k+oBm6V3
         cDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333730; x=1780938530;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Bb5+0SQ1WSt0e7KSkXzY2MHcwPs9a1pBUBUqaxnOM8=;
        b=YqnQnTu+MCRr3oB2uGhcHHfBzR0aAztiieMAxfZ23Ny+nE6njvwUvujUgBg3lpzEOH
         yMKaK3jVs2CdoC5lYjktoomK37McVzoZlGIEGxesYu55rd3sCdz4L8vnAcPgUv88ht6u
         6RH01sWxVcblO4tFyAlSwnD7mDdwmIt+vr/pAz2KtMTqERlKkbGOxMzDhAfGZ2vbFY48
         NcdopMHrZ6lgnEFtEZ9QfaJ/Yc+wfi0NA7fN8LzjtkRmMWeCPEZ0MLdVfGld+4xPG1Bb
         ZEXv9uW16v9XaGVibsOxw8bCoIN2U0UGbrx17UX4POUbLZfLLtDIfIWK1RxNTDyUNpox
         xDiw==
X-Forwarded-Encrypted: i=1; AFNElJ/TAzgSghShS+/nOyDTvBb5UGcAmQlFEOEWgEW/yc0LejalnL5cRGuE121Zlus0XZj5M+UpfVU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6zpWEEnBgYXeaEUY0cdWoIy4288PnybgNUVLPF+wOdJyfKMre
	KgbQ478YbVTO3Spuyf+1/wi/E72hE1CH8SrdTN8ScygAs2DLus82CrjNJDB5LA==
X-Gm-Gg: Acq92OGCTSSlEVNnRkDKjzhTJaSnLz+VTAas+tt6k2GlzL+fGNGj5kPApfwCKAmRgis
	PluO+q1mykTQUFOWUAYBsP5on8aY8UhYwSKYi7ou9hhdMdx/fKW7xpEF2pqdJHAw8PRKJXG3y1a
	GgPM2SAMJ6QAUrXYSZiPvG7iDaWrGKnV7ju/hJEVbjND0WOHsypoQlfZXGYI/WsnAEqfKPAgkHV
	isyYixw0MfgTXJmKgw1QUx7QM8Ays2Lu1ZV+qgmDpGl29tQE6xFdkg8PRqNqOAW7kzKgd47fW6q
	JPf6IRTFBKfnyN/hGcydHQKykR8WY3h3fThxjANHxcig0OKZJYG31dTXKoCss2+A8KEm9EiZca9
	TCvF152SFi/PNXXLOYZ1mGbrmBCSV2NEVRB7xYOIIzGSrq+9Ln8Q47V8PR/eBroyO46CvI0j6jw
	SwmUsA0aOYpXjsKH7iHc5yBkvcrwabCjl3JXClNdF9Om9xg4hM41QU
X-Received: by 2002:a05:600c:a11:b0:490:b0f1:c27e with SMTP id 5b1f17b1804b1-490b0f1ce6dmr5127165e9.24.1780333729641;
        Mon, 01 Jun 2026 10:08:49 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e13eefsm5056975e9.2.2026.06.01.10.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 10:08:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 19:08:48 +0200
Message-Id: <DIXVMW7QYLL5.M5EQ7YQQ0DTM@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next] wifi: ath12k: avoid setting 320MHZ support on
 non 6GHz band
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Rameshkumar Sundaram" <rameshkumar.sundaram@oss.qualcomm.com>, "Nicolas
 Escande" <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260123144224.2216923-1-nico.escande@gmail.com>
 <a4ee39fd-f1d6-4b84-832c-c4eb0166476d@oss.qualcomm.com>
In-Reply-To: <a4ee39fd-f1d6-4b84-832c-c4eb0166476d@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_100852_237663_E250C297 
X-CRM114-Status: GOOD (  21.87  )
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

On Thu May 28, 2026 at 9:56 AM CEST, Rameshkumar Sundaram wrote:
> On 1/23/2026 8:12 PM, Nicolas Escande wrote:
>> On a split phy qcn9274 (2.4GHz + 5GHz low), "iw phy" reports 320MHz
>> realated features on the 5GHz band while it should not:
>>=20
>>      Wiphy phy1
>>      [...]
>>          Band 2:
>>      [...]
>>              EHT Iftypes: managed
>>      [...]
>>                  EHT PHY Capabilities: (0xe2ffdbe018778000):
>>                      320MHz in 6GHz Supported
>>      [...]
>>                      Beamformee SS (320MHz): 7
>>      [...]
>>                      Number Of Sounding Dimensions (320MHz): 3
>>      [...]
>>                  EHT MCS/NSS: (0x22222222222222222200000000):
>>=20
>> This is also reflected in the beacons sent by a mesh interface started o=
n
>> that band. They erroneously advertise 320MHZ support too.
>>=20
>> This should not happen as the spec at section 9.4.2.323.3 says we should
>> not set the 320MHz related fields when not operating on a 6GHz band.
>> For example it says about Bit 0 "Support For 320 MHz In 6 GHz"
>>=20
>>    "Reserved if the EHT Capabilities element is indicating capabilities =
for
>>     the 2.4 GHz or 5 GHz bands."
>>=20
>> Fix this by clearing the related bits when converting from WMI eht phy
>> capabilities to mac80211 phy capabilities, for bands other than 6GHz.
>>=20
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
>>=20
>> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/wmi.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireles=
s/ath/ath12k/wmi.c
>> index 84c29e4896a4..14947fdb9813 100644
>> --- a/drivers/net/wireless/ath/ath12k/wmi.c
>> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
>> @@ -4888,6 +4888,7 @@ static void ath12k_wmi_eht_caps_parse(struct ath12=
k_pdev *pdev, u32 band,
>>   				       __le32 cap_info_internal)
>>   {
>>   	struct ath12k_band_cap *cap_band =3D &pdev->cap.band[band];
>> +	u8 *phy_cap =3D (u8 *)&cap_band->eht_cap_phy_info[0];
>>   	u32 support_320mhz;
>>   	u8 i;
>>  =20
>> @@ -4901,8 +4902,14 @@ static void ath12k_wmi_eht_caps_parse(struct ath1=
2k_pdev *pdev, u32 band,
>>   	for (i =3D 0; i < WMI_MAX_EHTCAP_PHY_SIZE; i++)
>>   		cap_band->eht_cap_phy_info[i] =3D le32_to_cpu(cap_phy_info[i]);
>>  =20
>> -	if (band =3D=3D NL80211_BAND_6GHZ)
>> +	if (band =3D=3D NL80211_BAND_6GHZ) {
>>   		cap_band->eht_cap_phy_info[0] |=3D support_320mhz;
>> +	} else {
>> +		phy_cap[0] &=3D ~IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
>> +		phy_cap[1] &=3D ~IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_320MHZ_MASK;
>> +		phy_cap[2] &=3D ~IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_320MHZ_MASK;
>
> This field is split across PHY capability byte 2 and byte 3, so should
> IEEE80211_EHT_PHY_CAP3_SOUNDING_DIM_320MHZ_MASK be cleared as well ?

Indeed

>
>
>> +		phy_cap[6] &=3D ~IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_320MHZ;
>> +	}
>>  =20
>>   	cap_band->eht_mcs_20_only =3D le32_to_cpu(supp_mcs[0]);
>>   	cap_band->eht_mcs_80 =3D le32_to_cpu(supp_mcs[1]);
>
>
> Since you said "On a split phy qcn9274 (2.4GHz + 5GHz low)" i wonder how=
=20
> firmware set 6GHz capability bits in this case. That said, the approach=
=20

I suspect that the firmware sets the same features for mode 'a', regardless=
 of
the actual frequency range supported by the device. I've also seen this on =
a
5G + 6G split device too.

> looks fine to me, although I would prefer to clear the remaining related=
=20
> bits as well:
>
>    IEEE80211_EHT_PHY_CAP3_SOUNDING_DIM_320MHZ_MASK
>    IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_320MHZ
>    IEEE80211_EHT_PHY_CAP6_EHT_DUP_6GHZ_SUPP
>    IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_320MHZ
>    IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ

Yes, I cleared the ones I used in my middleware but I really don't mind
clearing all the 6GHz/320MHz related bits I can find.

Thanks for the review, I'll spin a v2

