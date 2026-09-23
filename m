Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3F4C98302
	for <ath12k@archiver.kernel.org>; Wed, 23 Sep 2026 02:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AX2Nle44Lv8ybfqYcCzu93O+KbWu3Hg1NB0Oi0gGgoQ=; b=zQnaw5OtLaNV0ugBISo+UHOxxZ
	Fy5YPC3hlYrF2eBVjTNvE5E31GauJOa/ChejGpl7FnjFfnp51GQ7PZ3OhQtypkGzl2FOycJPZubwf
	4gU2jMAKWXKbbUBZaQUEn9QXuI87BEMObPa641jMdASaL1KFGjE5i7zwnodBq3gvJGmaMABCMiSco
	e0ocYoM5NoyxhqKE2y0enV5/oBd66+CKFkW5TcW9GTz3f9bfLXNOu+o/FuMrPW0SwKUYn1kp+kRlz
	dU0YvKoGdzhNW/bp0Ikwzvlj1C5HF/PpaMe8A7UHZfL3echFCkkF+tB+Y8Oxbh63FiYbo/ggzXLPR
	Z+FWEw4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9CeO-00000006vd3-3rA0;
	Wed, 23 Sep 2026 02:24:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9CeM-00000006vbw-0n3N
	for ath12k@lists.infradead.org;
	Wed, 23 Sep 2026 02:23:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MN8WDb1403441
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 02:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AX2Nle44Lv8ybfqYcCzu93O+KbWu3Hg1NB0Oi0gGgoQ=; b=WyNbrWli/8KG39EM
	0SdHfzufOO/i/WBjfV3LbpNtptLDb6Ls5zr5PJgLnM9nFQdUEDkdQ3yr81uKmPT2
	B2z39q5ivlbOlWRTVFa/CLTj4Uc7gMbRCG4bm4cj9yhj93EwD7yOZTBHFRxpjqu5
	bQQrAH0hesMpJXCzG5DgyRDZEj9u2AjmAN2N98VpbWnBNmxUGDo3T5H+GZU3O40m
	b3AXzxUAeKDgIfChMCGmHjKPhtO+72+o4V53XoBqciH8kQPr4LWW1ezA39pDZmAT
	28JJFQj1OTTdZFEGYONej1w/g2Pkc3KkS/4cWWaqBdOW64d8BZJT8x08/00M81My
	05yhMw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv3318j0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 02:23:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e25a5f6e8so528933a91.0
        for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 19:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790130236; x=1790735036; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AX2Nle44Lv8ybfqYcCzu93O+KbWu3Hg1NB0Oi0gGgoQ=;
        b=eRrY4icTdn5HJ1i9MyMszqjSpBmvLG9zMwwudRvcPJ/ZC9nIvfNGXUNKLgQ3xfcpkG
         EzAK26s25AsSJa+lZtzN9u7V/ocsp4Eciru1ir9jS0cw39SWBbucnNsYe4UaHpMhyafI
         Pyrjz/yWEUeMLAa2417+5FTCdkvlQ2en63fLS2Xh39ydubUKCYpmQNsg/ZehqaeVqyCl
         8clbcSWNzAXTIxrMvult9M/cz9F2Y/gixI7FgSRWy9jEKNybsttliLdE5xXwy9s48jD2
         YArEL8qZD/p8zPID1W90EyZEbL4/3WsiEDGb86eNQEs5+7RGPNGw+CQLCfzDC7uYiMDF
         xjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130236; x=1790735036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AX2Nle44Lv8ybfqYcCzu93O+KbWu3Hg1NB0Oi0gGgoQ=;
        b=EQ1ubrT5vl9e4NA6s+S/J4bfKZ8zz8vbq0oZK/IZEltU+MLnLSK/FZaAAWUjBQdM5R
         wqV1YmkY/kNeiy3Xe4BHrdvCd7pGeoxeEWj7+dc2FaMAAGMZMX4t8uuuVcHnpWPLp/9C
         MCQXsywPA7t9fIVNx/OJ4rVKsi4P+J+oYHOzM5ndKClIYBPAFRqBi6pnnQrmMsmwcMyw
         utPbFsgArFIDFxIu2HNLtIy8do2fGzOSLpZdS8czvaCxmFLzxgAA8pyoWZr3nTlRfEuJ
         wvGjnlo4KHhd7zApDIbFi5RAyQ4NJW/HgvsdWUuxHxEqT4MpWpGBSvk+Fjzs4qqQe8zJ
         jU8g==
X-Forwarded-Encrypted: i=1; AKwUvBw8hzc8e6l218F+gx63QT4VC3XiDTFAFYHn259//IwgLzt0bPyi2JYlN5ufBob8Nlhw26/cg4Q=@lists.infradead.org
X-Gm-Message-State: AFuF++l++RIhd612hmFy4AdnD9GeDKu8/OS/LeoYNCerJhWaAj1KNBK0
	hdyWdTHH2W2SGshf6ylipCu/fPsbMLZ6fTQ2eOXxWyEGhBFCduxcw6Tgv1fY4WrNWHdRi8ZKwih
	UKKwgJfZIiDBlQAxIxgxhHhmE+cVuik2wn4isYuq4Ico/2gOkxD9IDQ7NpKh3XLqb
