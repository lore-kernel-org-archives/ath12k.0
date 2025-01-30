Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CF3C0218A
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 06:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H23WwSFj9O0uWJFt/v7xnWizAiddo1nd5E9CRkVLZVs=; b=sNomXJPjzOGPWCUVRHi1oS17O/
	/D2o4QdCrYkSAYE9r8EBKavEE7R9MIxuOmSIlW3B99oEQbPFEZejSSp3cytPxvkFCiKgLNYYvlizy
	QpHkI8Hd/xOk8uOdBcT3piLFGfWJbEqemfJ8tFmoH95wzmvTapbeI2pZgX2DTlvXVDWSI/mPIlXLK
	+gup8TqRxX3iW/cZKEnFP9TUxIZ8trIWEE/CUko4R8IK9vupUSa5HksOi7+vz1bUEED3bVQxL5PtF
	lYTCuJHG0MOMGon972pEtWcA1n9qbm1tHbSXACXwAYm7boarRqQkO+ft+BCjMSrsRH9QdtKJRga9/
	LgQ6bCCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdOPE-00000008Kb2-09rP
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 06:52:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdOPB-00000008Kae-0CVV
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 06:52:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U3LE5t014547
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 06:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H23WwSFj9O0uWJFt/v7xnWizAiddo1nd5E9CRkVLZVs=; b=Fe5XuuBMaGq6dFA7
	fJ2iB1Enc1qXrRiOkt7V9ab07gqMb1WGSgxoEXb7zfqDb0o1CjjKPYhGP1gzTlKY
	5mMQRMLXj+R5LpAbm8PhpfBf1rvWtpranbVzdtp/U2LR2/7tg4Uoag+tPTEqp6by
	iTKGt3eoWh5F3psPT/ciojmYgKxoNMDnPESWpHhN/lYrRXjyK+VoOt/O2nFlhkxC
	m/+FPpI7mK+meHG5Y2ZfsFSIDKny92C1gpNJnaXGqZNsp7bc7BVbD7Kxrn7KcT12
	MF424vsdZOo1gjzOJFLaQRMs6PEXzP+9lC9kp3D77eV27j/y6PWNH3yazNalzlaA
	OI5V+g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fxvwrj28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 06:52:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-216266cc0acso28376685ad.0
        for <ath12k@lists.infradead.org>; Wed, 29 Jan 2025 22:51:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738219919; x=1738824719;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H23WwSFj9O0uWJFt/v7xnWizAiddo1nd5E9CRkVLZVs=;
        b=FTeQknt32TWp/qwdtQlNs1PBEbweitJIt+NYF4oOcu7ScaaWwxw9oMLklTNKyjJ8AS
         pQVN0Wsk/7qSlVecvraOqLkNVpshF6IgGzlLIjQqfF2Vu3OUUaLZUS9wNZfeXk0LvHU9
         Uem/jPBUidJfEoe0VmiFy/5F3DVkeZvtLYKK7uSzDm1Z5Lm2WB7VgnmBEmpirxgNEq6i
         prWBYEMKaXySBaiQmVFjeSjQ7q1oubF7d7CWPrZKgaQeKcn4SO+v3dxuMJcMp8DEWoGN
         y1SCmIgU3lXIRko6Vmy+Xllz4Z1sJac57uApq8Mg2SEJG91bW4q5t05JM0tSOnA+wivv
         SlUg==
X-Forwarded-Encrypted: i=1; AJvYcCVqMVJzI7SvC8zLKvM2EOgN+XMAJpBSwe2CfIY69+CaoABuxSMApvtHmnCvLmw5+WzhRNEjZqY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzbMvXHy88ZCQnR7nvoxQqmF0QtVKV+3QBzPn7Wj2UzqT6cIKRT
	sKk7XdiDcFwj4Noce732Cp/+zJmDrHHaa7tUj+Hji9dH47kpMdqtkGW6Z37BzSjiFDlfRwqol5Z
	9MZPZ2Rof2sqEDRWSQCCRShxRKWgy0thmho7XYNmFxmcUIVOyYjRF+js2yqE7Fkb1AOUV
