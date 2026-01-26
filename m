Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5CAC88E42
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 05:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzowBhmh4GyiafgZbDVvPBTe8h+TGbXiR8j+6f8P5zQ=; b=1B1ZtMeYjpI4w8RUthZFdmMSzv
	rWfFNAqtnFjAua4wRHnlzu9HUpNVRXM39NSVVWFq00ItKPEMvv7VluwUpKehTwA2gKGvgpEuuQr/b
	JsspBOML1Jf26+WNMyaXN4lSWleZtSscJrz63ua5h5M2/ZgyZ10UpgxsuXZsVyzsw+EE2up7DpEDB
	7VKeOq4gtOfkPaaumf3NP1ZKwGtxP/UGL+B1cMNNPvGQXgwHC6oH1+HGuTWxMiPrwOpnPbX9TCygG
	fFs8g3UzmZeDcnvKFqcZmfggfQRgp+b6FbTmaVPMwzWAh5ZveukaQmAjkyv/HSbkrLN2nAyZMzYl8
	F1xbMWZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkF3o-0000000BvtH-0NSx;
	Mon, 26 Jan 2026 05:22:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkF3l-0000000Bvsu-0sSO
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 05:22:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PKsLTp344832
	for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 05:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nzowBhmh4GyiafgZbDVvPBTe8h+TGbXiR8j+6f8P5zQ=; b=J3asSMv2vynvxwyZ
	ZfhjTWx+/dxzpReukXbBHERknAYxXomhZEgrY5OsLa0EpnfCnNLkQPRrMjmoDVNs
	q2V/ga5W/Zpl5tSH1uw3WPkTuz4B9MOLfhqIBr1EvOfbWxRPcWhwvqg+cMT2P9tN
	TcHT0P8j69/rCITYTeO0LPi09XaidXNhY2Nahy1nafvCmyG1ds0Gjv9vZhQNT2s6
	495I/yOBz9hEXL5PKB0tarMqp0mi5W78O3fimkpZ7/UrMvCmxxl6Xzu7t760QeDU
	LdMgR0AV6tqKe07SfIGkiLkseZlXg/iVwr8PCBezja9thLMUnf3kdKP+yTIUNLxS
	uVbZLQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9tueth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 05:22:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c5291b89733so2369379a12.0
        for <ath12k@lists.infradead.org>; Sun, 25 Jan 2026 21:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769404963; x=1770009763; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nzowBhmh4GyiafgZbDVvPBTe8h+TGbXiR8j+6f8P5zQ=;
        b=XyAOM9j/AvgT9fUEF9nO5j9ESLygKcxhtQGlVek4iVuLpFoSeZHsaa8AEnPrtwldVK
         +e78Z3GEjLbRZFst95lAS/yc34tHdY0myQ3cC+FAXS0h9mLVW+IMBb+4ipP5+RG3yNN2
         PDFdmbxmMY+Y2H6ccDPKXYM8W/fYpC8KXsCORPpPPMBcQmH4RtGF73KI7A71WiGuQP5B
         +gXFIIoIyHCNqjm8+xQsEuihb01fHn92zuTsNiadofjp1AwDKFT7kEFbuDMQ/lOLBN5H
         uXTkORHPFGXYwjJTA4kkSb1G9m418mFooca1c/miqgy2qAOJ/VOqPapD6c4xXgEgssyM
         gVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769404963; x=1770009763;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nzowBhmh4GyiafgZbDVvPBTe8h+TGbXiR8j+6f8P5zQ=;
        b=oStY5nG+7f5kWoI0/7+I1hVFu8voTMtzGdV4v9ZjjvvjSOGvNseYLdlw0jI5DMHA2n
         qEPmSLwutmsYpZn++L5jPMuqDYCOOTZcQ/Z7XnTONlT9nb4nClRQt76Z+HJeeR+gXZQ5
         d4Uw5VpMTqIEe0BC3R+SPmuA0PT5/8zJjAMwFRHKXpj8t4iartkkElto1+Cxdwq5rj7A
         uiPRv9TwYDBPXwxvnYZijJAEP44Ffv/sStoiiXvKFz0ucsKl6uW1Mp4JC3bjBy1wKjJ2
         HqAnLhw0SalOuNCXs8PaG2UwWNCp+hSzeoWleHIOUdNYHlZ/sdAVY3i90XJOyJj6e1Zz
         F0sw==
X-Forwarded-Encrypted: i=1; AJvYcCWNL57b1bNgZa0Oiaz48UhaTLGu5GWF4zZsR3puzrMxSjlGSVvFUgXGSoH+M+Qhw8oUJszliMA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEWrz/E7TLToh/PZeki+VP1FIEUSbyrvudkDrLLR7SjFZthR/e
	16VpEdBPGKmEluOTxrIcflwH2dsL8jYh9q7ilBrVvOgDuvmWPw/6v1yiLagH85vBD9ZelNrW8pc
	HripTfx6Ud+r3tLjdJMp8LMGogdUatJcU7u4llTt2niyrvz6kvyZJNUM66pTtDoOr
X-Gm-Gg: AZuq6aI3ePph1ZUhffSana0KMtklNl8Dwrc/xjT2+w7+7JUOTXlaZ1QQJDqExcsn5cC
	Vf+sEPQYMUuCdDmPkyxmLQiKuIbKArmmENKaGnkzu/VV0PX4HGU7L5wggJE4vFhGmvFrY7r0hB+
	t4+ENSlI239wLHsIAG1MM3sObTPZfbCaEC5yNifWyRoBItMjO5ugHVZpyDAG0afYwHyK2vl8fF1
	SBeBFy+LDkOuRLdH1+1A7LbZ1KcS6iwLlivjOloAGm0pOCULAiLWir1g4M3Zoke31zNoN5UN293
	sOx045iJSKP1yoUwG2qYePbuomKl0W2htmmjZ7nUv4KuYdk2Tk21O76inGV3D1QC+ZuWDdZKEU9
	DjTUnxZlAT5AMf0BK6iSmr30TAo96yChiznzSzWdo9TLGZDIiuYXI0XwX4VQy9fai0dzndYw=
