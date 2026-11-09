Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA279606A321
	for <ath12k@archiver.kernel.org>; Mon,  9 Nov 2026 05:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KKU8/c6X;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aI+BrLtd;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LoC0ao/2;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IwDJr0pl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zmqHuPAzZn1DNiHHKILm13x0Y5axH8HFFYvD/AHS9iI=; b=KKU8/c6Xi4UW4S
	W7Ok5xbF171rSCwBCPhrly9At7QibKxDBbTCZ8yRDUMI5dPn3rhGv2MOjLuUkr9ayFG+2wVZLm9/X
	r+xuvxS+8Qi4Zd5YYAuDoouydPcRqvouWs2sT7HUDuoiLiYftS0xL0eHljMzDVY6HedATaP/fSeZC
	Yc/4XgOG1V3PLZeOWxB09RNnGZmW/LE4rHdQwPz3p1eoq4hCGFZJTvWgg8lDQOgKM+ZWLEI3pmYPV
	AJxSzW14OkmkWqBkGJnVopV8Sp77o/Gpyffg53kiNoQwbEuCvW7MuTh87wYhtbta6Uw0eBWra4uMT
	3W3IdFCvaWRQqPWwv1Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQI09-0000000HQJF-2R2Y;
	Mon, 09 Nov 2026 05:33:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQI08-0000000HQIp-0kfH
	for ath12k@bombadil.infradead.org;
	Mon, 09 Nov 2026 05:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zmqHuPAzZn1DNiHHKILm13x0Y5axH8HFFYvD/AHS9iI=; b=aI+BrLtdZCv2XAm1+Au0JSoudp
	1wkdDyCwppiwNuSM9Ubb2SXKEPLSHgslCJA/M/NocMbbAlL30S/Sy+voU0q9BAtxGj/0jio4bFU5L
	kUFl+lxnrF+xpI3Gs9GE8AWX7gUXg9hbyyTrLnqzB5GJzxfL/cWwUBXOETPm8mlwBX66f+0jF/h5p
	AXpveJwunbvH9r0NOQdzAEa6pLn/0BGVcuATURTboWjjxGXceyBbgdGXO2G3bEXDSkxJ5kAeE8kkd
	yNAdszuB2+QpW6Hfebixz/uGT1+Nd9QvOfjAURMI7/YNMNEDApQi4P0ITwfftdojfw+VPlHAbh1Fu
	WF9FqiDw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHzw-00000006KVc-0dIq
	for ath12k@lists.infradead.org;
	Mon, 09 Nov 2026 05:32:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93K4aL3222673
	for <ath12k@lists.infradead.org>; Mon, 9 Nov 2026 05:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zmqHuPAzZn1DNiHHKILm13x0Y5axH8HFFYvD/AHS9iI=; b=LoC0ao/2P49Zffqq
	7MlqpXsryEyjvqrTu0UWpyNLuXwh5xrMvkTE6J0cyw0Jn/Phswp9NBq9BAJ2NNQs
	HI305aXlXqQtK4vDvjYenYT1nX02wKnJX0m27UIT+EvBXVAn3BoMRwc8wDlUnjMS
	NIH5aAcce26i6JeoSDf/ZbjmEe+OFt7IamN5trJ1zdcgjJEYybZyR0dGls9AR/j/
	xabF6kzUJydgoEtox/DVVK2OhD33hwQWsN81e4/3h80UTg2AYhfOFv6fdWO6jVWY
	Rf2nwSpCj9l0Oh9sW9sDVg3IMMsV0HOXJ5dVLXRwLuoHY0uiY/S0Pygc1m7kKfu0
	Fa6Uag==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv734r2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 05:32:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so618549a91.3
        for <ath12k@lists.infradead.org>; Sun, 08 Nov 2026 21:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794202367; x=1794807167; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zmqHuPAzZn1DNiHHKILm13x0Y5axH8HFFYvD/AHS9iI=;
        b=IwDJr0plC1ssNKjQBI2PRv34TPIZLFB4zPq6lZQnrUo55fF/or1KjYZ+zvYfu7e5mt
         xqa/And7+6OhZIKrmaN7iJ/5bvtirUo6oflOeEiQosPfHu+9mvV96WGkEw6RhGfD2116
         SV/XHBwkM62g2/E4O+EZYdTn4ihrfrxTiKEy02Oe0PJAYMLs80xlQprOX1OXRTuJWBVc
         6Ihd6iaB1NymFTJHJcBSliH2CE9C9Xxc1x0ZCBDilfTW+DTeXhyAZbtCzyPP4FlcO9iW
         NpAx2T4ve3xgnkPHrUY0L9wxqoEqpW0UIzcl1xExqYlhf+mc2kiCEVlk5kK4xDFsP3Ic
         FgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202367; x=1794807167;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zmqHuPAzZn1DNiHHKILm13x0Y5axH8HFFYvD/AHS9iI=;
        b=mevtXOLsYuMHddaY4A8pf7fOqzOtwO9mz+4Ls6YWhHuD1vzF0aUu8GxYXpm3mKSl7Q
         ENc0gos1gXQ7/o6WF3xlH17mEQf81rSKo/slvNz4GCxE8Nd8B50xLm/4ObitOGFS61ex
         o98VcgleObNzTLXJCuj4+pygvm/Lqo0mOaSiToQKxudUWL2tfIoUrIEZo2ZjAqdWYzJ5
         P1/XS8Hec5M/GHxHoiaHCoP7gjzwumWbgd1DtfReMvM8n+FqdzOx1BJHfnwI5QyvNhfr
         5KbCCo6IBNrqkwg1IeQ8oGn1F/M7MxctGNu5OpUadn7wVNIVDvPNnuWado7wu6EuYPIR
         4wlg==
