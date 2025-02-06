Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D3DC021A2
	for <ath12k@archiver.kernel.org>; Thu,  6 Feb 2025 19:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1EcH+wIk7SFlGrV9UWgKzwu6ZI6nYNoJsT/9rUuTdgs=; b=Z1xmcKIXYkCU1C4S0zHBUnkal6
	Ho0neCn2kCXnJVe3oZ48VmIwymal4DAEj1k7agwpSHW6A7xpX2QB/8WMX4supP24icjTGxqGcDLra
	X68PAtlk9AbZ0vTUXYIiOojWyqWsvmANQQX2HJuAeSMBX8H8T1Abbp9jasYY8OI9hfSAFEwaPOMm4
	0x08Ybk04fK+jXlmsR7Kck6GovELLycdCdZOhrT5JUR3SUoIRJ8CMLdG6p9NmlrKxLc9MJbsVVU9V
	H3SYCvtl1QzaJaNvrSYHl7o4ORO7op+SHMuSg27hpvrRyZy22mQ/dD6yEXFmGYdD6Jv1b6voHBdN5
	s9B+7tWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg783-00000007IUC-2rvw
	for ath12k@archiver.kernel.org;
	Thu, 06 Feb 2025 19:01:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6Z0-00000007B7Z-3rv5
	for ath12k@lists.infradead.org;
	Thu, 06 Feb 2025 18:25:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516GrTAt019088
	for <ath12k@lists.infradead.org>; Thu, 6 Feb 2025 18:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1EcH+wIk7SFlGrV9UWgKzwu6ZI6nYNoJsT/9rUuTdgs=; b=inXkckgRmSRB53rF
	tC9nyODSpmG2UQf+wXe182R70SDgJSMk/qYrSLNZh7qAVdFQ8JjARWyMO4k1H/at
	jtAWXXymYXeikCiEDkOPcjmYgLXgEAu4OgqlAF9zP7cRXvynElCSbLkSfmnAU5cZ
	DXKIfciB6Q3vW2tk5oz3oV0NN6m4MKK2/nWylSjgXlD0jHrWeWzWVqDds7q5Udn0
	nSwuk3O/GSqsv8xtX+G7ZvTe2ci0qn1AG8MG9nLHkextSGOVhLHV/NqElA1Nfrta
	j4elcG1sB+dEg/B0NAR0Q7c5nheJUPzaCGnL6NwORe4cxDgIC6F3s8K04aUvGSon
	BYruZQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n10h07y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Feb 2025 18:25:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2f9c774c1c1so3547329a91.0
        for <ath12k@lists.infradead.org>; Thu, 06 Feb 2025 10:25:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866317; x=1739471117;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1EcH+wIk7SFlGrV9UWgKzwu6ZI6nYNoJsT/9rUuTdgs=;
        b=RbByueqqfEVuR6DMiLaZ510GhrSjq8UucrYWz4BNtDygLE1sTIkGsO1la3zqWIr78T
         1fJta09zpKhImd3T2Q8HBVw26lVudsmRGLKyPggTK51L9XBzz33vPfLzrRfo2EF2Xsmk
         9+svFWori50BQBuIR7F9HWoSU4oDxJkT2N/axejhUA8/2g9H3v9OcEIg09/+HsdVQU4n
         6tbAZpN+EDi7YyFgpTKD9wiANHqJeUK13PkBK2MHushP2CrbRKnBJHmVqbEf5jTRoh5u
         eTpDi/faFfeLzjh7cyIS7kfcyXg5pzQE1iWMUXO4//RV1sW/5+ObzEWO35EkunF/AyfX
         9vew==
X-Forwarded-Encrypted: i=1; AJvYcCUteerascMqdMAWfyVVO0N9UH9uxytk4POaOo6+UMGjFGZ/k8NYEhqzuGoodDi7WeyyBkwhJNw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNbO/BOctFNesUp6nUU4e/qeWCdPJgtkrmWP0m9JUZqGUmUaT4
	NnT+MMTVU370hGomivO0IeT5COQEZybeFBdER9UNNZ+BK9Q1GJLF9U2NIflbcLUEgkg4PtYAqZl
	Ae1/jhK9FdO5foQbhqq7eInEWwxXRySOJJ1wKdZ1cc8yM7sECyHFDu89hXqZ9IKiviUxU
