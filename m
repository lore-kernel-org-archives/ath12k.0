Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150B0CD1288
	for <ath12k@archiver.kernel.org>; Mon,  1 Apr 2024 15:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=In5MwfNtTQDXWJRPI/WPKRi9Brgt2M4D6lm0z3L3HsM=; b=GbOfPJZXFLQtlu34VcEsIei+xJ
	xKqs9+6DFH/CNdlpqYxmSbeD/5xk8N0iWwC9cQnMKZttFtDZ1vNFIYWgyvcMciq87XkAMS7gA345h
	VI5u4FlIimhTam3dBDvgOW1q+NeJ7Ha+OtWsbpPYd4yQyFv8HUprU179JXrGtGzq2i8Txb1rK+9mV
	/41t7hCJW+ELQypUpheCeJT37+oKd35DqV8dRW1GgY5z8qhqml2pnyLQqShPxhneuPYNnk+4r8IRD
	wEGFlIU0tNbcxvPICKM3Cyvw119mAkqA/7pHEpDh01KPV2CEo+xptv2LxPFnjkCmDAXOGa3A7HVaQ
	tGp2kg1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrJA1-000000087cn-3LSz
	for ath12k@archiver.kernel.org;
	Mon, 01 Apr 2024 15:01:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrJ9z-000000087cR-1Iel
	for ath12k@lists.infradead.org;
	Mon, 01 Apr 2024 15:01:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 431BqAjU001371;
	Mon, 1 Apr 2024 15:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=In5MwfNtTQDXWJRPI/WPKRi9Brgt2M4D6lm0z3L3HsM=; b=U5
	S7vXsjii3JsSbJPquULjLlKoWCjjMNcqIHULziJGzYMgSbserdcwI/yhqprHuAn7
	JuyRkS5rTY8yBOXQ5yidKrs6AbWRB2lyMg5EPzxXX4fYPkCmulYGOg62J31HBIEQ
	eGY0xYxaG3fLc1OJwdViDWZyjDrWeDCLpz1JECuUeJiRIKtnShNylM7J7SCZwZ+T
	cKG9WzdWkCWfBfinIhW8hvk5Fk8U3aU4YCv0mAQwXPR/udQsvGV3bGSStqNV7nho
	5R1QxSCjZGZH4dgM4jKzcMe7psqdUKByI8Yvp+tWkfGkLsprizpxBJQGvMu0aIAU
	U/wyQKYOpse8+37IYJHQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x7qcvh1kn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 15:01:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 431F1HOx025475
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Apr 2024 15:01:17 GMT
Received: from [10.110.126.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 1 Apr
 2024 08:01:17 -0700
Message-ID: <59c05ce0-14ab-48f6-9ed2-f10d3f548a85@quicinc.com>
Date: Mon, 1 Apr 2024 08:01:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: match WMI BSS chan info structure with
 firmware definition
Content-Language: en-US
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
References: <20240331183232.2158756-1-quic_kathirve@quicinc.com>
 <20240331183232.2158756-3-quic_kathirve@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240331183232.2158756-3-quic_kathirve@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jTQgPx7giUW4JZTRUhDIFCLgOCbt8eol
X-Proofpoint-GUID: jTQgPx7giUW4JZTRUhDIFCLgOCbt8eol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_10,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 mlxlogscore=775 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403210001 definitions=main-2404010106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_080119_536685_16ED6FFD 
X-CRM114-Status: UNSURE (   9.42  )
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

On 3/31/2024 11:32 AM, Karthikeyan Kathirvel wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> struct wmi_pdev_bss_chan_info_event is not similar to the firmware
> struct definition, this will cause some random failures.
> 
> Fix by matching the struct wmi_pdev_bss_chan_info_event with the
> firmware structure definition.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205 ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> 

remove this blank line

> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>


