Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2A6CD5BD5
	for <ath12k@archiver.kernel.org>; Thu, 28 May 2026 07:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTE50W1bsXAlocRr11xq4D566Kq+w3xqvpSkOq4Nftk=; b=XelOFDgIXKuV/7DVZuawRA05ab
	khHeR6JByf7TZl5hFA+HhHvxmHlctJQDRwPZKcKVv6qDg5pRkw3a4AVgILHV1Al8DOB/NEsK1tJZh
	MluNblJXFEQMqP+qwEuKumdF7A/vUzR2l7rwJOQ0m7CXgZMg2mwT6GSAJ0PnrYI+gh0ur+0TnmOZu
	/F6jqmcFBjVMqawygNCws91BpGrqEU7W7kvnX7Rd5nuJoMZoZkOcExutwWpxz7tZ+RwLd74TTZ+jJ
	1UhgHKRv5h44nKI0okh9yYsNHslR9WXiFz7NVFfqtI4LpodfCfaiPhNFI2ZIu4QnLDzaFHqSiYe3O
	/XXHZOsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVbm-00000005JRd-3ta4;
	Thu, 28 May 2026 07:56:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVbk-00000005JRA-26ja
	for ath12k@lists.infradead.org;
	Thu, 28 May 2026 07:56:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S7AaWu1975743
	for <ath12k@lists.infradead.org>; Thu, 28 May 2026 07:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dTE50W1bsXAlocRr11xq4D566Kq+w3xqvpSkOq4Nftk=; b=NTpKuC4vCUCGx2Od
	hhlz9jf669+7o7EaCobZHcDX/c5FFeAhP3bgqAZI5YyMlgDEZzgxWj1brp9jrYRM
	Bpa1DGYmCUiKQ7K3bBQtUsfRVbYl57keeG7iIWvEUkybgwwY03hsa8QVkeuKDpRA
	jYxP47oS4AA1uAoq0HLYBatfDdf4ed0FHWiKYBHvn6PguYjB2+Be0FLdPO27n3s0
	zetVgoJRWZbOgobP3e9jP3ZyfUSKuiOvJGk0WnNOQJJmDqX7F9mCu0TpB/u8vsua
	GhYxIu3CV6q7kLJMEIZLkr0B7Wh3TEIleyBnL1YVylb/iauVgOclHKhPDl5brYUW
	JObNMA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3sv3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 28 May 2026 07:56:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso142360335ad.1
        for <ath12k@lists.infradead.org>; Thu, 28 May 2026 00:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779955007; x=1780559807; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dTE50W1bsXAlocRr11xq4D566Kq+w3xqvpSkOq4Nftk=;
        b=VXMCyWIJ40rGSN7jsKL0or84JjZbaoudMIuJ4ItbQSiTgYDGJmgBk/ibuprxP8i+Gp
         +LBL2u0iNGwGc0IwNrI3rVnY45Bp41URRh075aeZuzeF5Z4JCwJ/6BZOMUhqj6//EBXT
         tUNSUhNVv0R4iHgURQuLcKWSoDSSr0EFy9N8cAIxMlNZyZp/DcUv3taVYZIHyK6URUwD
         mDxGv9w4bwRfHsh9Ym5x5yE+4uxJnH8KzvjqblN8iGn34I8e+qFU7dUT7L4SUyN23QQC
         qwpfu1M44UuYsDV/cwDT0zravgFMytteZ8xJUVbNzb7DwbFGQQI/O8puMCYMAwmv6Qnt
         02bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779955007; x=1780559807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dTE50W1bsXAlocRr11xq4D566Kq+w3xqvpSkOq4Nftk=;
        b=fPPeLMkIh8ZDXUu7q8KQlXG0+r0FUH6952FdEzjiYqGT1F4uXeGS4nWG+fBGQYOZrZ
         MFkNbQGqntDza7Xged/SqBfEOxgyXQVRnLSRu1Bezpv4Cv4NJdXn/plj1cgwB1jbVVsO
         H/ZRmVCk5WjrzMdz15jbtscii/jiXl3fdVdyI3SCX4HC4rFZMzEwitFl/3FrJDh365so
         U4KyHKuPSuGj0czRuokO7bZg+yXdQ1KQzvVoO7/pdEC4D3VCWDkI496m1z6pGtCn6kPB
         0H7gV4keSbWcQCZ5nkeFml6ZHFiApGj6wujt1BDjkBZ377lfnomhP39+iTbPUPVwqjG3
         McBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7iI5OavRoD5j8fcaQDoTltINJZvryYuDtBT2x7fg5GQFUjifjBkI5gyLdyrelLIYz51+uf5I=@lists.infradead.org
X-Gm-Message-State: AOJu0YwPrxtWXNb0vpYmLicCixJOYA1Mdu8qfmxbzZCxqDuY65YdReA3
	okdfjmYgIFMflEAcWOWfBuu6zz+xmAfaoJVdYuCk5XXrZqVfxjkQrGQQHoqokPJ2xOyqqr7Q70p
	5x6fJZHXc+hwcvQqeYQ563cI414RZUUEeoigGQFpGKnfVV2CSJeRFWzmVL2cAwA6spteBMi/o
