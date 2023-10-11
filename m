Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAD1CDB467
	for <ath12k@archiver.kernel.org>; Wed, 11 Oct 2023 16:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZE5nDfa+VHO2PqzYkOSxvjpDiMETX6LqYr/QWU4McbU=; b=gS1E5Y1b0I11kr
	c/B07cwLYty6xJ8y8ZWYTr73xNo1qRBmU3fmujPlEtVN5KVS7fGixaGMa00mftMe81+7Fri170sPL
	e0jQtcABFcbqnwNUI3t9BvJHddqaJjYUiEIq0OSxfYFrAppM1Ol6IZPU9xdTlik/LUGc+U5BPkfv3
	HcuNKVl4jnWFM/G4j//sv5DUKZ7JlmEfKGv5PX4HU2eoMLlQTE1YqN0af6OnjHxFgv5q8u/pISQe+
	CPGxTAs0FnSUO8ZaoepvP1Wzg8tRIyFZ5lcOtEOgIqthW3GcCj0fHEautAlOpTKLQFhIfwSuL6uSQ
	OGfXr7+J19lVhd4BuEVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqcE3-00GGgY-2e
	for ath12k@archiver.kernel.org;
	Wed, 11 Oct 2023 16:38:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqcDz-00GGfI-1z
	for ath12k@lists.infradead.org;
	Wed, 11 Oct 2023 16:38:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39BDhYWP009485;
	Wed, 11 Oct 2023 16:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hlmfiJnGViuPESXrRudSCA0gO7eo+SPX7J5b9xcYvFs=;
 b=jB3CRjw1gWWRLJ0zrTG6v+mAmsyFO+q5aoOy7RFbpePOtAKBurZasoMli5iErCcRgsvg
 kHDgWDBPEi9JZGXnHvJ+QQPBBtr0LPJs+b8HgzuF4Xa9Gjb7ySy1IMrgBjK4z9hQoonO
 JDwiLNFg6YE25J5BiuzkP3AqJkZ7KgUbzpy1KRoqArJ3SAY3cIT9+dqyM1h7rVvbAQ66
 G4IFn0QkBqd26I96GFI1ccldHk5meCHcSXXAV5YU1f9++7T8ErhSus+2lyLim34sdt4W
 JSlC4zHKhAqhH5QqmqJxXLd7vLiLTnRSWCp925M2p+DVlnvQFAOP59Urp2nmx01KdUr9 Wg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tnstyrxt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:38:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39BGcIB7022028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:38:18 GMT
Received: from [10.111.181.241] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 11 Oct
 2023 09:38:18 -0700
Message-ID: <1cae47f3-f92a-4dc8-bbbc-bd88481e63c9@quicinc.com>
Date: Wed, 11 Oct 2023 09:38:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] wifi: ath12k: add set band edge channel power for
 WCN7850
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231011050004.423413-1-quic_lingbok@quicinc.com>
 <20231011050004.423413-5-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231011050004.423413-5-quic_lingbok@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iszBOQv-9wO4WuI6kQHKk_mngPjyHHB8
X-Proofpoint-GUID: iszBOQv-9wO4WuI6kQHKk_mngPjyHHB8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_11,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=861 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_093819_655591_BEBC520E 
X-CRM114-Status: UNSURE (   9.50  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 10/10/2023 10:00 PM, Lingbo Kong wrote:
> Currently, ath12k does not have the ability to set band edge channel power
> for WCN7850. In order to support this, ath12k gets band edge channel power
> table in ath12k_acpi_dsm_get_data() function and sets pdev_id and
> param_type_id, then finally sends these data and
> WMI_PDEV_SET_BIOS_INTERFACE_CMDID to firmware to set band edge channel
> power.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
