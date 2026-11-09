Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D9D606A31C
	for <ath12k@archiver.kernel.org>; Mon,  9 Nov 2026 05:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ozGuMC/5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=qaBFsdW1;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nPDMlJYS;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jwAh9LaC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g7RRgfA21WlV7i8D7fmlmt9kQAOg5FueD4hA6+UfHgE=; b=ozGuMC/5XFYeen
	MalqCfnkQnHcVwT6hd6HtmoQuYTctESehgTu791aaHzak7kQ7B1z7fdZeFUB8Pxe4zX3squF+ScyM
	6ZnFHSFZno5FZWjsaAMqu/LwUpARmlH1oqzzLIC9ZfhxaF0Ml14Nk3qccKzE5/0kfZiB99wyqqt+C
	zZrBdCwXV0aVJfy4MRuL4YtLEsYDDImIvZ2rc/dzENoqhlZUJ+c4g2thXKKbo+r4LZSJRe0oNso1W
	AsleXhP3DPb7fV7E6l2pYrE8f3Ja71LLLkKwetSxuLzpcK0dFIQMQXRiGCwaWj11H8GziJxyIuBta
	wTzryKFhM//GSQpUl9Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQI09-0000000HQJL-2mlQ;
	Mon, 09 Nov 2026 05:33:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQI09-0000000HQJ2-0OyO
	for ath12k@bombadil.infradead.org;
	Mon, 09 Nov 2026 05:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=g7RRgfA21WlV7i8D7fmlmt9kQAOg5FueD4hA6+UfHgE=; b=qaBFsdW1EMJ8pgL3lznmvLUS0A
	QTPQsQK0+GaBivxqObTeghsyBHSoX/IgUu5T70Nt1lrc9Yxp/KQCVqP8Q+5vSlDtSr4B/Mla+hguT
	j0EmBztUHIzmYwPWAHv0JlTyP9QVDqwZEeCtYd49SPKsgVUSGYzuLyisKwL+y4SMn0R7ykpBP69PY
	0XYW6SXQv84zq/+UjQGatDbnPcQSfjzdVdBVHyuDSYxEiHNEnyZf3/BJGGox/SG5SGqLkkRaadZ5l
	NQD6IRzqUbs4NxpB9U/vuBmz3YA4yevkN8hVaTAsCezSrTVVh0xtVmnJe2sUAGz4NkgAg0PtyhZKI
	koDduZBg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQI01-00000006KWI-1VgN
	for ath12k@lists.infradead.org;
	Mon, 09 Nov 2026 05:33:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93K4kU3222719
	for <ath12k@lists.infradead.org>; Mon, 9 Nov 2026 05:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g7RRgfA21WlV7i8D7fmlmt9kQAOg5FueD4hA6+UfHgE=; b=nPDMlJYSrPzrtjMg
	ZKcDjQ7BK/zqx0h+4G2JZ4BMluWz3Z70q18ZhWx+QvzFZkIk5NNdQLnLE9T0a9Qe
	sFDwNsoLLh9nI6BVVCBzmZDb2BaKsXhBm7qBm/PK+UghJeTJ8Vkjzd3s5Puu7/HL
	qY+l06rROO9RmshsI9QhUkl6Ikml/Y389uKVnMCkINU6tPVAzzsool6PGU6gUf6o
	IbYMYnpfpu2xTdkeob5ZAB685OSmu/Spb6Vrbdn5a809TNuyyYEGYH2SF7XNeWBn
	M7QScER98AMfHF5Wh3tCPlAQK7yUj6EClTeuj79aLGhYgtmCO7JZBRuG4wdH20jw
	UnNA0A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv734r2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 05:32:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so463503a91.1
        for <ath12k@lists.infradead.org>; Sun, 08 Nov 2026 21:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794202374; x=1794807174; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g7RRgfA21WlV7i8D7fmlmt9kQAOg5FueD4hA6+UfHgE=;
        b=jwAh9LaCPeuxAFvlrURQWGyUyoj6gtCbBsejeJKZEzYB2q/Z4LVIy/DQUgL3q8qXfd
         OkReFuOpYNdYwO0ygNBSHDPUMu2RoHJFZ51dfj6Fxy4AWcvIKGEYe8+3sCeX06dNZRcg
         57Q/XsmN0X5TwQkZPEmp2AeIcsO5YJxCTwriZgFiugN3SefjfhhZMEJ03rZ0bVNIjKIY
         ZPSUWDeXbAA5zYlZLsMgtnEbb2/rJMpkfTY/iSexE7IQCyiR13i7+230myMJs+gyjg2b
         s7+bukS2q7HTbW2h7uEnkbCz896HPnQowVxTskJb3A/afXSc7q+HWD/NR5bbm4xWuGV9
         Vb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202374; x=1794807174;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g7RRgfA21WlV7i8D7fmlmt9kQAOg5FueD4hA6+UfHgE=;
        b=gABdC6qnYgHjz9YaoDRF03WJtZyS4jp6zQW45YceUeq52kv4RBecOgLf3tvoge8EL2
         AdHeju5e+vfbWL47uT9Ix2zepY76arzJR5qyKR74NQuHpy/pli1ToNZ6Qjv8K//0FrDM
         oMAOStNAGeLcwq9902+/6QVQKsaSK+BxaqkoJgK5iBb/gWuf2r6nMBRSbbe/NbM/yBhb
         Uk4Pfn22f31idOUNd1vu6ybMdrUQc9SPtvbEA11+7sd0hBIhACeKieBucaumTiEEjCEF
         Hk5MPxBri9NKh0t8qIFAEyRSm9Ml+bxkZRJk3jWSGrXLDMJlgaWmsQv6jpNf6qwNPBWV
         i8wA==