X-Gm-Gg: ASbGncs2zTrXXywPPSiVsbcRZ3ttVS00Zfu9UuD9O6UKZXcyIZTuBpXE4Q2kz+sRVg5
	mM0SQ2HfGBn6smQDKpBImnnwnloHl01Y+VEFj9UWQOPVDsIupDIbnjEjvHTfMbChDBwqUWFHEc0
	smzqeOZrnBW+vxX5H3adrjkvf0Wk3ljIoSKp4XVoNVZ0IxzaNNNnChDS5NtbGVD2MS8/F7M7LzJ
	rss80huYme6kdsc4hb/hIMc4AbJJ+1aDlmJyjLdHVxQ75yUT3E4y18FWAo6aMetNv36FiOoKZNU
	cXB+toG6ar7EoppXZPvS+kzAi4zY4mi267VGug45xnwIdiqAglviW7eWfFfvO6fIPLXPWqXS1Q=
	=
X-Received: by 2002:a17:90b:4d81:b0:2fa:1f1b:3db7 with SMTP id 98e67ed59e1d1-2fa24272512mr75662a91.18.1738866317548;
        Thu, 06 Feb 2025 10:25:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHciBvji60FFYNw+wOe9jHq7tipWI0mE+EGPEF5DfFHGH1ACVXasewYAUw5HrXPa8KOxve6QQ==
X-Received: by 2002:a17:90b:4d81:b0:2fa:1f1b:3db7 with SMTP id 98e67ed59e1d1-2fa24272512mr75461a91.18.1738866315693;
        Thu, 06 Feb 2025 10:25:15 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa099f4d6asm1727996a91.6.2025.02.06.10.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 10:25:15 -0800 (PST)
Message-ID: <7633c19b-2aab-4f2a-8c11-27425f7299ae@oss.qualcomm.com>
Date: Thu, 6 Feb 2025 10:25:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 25/33] wifi: ath12k: Fix locking in error paths
To: Bart Van Assche <bvanassche@acm.org>,
        Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marco Elver <elver@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
        Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
 <20250206175114.1974171-26-bvanassche@acm.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250206175114.1974171-26-bvanassche@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Sbt9jjhUP3WB5h_CfvIZAkTgimqfnnfu
X-Proofpoint-ORIG-GUID: Sbt9jjhUP3WB5h_CfvIZAkTgimqfnnfu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_05,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=858 lowpriorityscore=0 adultscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_102523_123709_AA64A3DE 
X-CRM114-Status: GOOD (  18.43  )
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

On 2/6/2025 9:51 AM, Bart Van Assche wrote:
> If ag->mutex has been locked, unlock it before returning. If it has not
> been locked, do not unlock it before returning. These bugs have been
> detected by the Clang thread-safety analyzer.
> 
> Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> Fixes: ee146e11b4d9 ("wifi: ath12k: refactor core start based on hardware group")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 0606116d6b9c..212cd935e60a 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1122,16 +1122,18 @@ int ath12k_core_qmi_firmware_ready(struct ath12k_base *ab)
>  		ath12k_core_stop(ab);
>  		mutex_unlock(&ab->core_lock);
>  	}
> +	mutex_unlock(&ag->mutex);
>  	goto exit;
>  
>  err_dp_free:
>  	ath12k_dp_free(ab);
>  	mutex_unlock(&ab->core_lock);
> +	mutex_unlock(&ag->mutex);
> +
>  err_firmware_stop:
>  	ath12k_qmi_firmware_stop(ab);
>  
>  exit:
> -	mutex_unlock(&ag->mutex);
>  	return ret;
>  }
>  

This looks like a legitimate issue.

Can you submit this as a single patch and cc the ath12k and linux-wireless
lists (as I've done in this reply)


