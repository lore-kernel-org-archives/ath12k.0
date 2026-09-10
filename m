Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD3FC79FB7
	for <ath12k@archiver.kernel.org>; Thu, 10 Sep 2026 06:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0iLDqLG5pF/VNrOWDOw4FPl4nltC+AvSy8rtXgUBCIw=; b=hRZOTMspep6AkxOjRgLwIzpwRJ
	+5nRoMCR55POwdwb844UDliSQ2wr8w8ojdhYEzSMvnCMalRp4EAbkffkM0IreLKqTUZ6cOra7IDFL
	hWJCdCrWhbXh3SoLNHjjZetZoDpfRXosD7LAjsraYB28ZnbyvLNIvmhhRpG5KcS1E5kMeFAU3QwY7
	zOJznIdc+m46Y6r7vinv/WAZW3un2cn9fRhmF2LevvQxqLhuGXcBen9IG7c/iW1YzKFzXOvN+E/d7
	MUvdr5UpmmAphWD3I/H2Dw9wgKPZq49HvB5v/SY0qqeCeBUBrnWQY2aNAFutZ82DK0TodgcD/3WY4
	EaqiECBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YCn-0000000DVZj-0ht4;
	Thu, 10 Sep 2026 06:24:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YCk-0000000DVZJ-0DMm
	for ath12k@lists.infradead.org;
	Thu, 10 Sep 2026 06:24:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5H2Lt4059860
	for <ath12k@lists.infradead.org>; Thu, 10 Sep 2026 06:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0iLDqLG5pF/VNrOWDOw4FPl4nltC+AvSy8rtXgUBCIw=; b=LMDDWjb/7KMyhyjb
	8sPvd6NH0z7RGV263y2y+0HAGc6FCECDCnfsEz66kcRFeHP/OnGt4cX4vOTqBdfh
	tczeY0xO4kWKlNGoB6QdN2ngdXwIcUv6zlovrH4yNIQlcM6rso9YHzFd48lszL9N
	wlzrOAbsgV7Q9jAIzNbH4AElx9BSGlYUqVCSHnANSq/K0dXBG2gz2exNDRd9uKem
	VBUo0Y58rXNZw768W8MTvO2CoJn2T9jmwbvIktLERY8CKPN1WOmOXYJhPQ9Lwz5v
	zncmFotQc2pEqIjsDdBHaUdi4nSktMY5TffBHa/qqSOhK6apBXxwrySEf9Tcj+6J
	KIqcOA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyftedx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 10 Sep 2026 06:24:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc44d708055so11297315a12.0
        for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 23:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789021452; x=1789626252; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0iLDqLG5pF/VNrOWDOw4FPl4nltC+AvSy8rtXgUBCIw=;
        b=NmAYZETQ2RUZPkWnldulAjQcWcP0i3WpB6fjRY2+uQLjKAR5c40NkWZPGT2vEKIOiC
         nVqQQZZzSWqikddwVOUlEbiA3OkQjzCEaUG1U8j3t3icYspkJcGIG6KxsaOh539gyl/2
         p1cOsYOEZO5/YVl1ItnirwVBlTD3mFTqAOXROO5m6olLtcNz5FfBIMcK5NPRoWQ+uGfH
         57nH3+hL/x2Wc4f4wmP78HdCh8KpRiYUpTfSHZE7FD0LTQ9EegZ+B/4sLxlfTrA2nOrj
         AdDzhUAds1hlvBNaoh34J8irScNAkOCv7lvWK4wg6FKE16UE7RKu1rKyzjiyuwp0mV2e
         hdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021452; x=1789626252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0iLDqLG5pF/VNrOWDOw4FPl4nltC+AvSy8rtXgUBCIw=;
        b=lw38rg2XpiRCTGaM9JXx30+X+vyhuFZYWjMWJCSIO87KxBAjUtnQtcQSvmONpiE/rV
         gGJX46fHmD2e4FVRx4tePyogeLIqksJVKI7nMAMeaSXZrbNDivr2gq/Sk3FBDRLkSLhR
         nzjqunXPiCa4zn33oMdVoiZMkJVij9EyAgtfyHvFtyNIar3T2lWFn8KddjCrxHVzitpB
         l42AA+4yZUhdmsl2S+fE8OsJr7ukPhi/kLOPI1cIx+yXx+8bsSUnQX6DFjmuHAvYSCFw
         MNV5glMO06Lj4M7LRy5zeQ5cMAoegMF7sCNIJu0ZNQ0moug2Qrx6BI/LsFNRZ7tdUJa3
         hVMg==
X-Gm-Message-State: AFuF++muVP01zur/4Q1po0+sp5jL+MfncxIHXokQxYywmtEHRn4B3fCD
	rCM07/LH6IaF/Zmt/Abv5gUypjLjcp+GAObssTofs0u3GqkBdThlkdDzyx3pcj0zqRq5oTMKTZD
	6iwykJG/1AJ6YPpgkHH3ss20Xr8n4NiLAZxr2k1QVdcUntRpTzpEItRUE/e8QTF5PQxV0WAzJ
