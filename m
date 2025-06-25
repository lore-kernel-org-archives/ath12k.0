Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3DDC77B7F
	for <ath12k@archiver.kernel.org>; Wed, 25 Jun 2025 03:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rGKfn836zR6g1TaHMmCprsxDY1nI2yMAFBUTp8Nr74=; b=T6BPHgJgry+eSrPyDSBPRHw2kx
	lzxJ5ZcTryrA9bugwFB3xBsA3Vj467CTv00oosbbDjlBz1MIf+QPlqTNXP8W7a4xRRkKNpfKbrWkz
	4GfiH1W/gIk7hp0tI9I/JJIgUOxEkKhqABcC2dY/YDmiX7ul9tMvo8XYG3DEiFafoiUS1aintQLrT
	k5qHkojGrZmbbqtr+kqPydIi6Og0944kE3LRVI7sn6raPNulLajEhdU/hx/SbNR191xKfi/B3qt+9
	MOuk2iOlnNqMyXDlMYTt+hmYaDMsprssPoDsrhnt2AR6HiWc+bqlrEIi1O3lwCBDh8rVvcP9I6D+0
	vOJQYiDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUGN9-00000007Mvr-2exR;
	Wed, 25 Jun 2025 03:00:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUGN6-00000007MvU-485b
	for ath12k@lists.infradead.org;
	Wed, 25 Jun 2025 03:00:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMfNlI021624
	for <ath12k@lists.infradead.org>; Wed, 25 Jun 2025 03:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/rGKfn836zR6g1TaHMmCprsxDY1nI2yMAFBUTp8Nr74=; b=gv0Luwcx2bM7oMD1
	8Bq72bU8TA/cvxEDGB2FEr8iqIenGWSES4PC3ax4OMVwIjsnAvRBQ2piQowLjdVy
	M6pq5EPe36mvX95yY9g2xoDrlyuVFsWbJQ1jh01H6JL/u3Q17D2qwPpoj8sZUiR4
	YppFbJjImj21c3V8Blcfw07yCCFNyYJdiAptmebDqFmze7ORj0VRDL7EkUwxWWyL
	ig4g3Eu7fGa/g68XnPBSvZUOiy1ZI45WiippnbmLq5d3+uDX89VRC96DbfL55VlN
	RrxpyZHy3OJ8corl28ePdtN4GV13LV32Xs8BsK7YVO1vM3ce4FupIARnZ4xpJa+w
	BJ2+/w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpxhqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 25 Jun 2025 03:00:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74890390d17so902053b3a.2
        for <ath12k@lists.infradead.org>; Tue, 24 Jun 2025 20:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750820406; x=1751425206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rGKfn836zR6g1TaHMmCprsxDY1nI2yMAFBUTp8Nr74=;
        b=eHcCTZ5xGarWlDfbWqe6KAy32LPEXjz1QYAXCG/8bUKLYT8k/PDVh/76FtveGjx8Tp
         Jr9yv5fgZCUAykOv64LBN+1/BHIyH4Hn3U5V5l2sUkua2PxIAISfkQNxbjBjeIIcbhvW
         U6tliIErmHG0EY3z0NL2HxNztA97mVmIPHU1Go2qAGnJlFO/hakiW9EEN1iElTwbFo9f
         zJXenBNSaSReMGuCyOuJtkFbRzPORc6P+TR5oJG1xA/IO3tYwtcAaSX+tvrNtEmcFPDJ
         RSWQkzeAOGwPhQGADhQ0g9IgeF3kmMq4oNNDn06IwaAC1louK1mlN6D8dZtOqSbRxPhr
         NXcw==
X-Forwarded-Encrypted: i=1; AJvYcCXBi8BWBvF65cY2fPsU/OA8EWwtq92rjHoCg/jEGAk2o2/9tN5CIhpu0D2pXMqQWyfgeZr5CwE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzE6hlaF+8hbryETuEcVFN1QciSYDxUPNm3bbOBZQwjYK133L9F
	VIhCe8vFPWQeRkl3vcgpzwPSH4DfcjgcKnwqr+TGnlxscXesUkIe3+3WvJUKVG5pz6UT1VK2GEZ
	L/nFOQQCj5sd29RZ3S4dhlhRe8psRxZhBnzOJQ2/OE3buPgJR5Ak7XelMq123KngH
