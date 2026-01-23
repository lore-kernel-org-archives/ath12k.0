Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05141D778AE
	for <ath12k@archiver.kernel.org>; Fri, 23 Jan 2026 18:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KegYK2vZBZviGaRge3JiqfwLGVWHhhcV3h3kEHEJt98=; b=1yG/8P2DARBtZ7e+0HlBrPobWR
	zQwnQ/jNGa+JmhFidIVhdfl6FmB08xx1VQtzWPK8OSOhuMhOCUO8LsAhWZ79GIBPupyPoY8GSQEXu
	GIqEkp4mRsE/DZ5JBP7HYubhpBJqh3KW7Lrg6ZkEW7P1ENYW6BJoGDiI38j0a7C145MAaKm5VRJT3
	49mMfcHKm976AF6nRVgsIMH2G6eL70Qk6vEpnnv3XkSkmANg/omqngXciLbAtgNFw0XhDU95Wn/K7
	WozH1J4kZm7GwqUGdmeo4D5r+W6Gqhl7SI2W1U6PXxEOurOUOzARfdOMmM9HJdnwvv8/w6tvOqZ31
	lxgiIUig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLyO-00000009M3Q-23N8;
	Fri, 23 Jan 2026 18:33:32 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLyL-00000009M2y-2hSy
	for ath12k@lists.infradead.org;
	Fri, 23 Jan 2026 18:33:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so28621675e9.2
        for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 10:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1769193207; x=1769798007; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KegYK2vZBZviGaRge3JiqfwLGVWHhhcV3h3kEHEJt98=;
        b=bEZ5xNlv6cPFridmeMyBnt5AGevBCuvYy4cxP261onQAt0/82iK/wwaRpIt8K5K5TL
         Vgt1+Z4riHCXkON+izMXD6cLYodGc5afaQf8jASCy2yZCsiBDTe3deSZbsAnbqRCTGrz
         y/8esbg65bO+e9ioAF2ET5nnHbvgs9N4IFCgR6Tgu008cN0HC0x1kxQJmROL0XkRkHWW
         wAIzyTuprsvIzFmy0xiQxDapGGN+xSpWGMK8UwZtdtXllPdilmaKT+yuLsRKZCN8VIP2
         hxAzoq1wR4PB+YOCSxVrKmIkuAltK3Q8B5Kan9mqmGgN6iHx9e05PkTj+zn5FF8hW0oj
         HFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769193207; x=1769798007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KegYK2vZBZviGaRge3JiqfwLGVWHhhcV3h3kEHEJt98=;
        b=Dm8z2owT8Dq+vHRbysKvami5Hly5O4HmOV7tEPecFTfkJkHs37jSXqBX+ZlKX/SYXC
         jHHKyIgLrHqdMoLdSPxf67dwa4svEdX2OHvJorA9lbCnY6dSI+DMCyik4/rNGeqJNvdr
         jrCsgYkPKko0BXUFzV2ZqE1cT07JtRQXlLNpddI8cn1RDF0JPTZn3+ShMipfX6u5uvb1
         sozVg15wE3TV0z+0nRaGwM2Oz/ovHL0hBmm5lBA3Q2eFSnS9DPLv1QC0QrDl9K3xUZ3Z
         lqiDItLWP9cHmEnm4filucAIlRL5MDIadPkmmjuEQjN5fPQ2X6tuMJwIeTTxRzP/Ix6E
         JTgw==
X-Forwarded-Encrypted: i=1; AJvYcCWvHLvTAbBFSlHKdTa+q9GqbM+PB056V5bCmfYUF6+4kDxKEkB8RrMuQ6HFMdKnwcdmWn0gS5E=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQbQsRi/UVcMe0QtarOPw+NNbUYH1PMtxSkWEeFDO+e+XwBIY+
	9VaVH+tyhLeq/W71bbeAGyTiz/y8JgFTYaKGKhWYJzfz2UgfChYmH8q9d9nIE0o8NNk=
