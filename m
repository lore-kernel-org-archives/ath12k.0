Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E63C4345F
	for <ath12k@archiver.kernel.org>; Mon, 15 Apr 2024 05:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+O4aGNZrgTZjT0aCMHZbL1/O99msD2nnQ5tuUHcX1u4=; b=nNt0q1/zMIAAkn73jxHpUaR2Cj
	pRpHlU+0r2k0L8j4KxeeJfSGBGKnR49Czj8sxQaFJZNo1qwSk2mB6ng8ZfLgOc3UHV870Vs6+lOcw
	ax6uCBQT1CoUhVVkT52fnN6jQeKDwkDGaPy2bRlxUY6WDzrx3hfgLXTPLzIc7t3en1FW75qmxD51w
	gNt9Byas58CGfgM8oREg9pmasIha8aq/+Vx6IQQ1q8DlE1DYlZprPSyNVgVLkTmytjUJ1JyTwQ//N
	tcBem9F91HZbNcaWgokQ+QMN963+nbRBjrVLcVZM2PcZFk4aVavnz1mIjve24WTye2OkDynxqHnG7
	Fwn3OCGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwF3X-0000000725u-0jlv
	for ath12k@archiver.kernel.org;
	Mon, 15 Apr 2024 05:39:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwF3U-00000007253-0xlc
	for ath12k@lists.infradead.org;
	Mon, 15 Apr 2024 05:39:01 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43F4xx9x031087;
	Mon, 15 Apr 2024 05:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=+O4aGNZrgTZjT0aCMHZbL1/O99msD2nnQ5tuUHcX1u4=; b=kJ
	+Jm/7DVRiVLEVUSEwdSlYiWpspzT6fvQKFCbOZdjDPj9YGNfVi4ALRaUENq+31gv
	J6zx3a3Rbb4udYnuH5HCLt1vCI6TXZfYfNvXenwK5keH+8pwx1fDDgcIBH90rpcV
	Y79h21rXoGUWZVmyOOYtL4LVgngYAsInzUABPN/5+4G1lyv6mrAJdy0FRm/3f/HI
	cJu8AEnLGsAggri85BAVVVIjVWYciCxjjoA42CdnI0ahPKrtZ6KosgzyeCmHgq77
	4i+/twzg/sNM273C3z7J8xgQkK9p4X51sR/QBBu5Ox1ywlnKwQmASGbTYBgBAkRN
	iEZWn+57WK+vPUQpvGtQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xggvgrvw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 05:38:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43F5cqNA018912
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 05:38:52 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 14 Apr
 2024 22:38:50 -0700
Message-ID: <ae78bdad-6f6b-8d8e-c324-7dc990895e9f@quicinc.com>
Date: Mon, 15 Apr 2024 13:38:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 01/10] wifi: ath12k: rearrange IRQ enable/disable in reset
 path
Content-Language: en-US
To: Sidhanta Sahu <quic_sidhanta@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
 <20240412060620.27519-2-quic_bqiang@quicinc.com>
 <8122e56b-1e57-4501-8180-24a65247465f@quicinc.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <8122e56b-1e57-4501-8180-24a65247465f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fLjXPDIzUIktC-wk4xrA8K2LHGf7EBc_
X-Proofpoint-ORIG-GUID: fLjXPDIzUIktC-wk4xrA8K2LHGf7EBc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=889 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404150034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_223900_439074_90FB4C5D 
X-CRM114-Status: GOOD (  12.78  )
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


On 4/13/2024 2:24 AM, Sidhanta Sahu wrote:
>
>
> On 4/11/2024 11:06 PM, Baochen Qiang wrote:
>> For non-WoW suspend/resume, ath12k host powers down whole hardware
>> when suspend and powers up it when resume, the code path it goes
>> through is very like the ath12k reset logic.
>>
>> In order to reuse that logic, rearrange IRQ handling in the reset
>> path.
>>
>> Tested-on: WCN7850 hw2.0 PCI 
>> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/core.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/core.c 
>> b/drivers/net/wireless/ath/ath12k/core.c
>> index 3c522a4b3e9b..28663cf4db30 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.c
>> +++ b/drivers/net/wireless/ath/ath12k/core.c
>> @@ -879,9 +879,8 @@ static int 
>> ath12k_core_reconfigure_on_crash(struct ath12k_base *ab)
>>       int ret;
>>         mutex_lock(&ab->core_lock);
>> -    ath12k_hif_irq_disable(ab);
>>       ath12k_dp_pdev_free(ab);
>> -    ath12k_hif_stop(ab);
>> +    ath12k_ce_cleanup_pipes(ab);
>>       ath12k_wmi_detach(ab);
>>       ath12k_dp_rx_pdev_reo_cleanup(ab);
>>       mutex_unlock(&ab->core_lock);
>> @@ -1136,6 +1135,9 @@ static void ath12k_core_reset(struct 
>> work_struct *work)
>>       time_left = wait_for_completion_timeout(&ab->recovery_start,
>>                           ATH12K_RECOVER_START_TIMEOUT_HZ);
>>   +    ath12k_hif_irq_disable(ab);
>> +    ath12k_hif_ce_irq_disable(ab);
>> +
>
> This core reset is called due to a fatal error. In case of an unlikely 
> scenario, when there are consecutive fatal errors notification before 
> the first fatal error is handled, then we will be disabling same irqs 
> again. Shall we have a check here to see if ab's already in reset 
> using ab->is_reset.
There is similar logic using ab->reset_count in ath12k_core_reset().
>
>>       ath12k_hif_power_down(ab);
>>       ath12k_qmi_free_resource(ab);
>>       ath12k_hif_power_up(ab);

