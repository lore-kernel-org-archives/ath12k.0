Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37891C79F99
	for <ath12k@archiver.kernel.org>; Tue,  8 Sep 2026 07:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yySNJ2c/T3/7UiSJLByUZbtOSSdVDE444k2LE0ArApM=; b=zwR4ZRS44H5bQOrql8PGj3abqo
	7DJiphR//5sF4lCfhAhp2qjAxbLVvLQoUPhHoop/LRGDhJ87wRzSJBiYalC2GEi/WGF67g4f9jrXK
	5qxMAvL/OVSMLugBHKwmaqnRw2bqMaJOUJK/jmymsTfwUf8I+1iAlLMub5EZiSV6Jgv9qH8suF97K
	ecs66yoRjPLDEyjRwX98O0OiDIAvS2oHmcfqjX6bW0j9RXGFEXTMAK2Hx5VQ6vDexVA+TAe7d8JN8
	b876A2E2591WVHxajCXbpY2qGkhybWKkQcONG28JbUA+ndW73NfRqUvYyPuZHoAaILEzz4KWWjN4k
	SrQgQlxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3q68-00000008G6J-3iFG;
	Tue, 08 Sep 2026 07:18:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3q66-00000008G5t-0wYz
	for ath12k@lists.infradead.org;
	Tue, 08 Sep 2026 07:18:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Ljre1645928
	for <ath12k@lists.infradead.org>; Tue, 8 Sep 2026 07:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yySNJ2c/T3/7UiSJLByUZbtOSSdVDE444k2LE0ArApM=; b=ndUbY35ug66347vF
	2aF7dQwPlR5/Fa5aKgu/jzPrfxpDnTj274Fpp6b40pAGHDftnf5yuCd7I8zb8RGg
	m6utY83nJS95l2aFLRO26vGp+jEgYDPEIr/kG3KKfKKtjz98zh5Q31F+WH7grfGt
	GvmTdzGL8RjQkPta3mRreaJpjqUVJLGG3FBk+uhpaTyfUzZOdVSWDSz8SPFkMMiU
	crMj9P6kDsDQYnQ1k1TM1IWmvgVE+Kk9kXPjBMJbTohBGCELaKD/d9dvRUgDZ0fP
	gvyRWiL4boxFJLAQ3n390Zxo2sVAZ3R76gKefFW67wAHozIIvQUWbk3Yzs+xJ4Ge
	IClpGQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvug8tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Sep 2026 07:18:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so3924588a12.0
        for <ath12k@lists.infradead.org>; Tue, 08 Sep 2026 00:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851905; x=1789456705; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yySNJ2c/T3/7UiSJLByUZbtOSSdVDE444k2LE0ArApM=;
        b=Scd2i4gl22t2YfrO4gjSKEwn6sVWgMXcqxYwHxV+4PUuxzklRCgxxiejg5axmUkcZ9
         z4SkB4zI5nmQhT2aaUdbRDEYHdWtXr/1E9Z5YkBZzDPrXWtgIKsQf+QYS67+qidDG71Q
         cP3zgjCc7s5DCYVEstghVxTZJybbTzcBuhQ9QHz3pePbuLgZeJrKXFY/6ku/PPXA8/ic
         cvsnE+2FcJuiYc6pPoldp+cBEjnlnyHDLX17R66SlAoQrdLdElI5Z32keKHlIEuhTNsB
         zwW9CKfAFClNG3xPK3K2sxpTTnWEuO2TMeOszCM6Rg2qEowGThi9corM+yXnmDeRcn3G
         JU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851905; x=1789456705;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yySNJ2c/T3/7UiSJLByUZbtOSSdVDE444k2LE0ArApM=;
        b=eTRaMVT1PzxuzY1Xom2OOgxIfMD2TEpc2KN5jxxQwuGMg4o/8QZFOJdur9lJO2uek5
         00MDsoGI0KxCVXrxd/xxdBwZqb7rslQ+ZyHK6jB8RAgbidvuNP+icGmn7AZMDNv3LAwI
         plmG/TINZ5K1qq5InpTGbTTa2ixSAZC2CfmtV2mjo5nrseIgVo61NPOlCkK9u3wdRWy7
         Fwu6RMqcdX/zASHEg0x91YHl4R8BB67V1Jv3KKqapoyLqWNPcLe7hZzuyn1gSKxSN71X
         gmEaKVCHypYdHBbhllvXKEfPvIQsu8AJdN/b7+OszztEQNhfszB8GJTKFrLKP12VHv3u
         Im1A==
