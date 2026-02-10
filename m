Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56480E9463A
	for <ath12k@archiver.kernel.org>; Tue, 10 Feb 2026 03:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sas1ZJd0Kb7E7fpR6SS6u+XiXBW4YnNy2/f4A7c01O8=; b=njUjO0fW77x4KSmkZj80FEQbNM
	ypka2VRph70z+4Vz0pzNfUHMlVcdrdFi/r+XEBc5rT9GSiihQxVP/f1O0wE+PdT7qBVi9rXHHk4uU
	ywDa7VkEahi+wg2b6R88vI1Xeoq72PBFFoZfa2AuwsZcCuiLgriTwfpOlMWYXchITI4q9StM2cNxg
	WvMgLRnknlnOzD+UFcV6akYfwz8+zWeaT6WkXT1O2iNtogogCX49Prd8OdCgzqq1XP8JDWW1JMw1d
	iNLZ3slM596p6jjlR0LcnYTXOakeHJlU4GsfsNmpyd6wbrUKOPth/BScZALJbosZjQHKMuUsuSlAd
	vCbyxQ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpeLP-0000000GNF4-49eX;
	Tue, 10 Feb 2026 03:23:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpeLN-0000000GNES-367g
	for ath12k@lists.infradead.org;
	Tue, 10 Feb 2026 03:23:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619M46314003606
	for <ath12k@lists.infradead.org>; Tue, 10 Feb 2026 03:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sas1ZJd0Kb7E7fpR6SS6u+XiXBW4YnNy2/f4A7c01O8=; b=A4F17Vcwp4alj6/Z
	qDcz0EgakZmzbs9B5gtwkmXWH0rQOi2mULhDWoUwCgK45g/23l45Q644f+6FDXIk
	Wiu5zbp+y1BYJ9+fdZmI6MZJsGVGh+/3fL6GSFGVBm7xfHPkx4tZQwsTW+WLOO9o
	wj8r9bCRk0Z8o6CPKBSCaGikoi/mTFLkNu9Bz/yFTf/TJizGYrLHj1wFm+1D8UX9
	GN8MP2o2azYPsLL8P212DKBU0XLfSMx6+PVedjMLnLJ3WYOVlq/0QnhvCGsLHt9s
	oFFQm1P+mCFlvr+oHrjx3KIINAd9w1bxvAO64FrrCFNEpzLtOfczCXQ4OQS/XW4k
	2oqdxw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7r23gvb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Feb 2026 03:23:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81f48cec0ccso4747714b3a.0
        for <ath12k@lists.infradead.org>; Mon, 09 Feb 2026 19:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770693796; x=1771298596; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sas1ZJd0Kb7E7fpR6SS6u+XiXBW4YnNy2/f4A7c01O8=;
        b=OXHnrzQijOb9wRFoF6YJmWGEo9kSNms4oceYBNXi5SvJQtrh+sLYZeEXTRKQg0pGK1
         l9GHME3YvErDeY9r1N4p+WGJ1VZkqquthmvL4AjTNL1gJ+WFOdoaYBqoRWB5/tg/DWi7
         pzY0fvVqqRmggxsp8eypRoJ/KFfnEK7ZEADO8y9cBuGhiLSZN6qznwP1StvRwBhXEC48
         t/kjvmCWa/yJMB7m2bR2OERJRNxkaVzw01Dr/ca5GMJsfDn/zcRxrSDCWJQq/lRlrKn7
         WRYnqM8EpA+jtU90MKrmLhWkscp//o2VrgSrZRhICLlMcRtZgxF1elCBp6kV15wBuKVk
         Ja1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770693796; x=1771298596;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sas1ZJd0Kb7E7fpR6SS6u+XiXBW4YnNy2/f4A7c01O8=;
        b=vzGz4ATYiS4qysWe1fB+hQFSc+zWNRid2VKKFuc9Ehm0+JhSE/cujZCqz2wGS1LYWZ
         pk45dztNAQynFTKS7A6TV8MK6c+KJNMRz1w7Urh+gwWOqwqiCpuLcQo1US7WDONaV/im
         lHb6/7IuoeY4RUFHdtBEA9A2cIVAwy6s8JLN7q7QNx2IHLwHvtJkkJ/5xI2e+abk2gej
         Py+dEcfneajRZ5mmuzXr1vO3QVCFGNN52Pc1SS5DuLISE8uSRnapQYA2lp5MSTK+CwLS
         xdgOEAtl3/RtH6R2C+fE2sJXeii/pcIiW2ezRbd2J5SQIiixnafUlFCopJ9nlpCPD6KI
         JNRA==
X-Forwarded-Encrypted: i=1; AJvYcCUw7DrMWVhhxSbpfhKKuGeZeQr12shtzsNMSGCkNjbCDt5W5/akGa5MAT9hlD3byhuRR4TXPXs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyAi6zDzSnSKcjxHf2YYhFyfgrNHDx1/Tr1qeKy0UdqyuH9HKq
	9RQviHW7eo5fX65wvR4rcruW4+WHeLkfft8zzZaYcq4II8fZJvKbW0c9TuVdORfAC52nyGYYSoG
	N880NwcHnNdce7fIjCh+scuqrvGdo8OLPw/4O9K0GOhtI/VCQGifIK84CRdgXPlct
