Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E392CCD1BF
	for <ath12k@archiver.kernel.org>; Wed, 29 Oct 2025 02:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XHD3qAsYq7bk8sAiSss2ZM7l6bFmO2byTwWLdGl1uY=; b=HIjOhG3RAxEovjSPhs1Da5WYcj
	ezkkg17qtgRX0Ru7HulB7XaeY6ldR13pj6Znt4AZROFmxJXo/jk2mff5/avibb2T3ZS3Y51AM3IzX
	C7PFc7ckRxSIL9LHLYykBpDLKEKM9azVmmWLyRGG3cy+3dpmJrthQSQS9/iDs4I237akZdIPcQyz+
	R7XzkC4CKdoCloC3XOvvZ/AExfgs3MWTlQ38uJ+fz5VtQiCwxX/ffpzaaPXFwqy61B1VDQ1fJndZS
	cnRDOV2IHgG/dlAZgeX2bu99KPAQVUUF2Q17nqqDZzLG7itxYEDZQfkxwCwwA1DZ5D4wbllIhfigX
	ZXGqehXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvWU-0000000Gxey-2uqF;
	Wed, 29 Oct 2025 02:02:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvWS-0000000Gxe9-0j8B
	for ath12k@lists.infradead.org;
	Wed, 29 Oct 2025 02:02:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJqTFA2510892
	for <ath12k@lists.infradead.org>; Wed, 29 Oct 2025 02:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+XHD3qAsYq7bk8sAiSss2ZM7l6bFmO2byTwWLdGl1uY=; b=moCLACVvtXJYioCm
	xM4rt6KPH9Mqtg0ZB5RMJqSan/DxiWnPwMHrqaD7A8XhwR2HdSusHkSpJECCUGSN
	J/gP3Chb8gOvReqNfc8JObnuRGpw0R7jXjVV95nN2YLwQW9xIWeMXV2AT6oczXzp
	x9SXOWec7dmmsinlgjlkXSr1aR0SjZo8M3q2+7iokPSCYYZ/azq1UkZMf8zcncGU
	FtK+N95fE6dytdHwaaRGIFugzaTLxedY1w3WEBMAI+/pz/io+/g74rqQhf7/+8sE
	PuuAEGE6EDUCPBFkJ2dTi3e1XMEP7xucQvMQBwg7cBPNJmqThLPH5ZdKJf6+hW4A
	/HT0gA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34cd8t91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Oct 2025 02:02:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32ec69d22b2so5696391a91.1
        for <ath12k@lists.infradead.org>; Tue, 28 Oct 2025 19:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761703365; x=1762308165; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+XHD3qAsYq7bk8sAiSss2ZM7l6bFmO2byTwWLdGl1uY=;
        b=TfDmvxOhUHsJLe4mDzVta1B2PBxUkQnMnmmY1fWf7yyd2O+oEtaJ/tiLVFNhy/i5sY
         5KtnBZpRwp+7Nntq30tjDblSgABozrq+hBOuDc9epz0Ndrc7ph3SkSNbw7gWm9e84tnS
         BgLjIj3BjOj193pGY6WuVokq9AVv3uRuLwXnFaMxBYf9aYMp3nUbmklsxneTcmoSUYqf
         9kihcuyIieZPLHuKVIsnnPFXMw+vS40pbRI7svev/usdjU2aLaqCE5LHGie7UKORDrVL
         rxLoVfjTReBLlL5Il3kdBIJI5qqgW5DojleIBp/u9maMAyWk/w6GGriWxgPahPKPqlcs
         IRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761703365; x=1762308165;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+XHD3qAsYq7bk8sAiSss2ZM7l6bFmO2byTwWLdGl1uY=;
        b=QUK+u8ICqgnHtxIZjPt/G1k7SH3gLRnhODZmFg7FQGbGLFeVbqDIe1o6RCl/tqzuuQ
         UUM9AJ/c+ZmG78cpkkEjXkKvERlPSfgQgWKaILI2OwTfi7UO6gSBEmxprCZNti+qdVc8
         R6KbZ43As7A69tvNsrdkQSLWLif+j2jqrg9CCNDeyDka2gUUacrZUNLAexpGZpTl0g/9
         69oZVGs9fYQTweBy3GcfKL+PdMpBIWFOx3jbyMmwQHdvzCktNYoUeTM2Fp24jwVXTGUX
         x8lh7eAQIP5GvEOffC3tMQ3yJZBjXPEGSmhcCGK7nVWv3wmt3l27JoAvbMEqtI1ndIGb
         0W7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDz6JQOgyg1QmEXMib/6lpZqdcw5M4dDMoyXLPeWUDwB3pluUgKpGzkuDBQHkb8k2lCBkP+vA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzXG0TrD7LaiOcNIau85q1RlmD+5No5CYIV/6y2Ec3EGPqXNDB9
	dcKdMn6UlZbjPnLkV3lylJobPWixKfFWcW7bQXGoNJ0E4bWiIXux5eDxZZHcIPCSbe2TK9OvzDL
	+NGRnGY8x3MgEztPas2DwQ5E6G5c31eMm4btjYxeJgXxHVvA53n3HhyzUGp7yhhRs
