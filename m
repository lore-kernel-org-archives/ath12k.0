Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AD9CD128A
	for <ath12k@archiver.kernel.org>; Tue,  2 Apr 2024 00:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8YyxJ9OgOukRr1mrdTMA2vKHNbee0gdUvwA6crGCyKs=; b=uTFTl2fZuqauQUHMw2oazhVqxs
	+8fozwhGDMLYpI1qmv7qn43QNQ2pPVr+9+LbszKjV63WHZi4TXeH8mtzmrM7tOW5JhRHtLDBe5AoX
	5Xg5bfMHFz/dSZMnYY/K3XCbyGAg0W5U6PIaO65hEEIjvlr5JIajNHeFW0JJRfxg1Fx87PHzHpBCM
	YRTgWIE5zWWJj/Inl8TFaZvZo8CPXTxVe4cjE4plBFExiJ74i/dKRa3XYKQSRs780iCDFHESMH1dE
	PKc2tThdiO21KfhNj8TwDqwsY3hrREICe/iDpa1K9KritdUB5SgMFy8+MQAFaMa5I5N6p62rF44T4
	gKq3H5AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrRt7-00000009FJl-2Ouy
	for ath12k@archiver.kernel.org;
	Tue, 02 Apr 2024 00:20:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrRt3-00000009FH7-1LlW
	for ath12k@lists.infradead.org;
	Tue, 02 Apr 2024 00:20:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 431NxCbo025645;
	Tue, 2 Apr 2024 00:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=8YyxJ9OgOukRr1mrdTMA2vKHNbee0gdUvwA6crGCyKs=; b=H6
	Z58wDMQiXaGbXPUVBGtbQRSjSkrApVluPpJxWUoW7UmWiHX+HP1iMng+MkuOM4FY
	F+CpXXoHLsaDTSlCnhhwJh2W15IgUJd3ylE/TY+t7EzKfmN9CfDg/JDjuDlfrWVv
	tn5JL3mvlKHfMzQuYfCRoIBlLTiXAaQHcDG1REGx2Ha7R0cTEuJIQecnaxX2Ee8T
	93VxGPszpBLPkuiJ7KMO9tkLHSAr7cS5heWUQ0sHse1RcxzHi2bjhv2DlSvDACU/
	mvYKeHIbd4ecO39ygwMSu4lt4rzKPVU9W5gpjyFudpxggyv8m7DYPDTgfxtlsWdD
	duyv/nNi/ZBSRj9x9IIg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x81wdgk2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 00:20:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4320KAu6006679
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Apr 2024 00:20:10 GMT
Received: from [10.253.8.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 1 Apr
 2024 17:20:09 -0700
Message-ID: <5b044799-1486-4a49-a71d-dff98640a16c@quicinc.com>
Date: Tue, 2 Apr 2024 08:20:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix flush failure in recovery scenarios
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>,
        "Vasanthakumar Thiagarajan (QUIC)" <quic_vthiagar@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
References: <20240329015630.3019-1-quic_bqiang@quicinc.com>
 <dc3ee4aa-6fce-44d3-9095-b8b2846e1f4b@quicinc.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <dc3ee4aa-6fce-44d3-9095-b8b2846e1f4b@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: y_JmH8VZl-0dIutWdzPEepGmLouSDQ4P
X-Proofpoint-GUID: y_JmH8VZl-0dIutWdzPEepGmLouSDQ4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_17,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404010168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_172025_560182_462AF168 
X-CRM114-Status: GOOD (  16.93  )
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



On 4/2/2024 1:01 AM, Jeff Johnson wrote:
> On 3/28/2024 6:56 PM, Baochen Qiang wrote:
>> Commit eaf9f17b861b ("wifi: ath12k: relocate ath12k_dp_pdev_pre_alloc()
>> call") moves ath12k_dp_pdev_pre_alloc() from ath12k_core_start() to
>> ath12k_mac_allocate(), resulting in ath12k_mac_flush() failure in
>> recovery scenarios:
>>
>> [ 6849.684104] ath12k_pci 0000:04:00.0: pdev 0 successfully recovered
>> [ 6854.907320] ath12k_pci 0000:04:00.0: failed to flush transmit queue 0
>> [ 6860.027353] ath12k_pci 0000:04:00.0: failed to flush transmit queue 0
>> [ 6865.143385] ath12k_pci 0000:04:00.0: failed to flush transmit queue 0
>>
>> This is because, with ath12k_dp_pdev_pre_alloc() moved to ath12k_mac_allocate(),
>> dp->num_tx_pending is not reset due to ATH12K_FLAG_REGISTERED set in
>> recovery scenarios.
>>
>> So a possible fix would be to reset that counter at some proper point,
>> just like the old design. But considering that the counter tracks number
>> of packets pending to be freed or returned to mac80211, forcefully reset
>> it might make it hard to expose some real issues. For example if somehow
>> ath12k fails to free/return some TX packets, we don't know that because
>> no warnings any more.
>>
>> That is to say we should not reset that counter during recovery (which is
>> already done due to above commit), instead should decrease it each time
>> a packet is freed/returned. Currently almost each related function has
>> this logic implemented, except ath12k_dp_cc_cleanup(). So add the same
>> there to fix this issue.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> 
> Do we have QCN9274 test results?
I was thinking this also applies to QCN9274 and should not cause any 
regression because it is quite a straightforward change.

Anyway, more tests more convincing.

Hi Vasanth, could you help with SSR test on this patch? Considering that 
debugfs patches and firmware-assert patch are not included in ath.git, 
you may need to find a way to simulate firmware crash to trigger SSR 
process. Please let me know if you have any issues in that.

> 

