Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1A9C4345F
	for <ath12k@archiver.kernel.org>; Fri, 19 Apr 2024 14:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLOvtlL/JJAvBaLgqLGuq46Heq1oHvD25UnazPKKfLA=; b=JU3J5K7/9Oq2Bubigr77FKh2ar
	m0lTGNGhA0Mf5A+SsDqsD8b4n+3ZN1YtbisZf4SyiRV1wokXC7By9cD47HGvhfdEpy3w+5SJacWop
	3w/D4hkkvWp+YjC1h4fKJr4mrN5s/zb/Ka3wO1rHJoh7RFBhEJhmpGfbEAQxh62WQtc3CvsvCeOl6
	UuP2/2Z2pXTSOMDiUoO0/ZbamdprCB0FW7S2b8cNXmkiA30+UPtJwCH9US+VQGfHlAIeClLgWdokF
	JAHwrRrjHZFW+2h/FtluNwUXmQ5LXsDSgrHlVy0zu1ckQbtf2Bm86eiaDEVhiiZDJVWQfLWYW4bzb
	VSMyJ9qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxpe9-00000006363-2k0I
	for ath12k@archiver.kernel.org;
	Fri, 19 Apr 2024 14:55:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxpe7-00000006355-09jM
	for ath12k@lists.infradead.org;
	Fri, 19 Apr 2024 14:55:24 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43J5u9Dr010237;
	Fri, 19 Apr 2024 14:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=NLOvtlL/JJAvBaLgqLGuq46Heq1oHvD25UnazPKKfLA=; b=Qb
	B6M1wj+hrMdlpaJVs34vZ983nN352KCXU0uvL0tyqC2kEe8Ru3uWoUjzxNWKExd0
	IcIzxLfFvuvJnZNxcReQ68txpF36XgOApHV8QnMibfZ4tSK/PrUlDkZklKNBE8Y6
	61RC2v/p1VodTyIYRyQDDq09YRfLw7aT9AeIGeTB/rBHiQOLvCyB/eqVvk8ohu48
	5R0OvSp2hAb7Ttxd6TpToZWoP8GvoJ4Djn4ox/WPVMvusDgJyfnxK96ovg8D0C1M
	0KDA6mvsFq9FhXt/oDDLHOXMKs1DF1Ihd8ahsNwNWq5IlIjE2HPOhwLu9yaJycA9
	7F5YfX1jW+Dj+Z8x6r2w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xkaw7sx4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 14:55:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43JEtHFA020092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 14:55:17 GMT
Received: from [10.110.56.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 07:55:17 -0700
Message-ID: <4f9ab4ca-595c-4208-96c3-89f709b74b1b@quicinc.com>
Date: Fri, 19 Apr 2024 07:55:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] wifi: ath12k: ACPI CCA threshold support
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240418162019.1246749-1-kvalo@kernel.org>
 <20240418162019.1246749-4-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240418162019.1246749-4-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RZrZJKGtoJkUbqeTtd1D-8mH-xwg6T0M
X-Proofpoint-GUID: RZrZJKGtoJkUbqeTtd1D-8mH-xwg6T0M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_10,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404190112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_075523_251745_7F214FF4 
X-CRM114-Status: UNSURE (   7.24  )
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

On 4/18/2024 9:20 AM, Kalle Valo wrote:
> From: Lingbo Kong <quic_lingbok@quicinc.com>
> 
> Currently, ath12k does not have the ability to adjust Clear Channel Assessment
> (CCA) threshold values to meet the regulatory requirements. Get the values from
> ACPI and send them to the firmware using ath12k_wmi_set_bios_cmd() function.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


