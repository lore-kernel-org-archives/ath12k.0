Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69748CD1288
	for <ath12k@archiver.kernel.org>; Mon,  1 Apr 2024 16:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hevkxwDEgR2pYUvj9X2yFlu71zQ4lB/37iRPo7HoeyE=; b=pSB2nm2bQquK899nfFdna6FKU6
	nC061aGV3zg7SFbcA1NEzvV+8MNNuCq10Wae70iYPVVWjpzE9Cy0icTF/0iGsAlzd3n4DLzpB6L1T
	KBCQkU9OSqKxY3UoLe3hR9d1EFNs++z4I75GmrdYXvcbxiC20XB7oPIaz7TzVJTOd/4T7/yWsNEYd
	9ACyud0KQA7K58d0MK5dLvctjsH4lUr9rBYw4lyYyEr07FCW/C4CB1Kp2ff9CiruebYwRCj521LTZ
	z7VPjJpN9I6TvZ8U9r1cx+y7ToaKAVxPaJyutYkAR2weoefkKJTl9TNpcX6B1RF8dScKjZTX5ge9Q
	o4uSCqGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrK85-00000008HkD-06GM
	for ath12k@archiver.kernel.org;
	Mon, 01 Apr 2024 16:03:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrJ9N-000000087ZU-33gH
	for ath12k@lists.infradead.org;
	Mon, 01 Apr 2024 15:00:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 431DwiUf000388;
	Mon, 1 Apr 2024 15:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=hevkxwDEgR2pYUvj9X2yFlu71zQ4lB/37iRPo7HoeyE=; b=b/
	ovJYlW2s819vu9kynpJnEzcTd0bemTAo1ae1+bUR6GOlEo5MhmaqRDMoDeI20Lhc
	aT2hwfykNlbueQDvt0I1axAomotLQgw/sa+4dbYm9weart/Wj+ZzEZ5S+Xgp2zvz
	1qtgDIST3ofllTmxpw+/gaE1whQYBrTsQLUpqL0QPW/pGI3FRm8DKhUaG8Y7e0nv
	/TH1NreCYZm25yo82SQyE1DliQbHoI31pDQusASoMTysTwO9G+H8vyrv19bKSk7g
	aMXzje2T7V4tSSIJyIIq4p0VmivO3nxN2NvSc1vmThH23pa8KYKcyvNoxD9/K1nm
	LRwPBC/ezvnwWjelwu+Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x7r0hgygy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 15:00:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 431F0c38011718
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Apr 2024 15:00:38 GMT
Received: from [10.110.126.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 1 Apr
 2024 08:00:38 -0700
Message-ID: <c4924128-817a-4026-93f3-acedfe70c858@quicinc.com>
Date: Mon, 1 Apr 2024 08:00:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: fix BSS chan info request WMI command
Content-Language: en-US
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
References: <20240331183232.2158756-1-quic_kathirve@quicinc.com>
 <20240331183232.2158756-2-quic_kathirve@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240331183232.2158756-2-quic_kathirve@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MKsmimNpGOk7zfhpobST5Kv8G_q2o5hF
X-Proofpoint-ORIG-GUID: MKsmimNpGOk7zfhpobST5Kv8G_q2o5hF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_10,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=865 bulkscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403210001 definitions=main-2404010106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_080041_960536_B2FE9728 
X-CRM114-Status: GOOD (  10.49  )
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

On 3/31/2024 11:32 AM, Karthikeyan Kathirvel wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> Currently, the firmware returns incorrect pdev_id information in
> WMI_PDEV_BSS_CHAN_INFO_EVENTID, leading to incorrect filling of
> the pdev's survey information.
> 
> To prevent this issue, when requesting BSS channel information
> through WMI_PDEV_BSS_CHAN_INFO_REQUEST_CMDID, firmware expects
> pdev_id as one of the arguments in this WMI command.
> 
> Add pdev_id to the struct wmi_pdev_bss_chan_info_req_cmd and fill it
> during ath12k_wmi_pdev_bss_chan_info_request(). This resolves the
> issue of sending the correct pdev_id in WMI_PDEV_BSS_CHAN_INFO_EVENTID.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205 ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> 

remove this blank line. Fixes tag should be together with S-o-b

> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>


