Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F20AC7EE30
	for <ath12k@archiver.kernel.org>; Tue, 24 Jun 2025 19:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H81KJDxnvk8MLP9fd6usStsOVCgvFGkQ9vXSXSAgBOc=; b=bXKhp8cYrCzSHKCd7e305vPDs6
	JLWZAVoQxicDdVU97TzwytK5LdkXZGS9rFGb6jxMm2GQeZiElKDrPUiD/wf1buHM60R1Jy93xTOrt
	QNTIEYOWthpVGBplfHPD6ffGQwRKK6uhVgR/b8PkvKyc+BqTs1wJ3q/R1lWP3kURwBg9bPDyPNOYC
	37K/ijNN/nBHwebUECQ4Z0Iu52J80mqO9DgxberFadMzBGTTKtov/C9iT1s2dAKIqZJOmIgeK6Dqn
	dZIbko6T+cD3inPoY/bqBLdEy46CqVEfelo1u5XG7X83+9D80LbINEmkHJNfoqw+kbdSQ/vkwZy2M
	Bcnwrf2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9jy-00000006gg3-2rov;
	Tue, 24 Jun 2025 19:55:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7PT-00000006NlY-1U6V
	for ath12k@lists.infradead.org;
	Tue, 24 Jun 2025 17:26:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFbQkD019166
	for <ath12k@lists.infradead.org>; Tue, 24 Jun 2025 17:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H81KJDxnvk8MLP9fd6usStsOVCgvFGkQ9vXSXSAgBOc=; b=iLjDCPE85hZUmA0J
	uGmXfPria38knNTGYg4X6sGKJzcjyXpCjaDcMZCwXjAx756NH8ArLfjIh+bVZS++
	gxOqL1j24TinnuPCJr+rcmQqoO0B/2ueIXgfsR2d1JgnRbY4eY5Z1UOzhKwhYwDk
	mOyyPVoI/oq/mRqU4GUCbvBjGM6FgQ0zwbB6mQ3vRYywG+h3uuLXr+CN6VmKwfrG
	u3qXRxyLo0KOIdO68v0xgUvA6u+pvWC5O8aRnTttAqEwJ3aO8unUG4MV/yYniAUq
	qbYHlpUkonFdAaO7C7wbsM3uFERuo2nnd3kOqaKezGQa+OCy9c4tHxy5wToLUyLa
	euFvQQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwubs4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Jun 2025 17:26:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235f77f86f6so56123085ad.2
        for <ath12k@lists.infradead.org>; Tue, 24 Jun 2025 10:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750785972; x=1751390772;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H81KJDxnvk8MLP9fd6usStsOVCgvFGkQ9vXSXSAgBOc=;
        b=N0jqzdbXGP9RxjE79zKByKDGVCRElEcjxRqbDSQNaq2VTaZD+7XfAw6k3BzbXBW2Ma
         krtFWEhlwmxGDPiMe8wlnAMJuOVQl5ZbgRoS6gDHpLU/+igpqlyHFYfIMRXOBEbHIb3k
         vyjzkgX/Mt3oQKNLRVgDgvLDUoVm0/LwWFEGgjeHbyJ81kXB5yk+gaeqHUDvdY5BVdHt
         YIoG6AnbIZTz8fHTALZiF0VquA2GLVaN3ekZbt6YPdkCJgrnVgOdDfwu56g9fZY1Wzxg
         NDIIHjzY4gOSxUfR1E5ytfEbcw8irBwldC7WQI3IOExoL6tGEJgKik/QAHOMf7GFgOiz
         BQiA==
X-Forwarded-Encrypted: i=1; AJvYcCXx3EuadPHx/0elDzQ/tYfOJ0ltm/ppyLW0N860Ycft4QqD4DYnrLoxxU0+wkCggaBe7zG93GM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyCvf+3Lv7oENy9DOobEyTATbwyELEfA22esFYedtIdeGCnr2w
	OyW2qwyoVD27PoYaPY/sSUNizY9iVBslJPh0IbUfnnYFQPhpwnWwPoLQkpcNoUHHJopsNyK8fKU
	vcbK4orSSuCkha25DS0Fw1kcGRJwL9haDyKPyPXSX9rDF81dhsV/TXa5BUeQM7t5I
