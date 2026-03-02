Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B92AD58E46
	for <ath12k@archiver.kernel.org>; Mon,  2 Mar 2026 01:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hg7jEDKqAjrvcGMc2MwAhzR/RK1kkh9IRIU9FZY40Ro=; b=BYXTpss6WdN9Cn9kpHz+cmVbIx
	jnV0EeskLh7qGxIZrKXcgT2gGhpLbxKDUVO5LUCpp4gKJUm0+Kq6rVkSn6Md/9IzHDsViPP9Bhudu
	bHLwIiu1Cpbi/5a5iNo37Ulri3K2p93bhWYSURS7qsOmFxaAazSdZuVEupaEyFC/tOf3vs+OULLjA
	nd6MSo6uwrsQ52H5YP7YEefsmr4+zPwctfQpte8j0YBtGUiBjiGnhwdNObuUE4+w0XDE2eA+mEUhE
	K9W97PQaTE8zdN7he02XfkZ8soMD+lUv1TkYnnE1X+rKIg2AtMTgIFUiBchKtBiCNJjcbuPr3tvs9
	DKt6IwjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vws9E-0000000C4Gc-3Us8;
	Mon, 02 Mar 2026 01:32:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vws9C-0000000C4GI-14rM
	for ath12k@lists.infradead.org;
	Mon, 02 Mar 2026 01:32:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621JHpIH1563059
	for <ath12k@lists.infradead.org>; Mon, 2 Mar 2026 01:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hg7jEDKqAjrvcGMc2MwAhzR/RK1kkh9IRIU9FZY40Ro=; b=X01K4PAelQNu1s8A
	M7ZzvufC3LO96Mwxo3YLBMEQStYsgoSr0sYxehBgIQfSR20Gw/VmBq44zDFHG3Ri
	s06qiaH0cnDpxKMJaD54VHvD3L7khIi6PN+TJ9ZXYkQ+h9auDU41q3ZtTRzP/jNY
	+zfd825zNa1XDe07Kq1d6h/xJfVLLkKpi1UJgVXetBLGzKnTUKF5ndIpxSH8lrhO
	Ul/sCS5APyBsTgVis0x33s6vaty2cFCFhTO61I/MO5ytvDEkkZ61825M7NtSGcOr
	hOTEMHNd2N9pchr3wSg+rtdFbajPPTDT8FVIarhKEzUmDQRsJgOlMuh+BsI8E1fw
	32NB0w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshkuh29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Mar 2026 01:32:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35982c5940cso732784a91.1
        for <ath12k@lists.infradead.org>; Sun, 01 Mar 2026 17:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772415152; x=1773019952; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hg7jEDKqAjrvcGMc2MwAhzR/RK1kkh9IRIU9FZY40Ro=;
        b=VHh4lGn67mbfVyZzUewWvrQgWateJJyMoXEROPnqD9czzV3LNpVkiMRl1/iS9zq787
         G2Tu//3BNuW/JtHcnj9TZCLQ5JiTeBxyuVR6ECrt+y4sqdTFOxGrxxtVQPXMWqKlZy6B
         NHhpuVMKYM6mtB3WTgf8wgyvxYRl6Im+87a7br8MEJAVnB5yX/Oq+HkGrSh47TlcmtXU
         ElpzKT1RsXwSCtUvlulE+PORbGyz/iLgMwdbhunRYp1FiKSGDiiWMPz/tksrWHbZGdrm
         iA9EYRUGJM/iG24JKrLzylY+MMCZoXRwvLB0xpo7i2NXU9Q69yKVhY0g1Q02TP8xdkfs
         ffQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772415152; x=1773019952;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hg7jEDKqAjrvcGMc2MwAhzR/RK1kkh9IRIU9FZY40Ro=;
        b=HGiBxML/r/cJ6BizVSTUbSTCNnJ+0k8u2hB6LfGlNCL+goCMFCSbvskeb7IKvAf1DW
         gv2mwir3BSPZj8vD0KA4KaEghCk6KUsT7ka+2Wowfl/ZM2ru1fVUlNXDw+/bXrkCZUk4
         r3dKMnA6LkEot4rRnuQlr1UsJspl1wK7qAlFJmUboS1TRTH2KWd+/XlByjORUI7J3r17
         bnjTTFogwzESBvYiZ3hl5a18VhwdAOu0t35wx6z3si2NgecEX+IQRUJ2HHdrtb5Y0hzU
         129XYX1iTNjP4Y6xvL9WkCStlORx6fmZ9HKj0bbtzO0Nx/mg77ekZDQfy4b2APYE9Bdo
         d7Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUXly86cezM7Api6Z/kOLhfvMyYaXcdDGusObU8p2QWuMUR9TchiN6jRXWdIJ1+N1xbZek68/0=@lists.infradead.org
X-Gm-Message-State: AOJu0YycvOy6PJ9yZZia826WtwGOgsnPnm4V9EUlxiLgxJU9Yho9A9R9
	aq5K3X5iWDjzLMoH47Ag01BrocI+BmCdJppirMpy9+s++VQWvnN8eN8fpRfDZNR7uY0LX0iJFEq
	b+SS5CFIO3lVAnhILnNigP4PaGwmJ5V7E0RgQ0O3be4Psk4X6UFpuy3zX8PgBnMVX