X-Gm-Gg: ASbGncuXZJ+b63+qiC2fGErHW8C5zMEZJbA+Tnh+UGDfb9bOj6dqhR0KiQC40kSwnu2
	yLna7Sl/41x2sLAWO1HUSi2PKrccwDTj8e/eNCvl5EXf5tliWPksAgIT8Z/6GlodS79257u97YE
	CsWViCrv8283yuq23Je7q0ck6C9esHifehxyBZD9EIU+ubu2vfCcNXEo6faz3ZxjYXLADYef+K7
	QVObqjfAwfMszP4zYHmGSSUNmnnbG1hT2TjNTe+S13UBciacdTDamKf+FKAkd0ut0eBjZ9uVmfg
	Dl+owUO+ONfQe6AZ99Up09OqCdHgoW2L+zpxkTU=
X-Received: by 2002:a05:6a20:c78d:b0:1e1:ad7:3282 with SMTP id adf61e73a8af0-1ed8730a904mr3511361637.7.1738219919015;
        Wed, 29 Jan 2025 22:51:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzG+DogYyZ4oCV8O4Q9rbTI5YcJ0UW8zYZUFnb0DL3QdqmDelnZIfjmzVNjsQlG0V809uVRw==
X-Received: by 2002:a05:6a20:c78d:b0:1e1:ad7:3282 with SMTP id adf61e73a8af0-1ed8730a904mr3511341637.7.1738219918596;
        Wed, 29 Jan 2025 22:51:58 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec0a666ddsm508683a12.73.2025.01.29.22.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 22:51:58 -0800 (PST)
Message-ID: <9c12e9b9-35a4-47f1-bd17-6b4641de92a4@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 12:21:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: remove return for empty tx bitrate in
 mac_op_sta_statistics
To: Remi Pommarel <repk@triplefau.lt>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
References: <38c2a7c4f7eaf57b9306bb95a9e6c42b7d987e05.1738169458.git.repk@triplefau.lt>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <38c2a7c4f7eaf57b9306bb95a9e6c42b7d987e05.1738169458.git.repk@triplefau.lt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kUv6SIztxy8iAVJqrjzF9I5dKisXgKOk
X-Proofpoint-ORIG-GUID: kUv6SIztxy8iAVJqrjzF9I5dKisXgKOk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_03,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=963 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_225201_108975_825D8932 
X-CRM114-Status: GOOD (  22.28  )
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

On 1/29/25 22:25, Remi Pommarel wrote:
> Currently in ath12k_mac_op_sta_statistics() there is the following
> logic:
> 
>      if (!arsta->txrate.legacy && !arsta->txrate.nss)
>          return;
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

MISSING_BLANK_LINE
'Tested-on:' tag missing blank line after it.

You missed v1 comment? :)

> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
> Changes in v2:
>    - Rebase on ath-next
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 33 +++++++++++++--------------
>   1 file changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 4fb7e235be66..e9663c6ac72c 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -10170,23 +10170,22 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>   	sinfo->tx_duration = arsta->tx_duration;
>   	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_DURATION);
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
> -		sinfo->txrate.eht_gi = arsta->txrate.eht_gi;
> -		sinfo->txrate.eht_ru_alloc = arsta->txrate.eht_ru_alloc;
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
> +			sinfo->txrate.eht_gi = arsta->txrate.eht_gi;
> +			sinfo->txrate.eht_ru_alloc = arsta->txrate.eht_ru_alloc;
> +		}
> +		sinfo->txrate.flags = arsta->txrate.flags;
> +		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
> +	}
>   
>   	/* TODO: Use real NF instead of default one. */
>   	signal = arsta->rssi_comb;

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya

