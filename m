Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826D9C982F1
	for <ath12k@archiver.kernel.org>; Tue, 22 Sep 2026 06:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wjgJuF0n0CBkv3BCSg5e9sd/k9j33jADqObLn+WFpg=; b=hik/hzulUlveSG/3YtAYfOg/bq
	6reiMSVmRV0D2B3fJ6GtAhP/KiUxWnW85hsNFPBVZx0isi+h1Ctnw409fEPvKUcQwCpHEp4d7wa4b
	PlIDMIB0XSb4J5R6mYoAMvUZ551stu+EbbGcm09bWK1UAJsKJmA95CRdAVnpcKxDyk1C9NWKycHrk
	UVKzb/Wswdo4ACdlSyfX/uxmYX7Viwdcpao7e6f8nErmo36bw88zUL2B0B4ejqT4kFXS+E/fDarFG
	DI0QEO7ANz8NtaxqUojtOTG+BfRR4VUKZFbkkwtAANq87fwQZXL4cS3fyka+2KbT75KQwT8RahWRu
	l8zn+naA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tlc-00000004Jc5-0ocC;
	Tue, 22 Sep 2026 06:14:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tlZ-00000004Jbg-3VTM
	for ath12k@lists.infradead.org;
	Tue, 22 Sep 2026 06:14:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00JrV3676925
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 06:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7wjgJuF0n0CBkv3BCSg5e9sd/k9j33jADqObLn+WFpg=; b=Np2i9P+fcuY3dSkO
	0iIYiYcFq7gAcEu74BV8uYScuDNd7vVgIWZuhpNY7Y3FsmDlSGcBZpXcccmllrmI
	1RpTNGbQmX7Mja8fFT5lYGDPOCjW+8iJdzWy0P6Zlr4qEJiiHgIlBv4gz2ntz8jP
	Vzdb3c8DcwGMl49yzh+5/Sv+Pcl043SEm+rWboWPzoMbCTnEFcV1zcPmTmBc2T8i
	xNiMcubmdYU+wjlF8RIOVT+H7g/xZYYKu5IQY1qsLBMGoVi2J0hF8MtqhVt/FHru
	qGLodJ4WgE46KozEgQigB+AGWw+Qi6GATMPbOPhI3UFrIscJ9XDoMvNtlPrUvisX
	YREisw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu85vjqgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 06:14:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6fed0652bso42946735ad.2
        for <ath12k@lists.infradead.org>; Mon, 21 Sep 2026 23:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790057648; x=1790662448; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7wjgJuF0n0CBkv3BCSg5e9sd/k9j33jADqObLn+WFpg=;
        b=H1txBGWXk/JZUAMtZPUTilaNdqdak7pbwj/eSP/3Qc3YIJr2MXYsZeFlEAPxP+bayB
         74eIEsw31N3mCvTB+7BwtbyZPj8EbsiZalleyTUCAYCuhaRo7gnn7YY9WkVahdn245ZX
         UyIR/uVUYJS2MWaJeTMwlh6uqRTUjCtgORFZZ5Xbxgxi/ZwVmY2kECkO/ZgmWUb1tKV1
         l9sgcKnDxY8GVlY1Xs3BZ2BRFi1jSOZzwyy6ARN4o/kc/ekJHi6WMuOcNh+QWXHPUjI4
         BjyiAMy4IRX0LgdCo4iyX2sIGq2X2X5arnVDH7/LEzKA5U01tWA0hqNrUBS4oTYjyeLn
         Xz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057648; x=1790662448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7wjgJuF0n0CBkv3BCSg5e9sd/k9j33jADqObLn+WFpg=;
        b=rJppUQ9LrLzDmP41l3S55Yj0RqxPvELOCz6afTfnHshTOJTBEvjyGuTDQ6BKFZnXKT
         J4jiNIBqnitwqoizzE3YsWleAXB9CLiTfeBpTCCGFzNNJlX7IB6QTWGmBZgU2Jlctsb0
         9LCydhVO1amURkhtNYcUafWJcfnc/Rqk2a2tuLhcTQoebVLGkZPOyQIK1W6oTMOoIl1G
         gotvx3V7ZxaYF2l7zLDxVILMGYq55hI/15+FhSwHJM4QNk3twume0i0l+zAdiRNbaTvv
         ffJx5gWCK8piLt7KtewZg+MEqk/nUP4sNp1Y3ixAYYFB1D9OQenGfajGNufEYH+fOhyp
         CMnA==
X-Forwarded-Encrypted: i=1; AKwUvBwbeMv7/aksgYIQY8qDW1qcq5ntHS+7oZ7OMkbUWEs1bhNWbw6Oo79ieA3xmSJjJAbTXc4do9M=@lists.infradead.org
X-Gm-Message-State: AFuF++k5842G/FwMtjj+wcO3H2TNjrxzsBJ9VLzvDR7Wswd3oGT2nJ4Q
	5YOW0T7qKRcgS1NWANZfSDGk9jGp11NHZcBWQe5PQ0RO6mYppyXGRc+PAFDBJyvpxh+z2i6eRVo
	X9NDcLjW7HDNInA7vcKIEiHFGNkGJlYgJOadJ3zaXQRDOWwQ9P8AYz/o8ETbSaZXr
