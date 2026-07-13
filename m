Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CC7C44501
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 03:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jlH+kqpuhP4XLp/9HwP9AS7/ZVK5TzgNUSZ5uQWx4k=; b=w0tA0CbvhqHfmQ90/vgxxuMSFR
	aGWPjYB0cRYYLJ6bZe4oA2CDnmCd/VmmkUp0uLrRDd+cyy+AZVDIdG/JQLdLNJ1EtMQrLIuVe5p9W
	VKlZX/6Tael0NEUIqxw0pYTQaUkwGx2pEuJEB2tzsehFnUoGDh1UTByxNz61OS/BcbQLYgMjMRM01
	hFVA/WN8Je65VeRAn5l2cEY9FX0SkMYK4XPCOSmtg6ZBSqUx5kOifUMmyxrthnMF7VJWMepOow8sp
	xDejSdjoIwxltUdhlsRte4TIgUR5RygFe8s8I2gT9Y/8HlhOGYliApGidJ5crCYjqeHjBePVI63HK
	+XyiXCfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj6xj-000000080X0-3onN;
	Mon, 13 Jul 2026 03:04:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj6xh-000000080Wb-3Mn4
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 03:04:07 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D29nRS107889
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 03:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/jlH+kqpuhP4XLp/9HwP9AS7/ZVK5TzgNUSZ5uQWx4k=; b=M3rERpreWkDVQVWv
	8pP8V5ev28A+tYAPTIpxhMPjBKmur/93b8VARdiNFJARpJA3GF/uX85Iw/eTGRL4
	MXhDpdgNwYr0lAGgbq0QgsFGcXtE2WLkwaihXQowlr4tAIduyRNfFCchO//CuKtD
	VfmNB9spdZUHAKbFLE7gqaIkSMf2xclM59m4rFb1hoOqMVEEquLy+44DP6pbxVhh
	P46Qv6Do6Uw5w6aDsNuszQ5Y0dOwCntOJ3gOYIHJ5r1hk3cxFLVtRhKahFBB/Vjr
	OBANTIP/nHawaohLsz27e5RAw72KewLDZE8DBVqZY2u0kYgXC827EStRDpvAQXjF
	9B19UQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgm56e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 03:04:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso2356926a12.0
        for <ath12k@lists.infradead.org>; Sun, 12 Jul 2026 20:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783911843; x=1784516643; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/jlH+kqpuhP4XLp/9HwP9AS7/ZVK5TzgNUSZ5uQWx4k=;
        b=GUys4sFAP6WklRQSHvo+EKfgS/DbdjchTGtF3Qza+bMjmXUxfTroPCp5JChUTWrxNK
         GeVIqKDOqr8IYstDjrwml60l3GAlQMFny3sLn4dPG1ETlCCLEM+XlTfoCIs474JO6I4c
         Q5ftHiowWmjiVUY6hMxaguMcPbgIyEacEwOo46JOd9C279pFk68SfRavoWyHgsEMkndd
         I4nGHYiQrzz7T3cSWVjp+SP0SU6RoSeaOkc8PJbkuTlI3+UROStrv7qDIKFOehMmBO+z
         65AQeqyh9MAoYqO+R4syyQcwyj3yD4SI08NwQrm1oUNQv8B8YrXup3HUaUD9QqIp8cOO
         riSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783911843; x=1784516643;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/jlH+kqpuhP4XLp/9HwP9AS7/ZVK5TzgNUSZ5uQWx4k=;
        b=ZyW/tTXTaRn0rIuSEHILPj5LCijUsh0QUio3uF+kuw6yqcptc09UCZ2vg32vMKpRw9
         5lBJjOtqTjapJugRpTL6jhS3zxpuAFDmHXZ7qgMuhdRUUWLOQw4bOENz1t0LRf9JcYc8
         rS+y1j3LHE9cXyoBhXsU3OUxUQ35t0IicCC8NFx0nupPs16+Bm0JgEkwpt0LjQFngIHA
         xskp7u9O4QX97uTjWaIxTEePBr06/BvMNRPGzLaTm2ghuP6sjL8vvUm6mQJd9zPQeXJz
         U7GrhMpigGVqR28gODvfGoCYTW1ZFgpLwXstF7dT+T9ZGkflxzgep7ttSTwOBfWnEMe1
         x1EA==
