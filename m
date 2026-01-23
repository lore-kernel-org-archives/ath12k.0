Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3371D778AE
	for <ath12k@archiver.kernel.org>; Fri, 23 Jan 2026 19:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFVEzYQ9QBCmXSWgFwr2qvywTgAFN6gJkTVIK9KbJ5U=; b=SgQPqFw4H9j3LO2mYHIJVoo/d3
	3oDAHrovwoUx/fQI8B2qriPExMYWZJz8Tq7hwCiD12RPb8zMsBNBMk8lIqicEkT7xWeylXszan9M/
	8Pd0KVnxb12iZtfaCD7eUTpwubzxiyxY8539lQTHfF6oNcC8AKlcAnR7+v37aa8NKwOzQ51CmR0Ge
	jTbBKaXngypDEHdYqZe2Q5Q/ioRpEyJOhZsTR79pa3m8siSxsH243elr1rLJsfnsktoBDBR/JS1c9
	LL9lWzH3pv9aNDQ5DGeAZXb/s6/BxoiEqrcCkLTaMQzpIBgF4SNkImwM+maAHAq1wmKk/+DzsYO2u
	AS1jqnzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMij-00000009PEA-34BG;
	Fri, 23 Jan 2026 19:21:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMih-00000009PDh-0O9p
	for ath12k@lists.infradead.org;
	Fri, 23 Jan 2026 19:21:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so21545395e9.3
        for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 11:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1769196081; x=1769800881; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NFVEzYQ9QBCmXSWgFwr2qvywTgAFN6gJkTVIK9KbJ5U=;
        b=y8i8IPHuFLXI5v9a7I/LNwJuCWP9zVm/fXgyxpUSEruekOfi9x0fWJwpnB/fbEIV5M
         Lhg+o71fY5IHixnRCguSuVZBJCXzXDWzshzPZxLblefk2qnf8ypH9xq3rNcO76lJTCQB
         39m2iJRlTUqI/rwfQ64CyV/c8WCR3qC9sBwKkzNWn7tbZ0Of/JJ0pXG8jXK5KId0PIZ0
         SgLSM4hdZQ62q8xR19NumFrRVkeMXy2sEipYlZDZdeGmDnVNxslH+zlbnzx28wLvC1dV
         /mYmaVDLzPAEhvPtc6xOng1e1m7Of1HqaUis1qmbpfbjyUpD9F/fFZTqg4PDxD2Mp2m7
         CkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769196081; x=1769800881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFVEzYQ9QBCmXSWgFwr2qvywTgAFN6gJkTVIK9KbJ5U=;
        b=MHsdAbJgRw2utq3y966OU/fRy2gNpC17oSI3UTw3ruP2R/EKZJ423kX0YXvXTNAznP
         6Q8NAndwa4d1qmMCrZpn7MrDJGjxvR8mhbCg4/FC5Hr0Z/zigYcPOKy6ml5mWgeOlGkS
         Kej2cMKSQXsUFWS4R0Mgwis5gW9OCKz1lDqiyfd6gbJha8lbynRY9wI/tGm6GKfvmkXl
         31w5vCq6lOM9HjYcZMmGh7rw3TzZ/YIIP8S7W3WWCxSfc+MoPU8SvZM4DSg0Th8C0vZS
         rNHgAMeZ/N9a+VgMcrpMQE8yzW0d9rylm+dLy8EMbmrJJXDedop/gmmqo0ZTs+4s1Tur
         MTpA==
X-Forwarded-Encrypted: i=1; AJvYcCWI2RS0IFyn15vNUWwGcw+v1/CIuIc2pdCLezAgOkMTJXIVt2suN+zen6nBh5mIQNqUp1yROew=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4gyXOM+1v3K59yObRpzdrSMUBgA0zXQKiLMXWAPz0sV56fja/
	nBlZrDdudCfYPaDlwJLI1Bsful/ii5RJDlFoSOuQkB2TeHabLaBfQ9+79uIzzul39oxGDA/i2Tp
	gFf+P
