Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41B2CD98EE
	for <ath12k@archiver.kernel.org>; Wed, 17 Jun 2026 08:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YF9kaY0ySVP8TclElgAl4XtwTiGQvc9KgAyLLUGd7Qo=; b=xqfrymw8S0TGHCuC27X1+wo6NP
	S+tdFMsAr4nZ4I6IkQDpx3p9mpEa4+kpBuxLlIAnMNG7nkGO9eJ6Im8d8LTDPLLLxutXJ4oBvCIJN
	e9NfPBoQjVbICNm0u5RRC9Qt9U08rhZy1MQOO3m/XaMxDPqepsOP3qa1TR0MLImGvSoJTE+lrc+CQ
	7LEdmjH281BXXy/4eq2PPm0giqV2JNb+iNdmbd0yeIt7QHPCvER7kzMHuO+5++laTGAzBWBe6we+X
	PD6MnvE234oARxlPZPtSuhf5kXajc/FIGUMswQ2pBtxSUv1K6UYDs3OJ/A/ND17dgzjj9WqSTw54d
	bTd7zZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZluG-0000000Gu8a-2Igd;
	Wed, 17 Jun 2026 08:45:56 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZluE-0000000Gu7w-0YHS
	for ath12k@lists.infradead.org;
	Wed, 17 Jun 2026 08:45:55 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4602e2a0372so4297284f8f.3
        for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 01:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781685952; x=1782290752; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YF9kaY0ySVP8TclElgAl4XtwTiGQvc9KgAyLLUGd7Qo=;
        b=ZnNYJP07WR8pUX0pFiUHnBXYaAC0qU/6HAx7bS8ZBAxU6K6Yne+FevAVmMrrXz4/dJ
         u2MwoeGN77q7foHAklR9MTiSIWF/GuWyDHYrMI7YI5VTKANbLziUTXYHpLpqraPbEgRF
         2MZlMsYP7XssRnJNL37EiZalN9VgV+q5eru6vAjeDs6vlsndWH0Z3lHuSW7HcT4mV0/Q
         mgd8IwvHF0qMPoDqdEAkFvbaTDRjydr3ZrGGgp9SmTbvXLfMYeRkKuGW7LDVyo/WuZMQ
         sg5Zli6wj7ZdJaRKzJ15c1nzZ6muTRQzjuaAaufKwvUxgVe/+9PsstR+d+MOdGrfxWy8
         Y8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781685952; x=1782290752;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YF9kaY0ySVP8TclElgAl4XtwTiGQvc9KgAyLLUGd7Qo=;
        b=O4aC4hYMGa4aPIcrfpl1lreJUGdsZ8zgUoFYu03Ypi07fiUvcDvjkIn9by8nVAzxE/
         m/52adjMIDWTPI/CYwjuK+n0d2mk5ebO9Q5ZUoBRtu8QuCtWqMiJB0iTl8Z71WHcupqW
         EQdnGUNHyY78xNnRBFYwQDBp8mdD1J7RZaJv6TVWkbAM/WM8gHn09JXKAj+fIN8vbBa2
         uf125HOP6wX6kM3FSBovlvDyolwj99L8egh4MSPjChFXnUx8dvJZpml5uk/bzowBEYvp
         OgwnbmGUZTAb2jC3CuCwmNWOO9kQUlw3gtm2E4R7RLluGswHRh8tD1hi7DxNTYpdIo1f
         UyBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9ogrqBSSjz6nkJGzcSgwagtMbSOBT2oH8gMuBxTPW7tGDvy6YcoZzU6+8iJ4tmmtdM65MhMY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7R40wzpEADQuZDGHSc1ca7soKKCd7AB466jeMsQEYQCWuwdK7
	lxGfk+ABNhlz54P8XSYs/5ZMuMfOSbCSN47Pk91Nbop21RTrf30P39AN
X-Gm-Gg: AfdE7cmTF8hY63KJB3X0DM0TSnBBWZ03RkMs01aKeAB5AyDkMXOdnBC9ve7aTmDaCLx
	JT/Ech8NaZy/6eNwedwNVmdJtc1u2tWLskmPc00CLZRqWv18Im177zOeS98MfehVwgGlywkrsZN
	S9Qhud/iAE3I5pdiSmyrxkjRj1BDEW+LMJBvQG6HTgdmbD5i62h+DaBzWj1xZc2+DuPEWLH4uaa
	kasWeCUITgfZG8ZknC60ff8mZbaTSEJleLDGW+QrfqqHWz9UNFn2U9MCY/EGXx1t8rQVk9xmK0N
	5VxhhXRUeuKehkJCqdbxcD5jNVQHzCgwUp7svo//yUCrosPNqWxBwYB3yYflU3ainncdzzgvr78
	WH3KgQncrIlG0AA18EvvwNBGB4zd2toVsPzh9FX/SAXiMGIujSLsycG/sBaFOl5m2AKCYFsWIGD
	3hP1JHgb7FVfTlt76o4zBi5ogLeej5PIU=
X-Received: by 2002:a5d:6843:0:b0:462:943:7ad8 with SMTP id ffacd0b85a97d-462412c7546mr3395654f8f.31.1781685951556;
        Wed, 17 Jun 2026 01:45:51 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4620b3ed0d2sm11458730f8f.22.2026.06.17.01.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 01:45:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 10:45:50 +0200
Message-Id: <DJB6YIA9WQGU.1Q3ODO8HFN4BF@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: avoid setting 320MHZ support
 on non 6GHz band
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Rameshkumar Sundaram" <rameshkumar.sundaram@oss.qualcomm.com>,
 <ath12k@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260611084422.1511513-1-nico.escande@gmail.com>
 <3fb00a3b-2092-43d2-a8f8-9f934505dcee@oss.qualcomm.com>