X-Gm-Gg: ASbGncvdsYyKEtBzxEZLL2WpDWDqwUTnmWyaddomA9e9hc+hSznUU99sxFZxfYn3xNM
	R6hTfimKqbGqRHGa6rYiw7pTx5DfuVW0yjz4Z1+Kx4VX2OPty7cd677O3pFyk7rlsnbc82fljXg
	GKJ2D2/dvkFShIAOcfvJU9M1mg0yFgT6mw77iN3IJE0mZjIuUfN/bf1VjJZ5kLXzaRWowt5/lX5
	amgXJKgW+MfaZgAzhHVyEabAj23BJAIrzWxDQFRrBySCpnfgzWaepIwcED/7y6XmpTcf0YFldm1
	tXAlk/nkt8p8gcuhWt+lz8LMYNo6zpmxxdQ+ozuxeCO2kZ8oZEOPNVKKeBBkioCr8+b+sLmMvZ1
	GhrvyBIOP+6FCGKPdK4pVrMS7VsXLUzVq1tsaLLn7YiWbDJSwCPIdUfDAOUTB
X-Received: by 2002:a17:90b:5285:b0:32d:e75a:5009 with SMTP id 98e67ed59e1d1-3403a15d171mr1330233a91.1.1761703364834;
        Tue, 28 Oct 2025 19:02:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGcScMXLm268C0Dm3zeV/yJI6TOPZWieAH/ad6aJnRDTo8npsq612B2XwRMppYY/qaERJ3iA==
X-Received: by 2002:a17:90b:5285:b0:32d:e75a:5009 with SMTP id 98e67ed59e1d1-3403a15d171mr1330204a91.1.1761703364290;
        Tue, 28 Oct 2025 19:02:44 -0700 (PDT)
Received: from [10.133.33.233] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41408757csm13100312b3a.59.2025.10.28.19.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 19:02:44 -0700 (PDT)
Message-ID: <606e4570-46ad-454d-a018-3bf2dd582dc2@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 10:02:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix potential memory leak in
 ath12k_wow_arp_ns_offload()
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20251028170457.134608-1-nihaal@cse.iitm.ac.in>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251028170457.134608-1-nihaal@cse.iitm.ac.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qkLfAMbE1pIunbaPPYZKxRY2DR0N2ei2
X-Proofpoint-GUID: qkLfAMbE1pIunbaPPYZKxRY2DR0N2ei2
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=690175c5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QpG1ZDNR6MNC-5z7ugsA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAxNCBTYWx0ZWRfX/NJ6moUD2Tkr
 QE24zBiSws3KkCFEb/acCtdbSeL08nMf+7Al8Y0JQAWwhLyXJDdoyBEH0YDrA/f7ITLxmKKSNkj
 rJA1UssFR1nDnp7l3Vp80+QaRDw1HQMtct5bLdp7vJjxMCkgREBh8jOgWoojdimlTON09Tw7hpg
 9/vm4WSbkQOeeeoLY4iIX6MycLbDSLyk0vjtN6okoSTWUf8W02GJg0AG2ffA1p7pEaU/34KtdEl
 0LqTB4HZHhgcbSzitz0LiyhXkQHcPw5Igy4kjVJ7RaFqSuaEb9YHVFfrJEbtZk4n7mzjD7Ti0yA
 mMSqpWJnsQFWOnzDede/iv3k7/FiEzWyIGWf9fh+q6p0zhdGZFOL/z/f5t9RAVsOxJ+7fePGA1L
 Dk0z15ZRCfBEKkfwDvMHrP+LMzJDiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_190248_332063_F69D80F4 
X-CRM114-Status: GOOD (  14.97  )
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



On 10/29/2025 1:04 AM, Abdun Nihaal wrote:
> When the call to ath12k_wmi_arp_ns_offload() fails, the temporary memory
> allocation for offload is not freed before returning. Fix that by
> freeing offload in the error path.
> 
> Fixes: 1666108c74c4 ("wifi: ath12k: support ARP and NS offload")
> Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
> ---
> Compile tested only. Issue found using static analysis.
> 
>  drivers/net/wireless/ath/ath12k/wow.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wow.c b/drivers/net/wireless/ath/ath12k/wow.c
> index dce9bd0bcaef..e8481626f194 100644
> --- a/drivers/net/wireless/ath/ath12k/wow.c
> +++ b/drivers/net/wireless/ath/ath12k/wow.c
> @@ -758,6 +758,7 @@ static int ath12k_wow_arp_ns_offload(struct ath12k *ar, bool enable)
>  		if (ret) {
>  			ath12k_warn(ar->ab, "failed to set arp ns offload vdev %i: enable %d, ret %d\n",
>  				    arvif->vdev_id, enable, ret);
> +			kfree(offload);
>  			return ret;
>  		}
>  	}

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

