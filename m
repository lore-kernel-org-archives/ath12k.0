Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624DAFB518B
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 03:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4mW63mk7YjycAnV8m19XiyzmNcB7vNqWdU77uD79T4=; b=0pH3jNQMTpsV0ZKrlKcZQDSjKY
	jSlSVDTNqqTICxrxTENbEbAMQdhGDFYrydRKhOJqYMQoOknk4vIAFSJPkHm19W/ndPY+NC+EkuVAz
	nuwC5K7JrgFEiyOYNKCoCdD6FT5OcrBg+fSaNTZ3Y+6Zqu1SdQ89ZnWJio3wq/Axd/vms1cbQShfu
	AiJre/gvpCsg9GFv6LBtAcEC7z2IEZTGl3ntGiUnLstorPJOMoCaP5m5du/QIq38DyN2vPSbRVlSG
	VbI8S63ws7qqNWTNOXDAOxwY7D3k/rKVY9Iv0QFBUifYE/cDt2xAn16qQ97lwXKjbjggtM/50ZVln
	83tk1nqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9xBp-00000005ppb-0UHR;
	Tue, 07 Apr 2026 03:33:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9xBk-00000005pou-2Rcr
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 03:33:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQ6qo3536831
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 03:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f4mW63mk7YjycAnV8m19XiyzmNcB7vNqWdU77uD79T4=; b=akweNyYoOvyz6F55
	M7f6YTOD1uXARJUfibItyciuOjRed+W4EZKg1+K1li3vcIq9FwH5EljjH6nRjMk5
	FzAU471a1xSIpKs79GagvxesEHLrFiLeNlwkGPD/xs7H71+7p1z07cz5aVTTgyHu
	xdIU/0qtqITLPB7E3WdjU1333jzC0jkd7M216lRioJJreKKNutnJ4g2OdL8+9010
	3GPmJQQMIS/mpXzr5xBJOfCAOnWwI1IJ6A9TxQ5bNXG6LxGC1Po2KD0y5D1o35N1
	h3wvi5KvpYEeIHLVaIZsl/Q1ARJDh2P5AB25U9sxjDBDrfB05hL+2pxKDemHyORG
	Uz55yg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra0unv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 03:33:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c70d1f65aso2619443b3a.1
        for <ath12k@lists.infradead.org>; Mon, 06 Apr 2026 20:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775532795; x=1776137595; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f4mW63mk7YjycAnV8m19XiyzmNcB7vNqWdU77uD79T4=;
        b=LwXSWgTUFy/a6nyqoYKFNd6O2PRTaH6gTzaQ9UZvupMhccySVfoFnlArD21hIA6npe
         Yc/+ZYYx/5ds20B/BHSoVkgIkVyJTvI5ZMeI0IODQmhv+fSuOijiqg7PkkQ8QeWqt+Gx
         SAGb9trtw3XR7IA9Ff1dZyfnw2a7etMei8Xa8nx1SU30/eWuj39xfUXVHoKO0BjaF+EN
         qCQENO25LYdhMtQN/YBxIJUeC/Azzg2IpziaMivr9l+CCZdVLWSegckrESkqS1d+1QFn
         ys/TUR1vySGOOuBuKY5pu8Wms0jTAlOrz73YhZJZABtJTl91gkMSbKN2JNbgsHW4NdOz
         RqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775532795; x=1776137595;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4mW63mk7YjycAnV8m19XiyzmNcB7vNqWdU77uD79T4=;
        b=sEiIACcWaVno/fO/pBoGGpmknJ9YqqaxSKVGQDR+qFHlcSJxp9FlbRuo3r3voDNXeD
         EPP0qj1KhGP/7lxoHP3XgdnQd4kroWLalIOTvMFdAirgF6pPhT4IQuu0KO4/NkhxWuxm
         UaUwYQ9LHOkLqyr3pBh3g+fUqmEc1qNGcLTJFyIRYNgtE4AjeglrjwswOUFZKyfFElI4
         HyoSQPWkosaIZpJvUvTx9En299KtUuQDXyOQWZWggn7ym3r8UbjEGgeNlh5GgTNcKdK+
         jQtLUrPOGPCRNT7cpCai/3YKbBL+a9tn9J39JWBl6oVrCm6VwdertI1qJHl5hBrI2QnD
         5fHg==
X-Forwarded-Encrypted: i=1; AJvYcCWwczDX9vTQaZLwiJLEqtVnHvUoUIbFYODcZc2MtO3p3hLNZh0EQ64y8bP3Gf0sVlhMTwGvQP0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJZfYRwWdPSAleKAqbid7iTDSfz7jAsE/H2KpCqbXluHaAWh8A
	9463W1CgGUeeDKwoU27qvF3zOYvqiyy+tsZi82jzhotphNFJ8jsCiU7AmBxd5Tn28o0VZrefIoe
	dzgE6xzfNKU6ZsA5EP2JjYy/Z/CufjENsTp9mM3VT8AWpmCWyKBrfPR0Alj2v0En3
