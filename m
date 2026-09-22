Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A611BC982FA
	for <ath12k@archiver.kernel.org>; Tue, 22 Sep 2026 06:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydl/Le8STRVOEBLkVL04aUGbtOU5VnHABeS+aKUR8+g=; b=rT6mYknZXhhORdOzLSLisZihpG
	7AY69SGQoQz4hyzYlad0vf4MJemMC/rckArx6hToQ688IdOdVJ9gJI3Rxck5sAwoaAvjFlTGa3J6Z
	ETmMyqvVCAgoPoSPi2nP5nFfpO2/Er2HATcj00sQp20VnA7bM86l17eZNVD0I1yre1DdYEccZV/oo
	R7/lh72vQWA+u7VLk8N7Mr7voZ1BNa/ASjtYUGVBYUAxQW59QT+mRFhjj/jpdYnPiJp8+W4rZq52E
	ZVp7PZIG25b6AlRbnqb1gOtgzZ7K3CFpChq/48eSV2uCoTmN7xbPQPjbWe9H9n7h0L27LSMLRKf2Z
	t9RzqgkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uHd-00000004MuT-1CfH;
	Tue, 22 Sep 2026 06:47:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uHa-00000004MtZ-1nhF
	for ath12k@lists.infradead.org;
	Tue, 22 Sep 2026 06:47:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M3hJ3G1842586
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 06:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ydl/Le8STRVOEBLkVL04aUGbtOU5VnHABeS+aKUR8+g=; b=MLdeZK8YpzjHXwfo
	9FDhxskn/jw63QmWPx03UFbjAUlYvICoLfywT5WHECMKfIDG9/uHhyWCpTYWY4Uq
	MsC7eGGz0Ntz7thiU6kGgDnYqNbwZ/78ZEGQ/yYsPfaxMi+dkZDvqNyn3QqNrTke
	9Qymyi1Xc29sM9wbO5mWtWEx7kpgicnKvB1lKB26g0mlVH8A0h2uzq3BJlHdrexR
	r6hy4/78ahK97bWpqzGM+p9ZjqQz/5Va7A3GWeGt2cFVpGRq+pgv05m+VmnE3n1n
	FS+Sqke8338PilmaA+Fj/vhmyvy1qWKWJASA3L/cBu/q3Xe1Hue72iDKztVfQm7n
	V62GZw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj110k9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 06:47:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39af92138f9so744467a91.0
        for <ath12k@lists.infradead.org>; Mon, 21 Sep 2026 23:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790059632; x=1790664432; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ydl/Le8STRVOEBLkVL04aUGbtOU5VnHABeS+aKUR8+g=;
        b=Fxo/SFnaUE+LKaYiEK5Ph6DhV1u3savnfS07f18tQOf9JWBRmNvonTSdIlX9Wbw3c4
         UMJnmT/sji9j92qU/pQZfsX7ZA4TLCf1ljHGw6WEGoFRmct93jT7hk5FCkO0xtfjDMZl
         2C+H+HEr+X3PU6tmW8bq2febjUpGhdWn906Q25ZyWn/VQqFRaEvifaRHXVENgUx/1n0x
         BesHS0pn5TYZn6ZByclkEiyw7L/KIzrqiKqEt7VI6FOlv95+/C+M9j/HhikTwI8zh7iC
         JF/mNlT4OFO722WdlUNpKXtIc3elhgJUamQ3waCBY4zLTEDKnV0IZ7Eb4kONJWE5sR8a
         H9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790059632; x=1790664432;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ydl/Le8STRVOEBLkVL04aUGbtOU5VnHABeS+aKUR8+g=;
        b=A2Oqq2UufASoE5bCYpR3guT6kdHi9SyZTakbll64hz8mG2pUnrNv2JNCDxvDkgZbLe
         d5OYZhwpKmeo1Kw8VJRu0+6/6lKL9ts0/MUOHEXwECK54cWnXjZky/qOQxTDOyezbDXK
         UWBTE5N/OoTag47K8qJ6qQ5yDz65SrL4q5Oj5iZo8fGuC6u/cLTRdsuLcXzgoVe11D2a
         GhGfKw3c+nQ4eo2naXdxRfbWxn8S+IJqDqPlLKrgndpQx2e91zZ/NMjr/X1+C/jOiMiz
         +F+WtDtxW7XIyRewfnB4Y7a3EtdbkvC1lnJn3f2ORSebSFj4RCHz2CWmQicB12W31mkZ
         jWeQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1KAls1UUuSy84Huz8mCBnMAkB1SAdUnJKk3rn8D74bfQi1hilAFr/0S+W89LbtMKaXOItkcE=@lists.infradead.org