X-Forwarded-Encrypted: i=1; AL+hErE1GVyhiowBqmstXlqVkKo0Eycz/vJkgcBubMHb32Wr1iI93T/wKRNiN84bP03vV2ATVd7cuOA=@lists.infradead.org
X-Gm-Message-State: APuU4Z/yu7nGlziWGxdxvHAI79E5hS2aKJsF51OGoKDf/nYl/KnQQ7WZ
	4MSpCREJYvbNG3wmBTQUM7a4IRr7HpkS3+yZVkubiv8TYTVJLyM4lWvPMqff1lpwqclzKZzW7om
	VTYO15e+GWOQUuLfWu9WsTWyh9IrNxmey3iMFD5JBQioqzcOlKuyPI7u6v/7A4XMp
X-Gm-Gg: AYBFou2dZJR9jB/UDtCm83fepoMKrwt5Wz940ybF+jF0qlrs4lIqTnw3XdZCEaMjP43
	PE4rBGTpZBCvoNgHKQcIDhesu7t9EhQ9LbqcxXcfyYNoGdZDAX0yjC6O47p6PeeNOnljEigVJEE
	OWwIpSk/tGNqjFtlvXtYAZwipChrfqSRKcWLqQYeJzkwdebz5pIyFxJQ3AO7Qg2BoRaXtIbZJBw
	50PA1TvAY5kZVkISlYaAqem5VTkxRz0S0YjAprhnfi0cbs4PVOMVV8Sm48DdWDDnKKILhoMDBsv
	mRKK+Ir34/lvcBUTVOcQmSKQ4hjJ4Blqvn/0e6KQwfusxZjrazKvrg0q22J/DO734i1iAPe9G8c
	fgf6fixk0+I2jrQIak+C23G+TscE2IKJSc1SH2IB4uhVainofGSlcS9wHI1xbGPvvLXKaWZ8xi7
	b6fmc6FUZnV2QD7CFz4fOR0KHwG/l46AqFS8smHytR5mF0Ww==
X-Received: by 2002:a17:90b:164c:b0:3b0:9882:9e5e with SMTP id 98e67ed59e1d1-3b12d41927dmr3188497a91.18.1794202374470;
        Sun, 08 Nov 2026 21:32:54 -0800 (PST)
X-Received: by 2002:a17:90b:164c:b0:3b0:9882:9e5e with SMTP id 98e67ed59e1d1-3b12d41927dmr3188478a91.18.1794202373940;
        Sun, 08 Nov 2026 21:32:53 -0800 (PST)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b139d0a166sm3096629a91.3.2026.11.08.21.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 21:32:53 -0800 (PST)
