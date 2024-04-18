Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B97AC4345F
	for <ath12k@archiver.kernel.org>; Thu, 18 Apr 2024 22:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mjKvSNAWlIpVzI3IIrZrBQFaI/9Zpxh+Nph30N497s=; b=u1kDJL2V4kfnzFUJrQ3rzty1vp
	ldiaHaT18C9qO98Fz9tJUz94zDd0O3r9ep2lkRAYlDgazYlljgP3riRkQRHn1i3hj8Ffzb3Wvhk3E
	uykebN2smQ0B20P9P/tN3Qg95NLMEjzlMZeNJYhV3phiboXZ/ct1WuJUKnMrL8gBTsuaGWfY2MXRt
	eO2sYeHvea1AFneCBEbCsT+4DDNIwDkNa8eykXZC5uwCSjWnU2GhzOqHW8TaOGao7muVTK6dZA7LH
	bsPN46RDuoQtZRL9gZfhWjmHue1Dsc4YmY1jLdxgPe4HMTzWkx7Cz91lnwEPsCaDFNDwtS8w6K0kD
	VrxbbUqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxaAi-00000003qGp-0hkg
	for ath12k@archiver.kernel.org;
	Thu, 18 Apr 2024 22:24:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxaAd-00000003qGL-0qKg
	for ath12k@lists.infradead.org;
	Thu, 18 Apr 2024 22:23:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43ILqR2Z009600;
	Thu, 18 Apr 2024 22:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=1mjKvSNAWlIpVzI3IIrZrBQFaI/9Zpxh+Nph30N497s=; b=cr
	crUigfviM5sSToxzQIXRxJ0dVXqLxrBxc1I7TG5XtVfwIsweZB5cV1xoxqF2Fob5
	TjnzIE+MerPhZiQtV/lhUCrjwyFxMiTrtHUyVuH3dMkFQodDiEWM+yeKGnOJEcaM
	XG4dIFOWzyLQnpvvKEzWzEhMcIKm9ScIV45PMKpTSOOvq5CWbATll8G/so7Na/VT
	QBOoF+FfX6GMBFDqdmONMomBhi1J5GCoivpzuFPRbyTtbH51Xw1KR7aSAZ+NRSUp
	Vpq7V5gHpY5y9pEehtLrCnsnyBdIwBh9RZ7HDNSnXXlL+WMDJUc6QST0M9XI9zEu
	trcMo42PxCL7RCdYHTmQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xka6rr86n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 22:23:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43IMNn7f007012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 22:23:49 GMT
Received: from [10.110.20.198] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Apr
 2024 15:23:49 -0700
Message-ID: <71414c51-26b2-4ce7-898c-5df0e8e31825@quicinc.com>
Date: Thu, 18 Apr 2024 15:23:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/4] wifi: ath12k: ACPI support
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240418162019.1246749-1-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240418162019.1246749-1-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 46IoToySGNOt0hx896yCx3bhmXBGzTJc
X-Proofpoint-GUID: 46IoToySGNOt0hx896yCx3bhmXBGzTJc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_20,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxlogscore=514 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404180162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_152355_530876_80C9E4BC 
X-CRM114-Status: GOOD (  18.08  )
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

On 4/18/2024 9:20 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> Through reading ACPI tables, implement Time-Average-SAR(TAS), BIOS SAR,
> configuration of CCA threshold and band edge channel power functionalities.
> This is enabled only on WCN7850.
> 
> TODO:
> 
> * test with ACPI support in hardware (I don't have such hardware), especially
>   suspend and hibernation
> 
> v8:
> 
> * rebase to ath-202404181528
> * rewrite commit messages
> * cleanup and improvements all over to match the ath12k style, including
>   error handling, naming and so on
> * locate new place to call ath12k_acpi_[start|stop]()
> * move wmi functions up in wmi.c file
> * consolidate WMI functions using WMI_PDEV_SET_BIOS_INTERFACE_CMDID into ath12k_wmi_set_bios_cmd()
> * ath12k_acpi_stop(): don't call acpi_remove_notify_handler() if we never installed the handler
> 
> v7: https://patchwork.kernel.org/project/linux-wireless/cover/20231013114434.81648-1-quic_lingbok@quicinc.com/
> 
> * adjust the length of line
> * add cpu_to_le32()
> 
> v6:
> 
> * remove code that is not called
> 
> v5:
> 
> * rebase to the latest tag
> 
> v4:
> 
> * revise commit log using imperative voice
> * delete guid_is_null()
> 
> v3:
> 
> * remove unnecessary cpu_to_le32()
> * adjust the order of the macros
> * apply jeff's advice
> 
> v2:
> 
> * put <linux/acpi.h> in the include guard
> 
> Lingbo Kong (4):
>   wifi: ath12k: ACPI TAS support
>   wifi: ath12k: ACPI SAR support
>   wifi: ath12k: ACPI CCA threshold support
>   wifi: ath12k: ACPI band edge channel power support
> 
>  drivers/net/wireless/ath/ath12k/Makefile |   1 +
>  drivers/net/wireless/ath/ath12k/acpi.c   | 394 +++++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/acpi.h   |  76 +++++
>  drivers/net/wireless/ath/ath12k/core.c   |   7 +
>  drivers/net/wireless/ath/ath12k/core.h   |  18 ++
>  drivers/net/wireless/ath/ath12k/hw.c     |  10 +
>  drivers/net/wireless/ath/ath12k/hw.h     |   3 +
>  drivers/net/wireless/ath/ath12k/wmi.c    | 143 ++++++++
>  drivers/net/wireless/ath/ath12k/wmi.h    |  41 +++
>  9 files changed, 693 insertions(+)
>  create mode 100644 drivers/net/wireless/ath/ath12k/acpi.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/acpi.h
> 
> 
> base-commit: c416602943dd36fbd13af7496430723935c867a3

I can verify this doesn't crash my system, but apparently my ACPI doesn't have
the underlying settings, so cannot verify actual functionality

Apr 18 15:13:59 qca-HP-ZBook-14-G2 kernel: ath12k_pci 0000:03:00.0: acpi_evaluate_dsm() failed
Apr 18 15:13:59 qca-HP-ZBook-14-G2 kernel: ath12k_pci 0000:03:00.0: failed to get ACPI DSM data: -2
Apr 18 15:13:59 qca-HP-ZBook-14-G2 kernel: ath12k_pci 0000:03:00.0: acpi failed: -2

/jeff