X-Forwarded-Encrypted: i=1; AKwUvBzknagslpVH0+Oal4ms8sRp5y9T+9xemCqh2OrP8db6q2gtec7VsV4FvXcouUDcLtZFY1Y+0JA=@lists.infradead.org
X-Gm-Message-State: AFuF++mlb5rvG8EFQMWv9zulLgS0ENK+r2Y/xwdSf7P5YTTZRNCRFWbo
	J3qDWhJzRACpA/28zwgsHYEeMjm5KCnB33E4w+Ik/2aFjeDcIa4foTfsPaYPbu+WjgjTwzEJvsE
	unPuSCI1hyrBH7AeWO/K6zeC3Et8QslNhzGbGyoI0VedVmugrnwrVuXaiNhtIgL9t
X-Gm-Gg: AYBFou0eKE/Kd1W0jX543yj0PrIiXfp9Fc3HNqgWLQRLsYAj7tlbg7V0T+h5tMD8KfZ
	q3yS32YIxgUmY6o63d2Y4/IhX6af1H3HPko0Q1jxKcD9UBDiQ0Bya5nfximvvVZ4EKZqObxdab0
	IpBE1DHswGoZDA5LtqKv9UXKFMuLzlctSp1glMxtNZNTjyNi1kWC3ch9D9PDY0nOeTG0TVpI9s7
	yJASlLtKSCCq+tCN9zYiNaRIhIe7nE0Bj+pYQJKRS95PMOEC/gBDzyOc2Z14HFUh0jESd/00YEY
	2AEmmVUoU8lLRNle1CbdO7i8aupM8H+5DjEk8nLb2qa2Qt9+aPw43viqCpOuTDpzSARa0lR8RNq
	DvP86kqgGoZnaeEkvuGC5R/UkF07TOJ03NMGTPh7oZzjgrElgQkg6s+rN3YnIVzJrqU/MY9U=
X-Received: by 2002:a17:902:d48b:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dafb1820bcmr307986995ad.21.1788851904568;
        Tue, 08 Sep 2026 00:18:24 -0700 (PDT)
X-Received: by 2002:a17:902:d48b:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dafb1820bcmr307986695ad.21.1788851903977;
        Tue, 08 Sep 2026 00:18:23 -0700 (PDT)
Received: from [10.133.33.87] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae36adsm53287175ad.76.2026.09.08.00.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:18:23 -0700 (PDT)
Message-ID: <54f89935-526c-4582-a8ca-4f645257db53@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 15:18:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: provide MAC address list for
 single-radio wiphys
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902082219.3010793-2-ivitro@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260902082219.3010793-2-ivitro@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6a9fb6c1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=m8ToADvmAAAA:8 a=8dmAZdvqxf5LAHb2O34A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-GUID: h7vrE7jNcQKkCUGyjOhKrHfcU09rJPJC
X-Proofpoint-ORIG-GUID: h7vrE7jNcQKkCUGyjOhKrHfcU09rJPJC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfXxmytLVHMh/ne
 WbVvO11Ypy6bhKAzl31fVsvoInv9PdO7E/nUPEQ8P+w3GxABGyK6bS236X3kM69yBd1TX8fOM5F
 1gFiX3KsFYj1+UUeuYM8jIBmCYgJFSlFkDRmflZ6xSrh59yVcldOXotmNaKf6fclUsI+56iRtrV
 fQL1YZ1kGx5fqZIMhTFG3s4wp0sbXGNvFvaw/IHKgZs7y+4kdqxptR8T1SEue7QKfgj2xUAXIDA
 KQE+D3DGGRPaYMmtoAxbCQqwmyaVjfVIYv/c9DDzTSF1/wlMTR2vuyBsFBBINk0onIzBqH/aW4Q
 phG7QqZP+sZLYeBnWKfAFuUguw3iqq9IWfRc+Sam5Sl0TRctkRSxMHlaAw/Da5fUuY8/E5z5VVN
 uJKOV3kzoIchuVT+yFVPdOEZkUlufH/nk7SInr1+I2xKHhtYA8CX+9E3P+4hAHQHI9kYvGp53/N
 Ou7kpeXtmhc9fv3r9JQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX0Wv5+KIiPQkk
 xEVCqr/43UhMSATNa/biVufbgYdBWuP4sCfKWxg/L5b0wGU5pzw0Y4edDOCjLRnbyHZor6AQnMg
 azhrNX04SPgdDEuSto79wKcrdumstOc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_001826_278687_6B4DBB4C 
