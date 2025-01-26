Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840A0C0218D
	for <ath12k@archiver.kernel.org>; Sun, 26 Jan 2025 18:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pud9PNRzD3MI/cZaRiKgG8KDXkfED8iswD139srnImw=; b=dY3CC+WANRd+lBHG3c12QID4Mk
	d7JX0KGnttlQ/17NaGPmyhzuZQv9YR32/ogX6xefo6uvc7U+xwsgYAa4OAzFbQSt9eSZcnctPWoqM
	yeKTRLoHYd7HJ4IVTZ1/b2fg7hkctD43EEx3nVfMfEU/MteDYMVz24W38OwARDoyjvdCFEzRxLND/
	ouFmpmUSuDQkkpgnh1IpsZpNS5vgN4/6GmGcp5M7Z6U9FmZ5xtseJVpQ8W4kU5CMyL2GloBd+Q+wg
	jjisqlT1a3sije5VBq+tcwcE5ikPXSbZhleg++5hCt1/TN9bkWblRl+uyVnIUxCPICWbAXckESHXH
	7j5kUryA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7Q6-00000000dTT-046Q
	for ath12k@archiver.kernel.org;
	Sun, 26 Jan 2025 18:31:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7Q3-00000000dSt-2NvU
	for ath12k@lists.infradead.org;
	Sun, 26 Jan 2025 18:31:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50QGtXUX017860
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 18:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pud9PNRzD3MI/cZaRiKgG8KDXkfED8iswD139srnImw=; b=hAW7lAlhfQDg3c/R
	vYx1YGZSSfeiuA9g7t5ZT76496dTY1uzbLEImPjPDOJsHZMxxtflKaRGwbXbBDWr
	eTVuuyGk1dci4tpmZSYhKHloTF0D75mf2jjvmX9L9ldgP3Xhouos5zvYOdBgeRzK
	NP9mcX0o+uk9d0csBQxUa5M1rPuwLftwzdoFK5F7uB8iOcTxYCvIV5yYdT/GA03+
	QoramRI4dHWZ4/NtNAwrrtB8tHs9XKSChxjuaNQpzufwCxsyDnqBH5HS8rtC37wy
	2xIYP0Yj2jsqnMUGAmi+bh07wYoaW7bXqHRj86jFPCxYcJzY44svbxD5gXm3hmMs
	i3vANQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ds0402nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 18:31:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ee46799961so10612469a91.2
        for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 10:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737916297; x=1738521097;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pud9PNRzD3MI/cZaRiKgG8KDXkfED8iswD139srnImw=;
        b=uE8cgQJvk48T5t/3QK8mCmqs+3HbZdGsMUOjq3Rgahgu1KZiCFGa8ZW+i9UaCet04J
         2PrnMF3Kpsq4CWbQysfsHjSxwZSZKF6mlwbgABC3Jc7vHyI4yxBytzMN+u5JlSlzR1r/
         Ym9BEzyE5zemmsmKbi7KWd2QW+R866x/rovC0Bo5zV9CV3jRd076N1tINHlkvBtWmbfN
         CQOOV140UcwRcvuzJCm3FSAAUL3Ok1YcSboedTDN5zZ+c/dPCG3X4vKbXIFA/RXrNevK
         jGKisFimdkKQnkLi6VWkvdsxuFs9Bu7fNIQ45xL5wGN8ZLVp7qdqqmFCld+QT1Li4Ojv
         40Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVdByJbmHkVczimP7v4LoWsvhvJ42wHBcEU4Zj6eojvvpc2ifQw9NvMuqOM4oVlBd9v8t6PNUE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4/EM1JOURbSBREbMah0utcyGBftQdMsqTGqrbLswkOj3Mwgi0
	/xSBg4vpXGLgsQhX3pHKN2WTzjxlfuVJobQ+Trq41P9AzO2Lkchb7V0rQRVYu8Qs8bBGa3OAS5n
	wYYNpHpCzZcOR8dWQIbNjTwgbGPTRc+11g6pTv61QMAmGi5UFkQURes+XNIZE8BRvVsxw
X-Gm-Gg: ASbGncu6ov2azXuUIVtGIdOjC8Kt11NhkjhFoOfWq73IQfPHJXDcllqxaDmvTZiPldb
	ZbTsCnb/XIthfgaX+x54eDhIEyEaznZqGG536aA31Kl9e+KoWwCHolOz9FkwnbHwOjC2R9ThMjo
	DXtOQ0KgWAG0OhK2Y260uJM5hA7hF30Zff7frMXnKBrHucfT6FcfR81BNCfGjP4EZ921iV1lHxj
	qzdfC/MY/cOx2hCBjYwe+VYvEJRpy1iFMyJ1a+7qfhNasFSbUpOhAv7TJEep+E5/SYIO+M/iaYa
	HDNUuyufWX5IY0KshKdzQZg4ZdW4SD42bqFPGTaK/9VaNFkjmgVHpXjh1jO5qvMjFHt6vEFo+A=
	=