X-Gm-Message-State: AFuF++krDJ0in/qwH9NaG68XzuwL1uNuJq5OnLAsiE15aXeWujnJyC0H
	HvYRRSWFBl4mpfeOj6X+uWpo957bqSRQr1JRP2Ef/0yLtw5jIq+S9FhaLH74VsP6a7XymgybVbH
	io5YCoaqNtMXC4L5FEt5Jeh2h+7oSh79U/x4vnEXRxy3E42Eo4moCvvuP8RR71IVq
X-Gm-Gg: AYBFou0tD+gEIPPtZ/3CzOZVOeLdjU2O65NxuFppXJhgJBmSbFr4yfIZzFeqxizylbv
	xXYLV0vh+Ft5+6cOk8yGB5Mmcd9495+B+EbkX0osnft9QpcXrpwBgqev7mYU+Tha7ac96Izfexb
	OC/rFeXRYhGPS5XcK1aHpM8Ph9c0BHcRjGmiS/HPYkSHB76xqcEWCr/zPdeBbRVKibTYydjD36v
	TICwlDKVH+ixCeeBDchjmWJtDvRVQ4/mJ5zHeuies+yD4skcpatBAUbojNA4q0FoXAOsL5YXHyF
	voKCuDqX79Vb18jwXdqjGmjxI2gsFyGjcPiM3/+YtBFWKsN5qpx9He+wlCnHjsjrGcSgJRS/XmV
	ukNJOsiaNjV1l9Le7VVTPUeFB1r4j1nCX9zWpkG1NO2qUJBpvsyPjKjvDaMKydBWyucBnn/92
X-Received: by 2002:a17:90b:4b05:b0:3a0:42a9:9c84 with SMTP id 98e67ed59e1d1-3a073672f0cmr103371a91.22.1790059632380;
        Mon, 21 Sep 2026 23:47:12 -0700 (PDT)
X-Received: by 2002:a17:90b:4b05:b0:3a0:42a9:9c84 with SMTP id 98e67ed59e1d1-3a073672f0cmr103358a91.22.1790059631784;
        Mon, 21 Sep 2026 23:47:11 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06dfd6705sm1662145a91.0.2026.09.21.23.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 23:47:11 -0700 (PDT)
Message-ID: <270630fe-e9d2-4028-a70b-2448a370ba9e@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:47:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath12k: advertise interface MAC address
 pool
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        kang.yang@oss.qualcomm.com
References: <20260921173033.846332-2-ivitro@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260921173033.846332-2-ivitro@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lA6qv8N82v0VE8iYTm6zIRtU91-N2QFo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NSBTYWx0ZWRfX9AK2VuHwvf+z
 IU0GSa3ljQY9NCSfxiKBS1MFtWhExfbfOkLV31hqwXuaxiRRwdteWZ2+a3xrJJtdfjz3jhtuk1l
 RlEqE31LXdnZpJNuhIFYHFQh1RRj3nM=
X-Proofpoint-ORIG-GUID: lA6qv8N82v0VE8iYTm6zIRtU91-N2QFo
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab22471 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=m8ToADvmAAAA:8 a=9m3d3nHKyyb8iBbjpxEA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NSBTYWx0ZWRfX/BCUrouKpp5q
 gRIg/IsKVwmhZWBUHMbNgdBWilSTKdujtfuB2+EPYiX43LFSHFCB9hkL/7GDT0zU9j2NvFFO5B8
 jEqlomYihJ6iYlPZ3dZg7KJarvhYrZgpZ3OKGQKMnB3e5f3H/3VWGDHk/kwk9eRylroclIZtuVa
 DytZn/38PsoINrrcSvomfDZz8zR5cPpHJIp52K22P1p1v291yuRmra4QPKNikEBCVhsrL3o9Hj9
 1XMjx/07cmnCkGq2d64lkZ7vvSiL3NMvkE0QZWFHjlU/x+S94L5bwNk5fk4UuXc97T4iAskY1JZ
 MZNAf2GXIDpG4DaZ8kski0ey4kX++EVhzAbupzijk2PUc6F1MzcrJ82aDMVKRYiRWObwTWHN5k5
 G1Rtw3EupiowxkqT3eC/IKPjHSdLAFyc+qjV8OoiAq5qwodQZWn1LmTNeILE7PVKJ24eJYJXiHj
 NLz0sa8M81PnhaK0Uhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_234714_478911_E36124E2 
X-CRM114-Status: GOOD (  34.73  )
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



