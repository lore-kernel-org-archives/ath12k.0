Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EC7C02198
	for <ath12k@archiver.kernel.org>; Tue, 11 Feb 2025 02:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpKCKjeAbIqONMFiJVjOlSnMTDfFUoERYTpc2AfR5UM=; b=W/ieGHhn0R7JORyu9+sYfBl+zc
	dZIXDef1g4PLzLeHV7kywF40vKOX+XCiLewQXh/Sqgm+XEtTMmJSlwudjcHxhUa2k3RCWKlw+rvVm
	MHna1u3YTML8hobwYACWf2L7uZD7ny3J1ZPtgNrKmCTmaChmmL/xrduBumsSNC27Zo8VD+Zrav0C9
	UDwq1CKNDAo4wyoiYOJ6qp/Z1iz3UKPAUiSA1lPbGtM5XTRS+W7zmYInl1MEXQApFgcsAEjYXNh0O
	2bxQ8f0ulPSJK9EugbA7vHGwsZvtlLz1nicmpy1Jg62B6WJ7coMG0tZclVdlYbHeg+sqslZoOQCr+
	f6NBmGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thfje-00000002Erq-40HJ
	for ath12k@archiver.kernel.org;
	Tue, 11 Feb 2025 02:10:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thelZ-000000024iD-48Zm
	for ath12k@bombadil.infradead.org;
	Tue, 11 Feb 2025 01:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RpKCKjeAbIqONMFiJVjOlSnMTDfFUoERYTpc2AfR5UM=; b=Q7SvDqxI2yzbfUI+il9gCxoknf
	MaFyhFyReSWmo74C6d9W6FRODE7EwHGG3191Qv5LqjC7+TrtrfTsQ5NxeUZ1QunRb4eQevZqdWory
	89PDWd36eFCW02XaVqAOpW9X6D2HiBNRzxkESzDZIRdtr5GafgaN1WnlHBsiicvCL2Pap2xWYD8Rr
	TXucXzTlIfZ4acWvIXK6fdfFPGvR2R6+paiftodan/T77fNFk7TTdinzb+RztKp/kkyQwalAhvmoz
	APvPzea4Z/M8e+8Vu8MkPOAS5US6Oh6gmKMs98O8JZfJ+gnrAhLFv9ZuqN4qAeLsjXh8pXK0hHrba
	llGrktWQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thelV-00000000QUN-3kfv
	for ath12k@lists.infradead.org;
	Tue, 11 Feb 2025 01:08:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AJJUwW002266
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 01:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RpKCKjeAbIqONMFiJVjOlSnMTDfFUoERYTpc2AfR5UM=; b=BvIbudgqxtCpqPJw
	UctRfJH+t4FfLmbBS6DWZo9mMKVxF5V7lzk8yXZYKku9oAy3Nf6ldJRHQbz2kPv8
	9vMUCZeAWOvVectx3FNt0oFFcDj0UShnLZ8Ky62Fuqf288E/Ros9Hs1eINEyzOFh
	xxiwy10rL+2G8ugX/42G4w/ndw2vNLynDlZ+EY6g+vHkm+pa20AT7if5kCstvjPZ
	awy1/cXk0qNkAR34tEpPNF5zFTWw4NtuCUYcDce9RLZjLgbf+NcRzyJuYNrtlbHZ
	qkYE8gQOMqjoe0aVzNBa91jSEQTJCovtC7UntEA0FHevXah6jlcC0Pgwtj/19Ebt
	bo73+A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qepxj9ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 01:08:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21f6890d42dso98148905ad.0
        for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 17:08:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739236114; x=1739840914;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RpKCKjeAbIqONMFiJVjOlSnMTDfFUoERYTpc2AfR5UM=;
        b=hdvDYWw0cCwwivgQgx/gHT1G07ZDalYQHDDqgZjIQjaF7xWr5E99kC2ZsO/fpZpDHL
         XDk90uKD06Ft+SHisE8kX0Rb/V374D609LmuG9jU4aACHNRehF5CAyJcXgT1BX4S4ZzJ
         FwvwZrZQ0fAw5qRq38mAwbs+jpbhMDpuuj+15+V6vTR7dEsuT8nIJOJk3on8rH+TWfdA
         6I7k3K2IpGE/rcIw2b5xRHBDHURlwvQ2ZcXlHfi+pe6PkLYMamTQRH+5qia05ky407Tc
         RgE5ATtDM88iZ/hPPeTKa7CNbhz8DDupuRbY2c/cU4XGrMaZ4tFBXVHSkNp6nx1JwW88
         vhwg==
X-Forwarded-Encrypted: i=1; AJvYcCVH/ynolJX+et54AHHS6VOm+8F44+LmIQDygwZa4wu/THlb0tYogoWNOkR/pLNX9qLlfbfQGl4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1HUGw6tTFzLdKYpDUq9Ugi+QqCYKDy/N77opP70b4phAWaDOm
	tKk3VayxUOT68ALdxSQbQ1CZK2jEQqtQ3Y3uI3JEm1wMcTHzjOZAfbBOrPs4H0XejqGFZ+4/EyR
	jkjdoG2sHmC00QdpSgmjq3QVJA3wMrJcGkdwckv0ZKV2jlAHhM/DGKnA0Tlfs