X-Forwarded-Encrypted: i=1; AHgh+RokfaoyO2qyX6WuhlBXv8uoIEpPTzov1C1bdm+7x71YLVnZyxCvas+vUSLNV4cAIm5zRH1vL9Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YxR/IQs/BfVSbFMFmq/R512zbaYRTHbzdfvms/lya7VFGXdKPwu
	i8hk/mzbIa9BS4ZdtyZIqF0KJ7KOMHUqN9stDNmFZzqtIydTBzslRHFH1+IJFyxlCa513ugh7RI
	DkLBSoEp/fzkS/XV0fy2fmIpotCd7LtXLbHOeac4EKla0R1xBmQYiHZ9udQW8Pbcf
X-Gm-Gg: AfdE7cnfNd91aIWs9q16tO+qdjKkbrg5B9ExdLnhdQwT8rdwPHQK+GYRNEAaqaHRM2r
	7lROa5TBS7m8WAT26u25lnV3+8zp5PeAsFom3Ruvh8rqm9B8d9kIPB4s9H2Iu92dTzHr3+O0juo
	eb3J2wX9CTEOUtLIdFrHVNfzNablehVqpiTf2iV92rp/kqxiVjORMpW+R8iRL9u+T0G68tkAvZq
	urr0QGpsP0x2kJQFnvLMRmFOZfabYPWUtcQOBAH0rK5sxbHhxSHOThjAVc4mgXY9c1nxHe+V0Cf
	ymYH9QyrpqcR5LkC6uTxo+y4BPRPqrTMcepW1bQP0RjsrWjGx4dTiz5It/CDeS4Cdp2wovJNn/f
	IdoA8GfBLmXMoMaADB/lRXnoEpL38+M/9h4QxjrgKhS5oEIl5ag99OW4vYxHB+HZkwrlVcw9pK2
	tp6GNrBe4=
X-Received: by 2002:a05:6a20:394a:b0:3bf:c2ce:972b with SMTP id adf61e73a8af0-3c110b6344bmr8240654637.50.1783911843474;
        Sun, 12 Jul 2026 20:04:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:394a:b0:3bf:c2ce:972b with SMTP id adf61e73a8af0-3c110b6344bmr8240634637.50.1783911843013;
        Sun, 12 Jul 2026 20:04:03 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162d3csm7701435a12.18.2026.07.12.20.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 20:04:02 -0700 (PDT)
Message-ID: <fe668799-6024-4370-acfc-ee64fb3a4d5c@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:03:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: skip PCIe global reset on initial
 power-up
To: Nazar Mokrynskyi <nazar@mokrynskyi.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jeff.johnson@oss.qualcomm.com
References: <20260505172415.566328-1-nazar@mokrynskyi.com>
 <20260505172415.566328-2-nazar@mokrynskyi.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260505172415.566328-2-nazar@mokrynskyi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDAyOCBTYWx0ZWRfX2hveVCXFgjEH
 vL+zKQ+IReXuOdYGgCB58flfEdJ+vWPjlAS2yzX5WK2lh/FfHKI32oNH0XQ8xQHKYgGmr0b57ZV
 ucUKcHGAnsb5vMhEed2M0K/UxRTzZ1c=