On 9/22/2026 1:30 AM, Vitor Soares wrote:
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
> advertise_iface_mac_pool and enable it for WCN7850 and QCC2072.
> 
> Other platforms keep the existing behavior.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Assisted-by: LLM
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
> v3:
> - Rename host_alloc_iface_mac to advertise_iface_mac_pool.
> - Clear wiphy->addresses and wiphy->n_addresses during cleanup.
> - Drop the single-radio check and rely on hw_params gating.
> - Enable the generated interface MAC pool for WCN7850 and QCC2072
>   (QCC2072 compile-tested only).
> - Follow kernel block comment style.
> - Link for v2: https://lore.kernel.org/all/20260915152815.254016-2-ivitro@gmail.com/
> 
> v2:
> - Gate generated interface MAC address list behind hw_params
>   host_alloc_iface_mac, as suggested by Kang Yang.
> - Enable it only for WCN7850, the only part available for testing here.
> - Add Assisted-by: tag.
> - Link for v1: https://lore.kernel.org/all/20260902082219.3010793-2-ivitro@gmail.com/
> ---
>  drivers/net/wireless/ath/ath12k/hw.h       |  1 +
>  drivers/net/wireless/ath/ath12k/mac.c      | 48 ++++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c |  6 +++
>  3 files changed, 55 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
> index e790de5737db..c58db8482aa4 100644
> --- a/drivers/net/wireless/ath/ath12k/hw.h
> +++ b/drivers/net/wireless/ath/ath12k/hw.h
> @@ -238,6 +238,7 @@ struct ath12k_hw_params {
>  	} client;
>  
>  	bool host_alloc_ml_id;
> +	bool advertise_iface_mac_pool;
>  };
>  
>  struct ath12k_hw_ops {
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index d4116ba0da08..46f5f338f44c 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -14743,6 +14743,50 @@ static void ath12k_mac_cleanup_unregister(struct ath12k *ar)
>  	kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
>  }
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
> +	ar = ath12k_ah_to_ar(ah, 0);
> +	if (!ar->ab->hw_params->advertise_iface_mac_pool)
> +		return;

commit message does not describe why only the first radio is checked. From previous
revision I know the purpose is to enable only WCN7850/QCC2072. Better to describe it in
commit message, as well as leaving a comment here.

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
>  static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
>  {
>  	struct ieee80211_hw *hw = ah->hw;
> @@ -14762,6 +14806,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
>  		ath12k_mac_cleanup_unregister(ar);
>  
>  	ath12k_mac_cleanup_iface_combinations(ah);
> +	ath12k_mac_cleanup_mac_address_list(ah);
>  
>  	SET_IEEE80211_DEV(hw, NULL);
>  }
> @@ -14878,6 +14923,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>  	wiphy->available_antennas_tx = antennas_tx;
>  
>  	SET_IEEE80211_PERM_ADDR(hw, mac_addr);
> +	ath12k_mac_setup_mac_address_list(ah, mac_addr);
>  	SET_IEEE80211_DEV(hw, ab->dev);
>  
>  	ret = ath12k_mac_setup_iface_combinations(ah);
> @@ -15120,6 +15166,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>  		ath12k_mac_cleanup_unregister(ar);
>  	}
>  
> +	ath12k_mac_cleanup_mac_address_list(ah);
> +
>  	SET_IEEE80211_DEV(hw, NULL);
>  
>  	return ret;
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index ae8df80928b0..ad362244ed9b 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -445,6 +445,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  		},
>  
>  		.host_alloc_ml_id = true,
> +		.advertise_iface_mac_pool = false,
>  	},
>  	{
>  		.name = "wcn7850 hw2.0",
> @@ -539,6 +540,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  		},
>  
>  		.host_alloc_ml_id = false,
> +		.advertise_iface_mac_pool = true,
>  	},
>  	{
>  		.name = "qcn9274 hw2.0",
> @@ -629,6 +631,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  		},
>  
>  		.host_alloc_ml_id = true,
> +		.advertise_iface_mac_pool = false,
>  	},
>  	{
>  		.name = "ipq5332 hw1.0",
> @@ -713,6 +716,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  		},
>  
>  		.host_alloc_ml_id = true,
> +		.advertise_iface_mac_pool = false,
>  	},
>  	{
>  		.name = "qcc2072 hw1.0",
> @@ -808,6 +812,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  		},
>  
>  		.host_alloc_ml_id = false,
> +		.advertise_iface_mac_pool = true,
>  	},
>  	{
>  		.name = "ipq5424 hw1.0",
> @@ -895,6 +900,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  		},
>  
>  		.host_alloc_ml_id = true,
> +		.advertise_iface_mac_pool = false,
>  	},
>  };
>  


