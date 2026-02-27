Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64586FD7F6F
	for <ath12k@archiver.kernel.org>; Fri, 27 Feb 2026 10:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/r2l+vLJaAiK2DMkjrG1+OQCRw0snb2TJXSdrDhm7U=; b=mfU5St7genFGqcXHTD9HnFz1xq
	yJ55SOPMv3L3LlJRZp6BM5RJEV3yNnH8D7bnPFI0WW9qjX+e9wkHCpo9/N9QymxKzHEd2wipO9Brv
	1t8nWONEnR15/OypDsAhoMZIX8e7RJn6QYFB5Kc0sw1kedg6M85aIbHJufu7Iignvzzf5hX/Gp2kN
	1/8UZoLOMr06XEuALeLPvucpFn7oC7/mLuMrlDLbanwLBDYRhtDSCvUOmYWNtcJ6eRtwW/SYaT98e
	3XLANf72TX6fUqU4P3UkYSC30ahQazflpSj/G2/PWsvAVlJy1MZ9XUkMndZRy2GpvIydfevJekpW5
	iAzKyGGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvvEM-00000008FLs-0QIM;
	Fri, 27 Feb 2026 10:37:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvvEJ-00000008FLD-2jlz
	for ath12k@lists.infradead.org;
	Fri, 27 Feb 2026 10:37:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RAGA7Y3747005
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 10:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/r2l+vLJaAiK2DMkjrG1+OQCRw0snb2TJXSdrDhm7U=; b=frT2HldCTIgNFv9z
	J2gppiOeQkkFi5WjsDk9/x5OwKbLZqytcSVJzxa10M+Z5GDV3TSiSS57+/vFMCJP
	BAYoyLYJlpsWc+XQqxDxfpVhrEGgl6PCOX0n9G7+lcvX18x12WG6oGgvXNONNbcH
	ECjVwk+ecPPmXnbOHhS5l43i4qsDEPq3UTbi1JCIWzIo9jYHsapRgoqiwR0tFefi
	Tq4rYhIGiRHdYQ5aC5d6SrFZGk3GDVqnI42nu9rkA55KnwQRCK6x1HWoS7lS8eCB
	RBlr0WyMozHjzeI41aGCb0SwSrZbx3Ws5MSpWfUW+IzI9BrHEE4zdFK3Ng5p/6ad
	GI2ZIw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuur2mvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 10:37:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70f137aa4aso1070442a12.2
        for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 02:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772188673; x=1772793473; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r/r2l+vLJaAiK2DMkjrG1+OQCRw0snb2TJXSdrDhm7U=;
        b=PVgTLWA5N2QQz2g0XDDppiSmLgNBiREb6cGzg5HpqgnISWhzY5Hsb9Zhra/jHsJixh
         9qJf+ImqSLwMkmkBr6mmOgafdvsmqrCtuxV8dPw8hLKe34N7OQCWbhDzPJLOj+2m7fIC
         tsxcJ0wEyRbIgSWCygXBNhuL5SCdxqfAG7gO3+HqFTjH/9zuxRq7HlmEtuG3afPI57sV
         fDBx+l75lXBnTsUy5KAhx/R/KPTdZoAeG0yTXCc+hXDMb7yzQveVQWZIwnuBwHGunSb0
         r+p51xlNJFmf5CudksYyd+RcR+Xf94TjbyZMZ/WPzu8ih7TyzUmAdBAPyLZLl8YajE4W
         qSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772188673; x=1772793473;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/r2l+vLJaAiK2DMkjrG1+OQCRw0snb2TJXSdrDhm7U=;
        b=oR/2Dkf2pm1FiF3/NnQKLPHDpH72CO0hRo6lHU3whmuKYiOmwPEGnaegcDUkbcCMNu
         dqLLo+EYlIy6iFU16tjUI6CfozZ8L/dG1k5xN03BjkC6EjjXJRuCqVoXH6nm5YS3IaRH
         YXd2tholKkhSf5sDFqZ3d5c+5XNsErJkU+4CbxUcdOMju1F8xuzAn2z7WYEz04mIg5Fg
         CRR4MyT8JOFqw+nqVxY1uMA1FmHyq6Y/J32LHRWgeqPNSDMjsyFKsfM6WMgQvBEgNIWx
         3Bd2CNdgKPdjs1tX9XpqNEd/oePBKhBZuPl+mPLrFZpFh4Fw238wwRgK2xQ9shyqOhr4
         E9Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXWWf2EzPUVwDCt6DTVHbytQdi+c4RlQBC4Q/vfCvUANkMuj3+w5oRp9SNfxziMTYAcHat2Kzo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRkmSqmpaFoXEnHSygLn9fG4jBje+m3I5+FUSCfEV3wCHbAaGa
	5Qt5quTT/jGQaAsoynGS38Zwr0BLtIptiI5IENOevHKYTqSnekMOwBQnXTdS/rIPdkSurxsPdUB
	PxaScHp3hUU9nVanxL0sZs7nLn1uvpY/SKYtOL29EQNhLgrWhdkoH//cdMH/bSusHOtDHhCYrrN
	I=
