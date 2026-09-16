Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6606C88E77
	for <ath12k@archiver.kernel.org>; Wed, 16 Sep 2026 06:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvE+1ily9WRpLiX7ByZ1lmquA+GohcfFipKt4On2X/4=; b=XnclVZBBjrDNvHz9B0t/Dk/cnA
	uZ3mp9gfEsaBLFeUd1QyU42px9cG1zMwSbaCvHMKLV3xGOR97SH8fN8M9oKSodpNTqHsB773tHaH2
	R9G5DfqFAENDP6smBHcR4ghbtaItaseigpKxBeXoAL7c3yFXmpHgRQKILOCGedetrz2OfbnoYBVaP
	/VvPzjnWOwK+yTFPCQw6vTDIvWlDbMRt0hQ7dSZA8IoHPL6P+IJMhO7Gibl+2SDVarJ5ph/X3R0EZ
	UX2sfZ0XR46MTmqP+DPgMobz1958+2MlL0EU2zHURfmSZ34VP4X5tWONy/aLmSSxTSV9GnC4RsdS7
	70bJlI5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jAu-00000008U33-2I56;
	Wed, 16 Sep 2026 06:31:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jAs-00000008U2g-3fNP
	for ath12k@lists.infradead.org;
	Wed, 16 Sep 2026 06:31:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G69lLW2780334
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 06:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvE+1ily9WRpLiX7ByZ1lmquA+GohcfFipKt4On2X/4=; b=UM0xiyLw91WqKKtf
	mQqc3EchzzuobHRJCTNuRVTTmTMolyccj3DBoTRZNfmJ2SZ3YUzy7REBGEJtLHdP
	/KhAKfZcUk79PZAxpEIcByZnqBItR0tWcJ3+PP2tY4cQyryaZjJ2nU4Q2xs2nyIl
	r5PhKIdyP/Ia8JUboLTO3jyp10JIXhpRcS7NaDpWR13wcfBWMTTnYxu/2CWu0hJA
	NrWxx5L+N0rJU2MdKkytGdwj89TwpPZ84zUhJ4NbeV02AZBfK+PuOyse8lekviWm
	0ty35fG0pW3pwTLcuKIwsA6RP4qlLZVRcSXnvPtQumqT53scN3kjCfErSydkusrv
	8IJQSw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq6kc4bth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 06:31:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb48f41343aso1787819a12.1
        for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 23:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789540277; x=1790145077; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvE+1ily9WRpLiX7ByZ1lmquA+GohcfFipKt4On2X/4=;
        b=ZUi+gwi7w2o9/411YJLElIvryfxF2lTP5a4kz5pMYXKx7kV0CwKcRLGQneyDsKCzvI
         Zn/zpC7k0pYetM7i2Yyh4anjVpGOSpEcTlFllnaY5TTDozt4kJOHdYXKKeNFdEgHw4ID
         AH768tZD03yKlymMs6D0c7+zJlhhBJDRMFRIGcPSB8sh7TW+qrZ/k1pVHFqTEGXQCPAy
         DDo94JKVplISPJXKbXvaO8/3s7RmSpuGiNlHFRNqrIzaldRuwSm7LvHGMjBGhfrhj1oU
         ZxLYu5C0L15K91bNkWbZdTZI95WhkpFUuxL1tWF21irVdbDNDAbOgcpnA8KrGifj51r1
         x41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789540277; x=1790145077;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvE+1ily9WRpLiX7ByZ1lmquA+GohcfFipKt4On2X/4=;
        b=l8HE7pK1JjWydEp1zY8Mb8hai8+5XiygK/5kY/1v36O/8LnqHOzPKjLUKJAD5vyMcv
         Evb2nyEwLJ1EZC2cDUX9GFforQOToIShmS3499OYV0pFJ4+fZ0dnbAiuwUgeedeKXe+E
         1tdjMGLfhhFzyWWCcMyqHJP7NGW2sKSV/ft85vs1xWw/ozWUGjkQJoLmzKaumoSB5Y3k
         m9yNLChE4Lh7m2GV3Qq7Pk76IdtpSMQ2rzt7z9MyumfGLqKHbfdx/A3fw62Lcm6UQlbk
         w0iLdXeoGMTA18LJIOUkNhPsgs15i5F2OmapVcXxFIBtdiNqlOQsWccBUKZMe2jzkHNm
         ftcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwk6415A0HOBjekv8kfCojVZH8AGwTVhCwC6qI5jKt1EVv0/L1q71FdzpG2lgiAT2xmi9r5v44=@lists.infradead.org