X-Gm-Gg: AZuq6aKgr6dIgViqu7uHPQ8PM/H1X+Wo1n0XbWz08PYxHiBQDXMFY2gxa/aeh0/tnBM
	tJKE3iPSGPvDlO5u+9jKpVvCzoaoWcHae5FtKQmWmQjbf9qUDyNBWqlKeiG05R07XXvzAx8jClX
	IhrXbOHFutGuSoSmJ+LbTEVfE14T8RXIRFY9LnDLfHBEdzZsDjJ3FRwcKmIgCul7blOmTTYA9UJ
	62IIWcThk+Rm2jDM9mDAv0dCx+ye+ifzeF333QAvnI+up1d7s62RHCHgtkNYYq513RKG0hNDSuN
	1NmSJa5ngGKvEHJLEd5dfr1VKy0ZvvmqcdV5459CUVWcM7fgliFsjzRliO2/bdFkxZqbXxSF+WX
	Xrxn5dVO+vkhiANurXLgMSNeEtWkAn4YV0oGOUsKXmCZd5hz7qhHI2AcYDspkW92Vu2w686fNhM
	cj+JyNTgTHT5wCP1ageA==
X-Received: by 2002:a05:6a00:b8a:b0:81f:3f6e:166 with SMTP id d2e1a72fcca58-8244170cf92mr11945067b3a.46.1770693796359;
        Mon, 09 Feb 2026 19:23:16 -0800 (PST)
X-Received: by 2002:a05:6a00:b8a:b0:81f:3f6e:166 with SMTP id d2e1a72fcca58-8244170cf92mr11945052b3a.46.1770693795875;
        Mon, 09 Feb 2026 19:23:15 -0800 (PST)
Received: from [10.133.33.42] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418b7cc3sm11804819b3a.51.2026.02.09.19.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 19:23:15 -0800 (PST)
Message-ID: <5823c5ce-274f-4c0c-b072-93bf418c02a9@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 11:23:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix incorrect channel survey
 index
To: Yingying Tang <yingying.tang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260210024440.3422264-1-yingying.tang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260210024440.3422264-1-yingying.tang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDAyNiBTYWx0ZWRfX4nLGhcfmo2xo
 j+otirV0HC6rS5oI7GKpU/qPZkF2p7fpU1ITJASkTCHYqE8gkfBIODXi/5yHv865gXPJcoD2d/r
 F6CnWBd29Wzrq9AduSTBR87NQdzKJazJVPtdnqmnubs3YDr+drzH60/eiz01Vi4LYdzxv9k/VJD
 vwa3wv2YT4czcSjJO8eHqdFGmBNMq3yiZFPJpFvJl0zx0rd2yusgyE+5i8QwAOb6fHeEmKW+g6q
 15098cUFhzV0Ft9sHDcZBkdnR1DIUXnB4ZPL13JmnU/Jl2tuZNd6fXJT72Xn/n4vReaVETzNiwS
 FmY8aBdO7epe2/OeW5325BLZv73ZvKFDm88HO70FiCQNl8eFmEuIf5fg01SZDUodnuUPhCz2bzL
 fHWndT9vSRUSck+rHz49D4SjgAoVswd9TFoLoovlglQlI42Z8/cTSjc6yz9fvsmp+xu+2fMwxSo
 WvI1JPPkJbuCI7vIq/w==
X-Authority-Analysis: v=2.4 cv=MLRtWcZl c=1 sm=1 tr=0 ts=698aa4a5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=_VGBLm3PVvvAHgW-t2sA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: lA-MMf-a1mc2Q951uh2d23bdjqp9g-QK
X-Proofpoint-GUID: lA-MMf-a1mc2Q951uh2d23bdjqp9g-QK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_192317_813194_689713FE 
X-CRM114-Status: GOOD (  15.03  )
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



On 2/10/2026 10:44 AM, Yingying Tang wrote:
> A wrong channel survey index was introduced in
> ath12k_mac_op_get_survey by [1], which can cause ACS to fail.
> 
> The index is decremented before being used, resulting in an
> incorrect value when accessing the channel survey data.
> 
> Fix the index handling to ensure the correct survey entry is
> used and avoid ACS failures.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Fixes: 4f242b1d6996 ("wifi: ath12k: support get_survey mac op for single wiphy") # [1]
> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
> 
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index e0e49f782bf8..86ce7d87b5a5 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -13086,6 +13086,7 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
>  	struct ath12k *ar;
>  	struct ieee80211_supported_band *sband;
>  	struct survey_info *ar_survey;
> +	int orig_idx = idx;
>  
>  	lockdep_assert_wiphy(hw->wiphy);
>  
> @@ -13120,7 +13121,7 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
>  		return -ENOENT;
>  	}
>  
> -	ar_survey = &ar->survey[idx];
> +	ar_survey = &ar->survey[orig_idx];
>  
>  	ath12k_mac_update_bss_chan_survey(ar, &sband->channels[idx]);

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

>  