X-Forwarded-Encrypted: i=1; AL+hErGcF6lifGOUV5P5U6MDZVD1hL1Mzqm7N6Gl6BqX5oLJIvLCvTxULhs542/54aKeaXsQGgYeisc=@lists.infradead.org
X-Gm-Message-State: APuU4Z9HD/UIW32nfMUDEsKKQXEtmhWV1qkqPLBvtQXGg6b8AVPM1MKQ
	3GXCtigAQISUNm0ag6QdxROFAv0e6Z3BRZJc96xVQNhWRB7PxZ4d95uRj9gXRb10cpJQaM+Xj0R
	YqwpqJqs3QIyg+mdp8cTipG/0Pl6uYzv0GU19o0wXGxQuz28tqEeEdIg2EA3/Ng0d/lVlLhwnsF
	E=
X-Gm-Gg: AYBFou1hSEglQjLuqARgk2it3mS1+CZSVlLf7HtWywxmfOVa2rGBxYtfP+wCUzGB8oF
	/mqp478zu/N7VolKxoJvumqSvd8/6tp6vALsqXjhnd9LDsp8IwJLL/xMT6ipw+DEHNbQ4hosnO4
	DRqeAeHlvdgNXAkXKu683WqHuwZwoFTZWUTQygdB1fcy5YFlZouDS4JKA8frafS8VBs4BrT29yO
	R1hRM1Iwf2ghlamS9P5ABzU+mP4cAxGoZU0UrrQJtoiSzpp3gUmWRn9knuwUZP1rfQAMPrMIJRh
	+H8nDAtau9X8DAPe3ewIXud/ojLtfgLQJZjDHf48YFoTRuJaeJc4PtqOu990WfxzTIUOZyovhE5
	UT70BdoeB2FudBugLgy9zinen0fBEjoSaBQYcoElXRtustTkzU4s1mmoNS59ARg6dEoBT1lGbus
	cTF3KJDZSiOxW5JvkFHwZ7VoxkBM7eJjgtuGQ74/i2RbEZkA==
X-Received: by 2002:a17:90b:4410:b0:3b0:a37a:230a with SMTP id 98e67ed59e1d1-3b12d329650mr2967580a91.25.1794202366938;
        Sun, 08 Nov 2026 21:32:46 -0800 (PST)
X-Received: by 2002:a17:90b:4410:b0:3b0:a37a:230a with SMTP id 98e67ed59e1d1-3b12d329650mr2967572a91.25.1794202366429;
        Sun, 08 Nov 2026 21:32:46 -0800 (PST)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b139d0a166sm3096629a91.3.2026.11.08.21.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 21:32:46 -0800 (PST)
Message-ID: <f927dd05-ccb5-4eee-b32a-a1f03aecae4c@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 13:32:41 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 2/3] wifi: ath12k: rely on pskb_trim() to trim
 the received skb
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
 <20261016-ath12k-rx-avoid-realloc-v1-2-0ce6cd99dd5f@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261016-ath12k-rx-avoid-realloc-v1-2-0ce6cd99dd5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyMSBTYWx0ZWRfX8HHWIu+Zjyoh
 m0560cPlByg66BXLKmzyJcUoOMuJL+vUXo1p/HxHL7FtlZN9uGPnXCBHFn4Pn77Jf/yn6iarzVP
 KHx+SZ/mNgQ9ZM8KCsBudSrJgLXLp5Y8izjPecP9fDJUnxXqP5gSysGVCAOV86IkX9MDeRSjdns
 xbzv8RpmXHjx+7eMLR9awYioRDW8y5l5AvdduPTSz9gq4OeKgelQ/NKItt/CHTVSM/QHgVwOIzp
 2RAA8nnjCPWM+K/A6mwLxde40BB5zwgcwtyU2dW0WcuzyTVt5cCQ47D/v6hBCHvPx4Keh2Tvyl9
 XWRyaafYB+bxFTVgqLOdLz8dq7bBmc8KnFTWrg1+RBnOlweBhkB6I1rsBbE7BDw6/CgCwzr0kck
 HHjU6Mgll8FanjF9GdUw5BxmQ5SF62PrzZK/pP5UfdzxwZvVroTpl/cVagL/NCLJVPM6TyNvnH8
 SOHonhczgdHsKGgzYPA==
