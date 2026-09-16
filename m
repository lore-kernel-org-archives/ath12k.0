Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802F2C88E5C
	for <ath12k@archiver.kernel.org>; Wed, 16 Sep 2026 07:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEkb3N9+VBdmBk6spQ+Gh5I1o0rBhb+6I3596AWs95A=; b=TUoCixNTLLKNVbdUa1znYf1M+j
	y18i+vavucROgXkSMriXaE093jUGksAjz8Jl07IfmJKNOz9ZyVkt2FwQBQXH3Dnzxt3oKoe230cdl
	fLMFABCRJaRVXKVRCXESJomEBNrX/Ul0eyKDShqKa4KeGjFFLV/2ER3i2T6IYz0JHmA5Gx45pXX2G
	m47Hz5XQi4KceDsnL2gmPyDlKX+bCTe6mx8BGEs2MfSymRUlzYCo0QywssGkDzcEyCaipDegwblaf
	azDt2Eup1rvkKHvBVAPsJm98LQ5w8OhfxkJlpRLLQOGfIaKmmEQkX13ngJFpgVEQP0tvEL88BhEUL
	fVtzpRiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jtO-00000008ZYH-0qWf;
	Wed, 16 Sep 2026 07:17:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jtL-00000008ZXh-2Z4d
	for ath12k@lists.infradead.org;
	Wed, 16 Sep 2026 07:17:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68rGx1955969
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 07:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OEkb3N9+VBdmBk6spQ+Gh5I1o0rBhb+6I3596AWs95A=; b=PjRCFUD/gue+5UwJ
	W1hYnVvLtAvf9j/3iqQiY9yYF7Gc71Z6VzdPmaquRrdiM1GEmS2DnalGO4lgDFuK
	nghqS1Qbp/V2jQTQwuoHv6yk0tU4msCs5RasPiRAjf2gSJ1lG0SO9hP/Oy/gZcje
	OhJe3MsTdgf3CUCNa4/Ue5vzOWPLZ0YYSQUmHV6W4IiFv5oD5PuFAVYwF1dfKIxz
	ahc+y/rkM0vWMSM09dJj41KdvRBISAvffiKqlM7SGnz5Njt2wLedjeyQIi1Yy+JQ
	yMzHfJRRiwn1fELNs6zRC05AFhXDE34nrmRH+yJzuyXJ7h+/FkiHQ4rGgNvXpCQW
	FhHVIg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywa0c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 07:17:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso70569545ad.0
        for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 00:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789543034; x=1790147834; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OEkb3N9+VBdmBk6spQ+Gh5I1o0rBhb+6I3596AWs95A=;
        b=hI7fpSkNxf6hPPo/vjDpvo9YvpbSWP3ezNQxwdtZPK0w2gj+DJHwx9iRwmIDiaqLv2
         WbtEadHHi1/D1wJ35yyg4CnLiOfVgBcOrRwCurLMdkYgR4Mj1fo5Z9SmWPx4YwB8o+au
         b89F6qxD5Cy4U+rtyLFUVcgY4QsnyXrpieY6j5gUR+2hJ4t6IsctVnZhpYbFOgrmaBZX
         9w/NZvolsHcZhe/vgEne2ZboAZ6v+W5jwKd23Wxpet0FQyVntMnBrYkWGV7VqQ22U0w3
         7xMoPOwCTmNWAGgX4YsUTbVnuvqSG6X9cBqCALZ7mg8te+RzJRquqmoadHBYH14EiwAT
         BpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789543034; x=1790147834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OEkb3N9+VBdmBk6spQ+Gh5I1o0rBhb+6I3596AWs95A=;
        b=pt92PK+6zr1R6VrzTdN6m2GioZ2ySF8zDBrW306LZSO6WZq0Ul+6ny4FjoavZNxRLS
         VTKxnrXd2cemOb4/0mKGavS8rrGQp8Ae7ljBAUy9U/kNEEIfSzviLK9rF05PaIVm54du
         kcoLMYFiRJW5BUJ4XBWUB9Eyl4prBrQJwL2OVOzjvrMhzjgKsGW6qAI3MDm/BDsLtJVL
         Si1hO/WJRyYUEgQ3hFCMe9sftxdplGX2JEnzginZ6nUfvXqS2euI0UPqeTX5CfEEd042
         xRJTKklofQXo7MZQuXjAAROIE3DHgUqq/auzUwKNnr2+7RZJuzp3cLw839Aab7kJsSI2
         DBvA==