X-Gm-Gg: AZuq6aJ5O4peWBUJV62/+SugsGUNofAZy+GjzIjSrOFtBdciBcUuI4z85oFR6sZTzy7
	lSxjkPP8EXkLeyU26gqMBkX7AGCtm2N22nf+rOZzPfjfRC3QKkm/zJYgnRv1bn5Pek+tD5h12rm
	xiGJpo2hvUHGhn7ASI+5Y5IBWCBjbbpWKf3LwNsaKgq8l8nJmNK5zHd2AV4Q6hn7m9dN9Srk2ya
	BG4F0xEab610SIyEXoxkTGr5XTRqUJqwE7hnYW+4WaEocePDWCF+U3383fPSRVYSOWVFmrVo74S
	WLW9ENJV3y7pYap6w6/Biv0b8QM0MMKhhDVRagCCbz50XoWvo/eapqVBm1Qq9lDJHCAm+tLSSK8
	3GkwwHUVj1X6DOAe8XMILS6/ix3+F/VvbTVTtY5Xtmsv3l17MokMeFMINuGFkx/VHl0KmaUuXYx
	i+r4HBjrSNvFwQyKYBKKg8LaMFs1e4rusSkgKLooJyyA==
X-Received: by 2002:a05:600c:c16b:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-4804c9b2113mr68277445e9.22.1769196081134;
        Fri, 23 Jan 2026 11:21:21 -0800 (PST)
Received: from [192.168.108.101] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804db8da59sm29516845e9.5.2026.01.23.11.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 11:21:20 -0800 (PST)
Message-ID: <b0e79f6c-36d7-4e49-9d43-8e305a598201@freebox.fr>
Date: Fri, 23 Jan 2026 20:21:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: avoid setting 320MHZ support on
 non 6GHz band
To: Johannes Berg <johannes@sipsolutions.net>,
 Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260123144224.2216923-1-nico.escande@gmail.com>
 <d26ee979-b5d5-4f50-b423-f8783122f603@freebox.fr>
 <bfed10db742d29f0609acb04d3354695f87b24e2.camel@sipsolutions.net>
Content-Language: en-US
From: Pablo MARTIN-GOMEZ <pmartin-gomez@freebox.fr>
In-Reply-To: <bfed10db742d29f0609acb04d3354695f87b24e2.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_112123_151227_60FDA71B 
X-CRM114-Status: GOOD (  11.69  )
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

On 23/01/2026 20:08, Johannes Berg wrote:
> On Fri, 2026-01-23 at 19:33 +0100, Pablo MARTIN-GOMEZ wrote:
>>> @@ -4901,8 +4902,14 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
>>>    	for (i = 0; i < WMI_MAX_EHTCAP_PHY_SIZE; i++)
>>>    		cap_band->eht_cap_phy_info[i] = le32_to_cpu(cap_phy_info[i]);
>>>    
>>> -	if (band == NL80211_BAND_6GHZ)
>>> +	if (band == NL80211_BAND_6GHZ) {
>>>    		cap_band->eht_cap_phy_info[0] |= support_320mhz;
>>> +	} else {
>>> +		phy_cap[0] &= ~IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
>>> +		phy_cap[1] &= ~IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_320MHZ_MASK;
>>> +		phy_cap[2] &= ~IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_320MHZ_MASK;
>>> +		phy_cap[6] &= ~IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_320MHZ;
>>> +	}
>> If you want to clear all 320 MHz fields, you'll also have to clear
>> IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_320MHZ and
>> IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ (not sure why it is not done
>> in mac80211)
>>
> This is, effectively, a firmware workaround. It doesn't belong into
> mac80211. All other drivers just have their capabilities managed in the
> driver anyway.
>
> johannes

I wasn't talking about putting this patch in mac80211 (I've seen the 
discussion on the patch Nicolas sent on linux-wireless), I'm talking 
about the function `ieee80211_put_eht_cap` clearing the Beamformee SS 
and Sounding Dimension fields but not the Non-OFDMA UL MU-MIMO and MU 
Beamformer fields for each bandwidth.

Pablo