X-Gm-Gg: ASbGncs7CEGTGKZZ8NIRXGLowyh7WsvfQprSha5FbkaHGWj0KuMKbpHNrgj7w3rJPxF
	fyLaTLN+5T0+w6EFdA15txAP4pajsjHDIBZQN3vcSvT8DiyiZgT+/GRtA1hXlUqBLnH1u7fp7ox
	7on0WjtJZNgR1jWl4qpHU8qy/PW8MlzS3ndAvmz9hSCF8bKwRM396xlJtYFQ4KZScPDvQnqP1ht
	VHW2HqeSnSY2UyhYsC4OtWtucsHvB7/NVwu5Gogbvm52NTijugq6TRlYP/7EksibAS4tna9zyMA
	ALogilJQJVtWLIa3ppPQUpYlIoXe0X7HC3U9ywVnID4kLRq5GryC14G6zAnZgUJy6q57rJ5ajbO
	+rEHq0kC9W6TDZzg=
X-Received: by 2002:a17:90b:1d8d:b0:312:1ae9:153a with SMTP id 98e67ed59e1d1-3159d8d6852mr24567641a91.25.1750785971906;
        Tue, 24 Jun 2025 10:26:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETairooMDzC3XVhPtfXlzqNuXuLeX56ohzqzwK4jWFu2BzVK3o1ztV+39tfeed69Z0UQeInQ==
X-Received: by 2002:a17:90b:1d8d:b0:312:1ae9:153a with SMTP id 98e67ed59e1d1-3159d8d6852mr24567607a91.25.1750785971401;
        Tue, 24 Jun 2025 10:26:11 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a331983sm13248029a91.47.2025.06.24.10.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 10:26:11 -0700 (PDT)
Message-ID: <58fa9f69-2525-4c6a-acc8-571b20a4646f@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 10:26:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath12k: add module param to control MSI mode and address
 width
To: Govind Singh <govind.sk85@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250624165031.58616-1-govind.sk85@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250624165031.58616-1-govind.sk85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EVSjvQTjn1_S7bvFnwnRVoXAERC4TjId
X-Proofpoint-ORIG-GUID: EVSjvQTjn1_S7bvFnwnRVoXAERC4TjId
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685adfb5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=usLT_vtIx6HESW-Kn04A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE0NCBTYWx0ZWRfX+9agduRlfKzh
 d6iueiOFkoweH5BPVis/TitEcORqvVkpsPg6BcAYOU5xDnrFzFpL3Fv4gFTYa8PnNmykl+afKaX
 eOAsbTntswDJzMX5MZEf/YGxU4x27+lx5SZFaFjlt2IE2+TyBZqPrT7tdTvbDi4pU1fnntT36lF
 d5CT5UZyBR2jX+SA6fhtDgBNV8wbwasmwL/xNiGbFPCgECcA4OpXx+pS7HXud0owERHXNAD/8DY
 Cz/Al3SkIBtBBC1gi0/Z9x+bTXhKedWJxDg3aisamjYipmbCDldh8u/QbENReTiPQQ2gZHrD60P
 mTHvJt66T1lNR53yjI8iPBBcTcjurmdup7mTQKbtrjUatEEf2ZDkAY9jbZagPL8XsgH7qfhGoCQ
 XBzX+UJuMcMNmXZUOuDoOmJkXz7RUe2QN02avwY/jj4WXOffD1qEj0SplZSUFD9yxQIaoXRt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_102615_532449_0BB67F0B 
X-CRM114-Status: GOOD (  26.41  )
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

On 6/24/2025 9:50 AM, Govind Singh wrote:
> This patch adds two module parameters to the ath12k PCI driver.

Please use imperative voice.
And it is preferential to first describe the problem, and then describe the
proposed solution.

> 
>  - ath12k_msi_mode: Allows selecting the MSI allocation mode.
>    * 0 = multi-vector MSI (default)
>    * 1 = single-vector MSI
> 
>  - ath12k_32bit_msi: Forces the use of 32-bit MSI addressing
>    by setting pdev->no_64bit_msi = 1 before IRQ vector allocation.
> 
> These options are useful for working around hardware or platform
> limitations(ex:  i.MX 8M Plus) where 64-bit MSI or multi-vector MSI
> allocations fails or cause stability issues.