X-Proofpoint-ORIG-GUID: 7nZdIQroxCzIKzLkXDgAxGmCPHWqj2l5
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af15aff cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GHdboaX_DFjh2CRH6W4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyMSBTYWx0ZWRfX2Hu1bu6wp7cf
 kRwAD04qAQUB5J2jmH+54IZvRXVrkf8AWA1VVXiLhSWmNENV5bTuhMSuh33e9sP4wvPfRbVpASB
 38W6nZkWb750QNWDq1nqiSPMuS9BUoM=
X-Proofpoint-GUID: 7nZdIQroxCzIKzLkXDgAxGmCPHWqj2l5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_053253_117218_7E29CF5F 
X-CRM114-Status: GOOD (  21.88  )
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
> Prepare the RX path for handling non-linear SKBs introduced by the
> following RX batching change.
> 
> pskb_trim() can fail when trimming shared fragments, so propagate errors
> from ath12k_dp_rx_h_undecap() and drop the affected frame instead of
> delivering it with an untrimmed FCS, MIC, or ICV trailer.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_rx.c | 48 ++++++++++++++++++++++++---------
>  1 file changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index 40b8da34268f..4f37ef12e40f 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -1010,6 +1010,7 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
>  	struct ieee80211_hdr *hdr;
>  	size_t hdr_len;
>  	size_t crypto_len;
> +	int err;
>  
>  	if (!rxcb->is_first_msdu ||
>  	    !(rxcb->is_first_msdu && rxcb->is_last_msdu)) {
> @@ -1020,7 +1021,9 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
>  	if (msdu->len < FCS_LEN)
>  		return -EINVAL;
>  
> -	skb_trim(msdu, msdu->len - FCS_LEN);
> +	err = pskb_trim(msdu, msdu->len - FCS_LEN);
> +	if (err)
> +		return err;
>  
>  	if (!decrypted)
>  		return 0;
> @@ -1029,28 +1032,47 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
>  
>  	/* Tail */
>  	if (status->flag & RX_FLAG_IV_STRIPPED) {
> -		skb_trim(msdu, msdu->len -
> -			 ath12k_dp_rx_crypto_mic_len(dp, enctype));
> +		err = pskb_trim(msdu,
> +				msdu->len -
> +				ath12k_dp_rx_crypto_mic_len(dp, enctype));
> +		if (err)
> +			return err;
>  
> -		skb_trim(msdu, msdu->len -
> -			 ath12k_dp_rx_crypto_icv_len(dp_pdev, enctype));
> +		err = pskb_trim(msdu,
> +				msdu->len -
> +				ath12k_dp_rx_crypto_icv_len(dp_pdev, enctype));
> +		if (err)
> +			return err;
>  	} else {
>  		/* MIC */
> -		if (status->flag & RX_FLAG_MIC_STRIPPED)
> -			skb_trim(msdu, msdu->len -
> -				 ath12k_dp_rx_crypto_mic_len(dp, enctype));
> +		if (status->flag & RX_FLAG_MIC_STRIPPED) {
> +			err = pskb_trim(msdu,
> +					msdu->len -
> +					ath12k_dp_rx_crypto_mic_len(dp,
> +								    enctype));
> +			if (err)
> +				return err;
> +		}
>  
>  		/* ICV */
> -		if (status->flag & RX_FLAG_ICV_STRIPPED)
> -			skb_trim(msdu, msdu->len -
> -				 ath12k_dp_rx_crypto_icv_len(dp_pdev, enctype));
> +		if (status->flag & RX_FLAG_ICV_STRIPPED) {
> +			err = pskb_trim(msdu,
> +					msdu->len -
> +					ath12k_dp_rx_crypto_icv_len(dp_pdev,
> +								    enctype));
> +			if (err)
> +				return err;
> +		}
>  	}
>  
>  	/* MMIC */
>  	if ((status->flag & RX_FLAG_MMIC_STRIPPED) &&
>  	    !ieee80211_has_morefrags(hdr->frame_control) &&
> -	    enctype == HAL_ENCRYPT_TYPE_TKIP_MIC)
> -		skb_trim(msdu, msdu->len - IEEE80211_CCMP_MIC_LEN);
> +	    enctype == HAL_ENCRYPT_TYPE_TKIP_MIC) {
> +		err = pskb_trim(msdu, msdu->len - MICHAEL_MIC_LEN);

Both IEEE80211_CCMP_MIC_LEN and MICHAEL_MIC_LEN are 8, and MICHAEL_MIC_LEN seems the right
name here, but it is unrelated to the pskb_trim() conversion. Better to mention it in the
commit log or move it to a separate patch?

> +		if (err)
> +			return err;
> +	}
>  
>  	/* Head */
>  	if (status->flag & RX_FLAG_IV_STRIPPED) {
> 