X-Gm-Gg: ATEYQzx/wDUi1koOTvA2zYQJ4QrpqbwKwDA/KcP54yzyL5qXYR0hR1A0Y8dYybHbpZg
	GCrKXRm42OUA+TIZIMdMa3eGFyaqjgojt0Y6KdjmpMSHeL0KUI/yIlDEQIlPhAtzvYeP/XCZyI9
	+yoCim73BMHYjnh8tKXSU2ItgU/7C9LrvYT98fwznIF9tJGEre40RAIMdgIs5i0RoOu64KTP0TS
	fXVVk6Zxo5Vy80hcQprEJBNLFx+qaON6uHj0dFSCEiZXXT4998s4kDcoQKWbQwAr7WlANWD9ZcI
	cwo8bh+8h/y5ZSj00R+5jJdY5Lbr0QjmC83u1iOYPwhynCl6IA5z1uVf86HHFGW2L5zneTPPpcV
	t21UCLDuYMj4dQw28Mf5onA7JBSbQrYnC7+9ZBZqpyuqSLTlEsFsX30TBsMoo23AASzxQh35Dxj
	hybQf+gP+gp/P003JeRwo=
X-Received: by 2002:a17:90b:578e:b0:34c:9cec:dd83 with SMTP id 98e67ed59e1d1-35965cca925mr8775008a91.27.1772415151960;
        Sun, 01 Mar 2026 17:32:31 -0800 (PST)
X-Received: by 2002:a17:90b:578e:b0:34c:9cec:dd83 with SMTP id 98e67ed59e1d1-35965cca925mr8774980a91.27.1772415151405;
        Sun, 01 Mar 2026 17:32:31 -0800 (PST)
Received: from [10.133.33.249] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35980594d37sm4719722a91.16.2026.03.01.17.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 17:32:31 -0800 (PST)
Message-ID: <86089c00-a6ba-4a36-af14-f63f557d1099@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 09:32:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Pass the correct value of each
 TID during a stop AMPDU session
To: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260227110123.3726354-1-reshma.rajkumar@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260227110123.3726354-1-reshma.rajkumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDAxMSBTYWx0ZWRfX3bhQa8djgqeD
 hV2vxzYE0JoAbFTILdvqiXvCUU7JFZd4Gwj+5MKJLUE2CuNqxHd+NpazTWlu1InaPerw+QOfQJX
 zA64xT6saw0zq1wAN5rMnCT+w7jY1S+J8Wv0wI8YlslQhhuPVXZViQXyTNPjvj8NdblAoKn7ufk
 rdbmpOcEmBkSRjWht9xJTHt+ULqB9SqjGBJSKludW2pNO2iYoX9JPhpiXOgMIzvkly95hN6zAwo
 C3dYpEVhk/ezlw5KfvZbdYVTDuvZKoPjiwgL2/iVzsTfCJ5TsNec9pEKqADTDVaP+ezihAwr6TG
 HoJlLhVupXCiWdSfb4KXkbPN6QMTgJXVEl55vlFgFZxiVcPa/ruGYhnJYrW91hKxW93vKYWrzfq
 HfWYMF9bLjKbZhXDIR7PsDiE6Nlw7R/j5zlpgBRcpLOfjMw0I2GtVqCoKd4B7OcDeD8OoTt5Qx8
 3zDVrfXEURbFbvrciig==
X-Proofpoint-ORIG-GUID: jg5DpB5b3vVImzPDC7BrEa4h6g3D0y7n
X-Authority-Analysis: v=2.4 cv=EvbfbCcA c=1 sm=1 tr=0 ts=69a4e8b0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vkfXM0Oplov9zySb:21 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=duuHIgzx20vBNMS0sRsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: jg5DpB5b3vVImzPDC7BrEa4h6g3D0y7n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_173234_440942_CDD1806C 
X-CRM114-Status: GOOD (  20.87  )
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



On 2/27/2026 7:01 PM, Reshma Immaculate Rajkumar wrote:
> With traffic ongoing for data TID [TID 0], an DELBA request to
> stop AMPDU for the BA session was received on management TID [TID 4].
> The corresponding TID number was incorrectly passed to stop the BA session,
> resulting in the BA session for data TIDs being stopped and the BA size
> being reduced to 1, causing an overall dip in TCP throughput.
> 
> Fix this issue by passing the correct argument from
> ath12k_dp_rx_ampdu_stop() to ath12k_dp_arch_peer_rx_tid_reo_update()
> during an AMPDU stop session. Instead of passing peer->dp_peer->rx_tid,
> which is the base address of the array, corresponding to TID 0, pass
> the value of &peer->dp_peer->rx_tid[params->tid]. With this, the
> different TID numbers are accounted for.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
> ---
> v2:
> * modify 'ADDBA' to 'DELBA' request in commit message
>  drivers/net/wireless/ath/ath12k/dp_rx.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index a32ee9f8061a..640f752eaa03 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -735,6 +735,7 @@ int ath12k_dp_rx_ampdu_stop(struct ath12k *ar,
>  	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
>  	struct ath12k_dp_link_peer *peer;
>  	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(params->sta);
> +	struct ath12k_dp_rx_tid *rx_tid;
>  	struct ath12k_link_sta *arsta;
>  	int vdev_id;
>  	bool active;
> @@ -770,7 +771,8 @@ int ath12k_dp_rx_ampdu_stop(struct ath12k *ar,
>  		return 0;
>  	}
>  
> -	ret = ath12k_dp_arch_peer_rx_tid_reo_update(dp, peer, peer->dp_peer->rx_tid,
> +	rx_tid = &peer->dp_peer->rx_tid[params->tid];
> +	ret = ath12k_dp_arch_peer_rx_tid_reo_update(dp, peer, rx_tid,
>  						    1, 0, false);
>  	spin_unlock_bh(&dp->dp_lock);
>  	if (ret) {
> 
> base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


