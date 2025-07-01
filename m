Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39949C8302F
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 07:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDOCxBpPVmbw0QEPicjZ41e6iD4nYwHdCMAbL9Ku9qQ=; b=DEmhHFphNUl3hyWLAxnfPXQ16b
	gCtnToriicNATooy0fUOG0lBXdwIlLRB5epTF2xOXyM2D97H31e6klR6IfoBtd0Qra1IvwhXYnqQs
	I522q/ogGmO8s5sncQ8/c9Y9VPnpLQgw8idZ88hGCzkf0NdSEccsL1jTxioKVXa4hU6R+uNxwtFpm
	063hYuDzll6z152hkLjiPppCl/iGpafW9rihRMzDniV4ONo517MFrjOSjERhD4Nt4psmGOXMqY3QO
	ASX9rIYY9YyRDH9crmdMGjl0rmPsdRAcDTsQRaQJhHcpRgwpB3Ge3efudqOGC6Qz7Ke1FmCtUGhDS
	uqPwWOFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVl7-00000004Jpl-458P;
	Tue, 01 Jul 2025 07:50:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVTW-00000004HKp-1Vnj
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 07:32:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5614Awwp018588
	for <ath12k@lists.infradead.org>; Tue, 1 Jul 2025 07:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TDOCxBpPVmbw0QEPicjZ41e6iD4nYwHdCMAbL9Ku9qQ=; b=ZqInRUwgFQ9z3QYz
	E2ySNgUlbzSBVB/NbFs798dAyNiQ58gIakQ95n9MGBkVnyL5QQQQSGV58js7AzdW
	SpsAiG8P1ciCX3ZZzieAt8q23tkSKCLtw+Y1PVW4B55arZHcdvh6U6AgeZ1aN8nm
	vOW1QvMiQ33YvXfAcLA+/ucFcN9/faAe5Z8q8zjPONJtBG6puA6AdP8kXNkeXepG
	Wm1sBhodq3HYN4MW39PUfMIEBHY3YI+DjD+0zN8pzOMycrbqbzQlqw1iCzA6apdw
	5kThZbG00co7yIihqb21qB/lYpYv9GC+HSN6+ZafEkr2/AFk2jzNDDFlxGb6D6ED
	Wj8/FA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxfksx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Jul 2025 07:32:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2fdba7f818so3752959a12.2
        for <ath12k@lists.infradead.org>; Tue, 01 Jul 2025 00:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751355135; x=1751959935;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TDOCxBpPVmbw0QEPicjZ41e6iD4nYwHdCMAbL9Ku9qQ=;
        b=HZdStFDPusvo8wWc3RnE9hDiyJeBJmbwO5z+uZ7rMU78uzD2IZwvGtoa0auMKGbnM0
         Wu4POHieX41ZmzBpBC39UyLX8Tc0K63qUsvYPD9sWHYyXFKWSTpiE/apcHpPHsYN2D/k
         3mHDmnjntufgiGt5BKjFRqXa+tBPiFEKxcX/8sb/WdAlvFTeVGcT0brd/IO+Y9wqqpsd
         +SgkkPdhxXLxe0E+wPXa06QlFb03TAQqceYjtpxpzI69346MRISxc3E6DXgBxVC3ELBS
         7f+bKMwNvPNAKDi6d7qJgIswtqBUzWoXAYGkKrBItVqkaqgoOv8SnmQIgQa8efz1Keqp
         j2og==
X-Forwarded-Encrypted: i=1; AJvYcCV7EP2LI+N+igAENi50K4nVVAahLYCK5/LcEfAbyHTQdK0dYzbPbcXNzVK8Uxf9LIgXOjC+yxU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyyFevml5CJMKVr82uyqMMwltRu1rfKff0i7+FGIh1OgkeD1wwr
	Ct7ILZdMzwQEhBmNKqDU6P2iYXxVUqDooNURRSxI3ikb0YwtDXIpRE9P94BGsXlmgm2RvaIC63E
	XrnYxt5vanzsTgbQGGHwJEUdxQFA2V95g60xqso8WDa48bW1R8jgMr+BzF01JlEZ0Dc9efHRK
X-Gm-Gg: ASbGnctm/j5zxEqc1h8nubY8dOOODfyJk+AgR4tFJOVOCYUHFtvsiRlCS2/tYwW60S/
	9OynCsoubhKOHMyzcPYVax4ptEcRiHO3fbx8tMS9HxjCjfTgU+e+S+mPRGmS0IwuaBRCSc2ZXw0
	hBcOFEfbjE+8wGAgYiAJj/g2I/0CH8Jg0OpBUhGVeVB22vZX3Ak3nGuvUcu742QenpITyv+CegY
	C5JCTUESSZVEUJwXHlPt08QEmvEqrz8mkLNkcCKM2sRHeu+dZicK+CJ82HP5zztWO80ebcKCJxg
	jWfWW7w3vMZes/f1IoAAM+vnKp01OcHJjCsHYAB/e+stADgkCrdVT+DBZUl5YHrY
X-Received: by 2002:a17:90b:3e8a:b0:312:eaea:afa1 with SMTP id 98e67ed59e1d1-318c92f09ecmr23522056a91.29.1751355135276;
        Tue, 01 Jul 2025 00:32:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1sJESjrU4RvtIsHlfmrSQQj88m8On/2shBq65FazB3a8VGlNdE9Uwjq35RE60fRLDMUtdwA==
