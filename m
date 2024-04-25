Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137ABC10F15
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 21:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qV8nu7BFdbzCjnKCkstWdn6gMp+GYqZJTQATgDRcvbI=; b=2DhCbHgWP9v5zdSwAzChy3aUVV
	Hd5bi7mKLH7BTwPhko5dO5Gbzmhvn+T7HfASKqxjzbc7ENvq8n4j0dkJDnfLFFGDNQxuOLDi58FgS
	OfCTQ3dvENYdYM2pip3cDu2rZMf3JiSm17FIwxqrwKTRKXFXWlLMbHtEw9pZzjrhlMVdIC9gY/C7y
	w7J5qfP1js4xiEUlyoy4bUfaNoRnjwSlA71A5PO51L7ltCAsVrIyN7iifIyBD+5/1QbNi8QRY78CX
	RK+1YdlyOBPIEajWk2bvBpv1I/RTinC4rvb+xjJO9RIHDbAAs7l8t0MAHgvjVZnNjT/iy76Vbeub6
	miNDYzig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s06o8-0000000AHhA-38IP
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 21:39:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s06o6-0000000AHgX-0Yhj
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 21:39:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PKokCs029808;
	Thu, 25 Apr 2024 21:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=qV8nu7BFdbzCjnKCkstWdn6gMp+GYqZJTQATgDRcvbI=; b=OO
	u66NaZC/bdqnDHKk+z91NXoObva1Oitesuc4iRloM1cR/KkK65wJFCz1ckggVXPe
	nMrShiCerTkEC+H2xLlO9PyEMvD0xKxiaDW1113bz5kWw1JP1z31EJW4LYnCFGf/
	kSGb1P3RTnIhEv0rbMAv4n8GlJjRFWWYH55DN+2jP7WGxf4aMiey0vz5F78w6kpg
	gqdg83d1OSbku40AzrzxV8gA5FggkeT8cj4oSs9r/4IKtZuGG1D1iyCO8cFzm1NA
	Vf5NqMJAL+TBA5U4vmxXQMIndK5E5E8ICk5K94rdWBU8pj66J6HA9IME5gayIjBv
	6BiW6t8vukPSYgtKdA0w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenh3rnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:39:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PLd4Gf032452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:39:04 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 14:39:03 -0700
Message-ID: <a5b87ff2-1094-4631-98a7-cc2189e7da00@quicinc.com>
Date: Thu, 25 Apr 2024 14:39:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] wifi: ath12k: refactor core start based on
 hardware group
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240425055759.1181165-1-quic_hprem@quicinc.com>
 <20240425055759.1181165-8-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240425055759.1181165-8-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HDcLKXmzNk4Jq8bCHEtmVFdGYEj_LNyg
X-Proofpoint-GUID: HDcLKXmzNk4Jq8bCHEtmVFdGYEj_LNyg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=798 bulkscore=0 clxscore=1015 suspectscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_143906_356821_BC616721 
X-CRM114-Status: GOOD (  12.26  )
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

On 4/24/2024 10:57 PM, Harshitha Prem wrote:
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
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Co-developed-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