Message-ID: <4ae460ec-fe87-44e4-a6d2-e1d7f6391fba@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 13:32:50 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/3] wifi: ath12k: validate RX frame length
 before undecapsulation
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: Wen Gong <quic_wgong@quicinc.com>, P Praneesh
 <quic_ppranees@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20261016-ath12k-rx-avoid-realloc-v1-0-0ce6cd99dd5f@oss.qualcomm.com>
 <20261016-ath12k-rx-avoid-realloc-v1-1-0ce6cd99dd5f@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261016-ath12k-rx-avoid-realloc-v1-1-0ce6cd99dd5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyMSBTYWx0ZWRfXxzoC5c2M9MeG
 X4voNe41/8aIHuLLJDIkiE+CDkaTj9KIUt0Nwe7Q/Q8yxSV4Ik6iYH0N3yvO/f1/SgQpdbESlu5
 +iC6S/yw4rFQAuwhUVWS5Zto5KCIfe+R/3hIIW5sIYEHUgByfrwRIA3Z9B5CWMsQ75LYFlhUgqC
 N46qakIISdFiCJRANwh5y2ENKwdCbYW3El+H/tnGwFjt4FWlGQd05Wk7lN3HU9mkKQr5D+1o+0w
 dkAnHcrerh5xYJTBm/BR1GzwpSdgxY40CNsliiVzlskp1NMraTYrZcQZSh0saZhn4O5jm8XxMAc
 3iy+SacFBsohAHkf5BY5s7F5Ki3ppM6MDprQmEjwlCEqLEK33lYvdPbsLjzU7kPK00MBzRRn6uq
 7bX9Aw2X3UYXB7Q0riDzhqCajjdekzA4bOVzglu5JvRVUXNosD7W4vLCflmWSNO1vo1eXwMsht3
 cj7JGOcd+U6zHtXfH1g==
X-Proofpoint-ORIG-GUID: -oiFKjoFHtYDc_scz9Qq-_e0XRLFTcnN
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af15b07 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7h9L7HgKJt0xFB7aMYkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyMSBTYWx0ZWRfXwzjceK0h/2qm
 G3tCH8FcbOs3/ElXJH6SilhZFF2TKHsY4B5i95di1rtqszEPT0SMGDu9FMMzv8Shl8OiMpalwS0
 r7BRdyWxsnvo06Vd2zmULSsS/9l4axo=
X-Proofpoint-GUID: -oiFKjoFHtYDc_scz9Qq-_e0XRLFTcnN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_053301_142180_1F358011 
X-CRM114-Status: GOOD (  21.18  )
X-Spam-Score: -0.9 (/)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/16/2026 11:16 PM, Lorenzo Bianconi wrote:
> Reject truncated raw frames before removing the FCS trailer. Without this
> check, subtracting FCS_LEN from a shorter skb underflows and leaves the

skb_trim() has the check itself, so there will be no underflow?

> FCS untrimmed.
> 
> Also verify that the frame contains enough data for the 802.11 header and
> the crypto header before moving the header to make room for the crypto
> parameters.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_rx.c       | 46 ++++++++++++++++++---------
>  drivers/net/wireless/ath/ath12k/dp_rx.h       | 10 +++---
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 22 +++++++++----
>  3 files changed, 51 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index 36be543b7c50..40b8da34268f 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -999,11 +999,11 @@ static void ath12k_dp_rx_h_undecap_nwifi(struct ath12k_pdev_dp *dp_pdev,
>  	memcpy(skb_push(msdu, hdr_len), decap_hdr, hdr_len);
>  }
>  
> -static void ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
> -				       struct sk_buff *msdu,
> -				       enum hal_encrypt_type enctype,
> -				       struct ieee80211_rx_status *status,
> -				       bool decrypted)
> +static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
> +				      struct sk_buff *msdu,
> +				      enum hal_encrypt_type enctype,
> +				      struct ieee80211_rx_status *status,
> +				      bool decrypted)
>  {
>  	struct ath12k_dp *dp = dp_pdev->dp;
>  	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
> @@ -1014,13 +1014,16 @@ static void ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
>  	if (!rxcb->is_first_msdu ||
>  	    !(rxcb->is_first_msdu && rxcb->is_last_msdu)) {
>  		WARN_ON_ONCE(1);
> -		return;
> +		return 0;
>  	}
>  
> +	if (msdu->len < FCS_LEN)
> +		return -EINVAL;
> +

every later trim in this function has the same problem: msdu->len minus the MIC, ICV or
MMIC length is not checked either. should we add check for them as well?

>  	skb_trim(msdu, msdu->len - FCS_LEN);
>  
>  	if (!decrypted)
> -		return;
> +		return 0;
>  
>  	hdr = (void *)msdu->data;
>  

[...]