X-Gm-Gg: ASbGncvO1Ed5gle0dq9prUICRk7279T5Njyf5DwHCxDgLEsG2Nal7taeETW0iLhtlhk
	OybezmPUuD9bOOos5JcmYBLw/Q3rCvndL1e+HidnmgGvFdvUixtnrTjOtrSnhj74s+HnXRhY6KL
	8TxYs5Z2filsjbozdVBctYnI9cikfFzMZzoL8i1jrmy7nONJz++erVUzZqo2w1/mtLE8QI7wedS
	+fxKFj3PUp6+PgVh6C0CoSoTNL1Q/ARuZjXb518sKYAgPgU37m3xIaSbReRaiFtc7m6YPJQf7rL
	eRdK++O0spdK6rQs0bcx2Lc3rJ7x24R1zpGl6nOo+z3sXQze2XjWd3nxwyfYLcNuGarz5xDLQg=
	=
X-Received: by 2002:a17:902:e74a:b0:216:4064:53ad with SMTP id d9443c01a7336-21f4e7ed222mr262295755ad.48.1739236113863;
        Mon, 10 Feb 2025 17:08:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/lVU6NZTzrLR3oJdGFyeLKiV8JfyCXjnYy2BiRewTlx0CpGjULYWYSq5eGpYAPKlbHbIRHw==
X-Received: by 2002:a17:902:e74a:b0:216:4064:53ad with SMTP id d9443c01a7336-21f4e7ed222mr262295425ad.48.1739236113498;
        Mon, 10 Feb 2025 17:08:33 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36560c94sm83817485ad.91.2025.02.10.17.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 17:08:33 -0800 (PST)
Message-ID: <a7ca4e4b-c432-4f2b-81c6-c7b06cd12de1@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 17:08:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix uninitialized variable and remove goto
To: Ethan Carter Edwards <ethan@ethancedwards.com>,
        Kalle Valo <kvalo@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Harshitha Prem <quic_hprem@quicinc.com>,
        Kalle Valo
 <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20250209-ath12k-uninit-v1-1-afc8005847be@ethancedwards.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250209-ath12k-uninit-v1-1-afc8005847be@ethancedwards.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SOjDez8akqGHKYbptK1rl5_789oS8vja
X-Proofpoint-ORIG-GUID: SOjDez8akqGHKYbptK1rl5_789oS8vja
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_01,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_010842_481478_2C50B25D 
X-CRM114-Status: GOOD (  21.52  )
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

On 2/9/2025 8:36 PM, Ethan Carter Edwards wrote:

commit subject should be as specific as possible.
suggest you at least mention the function

> There is a possibility for an uninitialized *ret* variable to be
> returned in some code paths.
> 
> This moves *ret* inside the conditional and explicitly returns 0 without
> an error. Also removes goto that returned *ret*.

ath driver convention is to declare function variables at the beginning of the
function -- please do not relocate the definition of 'ret'

> 
> Addresses-Coverity-ID: 1642337 ("Uninitialized scalar variable")

Is that an official kernel tag? IMO the proper tag would be

Closes: https://scan5.scan.coverity.com/#/project-view/63541/10063?selectedIssue=1642337

(is there a shorter URL?)

see https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

> Fixes: b716a10d99a28 ("wifi: ath12k: enable MLO setup and teardown from core")
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 0606116d6b9c491b6ede401b2e1aedfb619339a8..ae75cdad3bd6b6eb80a35fee94c18d365d123cbd 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -908,7 +908,6 @@ int ath12k_mac_mlo_ready(struct ath12k_hw_group *ag)
>  {
>  	struct ath12k_hw *ah;
>  	struct ath12k *ar;
> -	int ret;
>  	int i, j;
>  
>  	for (i = 0; i < ag->num_hw; i++) {
> @@ -918,14 +917,13 @@ int ath12k_mac_mlo_ready(struct ath12k_hw_group *ag)
>  
>  		for_each_ar(ah, ar, j) {
>  			ar = &ah->radio[j];
> -			ret = __ath12k_mac_mlo_ready(ar);
> +			int ret = __ath12k_mac_mlo_ready(ar);
>  			if (ret)
> -				goto out;
> +				return ret;
>  		}
>  	}
>  
> -out:
> -	return ret;
> +	return 0;
>  }
>  
>  static int ath12k_core_mlo_setup(struct ath12k_hw_group *ag)
> 
> ---
> base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
> change-id: 20250209-ath12k-uninit-18560fd91c07
> 
> Best regards,

replacing goto out with return ret and unconditional return 0 LGTM.

can you respin a v2 with the other comments addressed?

/jeff