X-Gm-Gg: Acq92OFBoWVaVDvQDdb016PTpYZ/tMoGtM01aUz1zgyl4hn6QbqEMVbzr4d7Klaleqv
	1Xt5AaWkCgskKrRrFefZunBz6CkELrN7hOnKfdXw26NAHNgnhdUnFg3BFQIwMPUVH6MV6NoM3hc
	sGb5/dnlczQIriLJ5+K4q3bnsutHevr4fLMNOT+xDg+Lig4FAnIYjkH0ZfsWVFJdvSma5r+QKbY
	JNtNjSnqR9r099jy0rq9hDMNOcSP6zUfPFsEgOdEJmlwgV0shG0qD8txlUzyn4vvgUMYPmM2rn1
	s9LcO3FC7RD3SRO3gHDs/GGDWuTLO0V0gNtVaAkj8vCCCJBeW4HnOivrBwGwHo0Ix+XfcTLeWpa
	Ac7XGjsaRJ4/mSLiIz1mfyoe2Ckb9VC00I17Mu1ONbxb01XfiKRspkZehPJdLC3WwtG3PlPdKek
	sv
X-Received: by 2002:a17:903:1a84:b0:2be:3850:297e with SMTP id d9443c01a7336-2beb07726a8mr290233055ad.31.1779955006978;
        Thu, 28 May 2026 00:56:46 -0700 (PDT)
X-Received: by 2002:a17:903:1a84:b0:2be:3850:297e with SMTP id d9443c01a7336-2beb07726a8mr290232735ad.31.1779955006410;
        Thu, 28 May 2026 00:56:46 -0700 (PDT)
Received: from [192.168.11.105] ([124.123.82.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf132aea25sm1996705ad.79.2026.05.28.00.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 00:56:45 -0700 (PDT)
Message-ID: <a4ee39fd-f1d6-4b84-832c-c4eb0166476d@oss.qualcomm.com>
Date: Thu, 28 May 2026 13:26:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: avoid setting 320MHZ support on
 non 6GHz band
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260123144224.2216923-1-nico.escande@gmail.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260123144224.2216923-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PvVb3qYINoudfntiKeJS-LU4UIGauNk6
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a17f53f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZCREz13nqshT/on6E9YcPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=QzOFYGnyxmos3_uqdkgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: PvVb3qYINoudfntiKeJS-LU4UIGauNk6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA3OSBTYWx0ZWRfXy2pxJBK9PF+D
 Fr8zU8PpvP1Nu4FnyVoOCkxOGFLreaiiplhiDNA9HtlOsGZBOR5AjutIxQAdnRd+3eiKIu1NIeQ
 NJYoXas9sfAk1hBxBBtVbJ9uH+OwPCzvVAoUTLKCADOrik64Qy31fMZr9pqpzu9GJ1j2jWllhJf
 Q+VXGQSKiexUhrxy+nEiyjSTN1eEna+WwqyXscGIXocXAZH0d86lXOPoOydJxLVHdOfAVTVAw3m
 Ljb7CHBK8GgRE8SWjVJK75oRX6sCaU7MiXfbYZJQHFoTBXEVNGaCMIZVvlssofUefhciroqnziG
 F03V/nM/451FtDB9MGIm9rSWhDF692ihBNcJ/jARCmDc3mgpYg7n7Ka2TmML1qCfAadjCzezO60
 /lw4/hNtYqaji2B9RchXbU8nG41URAwzeDxwhUKjwKIry3A8CXqkvS4Oir6ARx01iT5uacAwyCn
 4Oy7+4B1RplqD4lGa0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_005648_578204_D7977493 
X-CRM114-Status: GOOD (  23.54  )
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

On 1/23/2026 8:12 PM, Nicolas Escande wrote:
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

This field is split across PHY capability byte 2 and byte 3, so should
IEEE80211_EHT_PHY_CAP3_SOUNDING_DIM_320MHZ_MASK be cleared as well ?


> +		phy_cap[6] &= ~IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_320MHZ;
> +	}
>   
>   	cap_band->eht_mcs_20_only = le32_to_cpu(supp_mcs[0]);
>   	cap_band->eht_mcs_80 = le32_to_cpu(supp_mcs[1]);


Since you said "On a split phy qcn9274 (2.4GHz + 5GHz low)" i wonder how 
firmware set 6GHz capability bits in this case. That said, the approach 
looks fine to me, although I would prefer to clear the remaining related 
bits as well:

   IEEE80211_EHT_PHY_CAP3_SOUNDING_DIM_320MHZ_MASK
   IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_320MHZ
   IEEE80211_EHT_PHY_CAP6_EHT_DUP_6GHZ_SUPP
   IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_320MHZ
   IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ


-- 
--
Ramesh