X-Forwarded-Encrypted: i=1; AKwUvByqEleJzYBmtySn1LiO9HhKz9Dy/nN8H5O2K0knYGQDiLJCdbFGwYJSYp9eU+55xGiPhjucvsI=@lists.infradead.org
X-Gm-Message-State: AFuF++mrh6eQ/QhiHxMU24NPxy7yI4kBu2YBIxo37h9j2jc/1zx5pfiG
	0UJI9MdAfms8+perfLnhaCHGXnTM/jlDcF+FUJVBaEbnf/hQ2iyXfi0iDzlNvos6SCfqbG1HiRF
	zzfqlSFutEeRjYNpTcVrfhyryl8+gXmsAp8zlqdF4K/Jm4eJjY3qdQeP3aa5FlG5J
X-Gm-Gg: AYBFou2aieH4BzHOjDSrwZ+9msuXvE9/N4hhTijZqWIr/+P5FKtR1vB+Cg5/3/9BuvQ
	4LOOunZWOYydtzzKq8H46dkCspSnCFiG5h1zsIcmY8/4PrZWu2TJpvCpxWSw/qolj+STArJCmbh
	ASwTXNKxPHK4bfBkNeuiCXpIP2WooevphA5BIKkFSLJzKJeBdwhWsbTL5S0NrTGpNVruURv8XKj
	HcAnzVdAEiybEk4vlP3/HMfOo/Ou529P5/il6VRE/D4i6ny8/mtE5YxU0QO6UOPn4gaTqANo/2n
	UT9fSkEj++eAaCv5/HTa9hO2AtPSS0DFXQqOoewF/RwUcQftbfzASaCHmTAsHixBA+UNhviBjJ7
	tK4UJVDy0Eu6EZQItoMK6PA+fkCJEx9ROaeLbQgQNTG93Pecg6BMP8dw57cLYVyj6MzM=
X-Received: by 2002:a17:903:8c3:b0:2d8:d4cc:be63 with SMTP id d9443c01a7336-2dd8e76d9f8mr34586005ad.16.1789543033561;
        Wed, 16 Sep 2026 00:17:13 -0700 (PDT)
X-Received: by 2002:a17:903:8c3:b0:2d8:d4cc:be63 with SMTP id d9443c01a7336-2dd8e76d9f8mr34585385ad.16.1789543033030;
        Wed, 16 Sep 2026 00:17:13 -0700 (PDT)
Received: from [10.133.33.69] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fff3sm6586915ad.8.2026.09.16.00.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 00:17:12 -0700 (PDT)
Message-ID: <5e5a76ec-7aad-4ea4-a07d-19910722738d@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 15:17:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: provide MAC address list for
 single-radio wiphys
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        baochen.qiang@oss.qualcomm.com
References: <20260915152815.254016-2-ivitro@gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <20260915152815.254016-2-ivitro@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UgULygjl1GD8M4l0lp0LPsCUxuNtCZqu
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa427a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=m8ToADvmAAAA:8 a=ihpUpvldzNVQdVzym_gA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA5MyBTYWx0ZWRfX5EDUQXJ+E674
 Tnr2vCYvHRSp3SNIZBvZaVei0j/zoAheiHzETeEOTRbf6JeKYE2G9HYkAV28BQkouGFbg47lKAI
 gEJkh2GBccqUFfAcA9VBqArbfo5raUDPjXtVoaJGmzdULsXNm7eP0mt7Ux6MMeOqW1VJTWa9RZ6
 Hh3tM8Zzm/IOpCk+Fphul2Uo9ZV9KL7wDdc6rWFWisva2fSXAfom3xMa+iSU3ir1wr8tsgLZcCY
 j5bT4Bd2FyMd+AIG2SnD8ZxvaY6KxmWo9KqRBIyU8T9JWirhD2RCcPrjffa6QKeNSixLF0KTSYO
 jPcZ9wuCt11EdY2s49o5wz6T4cvWccpGG14jxDD4HOhV3/zqbUMJhibNdCl/iWuuBW9MRvJtpop
 4n3zs1OlJqoieTXWRXvUM9V28uBeHXvlSuIN0+fdpVtUYm64gZqYKJABe8NsC0glhdenoZGUdyC
 iDy8134vZEVmszo+bnw==
X-Proofpoint-ORIG-GUID: UgULygjl1GD8M4l0lp0LPsCUxuNtCZqu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA5MyBTYWx0ZWRfX5NGkBMPg/tXw
 pBJWNSUs8YncsrT1sbJMCc1XGbAaK1l+R2tUBMeci6RO2vHoEI3KBk4GprQ16p+HX/ERb35+05j
 ppphRT3quEZ1vZoeHrCl76MvJyZQvhw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_001715_669885_E6950A28 
X-CRM114-Status: GOOD (  39.71  )
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


