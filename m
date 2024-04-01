Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207BFCD1288
	for <ath12k@archiver.kernel.org>; Mon,  1 Apr 2024 16:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TA0nV97rtgv+Y5iM+M2MaCzWOpu3b5opvrWnyuMcovU=; b=lOMVi4RNzL7nKqRHzoC7K+s/rx
	R4G/a4Cf2BTKaAbb85mIp5phsLnrLSEER1+V40gCNgUWR7Z07mAuGaBHBQYf3tux+rqFUAZDQaTPk
	2ASke7+V+6mWdhX1xGkwO5gniH1P7QTGW7Us0LeWBLM23uZf+1E0t5TS2YF7IOBVb/kUSzqNHCMmF
	x/YrC1UiV76ma7+k9aMY42No7AdUkG8Vb018Z8bKNqm7BnvCHcjSTFOvvRbdEMqC/hQjf5MzYG4kp
	b22ZPGQptT2HEkww0+QxTA0BWa5rIwS5cKRMtw+26N65WTjJyFX1YYwsW3l9FoP7MN9juv9OuL7E3
	z9SPkD5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrKGS-00000008IsU-3XWO
	for ath12k@archiver.kernel.org;
	Mon, 01 Apr 2024 16:12:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrKGP-00000008Irr-1QOl
	for ath12k@lists.infradead.org;
	Mon, 01 Apr 2024 16:12:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 431ERvrP031119;
	Mon, 1 Apr 2024 16:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=TA0nV97rtgv+Y5iM+M2MaCzWOpu3b5opvrWnyuMcovU=; b=EC
	cGwP3KyiqFpZcdBElaGileGst6O3s1PGfQGxIGKJr2pE056MhdTPZ+XpElu6PrnY
	kbtRm6YnS5gbhF6bdRk30FFESgUz0HTl5Lt+7vIsNNedjvUKhH1kpGb2RQxPk4oQ
	hNdC5wBjtpQ5hFcxu5+4UsQx7IK8aq35kSvPEXwC1/e8bzZBS2tRABoMxwRWlvMf
	wE9ClotsM0ivYwkSa8aRYv1KmiCEn1fxVMEPRqU9ivdboFlLiMjPXvNzg4fjoYFn
	OYCSKnJ7g9WZ3XM7g7dIVbs/pe76Gkwe9Z7e1X9MW+E/vmNNKt1AOuCIbn+CcEZx
	O9Lp7f9NWqPwi91a9yRw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x7r5712p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 16:11:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 431GBwcT006204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Apr 2024 16:11:58 GMT
Received: from [10.110.126.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 1 Apr
 2024 09:11:57 -0700
Message-ID: <daca162b-b434-493a-993f-8817e586e5da@quicinc.com>
Date: Mon, 1 Apr 2024 09:11:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: match WMI BSS chan info structure with
 firmware definition
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
References: <20240331183232.2158756-1-quic_kathirve@quicinc.com>
 <20240331183232.2158756-3-quic_kathirve@quicinc.com>
 <59c05ce0-14ab-48f6-9ed2-f10d3f548a85@quicinc.com>
In-Reply-To: <59c05ce0-14ab-48f6-9ed2-f10d3f548a85@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Hz14U8lmYXJxqSIwkC31AHuC_uObUCO8
X-Proofpoint-ORIG-GUID: Hz14U8lmYXJxqSIwkC31AHuC_uObUCO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_10,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=668 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404010112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_091201_540299_15D0B941 
X-CRM114-Status: UNSURE (   9.66  )
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

On 4/1/2024 8:01 AM, Jeff Johnson wrote:
> On 3/31/2024 11:32 AM, Karthikeyan Kathirvel wrote:
>> From: P Praneesh <quic_ppranees@quicinc.com>
>>
>> struct wmi_pdev_bss_chan_info_event is not similar to the firmware
>> struct definition, this will cause some random failures.
>>
>> Fix by matching the struct wmi_pdev_bss_chan_info_event with the
>> firmware structure definition.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Fixes: d889913205 ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
>>
> 
> remove this blank line
> 
>> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
>> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> 
> 
Kalle can fix this when he merges into pending

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



