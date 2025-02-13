Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F317AC021A0
	for <ath12k@archiver.kernel.org>; Thu, 13 Feb 2025 23:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrKqwAz8/y/nYtbJvGFXtPOikpfxCNae5javLo1xFL0=; b=ImzXBTpeNA+vFHlOkBOlPktiTj
	5jQssLrIxj83hg7IFsS5ixoDrJQZTXbnVCIaiMd1gHGpGfkekN+U0n17zdp6L42EpoLjPovVb9Qs9
	OFSV6sWCd0i4TQf+Ec9QUDwvVvh7Qi5huTnMJIbq5CInGCZQgg4+r2wvPTml1KbGzZKsK49qiDirq
	YC7bbeLr0CqB89h+/p9N4TjT3cBZ7Zvhioi99NuoKxaP9LfunWyof8ppCejA0Kcjk9NSKPvvz/NF4
	Q9bJurD7gyY/991MIYXZkNV9Vunjk6BNhxAE/dLRkuGT6EbxpA68QIqkvG6KtIzTnftgXj7pIVi8J
	mDpkwvWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiiTV-0000000Cvrf-2jLx
	for ath12k@archiver.kernel.org;
	Thu, 13 Feb 2025 23:18:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiiSp-0000000CvmL-3r8u
	for ath12k@lists.infradead.org;
	Thu, 13 Feb 2025 23:17:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DL7wjk002029
	for <ath12k@lists.infradead.org>; Thu, 13 Feb 2025 23:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qrKqwAz8/y/nYtbJvGFXtPOikpfxCNae5javLo1xFL0=; b=HeqQg5O9K0Y7E2at
	X8d5r24mh7rsqGWqMCZMr1fXcvANuTXs2srUlJhxiIa5iLLIVekqoq1bbfxDKYU9
	ZAhwDVHLixMxBn0IWqsKlQHBRXi3Fq4OkfoHqCYgK21bApxWVaUkeU2DL59D33uE
	LfOTLd2i+VECGZQfTO6pYsk418w3Ou4SDvov2ox++ZCWiVWJdYFipasC+0RKrbc/
	kx6bLQ6hXQHLfqU52KRBX1JhV1agA6+PFsbL4UZTRMUJVPOEcwoC7bC6B8nt+Gof
	ALy2Uv91KbqmafKYcQf0df9IT09xidVIpa2n+wEtgjwoWLRDCfhLNwbeCVj3HFPR
	1xQQOw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44semp9vdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 13 Feb 2025 23:17:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e48a052ad6so29005446d6.2
        for <ath12k@lists.infradead.org>; Thu, 13 Feb 2025 15:17:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739488666; x=1740093466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrKqwAz8/y/nYtbJvGFXtPOikpfxCNae5javLo1xFL0=;
        b=ZzySqjHEdN0/mmGeTnuh+Mt03KLqxKHyg3zLMDapeEU/zbobxKdi01wsJ1MdqVUWpO
         WQrut+JgT0jXTxesAv8Vch9WEEhsnza2fLBcjwbQhK8khFM+boPG8xihi2saKCcRrnAY
         GUCj2Es42Z1/QFaCgPok3MeFWpoArCB3P3y4MzdJl/3fJtnYnTSYd9nGh+TiaK+qz7/x
         NlFzlC+xcAFhdDByEO4uG24tshxK9ZaYt7oTgVCmaasET0chiWZ+pTYRA0FWrqrOC5Ns
         t+GsfWPjy326uxZWDD2rEV0JV3xf8Di8IWW8nyM9wqKEpcU3z/wKISjS2TXJjQByVxPV
         npzA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ8kUaaOAPXPeUqzDBxQyaBm5D2ejux49fcCN1f204UeHeF5fa9JdGt3XzM9tuzV4m06890HQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYCN/ZhDePKAdrbGVIg6WXTvTsSwnJRq7J6LNuQFXN5UGO5esn
	xGbxA7uhdXMLxwNHeaClDTIKRmDIuHM8TNNyX6Hx8lkqfjDI7DW83CO6yDES1pBfhTIMRjgkIh0
	w+iAkJryqtblD2MWtM683QbrYe98yVDlCv3tj3PSPuKX4Afqf0hbdUdE3q65t
X-Gm-Gg: ASbGncvXqARF5H2NvvGajxxjuXPaHFFx4/FLrGpZqH5ehjM8dF7iS4cnCEKroPOjvDH
	HOWjlsm6o0w4AThm6wgwO9imLlmO0n/6iJbY5FUb9MPF0wNNALrEOaLJn8dHIuh1VFjxSuUGiYj
	fbL8wnFMaoBuS311DcoQjz+BVwv/x/thOqff6z/OLsQfSZBHauD++xwkuAmxlnN2XUVcK0GQakg
	NECAqpg4/xDxZ/shSUTys4+CrVZopOkpdajOv2CgZojTxfwBZlVVlamCRUePbubuDrfGw5dqwNR
	91xhqjU8alKZDN2G5iUS83DSurwK/FxAmUDbrSchvSGM4fdWnmXYe2QtK3/VPmy0d5B+7w==
X-Received: by 2002:a05:6214:2028:b0:6e6:5e66:770f with SMTP id 6a1803df08f44-6e65e66780fmr67123246d6.16.1739488665734;
        Thu, 13 Feb 2025 15:17:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3IyNLcVOqUOu1ZVdzkIWViilmcFh2U7s8tXWp9vxKaW2ksV73AkING7XUGsAp9dIz/TYnvw==
X-Received: by 2002:a05:6214:2028:b0:6e6:5e66:770f with SMTP id 6a1803df08f44-6e65e66780fmr67123006d6.16.1739488665371;
        Thu, 13 Feb 2025 15:17:45 -0800 (PST)
Received: from [192.168.69.139] (c-98-35-147-9.hsd1.ca.comcast.net. [98.35.147.9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d7a4379sm14800796d6.64.2025.02.13.15.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 15:17:45 -0800 (PST)
Message-ID: <14da00e1-f1df-4269-ad9f-4f9be02ea552@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 15:17:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] wifi: ath12k: use link ID for CSA finish
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
References: <20250213225036.3118133-1-aloka.dixit@oss.qualcomm.com>
 <20250213225036.3118133-4-aloka.dixit@oss.qualcomm.com>
Content-Language: en-US
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
In-Reply-To: <20250213225036.3118133-4-aloka.dixit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: p6cjkzUUxltLgtwc07EToNtaiaCC--Oj
X-Proofpoint-GUID: p6cjkzUUxltLgtwc07EToNtaiaCC--Oj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_09,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502130164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_151747_969511_87C52B16 
X-CRM114-Status: GOOD (  15.43  )
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

On 2/13/2025 2:50 PM, Aloka Dixit wrote:
> From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> 
> Send link ID instead of default 0 to finish channel switch operation.
> 
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>>
> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/wmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 4dd6cdf84571..198e22ec6735 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -6894,7 +6894,7 @@ ath12k_wmi_process_csa_switch_count_event(struct ath12k_base *ab,
>   		}
>   
>   		if (arvif->is_up && conf->csa_active)
> -			ieee80211_csa_finish(ahvif->vif, 0);
> +			ieee80211_csa_finish(ahvif->vif, arvif->link_id);
>   	}
>   	rcu_read_unlock();
>   }

This is merged now as part of another patch so can be ignored.