@n_addresses: number of addresses in @addresses.
@addresses: If the device has more than one address, set this pointer to 
a list of addresses (6 bytes each). The first one will be used by 
default for perm_addr. In this case, the mask should be set to 
all-zeroes. In this case it is assumed that the device can handle the 
same number of arbitrary MAC addresses.

The cfg80211 definition of wiphy->addresses does not specify where the 
addresses must come from. As a result, different ath12k platforms have 
historically used it in different ways (interface MAC pool vs. 
firmware-provided per-radio MAC addresses). That's why we suggest gating 
this behavior with a hw capability flag, so existing platform behavior 
remains unchanged.




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
>    host_alloc_iface_mac, as suggested by Kang Yang.
> - Enable it only for WCN7850, the only part available for testing here.
> - Add Assisted-by: tag.
> - Link for v1: https://lore.kernel.org/all/20260902082219.3010793-2-ivitro@gmail.com/
> ---
>   drivers/net/wireless/ath/ath12k/hw.h       |  1 +
>   drivers/net/wireless/ath/ath12k/mac.c      | 52 ++++++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c |  6 +++
>   3 files changed, 59 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
> index 011bb22e21c7..03cb35071e0b 100644
> --- a/drivers/net/wireless/ath/ath12k/hw.h
> +++ b/drivers/net/wireless/ath/ath12k/hw.h
> @@ -238,6 +238,7 @@ struct ath12k_hw_params {
>   	} client;
>   
>   	bool host_alloc_ml_id;
> +	bool host_alloc_iface_mac;


Please notice that, ath12k only reports address pool, and the allocation 
is done by mac80211, so advertise_iface_mac_pool maybe better.



>   };
>   
>   struct ath12k_hw_ops {
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index d4116ba0da08..45be5b08aa40 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -14743,6 +14743,54 @@ static void ath12k_mac_cleanup_unregister(struct ath12k *ar)
>   	kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
>   }
>   
> +static void ath12k_mac_cleanup_mac_address_list(struct ath12k_hw *ah)
> +{
> +	kfree(ah->hw->wiphy->addresses);

wiphy->addresses = NULL;

wiphy->n_addresses = 0;

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
> +	 * single-radio wiphy: with more radios each radio has its own base
> +	 * address, possibly from a different ath12k_base.
> +	 */
> +	if (ah->num_radio != 1)
> +		return;
> +

Delete this num_radio check, please use hw_params check only. We cannot 
make sure other chips won't have one radio products in the future(Maybe 
they already have).


> +	ar = ath12k_ah_to_ar(ah, 0);
> +	if (!ar->ab->hw_params->host_alloc_iface_mac)
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
>   static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
>   {
>   	struct ieee80211_hw *hw = ah->hw;
> @@ -14762,6 +14810,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
>   		ath12k_mac_cleanup_unregister(ar);
>   
>   	ath12k_mac_cleanup_iface_combinations(ah);
> +	ath12k_mac_cleanup_mac_address_list(ah);
>   
>   	SET_IEEE80211_DEV(hw, NULL);
>   }
> @@ -14878,6 +14927,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>   	wiphy->available_antennas_tx = antennas_tx;
>   
>   	SET_IEEE80211_PERM_ADDR(hw, mac_addr);
> +	ath12k_mac_setup_mac_address_list(ah, mac_addr);
>   	SET_IEEE80211_DEV(hw, ab->dev);
>   
>   	ret = ath12k_mac_setup_iface_combinations(ah);
> @@ -15120,6 +15170,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>   		ath12k_mac_cleanup_unregister(ar);
>   	}
>   
> +	ath12k_mac_cleanup_mac_address_list(ah);
> +
>   	SET_IEEE80211_DEV(hw, NULL);
>   
>   	return ret;
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index a20c21807344..8658828ea47d 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -445,6 +445,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = true,
> +		.host_alloc_iface_mac = false,
>   	},
>   	{
>   		.name = "wcn7850 hw2.0",
> @@ -539,6 +540,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = false,
> +		.host_alloc_iface_mac = true,
>   	},
>   	{
>   		.name = "qcn9274 hw2.0",
> @@ -629,6 +631,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = true,
> +		.host_alloc_iface_mac = false,
>   	},
>   	{
>   		.name = "ipq5332 hw1.0",
> @@ -713,6 +716,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = true,
> +		.host_alloc_iface_mac = false,
>   	},
>   	{
>   		.name = "qcc2072 hw1.0",
> @@ -808,6 +812,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = false,
> +		.host_alloc_iface_mac = false,
>   	},

For QCC2072, i suggest true. And you can mention in commit message for 
WCN7850/QCC2072.




>   	{
>   		.name = "ipq5424 hw1.0",
> @@ -895,6 +900,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = true,
> +		.host_alloc_iface_mac = false,
>   	},
>   };
>   