X-Gm-Gg: AYBFou0qBNSJ+9DiaRbEvsNfV19musvlB503dESCCDxHIgziJF3/VICqY1uzfig5SPP
	nwkmeie+FOKW4J3McBa0s1wwOTs1s9GuF+zkCclyjRjC+nfXf5oURANV4tyByV06S+CTGk8/ODv
	Qotn86EDbSOcYk/cXd+BnWzO4s/9rlZ968jY6tdNBslnGGdu+GETf3azyvuzVVKixWkzQAXBbrV
	gn12xjv+pMNUi1k/aLnjfsqYh78ahu+azyiWa87NtmLy718NvZfYUuAR4gjRLYiRylm3bIGxhuU
	fGcAfmZGdmJZ6zn+uQs3pV4xS6yCRAYompYTln0BMPFL+QpafeOs2w1DmVEWfd/pFc557FfbGx7
	gUwSopqk53hA6SpUtGeosZt3t78pYXkjGs0gSe6LW6rKm6skFRtbc34VQUVmMSkdR5rw=
X-Received: by 2002:a17:902:f550:b0:2dd:c100:80b7 with SMTP id d9443c01a7336-2df60b66cd8mr1402405ad.50.1790057647979;
        Mon, 21 Sep 2026 23:14:07 -0700 (PDT)
X-Received: by 2002:a17:902:f550:b0:2dd:c100:80b7 with SMTP id d9443c01a7336-2df60b66cd8mr1402095ad.50.1790057647398;
        Mon, 21 Sep 2026 23:14:07 -0700 (PDT)
Received: from [10.133.33.151] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d056dafsm4005045ad.72.2026.09.21.23.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 23:14:06 -0700 (PDT)
Message-ID: <974e540d-d6e2-4ebf-8714-98e4056083d9@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:13:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath12k: advertise interface MAC address
 pool
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        baochen.qiang@oss.qualcomm.com
References: <20260921173033.846332-2-ivitro@gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <20260921173033.846332-2-ivitro@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA4OCBTYWx0ZWRfXxn4xbloIvVgH
 GVpObxLJoDpMJ4j7a4jlHCO2udafAj+PMyTQ5lIy1re6VAOmdr6wWztwS1h0QjrEzfvg/L0/D0K
 fPEw6v7c3ToPvme4VzzwrhV+v37p9xA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA4OCBTYWx0ZWRfXxBvi7KSqcNcZ
 glqieVWptdRaWEhpztYgZCrZjb6yQ73NSxl+NMlSULYjaPzfCPAFCy2TItZfD9WklhDPWid1poV
 n8A6QNkYtwtEBQFp4fVSqeDfUV4j9WTnZPs47XCS0sMN5CjYaz/N+i9SpkEGuKNGl12G8gMzqu1
 +YiSZd54eSfvj9FXEy7eNX9xtw87pW99Ci2iGlVNG5F6eETRKkSExCjva7HEpwOr74b0dpR/ttP
 9+24E+eduO4VLJ2HTckNSwIlnAlTY1MTJZXcm+4tktMw3Kg2Z4hijrDbum7DwilD36908MEpOZB
 SgBG61gJz5OK35twIpwUGwXTszYezblEkqzK1Xa03bodA6pvycQV2av9eoUyqEVdR/UWmUFkVdQ
 EnvAnjsgGzbZxHZrJcAbUqdfyYsPZAxSbqHo8ik0isNtJ7WwP5ITzck0dR3W03AtZNGND5p5v6i
 36hZt2s9Trb02un+bQQ==
X-Authority-Analysis: v=2.4 cv=E8FYNqdl c=1 sm=1 tr=0 ts=6ab21cb0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=m8ToADvmAAAA:8 a=9m3d3nHKyyb8iBbjpxEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: HmynCHMquI8OVr9fRlv2LggPpA-AxPIk
X-Proofpoint-GUID: HmynCHMquI8OVr9fRlv2LggPpA-AxPIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_231409_911801_F6ECC138 
X-CRM114-Status: GOOD (  35.19  )
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



I just did test on QCC2072:

root@yk-Mayan:/home/yk# sudo iw dev wlo1 interface add wlo2 type station
root@yk-Mayan:/home/yk# sudo iw dev wlo1 interface add wlo3 type station
phy#0
         Interface wlo3
                 ifindex 6
                 wdev 0x3
                 addr 22:03:7f:12:be:cd
                 type managed

         Interface wlo2
                 ifindex 5
                 wdev 0x2
                 addr 12:03:7f:12:be:cd
                 type managed

         Interface wlo1
                 ifindex 4
                 wdev 0x1
                 addr 00:03:7f:12:be:cd
                 type managed




Tested-on: QCC2072 hw1.0 PCI 
WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1






> Assisted-by: LLM
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
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
>   drivers/net/wireless/ath/ath12k/mac.c      | 48 ++++++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c |  6 +++
>   3 files changed, 55 insertions(+)
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
> index d4116ba0da08..46f5f338f44c 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -14743,6 +14743,50 @@ static void ath12k_mac_cleanup_unregister(struct ath12k *ar)
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
> @@ -14762,6 +14806,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
>   		ath12k_mac_cleanup_unregister(ar);
>   
>   	ath12k_mac_cleanup_iface_combinations(ah);
> +	ath12k_mac_cleanup_mac_address_list(ah);
>   
>   	SET_IEEE80211_DEV(hw, NULL);
>   }
> @@ -14878,6 +14923,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>   	wiphy->available_antennas_tx = antennas_tx;
>   
>   	SET_IEEE80211_PERM_ADDR(hw, mac_addr);
> +	ath12k_mac_setup_mac_address_list(ah, mac_addr);
>   	SET_IEEE80211_DEV(hw, ab->dev);
>   
>   	ret = ath12k_mac_setup_iface_combinations(ah);
> @@ -15120,6 +15166,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
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


LGTM, Baochen/jeff do you have any comments?



