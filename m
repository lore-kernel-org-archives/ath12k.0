Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08E5C5B543
	for <ath12k@archiver.kernel.org>; Thu,  5 Jun 2025 02:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98gkKO9VZgvyA6RyLdZ6gTWX/uaH9U1xgFjK/tP8Uig=; b=ihVrO64iCP6E/cP9R3yQ1sVmbu
	WqT+pg48G1nIxgMTIhibHDrb5idnYeboduIiSggCZ2g1EsfoYyyvsRvTMfR9caNIht3LnkHu4aiVR
	XU8O/zZNfBF2wbRhCHH3Orm0MhScQ5LTLz906/563D3BFosxobmVCCsx2i7RaZm80LsZX322HvW5g
	I5BCG65amIepJMjDqTw6mgfKCAxv/hxICFiPUjnWVEK3BXeOjaHApz5YnRipX+E5FYnm1WKMd8HKP
	fVe2dNwsSy8dV3SNzm2EMolZDB3enM0e3ilptIb15FsKURrdht7C6QAy/Jpyz9DQeYhR4lZYHqj8q
	R6Vr2SJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN0DS-0000000EaPv-2hsX;
	Thu, 05 Jun 2025 02:20:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN0DQ-0000000EaPZ-0Zu1
	for ath12k@lists.infradead.org;
	Thu, 05 Jun 2025 02:20:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554GXBCe004287;
	Thu, 5 Jun 2025 02:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	98gkKO9VZgvyA6RyLdZ6gTWX/uaH9U1xgFjK/tP8Uig=; b=MpCFRUwNNc/pVjDM
	tzoCYm5/v2UEHAgKQ2YHGT1yjjeqy9bu3GWH/jF4ZouKyZrNxyNpH95BrWn0QJJR
	vexUjPZO+6ugKV4BDv53ZL+nim568qJOEZR2wvh7RgWQlqEPmZWf9Kew3GKYY6jI
	BBdx82vbiRcDtltGAT2HHFPIeqwKTZPdPXhWxK7C8UQNtDz+VzA5QSeBWVmh8B1H
	3B7OEg+ykwTvQFHrZe1JgBquJvjZPUO7BorCjd4O8QO/DPV2lcTfaq+7dIZQXzGJ
	DthBHrWYGibOzK1DIjFOLQ/fd9MJRAeG2NhEGoJYr5vJTKQQbKkqYb+phOiN8jD8
	ingv8Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ryvdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 02:20:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5552KE9p011493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Jun 2025 02:20:14 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Jun 2025
 19:20:13 -0700
Message-ID: <64f82d28-783e-46d4-a176-291c34183361@quicinc.com>
Date: Thu, 5 Jun 2025 10:20:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix uaf in ath12k_core_init()
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, <jjohnson@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250604055250.1228501-1-miaoqing.pan@oss.qualcomm.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20250604055250.1228501-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zcvavKgNYEuAT1Wq1aUu_sBIdZExmT7z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDAxOCBTYWx0ZWRfX4L1ZZobp30rC
 d3sGEc2NqwZvFnzvQQn08BZYJsci7PUL80oVvKz7KLvWgmQjxXITdawShFNFa2jeOBfPSK6Maxz
 6SQoDqKQJ9s77eeq2jwe29bzrvxoXN9uPwp3gOl9i1Uqt37Q/vpBRRVjm0M8m5/OjGyBqQPsgG0
 j1QX+P6gs90AezdzA83Qaq7HNGRlnETDn0KYdkcdFQcUlrFHsQpktFdB6xcVJh2R7vFJBduKETn
 UmKeqkb1P1GIUMDYs9x9tKe9kILz3mkO5lZCrgBqkUcEWOJuM0eBzAVjgJWPWXMXXX884qrg0Lw
 yyC4x9MjOmg7goOgCBXOP8psarHWEkD8zMSIh7u/BvdnkzAG0V2ikxe7Elr7RZ835huXMkeGt4V
 WWZ/nvc/IZe8pdis/hPXR/h9yJnVd1olqSE5btkIeBkwti0r5awYu1uyTfaR8kZ4xrW9ViTg
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=6840fedf cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=1-M4W3lqKYxiIo6tb88A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: zcvavKgNYEuAT1Wq1aUu_sBIdZExmT7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_05,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_192024_204628_6AD2B908 
X-CRM114-Status: GOOD (  16.21  )
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



On 6/4/2025 1:52 PM, Miaoqing Pan wrote:
> When the execution of ath12k_core_hw_group_assign() or
> ath12k_core_hw_group_create() fails, the registered notifier chain is not
> unregistered properly. Its memory is freed after rmmod, which may trigger
> to a use-after-free (UAF) issue if there is a subsequent access to this
> notifier chain.
> 
> Fixes the issue by calling ath12k_core_panic_notifier_unregister() in
> failure cases.
> 
> Call trace:
>  notifier_chain_register+0x4c/0x1f0 (P)
>  atomic_notifier_chain_register+0x38/0x68
>  ath12k_core_init+0x50/0x4e8 [ath12k]
>  ath12k_pci_probe+0x5f8/0xc28 [ath12k]
>  pci_device_probe+0xbc/0x1a8
>  really_probe+0xc8/0x3a0
>  __driver_probe_device+0x84/0x1b0
>  driver_probe_device+0x44/0x130
>  __driver_attach+0xcc/0x208
>  bus_for_each_dev+0x84/0x100
>  driver_attach+0x2c/0x40
>  bus_add_driver+0x130/0x260
>  driver_register+0x70/0x138
>  __pci_register_driver+0x68/0x80
>  ath12k_pci_init+0x30/0x68 [ath12k]
>  ath12k_init+0x28/0x78 [ath12k]
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: 6f245ea0ec6c ("wifi: ath12k: introduce device group abstraction")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 31d851d8e688..ebc0560d40e3 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -2129,7 +2129,8 @@ int ath12k_core_init(struct ath12k_base *ab)
>  	if (!ag) {
>  		mutex_unlock(&ath12k_hw_group_mutex);
>  		ath12k_warn(ab, "unable to get hw group\n");
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto err_unregister_notifier;
>  	}
>  
>  	mutex_unlock(&ath12k_hw_group_mutex);
> @@ -2144,7 +2145,7 @@ int ath12k_core_init(struct ath12k_base *ab)
>  		if (ret) {
>  			mutex_unlock(&ag->mutex);
>  			ath12k_warn(ab, "unable to create hw group\n");
> -			goto err;
> +			goto err_destroy_hw_group;
>  		}
>  	}
>  
> @@ -2152,9 +2153,12 @@ int ath12k_core_init(struct ath12k_base *ab)
>  
>  	return 0;
>  
> -err:
> +err_destroy_hw_group:
>  	ath12k_core_hw_group_destroy(ab->ag);
>  	ath12k_core_hw_group_unassign(ab);
> +err_unregister_notifier:
> +	ath12k_core_panic_notifier_unregister(ab);
> +
>  	return ret;
>  }
>  
> 
> base-commit: c3910de7bab78afbc106206aed5ec8e79458fbee

Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>



