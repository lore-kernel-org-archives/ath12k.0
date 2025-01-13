Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8E8C02180
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 19:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojTs5gJGcCPM/zOZy1/aQkWrBjI1IfejHR/He+7LfTI=; b=AnU0RKy+o4Bxn0dHxorJqso2Xy
	kuj5iluUoBUhlND4WS5NcbivZCi5SSl9aPIpiFUwG11VgoXLk2l7wY65edFmSZjgz9EM5afiXc5N3
	uNoPrNRL0iV/TuRkvp132zIGE53Yp6Zv2OiNxDZ7ZBC2yKu+0gj3r19MHtRKYA98uuuvX9p3+4ugy
	gsNB+ULkd6qKV7qEmbJ+K49bNwdHrz314aC9DAR7MfTh56SPzHKFCASwpObAHsSZPm7TnAu4XHvPK
	ZXS5+cPvZTK1nBP5KVgO+6slhGqj4q+t3NzCUKPna8Y6OsZw5W6Bk4xJ7Hh4UwBfJfQJ4FRsFn3lB
	JAkF5dYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPtp-00000006LDc-1ftK
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 19:14:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPry-00000006Kuu-2hjh
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 19:13:03 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DErVTN021534
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojTs5gJGcCPM/zOZy1/aQkWrBjI1IfejHR/He+7LfTI=; b=QK3vikbDAqNwOPBM
	SFtSNUlh9fz0EIdxtoYJE6P2slbW01h0nPSMjq6GUzFEDzb8H/pDxFRQz9mdVmPB
	XxG3uNlhMUUqvhH9rCjbFyJFaDZIdSKKSI6ZVAquEG8a0uhmV9kc31456s1AigZ8
	y4eZnWlTqCQK2hEckGlI4/u9HQ6LgM8zJDmY3X+7vOt4l/D87Rnf/rRMJ5PatTdP
	sOSVL8flzfSERkG+AE4l2xLGcFzBavIRsqUkjF8o12XM7vutDLAHJK/r/m0nXWG8
	JKr426mRqCwlkEF20JarYyyM5jMX9lrbhuXfc4LxJTOYbT+oK5jrDWpNdjjk0Rf8
	ZlJ4jA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44550agmy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:13:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2161d5b3eb5so83634435ad.3
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 11:13:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736795580; x=1737400380;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojTs5gJGcCPM/zOZy1/aQkWrBjI1IfejHR/He+7LfTI=;
        b=Lkmk3ZYQJg2tZw2j8NQ+9oUtbWp8CX+jqoDgwFd391dLPs4Pd40c51zAaXhXUF/Kld
         tzqLHWmmHyhgP9nLmgdxkAaqhln9HXK4DCzp313yr1ps9tJn6uM+L/094rJRgnVJKcc+
         gJqWxEcTcOiW402k0eKVr3rYAnFv/FR2GAfYtxH8hLeQ5WsoNNPMyxBK1kJghmMJWwAB
         ZVyAdIAmYNN6VZphesDKcm5WYP2En3jhDb3JtBdQbykmDOJr8rGwiHRnd6D+whidkhwH
         lz10yWACEgbGS/HqlZVjmytGGkQXNHvzgB/jq7hsZZF2JOtG3gT8Oce2g12qJDqKYG39
         LH0A==
X-Forwarded-Encrypted: i=1; AJvYcCX0yZpL9NsXgBY6SDjt7TPUgxwAddamSv2vhuBgev5KVEhp1zbH4Gyb+2yrmEMcNLX0B9Qulyc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+Ovv9JhznAYADb92+tk/Szfb/J6+B9X7Pqwy7bPouuTQpKRLH
	5LsD9oPY9IyOE9yhieRfNXH1x/K1eaxLkfgWiHEiRxW+amlNTpyW3RdHcIRbS/8T2mf69sL6Zwy
	aZZVKDrqZ4M0ydjoHJIGj2lxEmStX69PTH17wunKwv8usVyb4Ls4nNbQe0P3N