X-Gm-Gg: AYBFou1expnf4Kkt5kQ+RJD4NwT2TGriXwJsfEYv9elvnzbRjMSLmps7nQJp9H9NOTO
	p+QUrkJMmZ0Df97W7g5dd6CW2PEnYHzI0fdyzr6yoVD4651OOmk7VM0xA9g5FM6RwyueH90rJ+a
	mIpjE+woEg551081GUV38VbD/CiYW9y9bSgor8sgjXbr/zww/KOWlz/3bXtYxxZcRZhtBapOzpy
	deCaL9vFXS7lLKMvdhCBfk84m9O9lZa4N+Y/KcG3YKOxG4Pi/o1jY9i8s5A7/229MFWPasfqH/L
	HgEWbNFPXAWFeTrcTBNP5BGt30mXSaekLToJ+crQykwUPNbJgFkoqdU219iGbtRbiTs3sifNwc+
	Np6ItS8wudvRZ/Kclx2wbue9goifMEpkKrvd9jA+Lyl66OUkMv8F4pCyZRkIM1qQ9z0I=
X-Received: by 2002:a17:90b:3e4b:b0:39e:6c69:34d4 with SMTP id 98e67ed59e1d1-3a07e793f0dmr1094062a91.56.1790130235987;
        Tue, 22 Sep 2026 19:23:55 -0700 (PDT)
X-Received: by 2002:a17:90b:3e4b:b0:39e:6c69:34d4 with SMTP id 98e67ed59e1d1-3a07e793f0dmr1094043a91.56.1790130235472;
        Tue, 22 Sep 2026 19:23:55 -0700 (PDT)
Received: from [10.133.33.151] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc5f3d7sm2197098a91.16.2026.09.22.19.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 19:23:55 -0700 (PDT)
Message-ID: <87097a5e-d334-49a7-865b-f4660f9a8cc4@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:23:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4] wifi: ath12k: advertise interface MAC address
 pool
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        baochen.qiang@oss.qualcomm.com
References: <20260922200643.1133491-2-ivitro@gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <20260922200643.1133491-2-ivitro@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YFmIGRNtAeuonAmZHHB23uoQEw2nwFCP
X-Authority-Analysis: v=2.4 cv=HdaB3SE8 c=1 sm=1 tr=0 ts=6ab3383d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=m8ToADvmAAAA:8 a=EUspDBNiAAAA:8
 a=XWmW6VCIqsrZXVgdJaoA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: YFmIGRNtAeuonAmZHHB23uoQEw2nwFCP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwOSBTYWx0ZWRfX8Iu1yYppdh7W
 u/iwGOvOgF1zShk+SdIbeP6TZwR6KH4ZvkS/6mTysvM/WRgTLUs68Tu7P6Q5JojbU+AwxH2sw80
 h8tz4OShKzuphJQ1OrCF1klpJfSPRRQI+zGq/fLUpsnhEAtt7BFR+I6VHZn3Owp9/2WqRhbePgL
 CGF4skfmCMCR2CtnmlSzBLUBXmtckoJXpc06gmgTKBzablfME5s0rDHEIl25EcnTh13e+FnLYzj
 GV/qkExl4ZdWO3UgxEIZIjBJdZYbebeYJvOGi27/NoGDhMoFwn6n0B+EoljUBYDjteoNjH1yUPM
 PaBghju4hBYbU0yEV4+bsv+38VYU9lbEPy0hn76dkw2L56mDz3grMtRJXzqN2ktXdKseGqfPcsC
 HfZ7+EfQcAVb7RFnmEJ5bfkh6skXGpdXD88TMG6VsG2wL8pI0QoRU5fKS4AnTQLXX3Gd5mS2VK/
 FKkxZ0CGlMUgeBH1aMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwOSBTYWx0ZWRfX7hcoXWeKiQqP
 ONf904N52E93y43Iac+zkOcftk2EFH+8z6tjsUcbwM5M8kmr+4X7PRv4NPDh0zY09wiBw12KQcq
 Hl9a8dc7pUs2AwWi3kzza6k2t3tlEEY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_192358_400758_7738FF07 
X-CRM114-Status: GOOD (  36.90  )
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