X-Gm-Message-State: AFuF++mRgmeuD5d2fpK/9gW6OqM6W8B6N80A2uizSIoOacpefB/KqXun
	nKASP/LXaIhEL/c0A4YR8HSOaYKM/A+zARa1N7DKQGV2cW+gYwLQ3cJJd0+UX4Zrw1FkX0jRCuQ
	efpaoK0WPKRoeyWsj63NB76EhNdwB8/0Y3rA9M8enu0R2xKfRi+Zddnie3qKvyLfH
X-Gm-Gg: AYBFou0nOJ+9akbVQAhJNySD2CDdEtzipHltMEG2usQk56bUJVIRt4IXCfvt6EKdqQh
	/UAyd46XEQ4uFo/clL8KcLOKde/rOV/TwekSbLckvX8/GqboY0M1SGs6KP+rcgD4zXpfNcXAyWY
	ObxRy+IGs1FQIkc008G/OXpCxHOGGemDCDddpp+2o3fQG3CJdv9v2TwvV/C/yrtB+iyF2Th/YoZ
	yWV/F7Bnf2XdUXjUpix0lO01TfRUZP9q2WdJ30AU0P6cP+4pkPVusfx/wQYWGqn8zf9vWEliqfC
	A5nHEb9kjlLSSjJv6GFA96HumI2ETbquRg5FPWOng1MjP8azJWp3FGsyJYLo8X1FUSZJ004X+XH
	lW5+kKbUn5/0KqaJoSAYK2mXkD1V1qyWtsBFsCpdQjETnkogZN6Lln1Qt0UB4lwo3e2xYmybo
X-Received: by 2002:a17:90b:4e88:b0:39d:fea0:33f3 with SMTP id 98e67ed59e1d1-39e1fecbd80mr1528501a91.2.1789540276720;
        Tue, 15 Sep 2026 23:31:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4e88:b0:39d:fea0:33f3 with SMTP id 98e67ed59e1d1-39e1fecbd80mr1528481a91.2.1789540276174;
        Tue, 15 Sep 2026 23:31:16 -0700 (PDT)
Received: from [10.133.33.84] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbdfd89sm2763789a91.9.2026.09.15.23.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 23:31:15 -0700 (PDT)
Message-ID: <976d2e23-1ce9-4877-8241-bff04226554b@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:31:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: provide MAC address list for
 single-radio wiphys
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        kang.yang@oss.qualcomm.com
References: <20260915152815.254016-2-ivitro@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260915152815.254016-2-ivitro@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA4MiBTYWx0ZWRfX01dtlPUFSbjL
 RAStCNJx4vKurcmCoED5zHSljmG46ph9L2wSyXPT5O/aF65zuICrYus/nlIpQHU4zupSx6OFSMv
 7tmStv59GbGo+aHwG++pThnXcTCudcE=
X-Proofpoint-GUID: 1vbl5UzlAZ_zvG0EcZ8-E3awtyKX7kmI
X-Authority-Analysis: v=2.4 cv=ZINCCn7b c=1 sm=1 tr=0 ts=6aaa37b5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=m8ToADvmAAAA:8 a=wblLnW-cDSaZONvgar0A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: 1vbl5UzlAZ_zvG0EcZ8-E3awtyKX7kmI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA4MiBTYWx0ZWRfX0WxXXYeuklAE
 +A8/rJv1nWsmgGSb9yUYyyIjq+ercU4bOjjJcbJONFQNtb6oa3av5OGZYwl1N0pX2K3d7JtY3U3
 HU94KFGWSkuAoUednSnu1dpyiODfDaPsCyD1PiwiDuvmSQy6WckeYB9jKPZqqNw0xT9e+S3wpBq
 U+pDaGEUOwxJEAU3jl7trVkn8PtH9/65TyVP2J32EgdUT8Xn5PgvQ+nBlC8uwE5/g3h6YmiDJtg
 DPvWn4g85vWjfgUkNeESufpi/TB/7/Z+jJt/LnEonmwl2/01bRDNCY7oTCzSw9Dm979OJSDRkDI
 jj6qEK9DVcuMFmZFodSueoBf6iLazrp3YiyeAU9xF062Sa/J9XfeAAxb3Ya+r+9fmpv/e8wrrtU
 zHqS8ZgHgIP7NAULRSk+09z35MhD1s3qJ9BnMfeBwZxU4Bnt1hKqmIDPjpsNar+o/FvLlhmjJBZ
 HXU1lxo8UaFJcW4+DwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_233118_945782_2F6E1E87 
X-CRM114-Status: GOOD (  35.39  )
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