X-Gm-Gg: ATEYQzxw+PrgXMP21MmCnj4Oz9+xan2vhsl2+ehvUA3YVpUJcQq0w2QrtnpQ1lB242D
	J0HLmu1tgYiqIWFnjiR3KLsxRZ/Q2R9gMd0CIsGqBB/ATfpC1MGMWsSzBNZJLHc9r+v89ckKgsH
	Xcs9YVZyk1MP6FHd1JTfmeEknGcm/RsxGArUlOHiqyluU1Z3QOSzbT2u7vxwo5ho7mVipWmqfif
	cKDNjNHjMWpJ7ycRqM7HZHVZ9E78Orf/sGRfc6Nyrnpt7DCXVMcsvASvlgZFoJzor43u2q34iJF
	ge7G3dUbPN3zlc8Pfp6XJwBOwJMa4TPSlwsRHLqTve72NOR9fyklqvyRmbV2D0prIl9Kf1rGI4l
	Z7vV8efgK3Ss6u8WPqwnoBNAmKXJkAUVHOPbt4bZ2vXLBl2VTrKDosD1LImoYzSaE3woIzDPrlN
	69AlgXxP7AWlz3t/ftGw==
X-Received: by 2002:a05:6a20:94cf:b0:394:3344:a6a3 with SMTP id adf61e73a8af0-395c3b1980cmr2246183637.57.1772188673126;
        Fri, 27 Feb 2026 02:37:53 -0800 (PST)
X-Received: by 2002:a05:6a20:94cf:b0:394:3344:a6a3 with SMTP id adf61e73a8af0-395c3b1980cmr2246164637.57.1772188672587;
        Fri, 27 Feb 2026 02:37:52 -0800 (PST)
Received: from [10.133.33.12] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa801704sm4440657a12.19.2026.02.27.02.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 02:37:52 -0800 (PST)
Message-ID: <00743cd4-c3e8-41c3-bb2d-1ce7ff5630c7@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 18:37:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix the assignment of logical link
 index
To: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
References: <20260226041911.2434999-1-roopni.devanathan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260226041911.2434999-1-roopni.devanathan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F5RTIfful1wxxVks_oLlBX6_GdsSgfwK
X-Authority-Analysis: v=2.4 cv=PN8COPqC c=1 sm=1 tr=0 ts=69a17402 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=60smP4qnKYXzuQrFqocA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5MSBTYWx0ZWRfXxt/kUFBqRdBC
 cGEBPspfC8PmDqSgbZYQcVw5SK+4TH5hKIey7sG/A/wgv4kOOhTSmA0pQm1P8aMx3hbjYG3FvrW
 Lg3vVcLfQXDppprEfJzO3+YI/XkQdooGEWyfrl6JQ2AGsKHB5tnJBuoU9m4pzmfL8/o0axZZISz
 5dEuEjmp9/8zXQFkcmsTTL/kQ5oYqsEyP41a7qg1qEkyqJPhcE+GEzU9CigmKYjzVJI+IOzUv1e
 nFB3oESooqlwQD3TCO3oAFLmDi3nhWK+3xtSOFdbfL3n9ePzTb29jFu7UnVhzyCcmU3YYo5Drdg
 vjLWhbmBcloh9JcRAu61OlmrM+PuzN13zF95gF0ZjEs6odwL2mlLpJGbqUmyZpV21VOttaCGCCI
 SlB3bJblmivM+P7VqVdyQrcwpVd2cpSPCdYOLMzvg6hw2xCjazLi9GRdAOHKoNc/0DSZIo2RfcW
 j07U8yobRiCF9SV/BtQ==