X-Received: by 2002:a17:90b:5244:b0:2ef:2f49:7d7f with SMTP id 98e67ed59e1d1-2f782cb58c3mr63699412a91.18.1737916296986;
        Sun, 26 Jan 2025 10:31:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8M/rAM+9mO1LI7JuFdJJ4HCifG7IRN2A7evzv5QhhiiEsTUKLj3nd77QPQ12zTll45lKhvQ==
X-Received: by 2002:a17:90b:5244:b0:2ef:2f49:7d7f with SMTP id 98e67ed59e1d1-2f782cb58c3mr63699389a91.18.1737916296622;
        Sun, 26 Jan 2025 10:31:36 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa44530sm6088931a91.7.2025.01.26.10.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 10:31:36 -0800 (PST)
Message-ID: <c101bebe-ee13-4f34-b7b2-c044396726ff@oss.qualcomm.com>
Date: Sun, 26 Jan 2025 10:31:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: remove return for empty tx bitrate in
 mac_op_sta_statistics
To: Remi Pommarel <repk@triplefau.lt>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
References: <a4bdebd14f5dbec653b75277097917910344f244.1737142154.git.repk@triplefau.lt>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a4bdebd14f5dbec653b75277097917910344f244.1737142154.git.repk@triplefau.lt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kVMFFd7ReI3CQRvqi-Z1rQ3bmzwZg4QO
X-Proofpoint-ORIG-GUID: kVMFFd7ReI3CQRvqi-Z1rQ3bmzwZg4QO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-26_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501260150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_103139_734977_E846992B 
X-CRM114-Status: GOOD (  23.19  )
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

On 1/17/2025 11:30 AM, Remi Pommarel wrote:
> Currently in ath12k_mac_op_sta_statistics() there is the following
> logic:
> 
>     if (!arsta->txrate.legacy && !arsta->txrate.nss)
>         return;
> 
> Because ath12k_sta_statistics is used to report many info to iw wlan0 link,
> if it return for empty legacy and nss of arsta->txrate, then the other
> stats after it will not be set.
> 
> To address this issue remove the return and instead invert the logic to set
> the txrate logic if (arsta->txrate.legacy || arsta->txrate.nss).
> 
> The same was done also in both ath10k with commit 1cd6ba8ae33e ("ath10k:
> remove return for NL80211_STA_INFO_TX_BITRATE") and ath11k as well with
> commit 1d795645e1ee ("ath11k: remove return for empty tx bitrate in
> mac_op_sta_statistics").
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 29 +++++++++++++--------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index d493ec812055..cbc79ec7ac47 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -8912,21 +8912,20 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>  	sinfo->tx_duration = arsta->tx_duration;
>  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_DURATION);
>  
> -	if (!arsta->txrate.legacy && !arsta->txrate.nss)
> -		return;
> -
> -	if (arsta->txrate.legacy) {
> -		sinfo->txrate.legacy = arsta->txrate.legacy;
> -	} else {
> -		sinfo->txrate.mcs = arsta->txrate.mcs;
> -		sinfo->txrate.nss = arsta->txrate.nss;
> -		sinfo->txrate.bw = arsta->txrate.bw;
> -		sinfo->txrate.he_gi = arsta->txrate.he_gi;
> -		sinfo->txrate.he_dcm = arsta->txrate.he_dcm;
> -		sinfo->txrate.he_ru_alloc = arsta->txrate.he_ru_alloc;
> -	}
> -	sinfo->txrate.flags = arsta->txrate.flags;
> -	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
> +	if (arsta->txrate.legacy || arsta->txrate.nss) {
> +		if (arsta->txrate.legacy) {
> +			sinfo->txrate.legacy = arsta->txrate.legacy;
> +		} else {
> +			sinfo->txrate.mcs = arsta->txrate.mcs;
> +			sinfo->txrate.nss = arsta->txrate.nss;
> +			sinfo->txrate.bw = arsta->txrate.bw;
> +			sinfo->txrate.he_gi = arsta->txrate.he_gi;
> +			sinfo->txrate.he_dcm = arsta->txrate.he_dcm;
> +			sinfo->txrate.he_ru_alloc = arsta->txrate.he_ru_alloc;
> +		}
> +		sinfo->txrate.flags = arsta->txrate.flags;
> +		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
> +	}
>  
>  	/* TODO: Use real NF instead of default one. */
>  	sinfo->signal = arsta->rssi_comb + ATH12K_DEFAULT_NOISE_FLOOR;

This patch conflicts with the following that is in the pending branch:
https://patchwork.kernel.org/project/linux-wireless/patch/20250115063537.35797-2-quic_lingbok@quicinc.com/

The pending patch adds eht settings:
+		sinfo->txrate.eht_gi = arsta->txrate.eht_gi;
+		sinfo->txrate.eht_ru_alloc = arsta->txrate.eht_ru_alloc;

The pending branch will be promoted to ath-next & main soon, so please rebase
after that occurs

/jeff