On 9/15/2026 11:28 PM, Vitor Soares wrote:
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
> The wiphy->addresses semantics are hardware-specific in ath12k: some
> platforms use it as an interface MAC address pool, while others use it
> for firmware-provided per-radio addresses. Gate host-generated addresses
> behind host_alloc_iface_mac and enable it for WCN7850.
> 
> Handle only single-radio WCN7850 wiphys. Wiphys with more than one radio
> and other hardware families behave exactly as before.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Assisted-by: LLM
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
> v2:
> - Gate generated interface MAC address list behind hw_params
>   host_alloc_iface_mac, as suggested by Kang Yang.
> - Enable it only for WCN7850, the only part available for testing here.
> - Add Assisted-by: tag.
> - Link for v1: https://lore.kernel.org/all/20260902082219.3010793-2-ivitro@gmail.com/
> ---
>  drivers/net/wireless/ath/ath12k/hw.h       |  1 +
>  drivers/net/wireless/ath/ath12k/mac.c      | 52 ++++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c |  6 +++
>  3 files changed, 59 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
> index 011bb22e21c7..03cb35071e0b 100644
> --- a/drivers/net/wireless/ath/ath12k/hw.h
> +++ b/drivers/net/wireless/ath/ath12k/hw.h
> @@ -238,6 +238,7 @@ struct ath12k_hw_params {
>  	} client;
>  
>  	bool host_alloc_ml_id;
> +	bool host_alloc_iface_mac;
>  };
>  
>  struct ath12k_hw_ops {
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index d4116ba0da08..45be5b08aa40 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -14743,6 +14743,54 @@ static void ath12k_mac_cleanup_unregister(struct ath12k *ar)
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
> +	struct mac_address *addresses;
> +	struct ath12k *ar;
> +	u16 n_addresses;
> +	int i;
> +
> +	/* The pool is derived from one base address, so it can describe only a

networking code prefers that the first line of a comment contains only '/*':

	/*
	 * comment starts from this line
	 */
> +	 * single-radio wiphy: with more radios each radio has its own base
> +	 * address, possibly from a different ath12k_base.
> +	 */
> +	if (ah->num_radio != 1)
> +		return;
> +
> +	ar = ath12k_ah_to_ar(ah, 0);
> +	if (!ar->ab->hw_params->host_alloc_iface_mac)
> +		return;
> +
> +	/* Only the upper nibble of the first octet is varied, so at most 16

ditto

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
> @@ -14762,6 +14810,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
>  		ath12k_mac_cleanup_unregister(ar);
>  
>  	ath12k_mac_cleanup_iface_combinations(ah);
> +	ath12k_mac_cleanup_mac_address_list(ah);
>  
>  	SET_IEEE80211_DEV(hw, NULL);
>  }
> @@ -14878,6 +14927,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>  	wiphy->available_antennas_tx = antennas_tx;
>  
>  	SET_IEEE80211_PERM_ADDR(hw, mac_addr);
> +	ath12k_mac_setup_mac_address_list(ah, mac_addr);
>  	SET_IEEE80211_DEV(hw, ab->dev);
>  
>  	ret = ath12k_mac_setup_iface_combinations(ah);
> @@ -15120,6 +15170,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>  		ath12k_mac_cleanup_unregister(ar);
>  	}
>  
> +	ath12k_mac_cleanup_mac_address_list(ah);
> +
>  	SET_IEEE80211_DEV(hw, NULL);
>  
>  	return ret;
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index a20c21807344..8658828ea47d 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -445,6 +445,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  		},
>  
>  		.host_alloc_ml_id = true,
> +		.host_alloc_iface_mac = false,
>  	},
>  	{
>  		.name = "wcn7850 hw2.0",
> @@ -539,6 +540,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  		},
>  
>  		.host_alloc_ml_id = false,
> +		.host_alloc_iface_mac = true,
>  	},
>  	{
>  		.name = "qcn9274 hw2.0",
> @@ -629,6 +631,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  		},
>  
>  		.host_alloc_ml_id = true,
> +		.host_alloc_iface_mac = false,
>  	},
>  	{
>  		.name = "ipq5332 hw1.0",
> @@ -713,6 +716,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  		},
>  
>  		.host_alloc_ml_id = true,
> +		.host_alloc_iface_mac = false,
>  	},
>  	{
>  		.name = "qcc2072 hw1.0",
> @@ -808,6 +812,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  		},
>  
>  		.host_alloc_ml_id = false,
> +		.host_alloc_iface_mac = false,

QCC2072 behaves like WCN7850, so we should enable it as well