X-Proofpoint-ORIG-GUID: F5RTIfful1wxxVks_oLlBX6_GdsSgfwK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_023756_063871_E2AB4507 
X-CRM114-Status: GOOD (  24.49  )
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



On 2/26/2026 12:19 PM, Roopni Devanathan wrote:
> From: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
> 
> Per-link logical index is assigned from the global counter,
> ahsta->num_peer. This logical index is sent to firmware during peer
> association. If there is a failure in creating a link station,
> ath12k_mac_free_unassign_link_sta() clears the link, but does not decrement
> the logical link index. This will result in a higher logical link index for
> the next link station created. Also, if there is a leak in logical link
> index as we assign the incremented num_peer, then the index can exceed the
> maximum valid value of 15.
> 
> As an example, let's say we have a 2 GHz + 5 GHz + 6 GHz MLO setup. So the
> logical link indices that they have are 0, 1 and 2, respectively. If the
> 5 GHz link is removed, logical link index 1 becomes available, and num_peer
> is not reduced to 2 and still remains at 3. If a new 5 GHz link is added
> later, it gets the index 3, instead of reusing link index 1. Also,
> num_peer is increased to 4, though only 3 links are present.
> 
> To resolve these, create a bitmap, free_logical_link_idx, that tracks the
> available logical link indices. When a link station is created, select the
> first free logical index and when a link station is removed, mark its
> logical link index as available by setting the bit.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
> Signed-off-by: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.h |  2 +-
>  drivers/net/wireless/ath/ath12k/mac.c  | 16 ++++++++++++++--
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 990934ec92fc..5498ff285102 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -522,7 +522,7 @@ struct ath12k_sta {
>  	u16 links_map;
>  	u8 assoc_link_id;
>  	u16 ml_peer_id;
> -	u8 num_peer;
> +	u16 free_logical_link_idx_map;
>  
>  	enum ieee80211_sta_state state;
>  };
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 68431a0e128e..db1b098b67d0 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -6784,6 +6784,8 @@ static void ath12k_mac_free_unassign_link_sta(struct ath12k_hw *ah,
>  		return;
>  
>  	ahsta->links_map &= ~BIT(link_id);
> +	ahsta->free_logical_link_idx_map |= BIT(arsta->link_idx);
> +
>  	rcu_assign_pointer(ahsta->link[link_id], NULL);
>  	synchronize_rcu();
>  
> @@ -7102,6 +7104,7 @@ static int ath12k_mac_assign_link_sta(struct ath12k_hw *ah,
>  	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(ahsta);
>  	struct ieee80211_link_sta *link_sta;
>  	struct ath12k_link_vif *arvif;
> +	int link_idx;
>  
>  	lockdep_assert_wiphy(ah->hw->wiphy);
>  
> @@ -7120,8 +7123,16 @@ static int ath12k_mac_assign_link_sta(struct ath12k_hw *ah,
>  
>  	ether_addr_copy(arsta->addr, link_sta->addr);
>  
> -	/* logical index of the link sta in order of creation */
> -	arsta->link_idx = ahsta->num_peer++;
> +	if (!ahsta->free_logical_link_idx_map)
> +		return -ENOSPC;
> +
> +	/*
> +	 * Allocate a logical link index by selecting the first available bit
> +	 * from the free logical index map
> +	 */
> +	link_idx = __ffs(ahsta->free_logical_link_idx_map);
> +	ahsta->free_logical_link_idx_map &= ~BIT(link_idx);
> +	arsta->link_idx = link_idx;
>  
>  	arsta->link_id = link_id;
>  	ahsta->links_map |= BIT(arsta->link_id);
> @@ -7630,6 +7641,7 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
>  	if (old_state == IEEE80211_STA_NOTEXIST &&
>  	    new_state == IEEE80211_STA_NONE) {
>  		memset(ahsta, 0, sizeof(*ahsta));
> +		ahsta->free_logical_link_idx_map = U16_MAX;
>  
>  		arsta = &ahsta->deflink;
>  
> 
> base-commit: 62f9b9b19939138c34ce0ac1e5d4969d617ecbb6

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


