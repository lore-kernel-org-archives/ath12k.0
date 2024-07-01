Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED60EC2BD09
	for <ath12k@archiver.kernel.org>; Mon,  1 Jul 2024 23:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ct+YK0KqKMBXAsUl2HzYVQBBVhncjQiOPx/4nUhv+rU=; b=ggQQMJrtuKwaep0G3B5e7/caqc
	aagoaUG2aMimfFSQ/5q+m2Tcggo5Jnf1is1x/9Pqz9Wawr6E5hz6+FsC1DJSfbToxg1aHxFSxkBDg
	M8mPH7nZGLhb1FgfOq61BTAMIMNOnuWPnw1lKn3WvQYRWcKe7VdYUIwrpSXceHdA/UyeKnfOCjWm4
	amizlqMspNWf14c8MYCDCFVHrYIqAKrrnC4rXmdn/ysGNeSYPueaRAFHIVITCsJqO25lJR63NgA91
	4l8hVLKnUFSGBI8qPA9HBqaJIFjeGlX9g+m7Cl/6KGCweGh0jwMEPaNT1FRqwc9Xatlu5MNTnsX14
	jtHJ1ABg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOQev-000000056ND-2r1M
	for ath12k@archiver.kernel.org;
	Mon, 01 Jul 2024 23:42:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOQet-000000056M7-36nU
	for ath12k@lists.infradead.org;
	Mon, 01 Jul 2024 23:42:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461JBhSj014012;
	Mon, 1 Jul 2024 23:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ct+YK0KqKMBXAsUl2HzYVQBBVhncjQiOPx/4nUhv+rU=; b=Za/v/1UuzNZJNP4C
	UHBSXYTbrzvBjkdZV9QB7KPLEBqfLwoFQK86HtHidzPR/P3u0a02LAAl4vSvlUsZ
	+ZQFPyVWI90I2m6RfunNGs/K01xsXbCXVlsno28hScf9/UysHrJw9MtCo61cPl17
	RqSXNKCXAeoNBV9XgLoZ37ERecWlYRKWLYLGfHKpzKAKwbGO7gh/RwywA6KquRK1
	dMvM9Fx9xlRHqttOrcWcXQA7BY9xLfRn46EUTUS+1COLbpusFSs37lmpcuJB3TbG
	StIB9NHwINmCKhN9s7K8AXkdElTkdE73xI+PGhV3YgE14lhEUHein09DJh/KTukH
	C8hA8Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402996nnv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 23:42:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 461Ng5Bc004214
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Jul 2024 23:42:05 GMT
Received: from [10.48.245.148] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 1 Jul 2024
 16:42:05 -0700
Message-ID: <0eb04b51-c303-4557-a156-f72e1dac1523@quicinc.com>
Date: Mon, 1 Jul 2024 16:42:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/8] wifi: ath12k: refactor core start based on
 hardware group
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240628095139.292952-1-quic_hprem@quicinc.com>
 <20240628095139.292952-8-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240628095139.292952-8-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6ri1g0MurAs3nDryNXfCBmZEY9-dPaVi
X-Proofpoint-ORIG-GUID: 6ri1g0MurAs3nDryNXfCBmZEY9-dPaVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_21,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015 mlxlogscore=796
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407010176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_164207_931105_1A47B6A4 
X-CRM114-Status: GOOD (  13.05  )
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

On 6/28/2024 2:51 AM, Harshitha Prem wrote:
> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> Currently, mac allocate/register and core_pdev_create are initiated
> immediately when QMI firmware ready event is received for a particular
> device.
> 
> With hardware device group abstraction, QMI firmware ready event can be
> received simultaneously for different devices in the group and so, it
> should not be registered immediately rather it has to be deferred until
> all devices in the group has received QMI firmware ready.
> 
> To handle this, refactor the code of core start to move the following
> apis inside a wrapper ath12k_core_hw_group_start()
>         * ath12k_mac_allocate()
>         * ath12k_core_pdev_create()
>         * ath12k_core_rfkill_config()
>         * ath12k_mac_register()
>         * ath12k_hif_irq_enable()
> 
> similarly, move the corresponding destroy/unregister/disable apis
> inside wrapper ath12k_core_hw_group_stop()
> 
> Add the device flags to indicate pdev created and IRQ enabled which would
> be helpful for device clean up during failure cases.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Co-developed-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


