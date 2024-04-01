Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B47BCD1288
	for <ath12k@archiver.kernel.org>; Mon,  1 Apr 2024 16:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UiHXwQ3IC4mMGzz86hDn+w9Rdaqn/hBMPT5QXoJXHs=; b=CiXnEpDXBAjClUyRfvWGPIx02L
	joaqMWAjhpuEOOW0YiuPeWua6iMYc6sPjtMRYJY70Q/uUAcW1k0+/2gg0S32dSdDbM4N4BhPYw4A8
	ESFewvaZwDMIW6Eipb0lG6SsseuKNSAC8aBmoSKSwSpTlkihwJtHadkH4x/GxwVTnMLuZ/ozr55HS
	xWDiTpbWdgYutWDWAKDhG46UazMqlmwPxo1HuCqdtWvVmtZ6b8ZMioofHTB/LEZEITbuMKN38rOtV
	ce4ihTpzl/46MlZb7M4ZU4rMzkfgqeqPtZU+pfvSe5dihlh50ObMu03xsWgpUFPciYiSypZLlflwA
	nqPGfH4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrKH5-00000008IxL-0etQ
	for ath12k@archiver.kernel.org;
	Mon, 01 Apr 2024 16:12:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrKH3-00000008Iwj-1QZy
	for ath12k@lists.infradead.org;
	Mon, 01 Apr 2024 16:12:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 431ETOXc003775;
	Mon, 1 Apr 2024 16:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=2UiHXwQ3IC4mMGzz86hDn+w9Rdaqn/hBMPT5QXoJXHs=; b=mr
	LgnfXa/fRw2u1VyFW6lK6JgUYpILO3lhBczI0fCxG0MDyinzlCPWiONQTtnKSGMA
	YJLO7Opa5S04ejfoxmLCN9PyX2x5X7zDMWDv/IfxGvADCZHKjqgwZJq6xO+D2k3Z
	730Xovo/Y+sYTeAzTBGrCa9G92S7hdPxxhyRXVeinTVUVUkqECPU5z5HT5vL/Oks
	oPw1CMNKf4xra1EiiTx3lSIg0V1HlfYvZSn7Q9tVBegKTJEDJJnmZne475LJNpOx
	MBi95mUrAGx56py8rQoHMdBBjo5ADnpPMvcchImA/2xs3bxI695kQrQ1k+NCSgNg
	SPSlZM4/9aJm2Ze0jWLg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x7qgw94yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 16:12:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 431GCADR019021
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Apr 2024 16:12:10 GMT
Received: from [10.110.126.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 1 Apr
 2024 09:12:10 -0700
Message-ID: <6b08a911-1ebd-4bcd-bc18-56764ac83729@quicinc.com>
Date: Mon, 1 Apr 2024 09:12:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: fix BSS chan info request WMI command
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
References: <20240331183232.2158756-1-quic_kathirve@quicinc.com>
 <20240331183232.2158756-2-quic_kathirve@quicinc.com>
 <c4924128-817a-4026-93f3-acedfe70c858@quicinc.com>
In-Reply-To: <c4924128-817a-4026-93f3-acedfe70c858@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8_5KyyO4d6BWOW8RejgHmnjnl4oiiHvR
X-Proofpoint-GUID: 8_5KyyO4d6BWOW8RejgHmnjnl4oiiHvR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_11,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=883 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404010115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_091241_531598_36B22AB0 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

On 4/1/2024 8:00 AM, Jeff Johnson wrote:
> On 3/31/2024 11:32 AM, Karthikeyan Kathirvel wrote:
>> From: P Praneesh <quic_ppranees@quicinc.com>
>>
>> Currently, the firmware returns incorrect pdev_id information in
>> WMI_PDEV_BSS_CHAN_INFO_EVENTID, leading to incorrect filling of
>> the pdev's survey information.
>>
>> To prevent this issue, when requesting BSS channel information
>> through WMI_PDEV_BSS_CHAN_INFO_REQUEST_CMDID, firmware expects
>> pdev_id as one of the arguments in this WMI command.
>>
>> Add pdev_id to the struct wmi_pdev_bss_chan_info_req_cmd and fill it
>> during ath12k_wmi_pdev_bss_chan_info_request(). This resolves the
>> issue of sending the correct pdev_id in WMI_PDEV_BSS_CHAN_INFO_EVENTID.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Fixes: d889913205 ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
>>
> 
> remove this blank line. Fixes tag should be together with S-o-b
> 
>> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
>> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> 
> 
Kalle can fix this when he merges into pending

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