X-Gm-Gg: AeBDieubqn5cEjywPgNv28tDoWyx0Ym+SK3SXmRRRQkc2CAVHk87oXtRUJwcI8DFDac
	JhYwRbDF8gUhA0BcXz0Bo7am0Wazw/cjkb5AlsyyBS862TuwZVSYxW1HYkKiB4F8/zqhqvIsASD
	hxD3ipqovsnVCEPhg8Q4xYsB3kAYMcSGdy3BYHw9lhmAQOvYr1cN/Xrhac/o7caLFy0SXr4Z70J
	FY9NezzwMIZ6pK80Xj7mrEv9uCZGo5QsQbUIbDFwGVhBbzKohdxPJbtsmfMZZ6Vw5MKCaIXtAqP
	rpkfsJPACb/8P5e0BgSL9yz1LE0UlP4tGts0TOOHfeRcqjHfyVqS71+IFbJLs7tmgtm5lc4wbvi
	a6SoFmBtA0pIzi8P5KfyYBqpYihm3L5zb1mydWU++GbUsGg0uJ+aIaEDzKRl/G/UdjS7dPYuX7s
	E0wng1YwhKU/IPPzrIHK8=
X-Received: by 2002:a05:6a00:9513:b0:827:3e19:574b with SMTP id d2e1a72fcca58-82d0dbb65eemr15287622b3a.43.1775532795144;
        Mon, 06 Apr 2026 20:33:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:9513:b0:827:3e19:574b with SMTP id d2e1a72fcca58-82d0dbb65eemr15287540b3a.43.1775532793222;
        Mon, 06 Apr 2026 20:33:13 -0700 (PDT)
Received: from [10.133.33.204] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5fb22sm19700159b3a.26.2026.04.06.20.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 20:33:12 -0700 (PDT)
Message-ID: <4fdf1499-4f75-4372-8bfa-2a9aac039d64@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:33:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Rename hw_link_id to radio_idx in
 ath12k_ah_to_ar()
To: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260331045834.1181924-1-roopni.devanathan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260331045834.1181924-1-roopni.devanathan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0E4iBWVdgaPH67kCdZPnl7uVhUsKS66y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAzMCBTYWx0ZWRfX5G6XYEwP0elU
 K6MUaV2MsWDks9vxo40cInf77+nbYXLPCNOL54x+iNzhc/HajcPV0XP53CfnT4tawvCSp5mEBMc
 ZPL8Ce22sj1pOogm2yzBk5WFqJQ2eBHhvZ26P/v3CmSXY/DKuIyIz/eSGdnQfqbm/n+oOPZA+tT
 +3Zhv+wr9KoSHw/FML0QX+YS/cX+QNlo9I/PqlFh7Ujn+e5cTw0WGNvkIMCiL6/znBi6WC7Foyr
 tbWXoToPZAYUh6lm2DFdx6+hjVpU4WmIXggvgwgIrsSZrJZJJrVgoioqkaN24q2IwAl3f0skHZa
 nBAdPC5sqOl9vXTeFgbcWZT2VBRS1P1zZUItHUap7ffF7TLE1qtBLYgVJXfktL7cZvg7vDv4RJU
 FLPlLHvd6jKZAcTJiyLig3ncZJv5M2fnJFktRIH0zZGE5rioNN3iZXqPHglirib512nrI/0zpvj
 Cgl95ycK6O+D5eMdyjA==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d47afb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qJTBxiSCcKiInWsf5WMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 0E4iBWVdgaPH67kCdZPnl7uVhUsKS66y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_203316_629020_07D2CFAB 
X-CRM114-Status: GOOD (  17.20  )
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



On 3/31/2026 12:58 PM, Roopni Devanathan wrote:
> ath12k_ah_to_ar() is returning radio from the given hardware based on the
> radio index passed. But, the variable that radio index is received at is
> wrongly named 'hw_link_id', which points to the hardware link index that
> comes from the firmware. This affects readability.
> 
> Resolve this by renaming 'hw_link_id' to 'radio_idx'.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 59c193b24764..5eff86827e9c 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -1366,13 +1366,13 @@ static inline struct ath12k_hw *ath12k_hw_to_ah(struct ieee80211_hw  *hw)
>  	return hw->priv;
>  }
>  
> -static inline struct ath12k *ath12k_ah_to_ar(struct ath12k_hw *ah, u8 hw_link_id)
> +static inline struct ath12k *ath12k_ah_to_ar(struct ath12k_hw *ah, u8 radio_idx)
>  {
> -	if (WARN(hw_link_id >= ah->num_radio,
> -		 "bad hw link id %d, so switch to default link\n", hw_link_id))
> -		hw_link_id = 0;
> +	if (WARN(radio_idx >= ah->num_radio,
> +		 "bad radio index %d, use default radio\n", radio_idx))
> +		radio_idx = 0;
>  
> -	return &ah->radio[hw_link_id];
> +	return &ah->radio[radio_idx];
>  }
>  
>  static inline struct ath12k_hw *ath12k_ar_to_ah(struct ath12k *ar)
> 
> base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