On 9/23/2026 4:06 AM, Vitor Soares wrote:
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
> Keep the first entry as the wiphy's permanent MAC address. Generate the
> remaining entries as locally administered variants by changing only the
> upper nibble of the first octet, which naturally limits the pool to 16
> unique addresses.
> 
> The cfg80211 definition of wiphy->addresses does not specify where the
> addresses must come from. Some ath12k platforms use it as an interface
> MAC address pool, while others use it for firmware-provided per-radio
> addresses. Gate the generated address pool behind
> advertise_iface_mac_pool and enable it for WCN7850 and QCC2072. The flag
> is read from the first radio, as all radios behind a wiphy are
> expected to have the same setting.
> 
> Other platforms keep the existing behavior.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
> 
> Assisted-by: LLM
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> Tested-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
> v4:
> - Document why the first radio's hw_params is used.
> - Add QCC2072 Tested-on and Kang Yang's Tested-by.
> - Link for v3: https://lore.kernel.org/ath12k/20260921173033.846332-2-ivitro@gmail.com/
> 
> v3:
> - Rename host_alloc_iface_mac to advertise_iface_mac_pool.
> - Clear wiphy->addresses and wiphy->n_addresses during cleanup.
> - Drop the single-radio check and rely on hw_params gating.
> - Enable the generated interface MAC pool for WCN7850 and QCC2072
>    (QCC2072 compile-tested only).
> - Follow kernel block comment style.
> - Link for v2: https://lore.kernel.org/all/20260915152815.254016-2-ivitro@gmail.com/
> 
> v2:
> - Gate generated interface MAC address list behind hw_params
>    host_alloc_iface_mac, as suggested by Kang Yang.
> - Enable it only for WCN7850, the only part available for testing here.
> - Add Assisted-by: tag.
> - Link for v1: https://lore.kernel.org/all/20260902082219.3010793-2-ivitro@gmail.com/
> ---
>   drivers/net/wireless/ath/ath12k/hw.h       |  1 +
>   drivers/net/wireless/ath/ath12k/mac.c      | 54 ++++++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c |  6 +++
>   3 files changed, 61 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
> index e790de5737db..c58db8482aa4 100644
> --- a/drivers/net/wireless/ath/ath12k/hw.h
> +++ b/drivers/net/wireless/ath/ath12k/hw.h
> @@ -238,6 +238,7 @@ struct ath12k_hw_params {
>   	} client;
>   
>   	bool host_alloc_ml_id;
> +	bool advertise_iface_mac_pool;
>   };
>   
>   struct ath12k_hw_ops {
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index d4116ba0da08..c131358efb69 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -14743,6 +14743,56 @@ static void ath12k_mac_cleanup_unregister(struct ath12k *ar)
>   	kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
>   }
>   
> +static void ath12k_mac_cleanup_mac_address_list(struct ath12k_hw *ah)
> +{
> +	kfree(ah->hw->wiphy->addresses);
> +	ah->hw->wiphy->addresses = NULL;
> +	ah->hw->wiphy->n_addresses = 0;
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
> +	/*
> +	 * wiphy->addresses is per wiphy, so the generated interface MAC
> +	 * pool is advertised for the whole ath12k_hw. The hw_params flag is
> +	 * expected to be consistent across all radios in an ath12k_hw, so
> +	 * use the first radio as the source.
> +	 */
> +	ar = ath12k_ah_to_ar(ah, 0);
> +	if (!ar->ab->hw_params->advertise_iface_mac_pool)
> +		return;
> +
> +	/*
> +	 * Only the upper nibble of the first octet is varied, so at most 16
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
> @@ -14762,6 +14812,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
>   		ath12k_mac_cleanup_unregister(ar);
>   
>   	ath12k_mac_cleanup_iface_combinations(ah);
> +	ath12k_mac_cleanup_mac_address_list(ah);
>   
>   	SET_IEEE80211_DEV(hw, NULL);
>   }
> @@ -14878,6 +14929,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>   	wiphy->available_antennas_tx = antennas_tx;
>   
>   	SET_IEEE80211_PERM_ADDR(hw, mac_addr);
> +	ath12k_mac_setup_mac_address_list(ah, mac_addr);
>   	SET_IEEE80211_DEV(hw, ab->dev);
>   
>   	ret = ath12k_mac_setup_iface_combinations(ah);
> @@ -15120,6 +15172,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>   		ath12k_mac_cleanup_unregister(ar);
>   	}
>   
> +	ath12k_mac_cleanup_mac_address_list(ah);
> +
>   	SET_IEEE80211_DEV(hw, NULL);
>   
>   	return ret;
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index ae8df80928b0..ad362244ed9b 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -445,6 +445,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = true,
> +		.advertise_iface_mac_pool = false,
>   	},
>   	{
>   		.name = "wcn7850 hw2.0",
> @@ -539,6 +540,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = false,
> +		.advertise_iface_mac_pool = true,
>   	},
>   	{
>   		.name = "qcn9274 hw2.0",
> @@ -629,6 +631,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = true,
> +		.advertise_iface_mac_pool = false,
>   	},
>   	{
>   		.name = "ipq5332 hw1.0",
> @@ -713,6 +716,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = true,
> +		.advertise_iface_mac_pool = false,
>   	},
>   	{
>   		.name = "qcc2072 hw1.0",
> @@ -808,6 +812,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = false,
> +		.advertise_iface_mac_pool = true,
>   	},
>   	{
>   		.name = "ipq5424 hw1.0",
> @@ -895,6 +900,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = true,
> +		.advertise_iface_mac_pool = false,
>   	},
>   };
>   

LGTM