X-Gm-Gg: ASbGncuMkSJZEZY8TjFtxuBzHWb4FWICAk94YUAIHVYLGzDWr0QqkV6QK5Q/cGGXbIQ
	y0Ki/GTEY4/m3gWJFa3/PN2vUHNq3KfF6qa24x+ausUjsRVXnemHoi9iYm8X7RiokMvDYaJwJSF
	omlAD1UEA/D1bNn+Y+X36LScrMXbRCHgIuwR+SQQkHeV1YsEZPIv2DOMDwU6Yl3DC3zmTOVeST/
	Pbdhy2MQRBItqYajpxOKXcCayNdYr8i0kmnGoGCkJH+1RvEn4mVS//5t+TrkvRte9WxQ/BAaHi1
	F0i+yP2XCoZQeE2C+olE+RyuCGbO+jocwYe0vNBVi3EJ7S+uBAtHh8iFCMA62Bp1xLiEyYDCv4A
	2pXy+EUNqW7LyVg==
X-Received: by 2002:a05:6a00:4fc7:b0:736:3ea8:4805 with SMTP id d2e1a72fcca58-74ad44928aamr2199203b3a.7.1750820406583;
        Tue, 24 Jun 2025 20:00:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8k9nP5GC32oX80A92Zdm8o3QK+RIi2Isd9EdppCplGvcDb/h43dIjvxGmnkQdLJqMew/JfA==
X-Received: by 2002:a05:6a00:4fc7:b0:736:3ea8:4805 with SMTP id d2e1a72fcca58-74ad44928aamr2199167b3a.7.1750820406118;
        Tue, 24 Jun 2025 20:00:06 -0700 (PDT)
Received: from [10.133.33.71] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c889113bsm3282794b3a.179.2025.06.24.20.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 20:00:05 -0700 (PDT)
Message-ID: <944ecdbe-d532-4871-8678-3cc44663d69a@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 11:00:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath12k: add module param to control MSI mode and address
 width
To: Govind Singh <govind.sk85@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250624165031.58616-1-govind.sk85@gmail.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20250624165031.58616-1-govind.sk85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685b6647 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=vB2BEDJm9S744fNV2K8A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAyMyBTYWx0ZWRfX/ie648s2GRtm
 TDjL1MiM1Hb+EwZZXKsVfw/3t15s+ADyyYx4urCjej9YWz8IGIFvVc00n4Cdrb1jN4mL2Ke/1Ql
 Xw8cVjkDlyp44Tm/bzZ17WAtWRTXPuVwIQp3FplrCptCSetcWpi+BwEu1gWd1JlZBZ7rMgGGZH7
 YzlIJLLDgjWUdB81PIu5+53KvfisPDB6If5BH0VSz73YwR1DNE0WzWs41BqMFrbrgYmY24HcIsu
 DT875D9+u7JMS+kPlcp42zamMK4BmjWPUzo2ufXiIaDL8zzzj3LNDsQWoKC9OwfmmyeiXAV2VPa
 8Xir7HzjzCqe5VCH9b3/RP526Mm/VsBCpbGUMF7HsYdJdRZx2ebxBetv1r4IHddpYZ5TX6tAXNt
 DtHo5vvC9Jdz77QhQ8vyrAQiOThRkz11luCwK407Sb5qtJLS0q7FuDLV/UF4d1F/O9e6k3hl
X-Proofpoint-ORIG-GUID: TszP_qeO9eAYVuN00Yw_4GpddIcwxbrB
X-Proofpoint-GUID: TszP_qeO9eAYVuN00Yw_4GpddIcwxbrB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1011 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_200025_170632_B474DBDA 
X-CRM114-Status: GOOD (  24.62  )
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



On 6/25/2025 12:50 AM, Govind Singh wrote:
> This patch adds two module parameters to the ath12k PCI driver.
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
> 
> The original MSI allocation logic remains unchanged unless the
> parameters are explicitly set via modprobe or kernel boot options.
> 
> Tested-on: QCN9274 hw2.0 WLAN.WBE.1.4.1-00103-QCAHKSWPL_SILICONZ-1 with
>            i.MX 8M Plus SOC
> Signed-off-by: Govind Singh <govind.sk85@gmail.com>

Like I commented in the Bugzilla, this is not a ath12k issue. Fix/workarounds need to go
to the PCIe controller driver, not its users.

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
> +module_param(ath12k_msi_mode, int, 0644);
> +MODULE_PARM_DESC(ath12k_msi_mode, "MSI mode: 0 = multi-vector (default), 1 = single-vector");
> +
> +bool ath12k_32bit_msi;
> +module_param(ath12k_32bit_msi, bool, 0644);
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
> +
>  struct ath12k_pci_ops {
>  	int (*wakeup)(struct ath12k_base *ab);
>  	void (*release)(struct ath12k_base *ab);