X-Received: by 2002:a17:90b:3e8a:b0:312:eaea:afa1 with SMTP id 98e67ed59e1d1-318c92f09ecmr23522023a91.29.1751355134815;
        Tue, 01 Jul 2025 00:32:14 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c13a1a9esm10645153a91.13.2025.07.01.00.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 00:32:14 -0700 (PDT)
Message-ID: <6e64bd6c-c6eb-b9ac-4f82-e241a7323ddc@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 13:02:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v7 4/5] wifi: ath12k: correctly update bw for
 ofdma packets
Content-Language: en-US
To: Sarika Sharma <quic_sarishar@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250630071114.3474672-1-quic_sarishar@quicinc.com>
 <20250630071114.3474672-5-quic_sarishar@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250630071114.3474672-5-quic_sarishar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0MiBTYWx0ZWRfXxjZi8LNOj+q/
 PUr/O0KQT8usfBSBaB9D4zZVEvHo7y2/hUg0oG7IBdmpUr1p7GdlO1HFbbDqQCWdXwRRAOEpYmT
 zr9k20r/uhOABvWJtKPGNSRPqUbxeOf/etAf25+yp0D+qmg6IGNzyarjqf6R+zkIhYyQ2Lq4SpE
 7fCCU5XTbdcnySQ+AXOZeblCNJDjECuyC9iYlyGNWakgKGCDzw4gwpXEIU2k9qRrm2GNi2KxCkd
 EOme6n2GjKi8Dh9ivQ478H9a3CCmkpWpqoOCV6EFJHf7XxX6WSPfC9QNMpnIsRCeHB/khBQGI3A
 MCRoVIEhMJvO/Fes9SchXf9+1FAv4OORu3Db4EqZq2bGh3XTKaG4CrnRr/18dpzkzY69e9zNvjE
 +sr1FIRCO3ESQDkbZsRQP8hqNeWaIFmOfMZREf13anZx9KcPHQ/vCsp9ZD6gcdHkPbOPAzMw
X-Proofpoint-GUID: qYNyQrkyjhHjXlguuYw9uMVLz4ExiTzb
X-Proofpoint-ORIG-GUID: qYNyQrkyjhHjXlguuYw9uMVLz4ExiTzb
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68638f00 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=Qn7UUWhMrg4689AsiVQA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=885 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_003218_528660_230CDDAC 
X-CRM114-Status: GOOD (  17.30  )
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



On 6/30/2025 12:41 PM, Sarika Sharma wrote:
> Currently, arsta->txrate.bw is filled from ath12k_mac_bw_to_mac80211_bw(bw)
> during ath12k_update_per_peer_tx_stats(). But in tx_completion path bw
> is filled differently if ppdu_type is ofdma for HE/EHT rates.
> 
> Hence, update arsta->txrate.bw correctly if packet is ofdma for HE
> and EHT rate.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/dp.h    |  2 ++
>   drivers/net/wireless/ath/ath12k/dp_rx.c | 15 ++++++++++++---
>   2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index a353333f83b6..0c1fece27264 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -1559,6 +1559,8 @@ enum HTT_PPDU_STATS_PPDU_TYPE {
>   #define HTT_PPDU_STATS_USER_RATE_FLAGS_DCM_M		BIT(28)
>   #define HTT_PPDU_STATS_USER_RATE_FLAGS_LDPC_M		BIT(29)
>   
> +#define HTT_USR_RATE_PPDU_TYPE(_val) \
> +		le32_get_bits(_val, HTT_PPDU_STATS_USER_RATE_INFO1_PPDU_TYPE_M)
>   #define HTT_USR_RATE_PREAMBLE(_val) \
>   		le32_get_bits(_val, HTT_PPDU_STATS_USER_RATE_FLAGS_PREAMBLE_M)
>   #define HTT_USR_RATE_BW(_val) \
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index 0f5edc81fc5d..ff92ec764ae5 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -1423,12 +1423,12 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
>   	struct htt_ppdu_user_stats *usr_stats = &ppdu_stats->user_stats[user];
>   	struct htt_ppdu_stats_common *common = &ppdu_stats->common;
>   	int ret;
> -	u8 flags, mcs, nss, bw, sgi, dcm, rate_idx = 0;
> +	u8 flags, mcs, nss, bw, sgi, dcm, ppdu_type, rate_idx = 0;
>   	u32 v, succ_bytes = 0;
>   	u16 tones, rate = 0, succ_pkts = 0;
>   	u32 tx_duration = 0;
>   	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
> -	bool is_ampdu = false;
> +	bool is_ampdu = false, is_ofdma = false;

nit: initialization of is_ofdma is unnecessary as it is unconditionally
populated below.

 >   	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
 >   		return;
 > @@ -1457,6 +1457,10 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
 >   	sgi = HTT_USR_RATE_GI(user_rate->rate_flags);
 >   	dcm = HTT_USR_RATE_DCM(user_rate->rate_flags);
 >
 > +	ppdu_type = HTT_USR_RATE_PPDU_TYPE(user_rate->info1);
 > +	is_ofdma = (ppdu_type == HTT_PPDU_STATS_PPDU_TYPE_MU_OFDMA) ||
 > +		   (ppdu_type == HTT_PPDU_STATS_PPDU_TYPE_MU_MIMO_OFDMA);
 > +


Vasanth

