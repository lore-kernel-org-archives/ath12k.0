Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D447C47258
	for <ath12k@archiver.kernel.org>; Wed, 31 Jan 2024 21:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6/fJWOpywTyUHR+4JBWC5SAeSTB16D1mFWre3cFXKg=; b=mt7HG6a+i5ZHo2YbSf4rOH9JcN
	FP6peuP5YmhuYsbD24StsJ0sy8MWSp9M+lcvWQ5e93YtBv6zv0D2h9Q9riKUdglcy1FjuY4WkazD0
	o5pzPcUDRB7wGNs42p6U0Ql3WziIN+TtdmxLQIhbFLg7ftFI36fLvDu41yy/MsGSTatjP60x4JZLY
	cglpuH+uxRpnNOQp6ONmXpGefIF/s4pZYziL235/TlZofo7IzlfL9soUgHjzhEDuHiKkcdZJW0uo3
	xeYiwA5VgSWCDvVipaH+MxZuvL5oFLpfNZTTmM2yysLqoYF+6wOlN4NI4IvWUZkEGRV2eRTAQiDjY
	ja+c3vDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHmy-00000005Qyp-2zjH
	for ath12k@archiver.kernel.org;
	Wed, 31 Jan 2024 21:06:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHmw-00000005QyN-2LFj
	for ath12k@lists.infradead.org;
	Wed, 31 Jan 2024 21:06:31 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40VCXlmD022245;
	Wed, 31 Jan 2024 21:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Z6/fJWOpywTyUHR+4JBWC5SAeSTB16D1mFWre3cFXKg=; b=Qs
	lSVMgf5tnduMT2mlx1dvLDEGFbVRvty7V4DfgUhqTPVJSblOMcRoYjY8jPZZUOJ5
	IUPiERYXdbCBSsYwj4kjmkbDTUcPXhoqI/v4rSskl6obBhHTGV9ZHs9rlzSfu9Sk
	W7zRXnkNk7E2TsriM542ZfG8aPO1XgzOlddbF9q/RdomIA7C0SSjEka/dVC0EafQ
	L+NE4Nvv9csbP4uS52CazpXDqwNYOYc5T2Vowz4NdgGYF4MZ1NIkeUezbuKXavKv
	3QjDee9swjPrXjTi0H3KLbs090/Ws8L4elztqsNejptEy3dMoYWXCvg7GGs+GALR
	eO88nREs87HxIrb5ifog==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vypaq1814-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:06:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40VL6T1Z007681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:06:29 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 13:06:28 -0800
Message-ID: <b7a6ad2c-7f28-4758-921e-f77b56b5190e@quicinc.com>
Date: Wed, 31 Jan 2024 13:06:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/13] wifi: ath12k: Add logic to write QRTR node id to
 scratch
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
 <20240129065724.2310207-6-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240129065724.2310207-6-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: C2sKIPE1h-2Ec4i61VnXiIbU41y9ARU2
X-Proofpoint-GUID: C2sKIPE1h-2Ec4i61VnXiIbU41y9ARU2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxlogscore=605 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401310163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_130630_636967_E7CBA29B 
X-CRM114-Status: UNSURE (   9.57  )
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

On 1/28/2024 10:57 PM, Raj Kumar Bhagat wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> Currently only one MHI device is registered successfully on platform
> having two or more identical MHI devices. This is beacuse QMI service
> runs with identical QRTR node ID. And, qrtr-lookup cannot register
> more than one QMI service with identical node ID.
> 
> Hence, generate a unique QRTR instance ID from PCIe domain number and
> bus number. QMI allows node id to be written on scratch register.
> Add logic to write QRTR node id to the register. It is available for
> firmware to uniquely identify an instance.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Depends-On: wifi: ath12k: add firmware-2.bin support

I would not expect this information to be part of the final commit text,
but I suspect Kalle can remove it when it goes into the pending branch

> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