X-Proofpoint-ORIG-GUID: HoUgPiqZ6INwViO5A8KpS9ywnoWMwceE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDAyOCBTYWx0ZWRfX+xDtRg+a0vs0
 Avm95KCTjBqcRZVpeWuvCG/OqD3BbqXbAU2vZlVPeiE8YfowRnC6OGhdwNkNpz31Jd6K7qh88Ox
 wjGpI798jhJvvevqMK2Sv2G+mGWxYoABri+xCw/nUtEcDgJGT0u2SaBdnh1lgd5gR2Lz0gFEmtt
 6RECewLpqDzSH0yZ/EQJwKgYHpaa3L3JZ0uxsIXwpYMjCXzjpoP5oaNbny0SMaRpRiIMqTzhWpj
 yzhWk82UgMZTWWPIz7PVLNZgkbeU9pVBsX/Tf60nWboQ4NJejdDVDMgVi7g68etr1wRnrZYUFW2
 tinyEsvBGzt6LvsdOfd4+T+F42aB3g+xwTnVAXmije7DBXesH8+CG+nzo+eK9g4JgIcLMr+YS8p
 wp3GfersjgVoe6TfZPLdGoYUMwDCM0NsZUrEOkrPqgXu9xMX/ag8FDaxeDkrq5sA2uF70m24xOY
 h5cm6V5vHYT9Bji34EQ==
X-Proofpoint-GUID: HoUgPiqZ6INwViO5A8KpS9ywnoWMwceE
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a5455a4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=TD6mGIVpAAAA:8 a=D4nGGoZ5glmf7WdhsA4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=V7iCuLqznmuTtf2Pv1nF:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_200405_992645_B735DF43 
X-CRM114-Status: GOOD (  26.14  )
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



On 5/6/2026 1:24 AM, Nazar Mokrynskyi wrote:
> ath12k_pci_sw_reset() unconditionally calls ath12k_pci_soc_global_reset()
> regardless of whether the device is being powered up for the first time or
> recovering from a previous run. The global reset drops the PCIe link and
> relies on the host root complex to perform physical link retraining before
> the MHI BHI register can be accessed.
> 
> When the device is passed through to a VM via VFIO, no physical link
> retraining occurs after the reset since QEMU's virtual PCIe bridge does
> not implement hardware LTSSM negotiation. As a result, all subsequent
> MMIO reads return 0xffffffff and MHI initialization fails with -EREMOTEIO.
> 
> On initial power-up, vfio-pci has already performed a Function Level
> Reset before handing the device to the guest driver, placing it in a
> known clean state equivalent to what the global reset achieves. The global

AFAIK this is not the fact. Some internal registers are not cleanly reset without a global
reset.

> reset is therefore redundant on power-up and only necessary on the
> shutdown/recovery path where it tears down an already-running firmware.

is ath12k recovery working in Qemu in your setup? I doubt it since recovery would also hit
the link retraining issue ? Also how about the rmmod / insmod sequence in Qemu, since
rmmod also triggers global reset ?

To me this is more like a Qemu/vfio issue than a driver issue. The QEMU's behavior that
virtual PCIe bridge does not implement hardware LTSSM negotiation basically breaks all
hardware requiring runtime PCIe link retraining. Not sure why it is designed like this. If
it can not be fixed/changed in Qemu, can we do it in the host vfio?

> 
> Skip ath12k_pci_soc_global_reset() when power_on is true to allow MHI
> initialization to succeed under VFIO passthrough without affecting bare
> metal behavior.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Nazar Mokrynskyi <nazar@mokrynskyi.com>
> ---
>  drivers/net/wireless/ath/ath12k/pci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index 375277ca2..a3d7aeb72 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -303,7 +303,8 @@ static void ath12k_pci_sw_reset(struct ath12k_base *ab, bool power_on)
>  
>  	ath12k_mhi_clear_vector(ab);
>  	ath12k_pci_clear_dbg_registers(ab);
> -	ath12k_pci_soc_global_reset(ab);
> +	if (!power_on)
> +		ath12k_pci_soc_global_reset(ab);
>  	ath12k_mhi_set_mhictrl_reset(ab);
>  }
>  