In-Reply-To: <3fb00a3b-2092-43d2-a8f8-9f934505dcee@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_014554_227792_6C1B82DB 
X-CRM114-Status: GOOD (  25.97  )
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

On Wed Jun 17, 2026 at 7:03 AM CEST, Rameshkumar Sundaram wrote:
> On 6/11/2026 2:14 PM, Nicolas Escande wrote:
>> On a split phy qcn9274 (2.4GHz + 5GHz low), "iw phy" reports 320MHz
>> realated features on the 5GHz band while it should not:
>
>
> s/realated/related

sure

>
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
>
> s/320MHZ/320MHz

sure

>
>>=20
>> This should not happen as the spec at section 9.4.2.323.3 says we should
>
> Reword the spec citation to: IEEE Std 802.11-2024, subclause 9.4.2.323.3 =
...
>
>
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
>
> The commit log mentions wrong `iw phy` output and wrong mesh beacon
> advertisement, so this appears user visible. If that is the intended bug=
=20
> being fixed, please add a Fixes tag.
>

Well I did not put a fixes tag as this does not create any real problems
per say. It does not impede any sta to connect in any way. Only
people explicitely parsing the beacons IE see an unexpected value.

So unless you guys really insist, I'd just skip it. Otherwise the 2
candidates are are:
  - 1476014fadb6 ("wifi: ath12k: WMI support to process EHT capabilities")
    It added the EHT caps parsing but lacked any logic to handle 6G so
    that means backporting would imply a different patch than this one
  - d4e244c85e45 ("wifi: ath12k: enable 320 MHz bandwidth for 6 GHz band
    in EHT PHY capability for WCN7850"). This one added 6GHz support and
    is the one I'm fixing but for a different chipset in mind than mine.

>> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
>> ---
>> Changes from v1:
>>    - rebased on ath-next
>>    - clear all 6GHz / 320MHz related phy capabilities fields from the fi=
rmware
>> ---
>>   drivers/net/wireless/ath/ath12k/wmi.c | 17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireles=
s/ath/ath12k/wmi.c
>> index 84a31b953db8..a8a4654c4f34 100644
>> --- a/drivers/net/wireless/ath/ath12k/wmi.c
>> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
>> @@ -5154,6 +5154,7 @@ static void ath12k_wmi_eht_caps_parse(struct ath12=
k_pdev *pdev, u32 band,
>>   				       __le32 cap_info_internal)
>>   {
>>   	struct ath12k_band_cap *cap_band =3D &pdev->cap.band[band];
>> +	u8 *phy_cap =3D (u8 *)&cap_band->eht_cap_phy_info[0];
>>   	u32 support_320mhz;
>>   	u8 i;
>>  =20
>> @@ -5167,8 +5168,22 @@ static void ath12k_wmi_eht_caps_parse(struct ath1=
2k_pdev *pdev, u32 band,
>>   	for (i =3D 0; i < WMI_MAX_EHTCAP_PHY_SIZE; i++)
>>   		cap_band->eht_cap_phy_info[i] =3D le32_to_cpu(cap_phy_info[i]);
>>  =20
>> -	if (band =3D=3D NL80211_BAND_6GHZ)
>> +	if (band =3D=3D NL80211_BAND_6GHZ) {=09
>>   		cap_band->eht_cap_phy_info[0] |=3D support_320mhz;
>> +	} else {
>> +		/*
>> +		 * It seems the firmware can report capabilities specific to
>> +		 * 6GHz also for 5GHz, so lets explicitely clear them out.
>
> The code comment should be less tentative, how about:
>
>       /*
>        * Firmware may report 6 GHz/320 MHz specific capabilities for
>        * non-6 GHz bands, so explicitly clear them.
>        */
>

sure

>
>> +		 */
>> +		phy_cap[0] &=3D ~IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
>> +		phy_cap[1] &=3D ~IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_320MHZ_MASK;
>> +		phy_cap[2] &=3D ~IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_320MHZ_MASK;
>> +		phy_cap[3] &=3D ~IEEE80211_EHT_PHY_CAP3_SOUNDING_DIM_320MHZ_MASK;
>> +		phy_cap[6] &=3D ~IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_320MHZ;
>> +		phy_cap[6] &=3D ~IEEE80211_EHT_PHY_CAP6_EHT_DUP_6GHZ_SUPP;
>> +		phy_cap[7] &=3D ~IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_320MHZ;
>> +		phy_cap[7] &=3D ~IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ;	;
>> +	}
>>  =20
>>   	cap_band->eht_mcs_20_only =3D le32_to_cpu(supp_mcs[0]);
>>   	cap_band->eht_mcs_80 =3D le32_to_cpu(supp_mcs[1]);
>
>
> checkpatch warnings:
> ERROR: trailing whitespace
> #61: FILE: drivers/net/wireless/ath/ath12k/wmi.c:5171:
> +^Iif (band =3D=3D NL80211_BAND_6GHZ) {^I$
>
> WARNING: 'explicitely' may be misspelled - perhaps 'explicitly'?
> #66: FILE: drivers/net/wireless/ath/ath12k/wmi.c:5176:
> +                * 6GHz also for 5GHz, so lets explicitely clear them out=
.
>                                                 ^^^^^^^^^^^
>
> WARNING: space prohibited before semicolon
> #75: FILE: drivers/net/wireless/ath/ath12k/wmi.c:5185:
> +               phy_cap[7] &=3D=20
> ~IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ;     ;
>
> WARNING: Statements terminations use 1 semicolon
> #75: FILE: drivers/net/wireless/ath/ath12k/wmi.c:5185:
> +               phy_cap[7] &=3D=20
> ~IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ;     ;

And all that will be fixed obviously

Thanks for the review