X-Gm-Gg: ASbGnctwfAS/+Yf8zApaKC9NOdetWjTWYK1qShgo9GrCYHrAL9cB8yShBUDuEKy17Wp
	izJ51QKddot4qugHuGSBUaWgqdH6e3idcdKyJr5zD7CtDGDzzLqGCsPTOhfbRB2J/j2uNAkApli
	y9XijFQML52xP3ozJZvouAB+a9PiX+DL2CvdlpuMGIBw3H28I7YvaOdZlzFlp0W+MOoCdzTRCQ8
	/jCEN44/9k7EImTYbvf+pTzTHF84NPPIabtQ4RD2g1zZNpJuA3or2tVj2BUh6Z1hpKboLw34VMJ
	8MOKywOPiFtbpIHpcftE8NHLzbCGYGILwMsc4sAz2ziyYJQnsw==
X-Received: by 2002:a05:6a21:4a4b:b0:1e0:d380:fe66 with SMTP id adf61e73a8af0-1e88ce26ed3mr33573194637.0.1736795579559;
        Mon, 13 Jan 2025 11:12:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlqFZdhLJxpDnvcFS0QjJICPibuPNW3II6dpekmZMtvmZ5zP50C9Zm2YSwL2TkOMTSo+QZyA==
X-Received: by 2002:a05:6a21:4a4b:b0:1e0:d380:fe66 with SMTP id adf61e73a8af0-1e88ce26ed3mr33573161637.0.1736795579194;
        Mon, 13 Jan 2025 11:12:59 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40568dd7sm6208324b3a.40.2025.01.13.11.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 11:12:58 -0800 (PST)
Message-ID: <5925d874-1b8c-413a-a6ad-16d7ab299f4e@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 11:12:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] wifi: ath12k: fix firmware assert during reboot
 with hardware grouping
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>
Cc: Kalle Valo <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com>
 <20250109-fix_reboot_issues_with_hw_grouping-v1-4-fb39ec03451e@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250109-fix_reboot_issues_with_hw_grouping-v1-4-fb39ec03451e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2tLtr48r8Eo0HljRlMjmacCJYFd6QQUU
X-Proofpoint-GUID: 2tLtr48r8Eo0HljRlMjmacCJYFd6QQUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_111302_807125_4D66483A 
X-CRM114-Status: GOOD (  22.79  )
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

On 1/8/2025 8:25 PM, Aditya Kumar Singh wrote:
> At present, during PCI shutdown, the power down is only executed for a
> single device. However, when operating in a group, all devices need to be
> powered down simultaneously. Failure to do so will result in a firmware
> assertion.
> 
> Hence, introduce a new ath12k_pci_hw_group_power_down() and call it during
> power down. This will ensure that all partner devices are properly powered
> down.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/pci.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index 837be309cd45a2d037ee8c3bba8f7be0f457d6b2..7f6521a56ffc0f1e9687c94d6829a9c1f1887661 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -1751,13 +1751,34 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
>  	ath12k_core_free(ab);
>  }
>  
> +static void ath12k_pci_hw_group_power_down(struct ath12k_hw_group *ag)

don't you end up calling this for every device in the group?
what prevents ath12k_pci_power_down(ab, false) from being called multiple
times for the same ab?

> +{
> +	struct ath12k_base *ab;
> +	int i;
> +
> +	if (!ag)
> +		return;
> +
> +	mutex_lock(&ag->mutex);
> +
> +	for (i = 0; i < ag->num_devices; i++) {
> +		ab = ag->ab[i];
> +		if (!ab)
> +			continue;
> +
> +		ath12k_pci_power_down(ab, false);
> +	}
> +
> +	mutex_unlock(&ag->mutex);
> +}
> +
>  static void ath12k_pci_shutdown(struct pci_dev *pdev)
>  {
>  	struct ath12k_base *ab = pci_get_drvdata(pdev);
>  	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
>  
>  	ath12k_pci_set_irq_affinity_hint(ab_pci, NULL);
> -	ath12k_pci_power_down(ab, false);
> +	ath12k_pci_hw_group_power_down(ab->ag);
>  }
>  
>  static __maybe_unused int ath12k_pci_pm_suspend(struct device *dev)
> 