X-Received: by 2002:a05:6a21:e598:b0:38d:f0f3:b94e with SMTP id adf61e73a8af0-38e9f116422mr3045932637.24.1769404962606;
        Sun, 25 Jan 2026 21:22:42 -0800 (PST)
X-Received: by 2002:a05:6a21:e598:b0:38d:f0f3:b94e with SMTP id adf61e73a8af0-38e9f116422mr3045914637.24.1769404962124;
        Sun, 25 Jan 2026 21:22:42 -0800 (PST)
Received: from [10.133.33.199] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a142e71sm7592156a12.11.2026.01.25.21.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 21:22:41 -0800 (PST)
Message-ID: <6a3871ae-e926-47cc-a865-a9a1a786b535@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 13:22:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix firmware stats leak on get_txpower
 error paths
To: Saikiran <bjsaikiran@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, kvalo@kernel.org
References: <20260123155750.6007-1-bjsaikiran@gmail.com>
 <20260123155750.6007-2-bjsaikiran@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260123155750.6007-2-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA0NCBTYWx0ZWRfXz6f7X0aKgrhr
 bZ0W9VlbIJNVvicau82KnatTgOQHBCKvsFxF0KxpzgR7+DFO4e/hl1Ye9VtU4HaOkvpnadSTMbM
 57wlrK6pvx4+FkbMTy98R3XOhNvvUFOOIFk8cxXcrk2GyPDYCT1hnIlZ5IVOuFspg2k+29aMW5v
 UnE6oAVSDxZEBngafI65rHMGqzf1wZ4tMCT7UFpVrn2w6C+R2NG1ZJ4NstL03+ylAZlxU4sEnZs
 Ow2De6MKpX5TJ7TscSgY10129d4swiJRpVcznIdom8uZasgpJrOupLV3+pkNA+IsUcCmKeU7iEQ
 GSDTJPzUq15VOYM8lKP9gnIqN+YZA1h6aE8R8crPJaKDx+rrfKLcDh1uXpy/4rKeEFCHjGaSLbn
 ONZ6p0ZEfHfpAqkMZDovAVmE/JODbu0WefO+sf8CmVPObzhdUhlkMRUfDygj+1ocV0lF/ynhEcd
 lUP8y3ioY9oxS2IWYWw==
X-Authority-Analysis: v=2.4 cv=QN5lhwLL c=1 sm=1 tr=0 ts=6976fa23 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=danhDmx_AAAA:8 a=pGLkceISAAAA:8
 a=oXzjqz-Yo2UKM-P5LK0A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 9JdombOIKks80vx5Ra-JjXVcrAgaxQni
X-Proofpoint-ORIG-GUID: 9JdombOIKks80vx5Ra-JjXVcrAgaxQni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_212245_419665_7D73DB4A 
X-CRM114-Status: GOOD (  21.49  )
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



On 1/23/2026 11:57 PM, Saikiran wrote:
> The commits bd6ec8111e65 and 2977567b244f changed firmware stats handling
> to be caller-driven, requiring explicit ath12k_fw_stats_reset() calls
> after using ath12k_mac_get_fw_stats().
> 
> However, in ath12k_mac_op_get_txpower(), when ath12k_mac_get_fw_stats()
> succeeds but the pdev stats list is empty, or when the stats request
> fails, the function exits via err_fallback without resetting the stats
> buffer.
> 
> This causes the stats buffer to accumulate data, eventually leading to
> firmware communication failures (error -71/EPROTO) during subsequent
> operations, particularly during 5GHz scanning which requires additional
> TX power queries.

IMO the description is bit generic - can you please describe it in detail? like the code
running path? At lease in
ath12k_wmi_tlv_fw_stats_data_parse()/ath12k_wmi_tlv_rssi_chain_parse() there are several
places returning such error code, and in which exact place is it returned?

> 
> Symptoms:
> - "failed to pull fw stats: -71" errors in dmesg  - 5GHz networks not detected despite hardware support
> - 2.4GHz networks work normally
> 
> Fix this by calling ath12k_fw_stats_reset() on all error paths after
> ath12k_mac_get_fw_stats() is called, ensuring the stats buffer is
> always freed regardless of the execution path.
> 
> Fixes: bd6ec8111e65 ("wifi: ath12k: Make firmware stats reset caller-driven")
> Link: https://bugs.launchpad.net/ubuntu-concept/+bug/2138308
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x)
> 
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index f7a2a544bef2..4195364cb6e3 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -5161,6 +5161,7 @@ static int ath12k_mac_op_get_txpower(struct ieee80211_hw *hw,
>  	ret = ath12k_mac_get_fw_stats(ar, &params);
>  	if (ret) {
>  		ath12k_warn(ab, "failed to request fw pdev stats: %d\n", ret);
> +		ath12k_fw_stats_reset(ar);
>  		goto err_fallback;
>  	}
>  
> @@ -5169,6 +5170,7 @@ static int ath12k_mac_op_get_txpower(struct ieee80211_hw *hw,
>  					struct ath12k_fw_stats_pdev, list);
>  	if (!pdev) {
>  		spin_unlock_bh(&ar->data_lock);
> +		ath12k_fw_stats_reset(ar);

curious how could this help if the pdev stats list is empty?

>  		goto err_fallback;
>  	}
>  