So there is no way to detect this?

> 
> The original MSI allocation logic remains unchanged unless the
> parameters are explicitly set via modprobe or kernel boot options.
> 
> Tested-on: QCN9274 hw2.0 WLAN.WBE.1.4.1-00103-QCAHKSWPL_SILICONZ-1 with
>            i.MX 8M Plus SOC

Don't split tags, and need a blank line after Tested-on since it is an
ath-only tag, not an upstream tag

> Signed-off-by: Govind Singh <govind.sk85@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/pci.c | 25 +++++++++++++++++++++----
>  drivers/net/wireless/ath/ath12k/pci.h |  5 +++++
>  2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index 1f3cfd9b89fd..4f58cb1e03f6 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -45,6 +45,14 @@
>  #define DOMAIN_NUMBER_MASK		GENMASK(7, 4)
>  #define BUS_NUMBER_MASK			GENMASK(3, 0)
>  
> +int ath12k_msi_mode;

should be static, make W=1 reports:
drivers/net/wireless/ath/ath12k/pci.c:48:5: warning: symbol 'ath12k_msi_mode'
was not declared. Should it be static?

> +module_param(ath12k_msi_mode, int, 0644);

why is this writable via sysfs?

> +MODULE_PARM_DESC(ath12k_msi_mode, "MSI mode: 0 = multi-vector (default), 1 = single-vector");
> +
> +bool ath12k_32bit_msi;

should be static, make W=1 reports:
drivers/net/wireless/ath/ath12k/pci.c:52:6: warning: symbol 'ath12k_32bit_msi'
was not declared. Should it be static?

> +module_param(ath12k_32bit_msi, bool, 0644);

why is this writable via sysfs?

> +MODULE_PARM_DESC(ath12k_32bit_msi, "Force 32-bit MSI addressing");
> +
>  static const struct pci_device_id ath12k_pci_id_table[] = {
>  	{ PCI_VDEVICE(QCOM, QCN9274_DEVICE_ID) },
>  	{ PCI_VDEVICE(QCOM, WCN7850_DEVICE_ID) },
> @@ -773,10 +781,19 @@ static int ath12k_pci_msi_alloc(struct ath12k_pci *ab_pci)
>  	int num_vectors;
>  	int ret;
>  
> -	num_vectors = pci_alloc_irq_vectors(ab_pci->pdev,
> -					    msi_config->total_vectors,
> -					    msi_config->total_vectors,
> -					    PCI_IRQ_MSI);
> +	/* Set 32-bit MSI flag early if requested */
> +	if (ath12k_32bit_msi)
> +		ab_pci->pdev->no_64bit_msi = 1;
> +
> +	/* Force single MSI mode if requested */
> +	if (ath12k_msi_mode == ATH12K_MSI_VEC_SINGLE) {
> +		num_vectors = -EINVAL; /* Force fallback path */
> +	} else {
> +		num_vectors = pci_alloc_irq_vectors(ab_pci->pdev,
> +						    msi_config->total_vectors,
> +						    msi_config->total_vectors,
> +						    PCI_IRQ_MSI);
> +	}
>  
>  	if (num_vectors == msi_config->total_vectors) {
>  		set_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags);
> diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
> index d1ec8aad7f6c..4fa8bb619cd9 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.h
> +++ b/drivers/net/wireless/ath/ath12k/pci.h
> @@ -92,6 +92,11 @@ enum ath12k_pci_flags {
>  	ATH12K_PCI_FLAG_MULTI_MSI_VECTORS,
>  };
>  
> +enum ath12k_msi_mode {
> +	ATH12K_MSI_VEC_AUTO = 0,
> +	ATH12K_MSI_VEC_SINGLE = 1,
> +};

I'd put this in pci.c since this is not part of an external driver interface
to pci.c

> +
>  struct ath12k_pci_ops {
>  	int (*wakeup)(struct ath12k_base *ab);
>  	void (*release)(struct ath12k_base *ab);


