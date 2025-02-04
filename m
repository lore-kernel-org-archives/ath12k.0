Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E54C0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 03:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JoyHl8BaLJ05WjJneh+Miolie5KQU0zh+iUovUVWenI=; b=4gs41NsFK8P5004skFzrZvxH4x
	xmcWAQPfrwagMDW9dNC+POElw6K7lGICqaYj4ljHgEf72djEQOU96JvkgQbMKUDUpRHOf0A+UGmkb
	XTPd5T2HC2eOqXO9JyOk8vMu/3X1HsrvIVlDHpIlT5Qvl67m2nFKCn8XhC+0l/pc2tCm67qeSGJGX
	1b/E723KZxn5afozRyVR7pqjiYxk2tkCkuV81rJ45l32XIf2dsGN0+b9DRdU2p5DrbiTuU7VIGWU5
	fVhYaroU3qJbuTaq1Snag62Q8A5lIazYYBbHT7bxKTMFi/X2pXSDEC7lBWn4mJqwoSACK8h6/08cY
	109VdKIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfA1z-0000000HCNW-2snI
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 03:55:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfA1x-0000000HCMs-2huN
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 03:55:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513IpdiR005920;
	Tue, 4 Feb 2025 03:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JoyHl8BaLJ05WjJneh+Miolie5KQU0zh+iUovUVWenI=; b=cSmE7Spsg0PuEMjh
	xO9NaTQXu6X23dEOfKTiobvJ8BSIfSDCzMU0S63v5sERiVvUx2PcUkpCfxKtsdrT
	OBkQ9kSg4hy3kkv3TlVtE68w/QraGVnGABp7XfQF9f3QrMDsL35gW+gk5aZRDRiL
	mV7kX1WbfIM5LqK+IT3q0hnZTau8VetmxPQsLjHjRfy9YCM6ZEId30HkOmnUFUfW
	+bUJYErXh6Bf4/CMWatfPAgvVRMhrko/kVUMHG9Nbyp5gpJVa6xc1wV7BfsVniV0
	s4P2nkaYO/Va3js/nh3kQunGHIFF4pUmlY/3Df59kmyksV7NgSWWnU0nOF0DMM8h
	4Q2AJg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k3ex0y9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 03:55:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5143t1Dp025623
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 03:55:01 GMT
Received: from [10.151.40.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Feb 2025
 19:55:00 -0800
Message-ID: <48d940c7-817e-b92b-025d-6821358bb5ea@quicinc.com>
Date: Tue, 4 Feb 2025 09:24:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 8/9] wifi: ath12k: Refactor the format of peer rate
 table information
Content-Language: en-US
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Balamurugan Mahalingam
	<quic_bmahalin@quicinc.com>,
        Vasanthakumar Thiagarajan
	<vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20250204035215.3227307-1-quic_periyasa@quicinc.com>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <20250204035215.3227307-1-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4iES9n-TlcOxM4eDs4bRh8LrbP9MSnyr
X-Proofpoint-GUID: 4iES9n-TlcOxM4eDs4bRh8LrbP9MSnyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0 mlxlogscore=822
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502040029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_195521_808275_99CF5BAC 
X-CRM114-Status: UNSURE (   7.47  )
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



On 2/4/2025 9:22 AM, Karthikeyan Periyasamy wrote:
> From: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>
> 
> Currently, peer rate table information involves complex computation for
> the rate index to update the rate table. To simplify this process, avoid
> the rate index calculation by defining the rate table with bandwidth, GI,
> NSS, MCS. Therefore, update the rate information based on the bandwidth,
> GI, NSS and MCS information from the TLV data of monitor status Rx path.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.h   |  6 +----
>   drivers/net/wireless/ath/ath12k/dp_mon.c | 29 +++++++++++-------------
>   2 files changed, 14 insertions(+), 21 deletions(-)
> 

Ignore this series, missed patches

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