X-Gm-Gg: AZuq6aKPehKzSR1GBjYFLPCvTWjlZWOpmPwiIfAUcJrvNu9meeVtwXh5LnjWQln2UXY
	SDP1XWvSxrVPtK3Tps6tHDnG0egTM//NO6oO8VNU5WWiQ57/dzVBqPVAW6tAQ2BVh3Gt0OeBGrK
	46M5toKRlXLrXVXrcqYJzzQc/BI76OqVnOCr7hwrOi4KW4lScAzziqdePjnh3JaF7cTyT3nBuI8
	kJzcvqeCJ4z8qvgI7BOXDx5Y4wXuXuZbtEc94soCRwjKNxNthxn4BVtVVHd5Fa9s7S17Rbbpf79
	aF6GUhXttcfFqVreIw+VK3ORKZmyP++z05CtGrJhH8fduBflHVQnXkHzlpHVhA92ebEE+xNCGGg
	kJGpLW1F7VVwGS0uSUul6MaGfkbLO7FHkgv12Eqz6l2s+Dl4jQ8Cvf/alrNhc+8Xip7oOatn8yM
	7/W8bUrC856mpdheZ7JoX/ZArUmKAWfALwXPpJu9zKh2xHAZFXkiVg
X-Received: by 2002:a05:600c:a016:b0:47e:e712:aa88 with SMTP id 5b1f17b1804b1-4804c9c144fmr69060155e9.31.1769193206911;
        Fri, 23 Jan 2026 10:33:26 -0800 (PST)
Received: from [192.168.108.101] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbb6315sm28860395e9.4.2026.01.23.10.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 10:33:26 -0800 (PST)
Message-ID: <d26ee979-b5d5-4f50-b423-f8783122f603@freebox.fr>
Date: Fri, 23 Jan 2026 19:33:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: avoid setting 320MHZ support on
 non 6GHz band
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260123144224.2216923-1-nico.escande@gmail.com>
Content-Language: en-US
From: Pablo MARTIN-GOMEZ <pmartin-gomez@freebox.fr>
In-Reply-To: <20260123144224.2216923-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_103329_944507_88777924 
X-CRM114-Status: GOOD (  21.08  )
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

Hello,

On 23/01/2026 15:42, Nicolas Escande wrote:
> On a split phy qcn9274 (2.4GHz + 5GHz low), "iw phy" reports 320MHz
> realated features on the 5GHz band while it should not:
>
>      Wiphy phy1
>      [...]
>          Band 2:
>      [...]
>              EHT Iftypes: managed
>      [...]
>                  EHT PHY Capabilities: (0xe2ffdbe018778000):
>                      320MHz in 6GHz Supported
>      [...]
>                      Beamformee SS (320MHz): 7
>      [...]
>                      Number Of Sounding Dimensions (320MHz): 3
>      [...]
>                  EHT MCS/NSS: (0x22222222222222222200000000):
>
> This is also reflected in the beacons sent by a mesh interface started on
> that band. They erroneously advertise 320MHZ support too.
>
> This should not happen as the spec at section 9.4.2.323.3 says we should
> not set the 320MHz related fields when not operating on a 6GHz band.
> For example it says about Bit 0 "Support For 320 MHz In 6 GHz"
>
>    "Reserved if the EHT Capabilities element is indicating capabilities for
>     the 2.4 GHz or 5 GHz bands."
>
> Fix this by clearing the related bits when converting from WMI eht phy
> capabilities to mac80211 phy capabilities, for bands other than 6GHz.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>   drivers/net/wireless/ath/ath12k/wmi.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 84c29e4896a4..14947fdb9813 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -4888,6 +4888,7 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
>   				       __le32 cap_info_internal)
>   {
>   	struct ath12k_band_cap *cap_band = &pdev->cap.band[band];
> +	u8 *phy_cap = (u8 *)&cap_band->eht_cap_phy_info[0];
>   	u32 support_320mhz;
>   	u8 i;
>   
> @@ -4901,8 +4902,14 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
>   	for (i = 0; i < WMI_MAX_EHTCAP_PHY_SIZE; i++)
>   		cap_band->eht_cap_phy_info[i] = le32_to_cpu(cap_phy_info[i]);
>   
> -	if (band == NL80211_BAND_6GHZ)
> +	if (band == NL80211_BAND_6GHZ) {
>   		cap_band->eht_cap_phy_info[0] |= support_320mhz;
> +	} else {
> +		phy_cap[0] &= ~IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
> +		phy_cap[1] &= ~IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_320MHZ_MASK;
> +		phy_cap[2] &= ~IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_320MHZ_MASK;
> +		phy_cap[6] &= ~IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_320MHZ;
> +	}
If you want to clear all 320 MHz fields, you'll also have to clear 
IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_320MHZ and 
IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ (not sure why it is not done 
in mac80211)
>   
>   	cap_band->eht_mcs_20_only = le32_to_cpu(supp_mcs[0]);
>   	cap_band->eht_mcs_80 = le32_to_cpu(supp_mcs[1]);

Best regards,

Pablo MG