X-CRM114-Status: GOOD (  30.44  )
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



On 9/2/2026 4:22 PM, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> ath12k supports creating vdevs with addresses provided by mac80211.
> Userspace can already make concurrent interfaces work by explicitly
> assigning different locally administered addresses.
> 
> However, ath12k does not advertise an address list, so when a second
> interface is created without an explicit address, mac80211 has nothing
> to pick from and falls back to the permanent address. If the first
> interface is already running with that address, bringing up the second
> one fails with -ENOTUNIQ.
> 
> As in ath11k, provide a list of usable addresses so
> ieee80211_assign_perm_addr() can hand each new interface an unused one.
> Keep the first entry as the radio's own MAC address. Generate the
> remaining entries as locally administered variants by changing only the
> upper nibble of the first octet, which naturally limits the pool to 16
> unique addresses.
> 

We (Qualcomm) ever internally proposed a similar solution, but it turns out to break chips
like QCN9274 etc. I have forwarded this patch to internal developers, will come back once
get a conclusion.

> Handle only single-radio wiphys. Wiphys with more than one radio behave
> exactly as before.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
> Note that a device which is not MLO capable registers one wiphy per
> radio, so each radio of a multi-radio device also gets a pool, seeded
> from that radio's own MAC. I only have single-radio WCN7850 hardware,
> so that case is untested.
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 48 +++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 9a775602775d..bee6701f1029 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -14685,6 +14685,50 @@ static void ath12k_mac_cleanup_unregister(struct ath12k *ar)
>  	kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
>  }
>  
> +static void ath12k_mac_cleanup_mac_address_list(struct ath12k_hw *ah)
> +{
> +	kfree(ah->hw->wiphy->addresses);
> +}
> +
> +static void ath12k_mac_setup_mac_address_list(struct ath12k_hw *ah,
> +					      const u8 *mac_addr)
> +{
> +	struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
> +	struct mac_address *addresses;
> +	u16 n_addresses;
> +	int i;
> +
> +	/* The pool is derived from one base address, so it can describe only a
> +	 * single-radio wiphy: with more radios each radio has its own base
> +	 * address, possibly from a different ath12k_base.
> +	 */
> +	if (ah->num_radio != 1)
> +		return;
> +
> +	/* Only the upper nibble of the first octet is varied, so at most 16
> +	 * addresses can be derived from one base.
> +	 */
> +	n_addresses = min_t(u16, TARGET_NUM_VDEVS(ar->ab), 16);
> +	if (n_addresses <= 1)
> +		return;
> +
> +	addresses = kzalloc_objs(*addresses, n_addresses);
> +	if (!addresses)
> +		return;
> +
> +	ether_addr_copy(addresses[0].addr, mac_addr);
> +	for (i = 1; i < n_addresses; i++) {
> +		ether_addr_copy(addresses[i].addr, mac_addr);
> +		/* set Local Administered Address bit */
> +		addresses[i].addr[0] |= 0x2;
> +
> +		addresses[i].addr[0] += i << 4;
> +	}
> +
> +	ah->hw->wiphy->addresses = addresses;
> +	ah->hw->wiphy->n_addresses = n_addresses;
> +}
> +
>  static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
>  {
>  	struct ieee80211_hw *hw = ah->hw;
> @@ -14704,6 +14748,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
>  		ath12k_mac_cleanup_unregister(ar);
>  
>  	ath12k_mac_cleanup_iface_combinations(ah);
> +	ath12k_mac_cleanup_mac_address_list(ah);
>  
>  	SET_IEEE80211_DEV(hw, NULL);
>  }
> @@ -14820,6 +14865,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>  	wiphy->available_antennas_tx = antennas_tx;
>  
>  	SET_IEEE80211_PERM_ADDR(hw, mac_addr);
> +	ath12k_mac_setup_mac_address_list(ah, mac_addr);
>  	SET_IEEE80211_DEV(hw, ab->dev);
>  
>  	ret = ath12k_mac_setup_iface_combinations(ah);
> @@ -15041,6 +15087,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>  		ath12k_mac_cleanup_unregister(ar);
>  	}
>  
> +	ath12k_mac_cleanup_mac_address_list(ah);
> +
>  	SET_IEEE80211_DEV(hw, NULL);
>  
>  	return ret;