X-Gm-Gg: AYBFou1tCn2uti467qVnQVWxb6IFGjYhebJ6RkmYtlzi6T6A2yoTv7UMG0ASkx0DBXM
	DK4P0mSNySSYt/kNtApHzA+JzRQKD2cbsUgY4r8dXe0NYQ9D1j/rxta+cSsHup/y9bSADt2vThb
	+ViZp7ohvaUcn++3jXzjfU31uzA4+s60WbozomZbZqnx2Lh2bZstHEaNObvvlvXS6RwGxoy07qy
	FCJPn74efK7+fwz8Ir8+buG25uS6nUiq81CvS19gKHTRXLxQO46zB+5S1LljYNIAGfX5ps1S5OS
	DQA3MaqOWAr87W6erXCJB6BUnRTjxfqwGFwSC0tJiMZkueQ4okBu0Ym9EfTWkrBYLBiLiSLh3KB
	PFZqxSLc7ec9mzaJv9E5CXGRhf2VhP4k25ulORXILx/UFh4E6IwqH83I=
X-Received: by 2002:a17:90b:274e:b0:398:b1eb:136c with SMTP id 98e67ed59e1d1-39b2610fe62mr59660449a91.9.1789021451502;
        Wed, 09 Sep 2026 23:24:11 -0700 (PDT)
X-Received: by 2002:a17:90b:274e:b0:398:b1eb:136c with SMTP id 98e67ed59e1d1-39b2610fe62mr59660345a91.9.1789021450630;
        Wed, 09 Sep 2026 23:24:10 -0700 (PDT)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e8ad192sm2468503a91.14.2026.09.09.23.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 23:24:10 -0700 (PDT)
Message-ID: <24d3c84a-a4a8-47c5-ba46-1d928b463f56@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 14:24:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: provide MAC address list for
 single-radio wiphys
To: ath12k@lists.infradead.org,
        Baochen Qiang
 <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20260902082219.3010793-2-ivitro@gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <20260902082219.3010793-2-ivitro@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vcSjiHTJEtXz1G5bAZczluM33y_EmRT9
X-Authority-Analysis: v=2.4 cv=GNqdgeNK c=1 sm=1 tr=0 ts=6aa24d0c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=m8ToADvmAAAA:8 a=8dmAZdvqxf5LAHb2O34A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: vcSjiHTJEtXz1G5bAZczluM33y_EmRT9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA2NCBTYWx0ZWRfX2UdbCmy6Gt2Y
 cg+OsfgZEOW0jEYsO4cPIfFYRVAyPWEIbfLwISgAxqseXqpii21jbqjz86AcZE1CTiQMxp5iZAa
 8lBbpwJJ3iNsFi8+4SAQA77sSUCsTYIli0I1UVPV8WbKIoSeBdpKCiAs4NbHi2BFrkhaywfJ9tU
 UaUM3E01pCD4sc9vBYmLSbvLTjg9KB6pVpUNB6Cs5k8UA1rrLYcK/680hPoYwNCsLd3i/OBpKY3
 O1tGv9m/6mXy+5xCGL8nTQcxPjh1qWVsXOkH+MS+B+iHmnOYeYBZfpDxIQ44/sRBEyq2FsULQmF
 z9t7QJwLEu0jne/VuB9FEpDHXD8OqSQXC9abO3GvEC4e+XXeYLCcPmHaiXhq/vfjtI8okEhJiD+
 euD8UNtxJcdb4HaKolto6o/4Ce/ggyenErM4QbpSDSCwvyZHinspHRUmt0mz1drGOwoJQawzt8N
 GhI9pNA3eyNm2fIuWYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA2NCBTYWx0ZWRfXxKyveDyF/iSv
 yTfu3NXvQRCuh0Ag5+j+MwszSBvMBR6/s7fczPDFe1Jyxrm9ElP2lPIWqcV4DVSm2jiR73w3PdA
 QJt5TAdmQ6zO7DIZ935gHg3HxOUiY24=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_232414_236866_BBD74ED1 
X-CRM114-Status: GOOD (  31.32  )
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



Thanks for the patch.

We discussed this internally and found that some Qualcomm platforms use 
wiphy->addresses as an interface MAC pool, while others use it to 
advertise firmware-provided per-radio MAC addresses.

Because of that, using 'ah->num_radio' alone may not be sufficient. Our 
suggestion would be to gate this behavior with a hardware capability 
(inside ath12k_wifi7_hw_params) so that the wiphy->addresses semantics 
remain consistent for a given hardware family.

This would allow platforms that need an interface MAC pool to use the 
proposed address generation logic, while preserving the existing 
per-radio MAC advertisement model on other platforms.



> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 48 +++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 9a775602775d..bee6701f1029 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -14685,6 +14685,50 @@ static void ath12k_mac_cleanup_unregister(struct ath12k *ar)
>   	kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
>   }
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
>   static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
>   {
>   	struct ieee80211_hw *hw = ah->hw;
> @@ -14704,6 +14748,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
>   		ath12k_mac_cleanup_unregister(ar);
>   
>   	ath12k_mac_cleanup_iface_combinations(ah);
> +	ath12k_mac_cleanup_mac_address_list(ah);
>   
>   	SET_IEEE80211_DEV(hw, NULL);
>   }
> @@ -14820,6 +14865,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>   	wiphy->available_antennas_tx = antennas_tx;
>   
>   	SET_IEEE80211_PERM_ADDR(hw, mac_addr);
> +	ath12k_mac_setup_mac_address_list(ah, mac_addr);
>   	SET_IEEE80211_DEV(hw, ab->dev);
>   
>   	ret = ath12k_mac_setup_iface_combinations(ah);
> @@ -15041,6 +15087,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>   		ath12k_mac_cleanup_unregister(ar);
>   	}
>   
> +	ath12k_mac_cleanup_mac_address_list(ah);
> +
>   	SET_IEEE80211_DEV(hw, NULL);
>   
>   	return ret;


