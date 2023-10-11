Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4FECDB46B
	for <ath12k@archiver.kernel.org>; Wed, 11 Oct 2023 16:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8YsNCeE3OzOaiuABrx55+54mibO0LD89LzRyJ1+7Zc=; b=bzmu7rXU3mpUyU
	borE2gCPmqkFq7kjIQpwuh5ari/QOu8Y7otWquBg+oR2TvCRGoyaEBQxqomIR8AkWw7WgbftXlbZO
	TWffbplhHDdNgAFYvELw4akqn8Y7VVupOExHuPxZQEIr9unVGVkKPB430kUzObcZ7GXpHT9ydwwtf
	tDfcSSxHABQjl5earBZPAsG00HOSmE7/6MjflA9cRfMejn39vrp3by/I6WjQqcp5QJSD93X+UqIhp
	G1H9mh0c0G/sYMcg2e1FGVzKV+9xY2T6V4rUzSZLpoKj6sEUdTgKwf0wDx/LoFaqoL2vB6849Dghc
	aRPdcYp00i+PvGUCfbPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqcE0-00GGfi-1C
	for ath12k@archiver.kernel.org;
	Wed, 11 Oct 2023 16:38:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqcDx-00GGeM-2S
	for ath12k@lists.infradead.org;
	Wed, 11 Oct 2023 16:38:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39BGPtqA032299;
	Wed, 11 Oct 2023 16:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=C25k+p7XRiMPSgYeX0L6ZaA8rsM2/XdTpXSQFQ+SZ7c=;
 b=kYkTVMIHORtbld3UYolSZL8sbQMM7xKHdKnMPRMBlWLjOKN9abHTVGcHBqYwogdB7Cc1
 zCMOZEB9I1C2K4z57y8rQOrTsEtatVTssHJOASDV+XligIdsAiUuKTb9GpXC3bOIIiLI
 rn62MZzsjM5AYoQ+a+WBNr3pyG75kOj3zWtiJ+6xWF/bBN8k6bYafmgY1pfHGMn/mQGq
 3sTT91+r8Mjr8nHqjacCtEzWZCWE7g/wAUDEjwKkcGXOyBaGlCEIFOy8io7UJlr+urD2
 824r91qZRyI4Bzem7J3ImVlp/CbUZPDxfbhYxxjOAtyssKG2jYk8pvAxSin5Llxx+7Z0 eA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tngtpa0ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:38:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39BGcGxC022000
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:38:16 GMT
Received: from [10.111.181.241] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 11 Oct
 2023 09:38:16 -0700
Message-ID: <7c8e0fe1-bc87-4fc9-820c-1145e1ff649b@quicinc.com>
Date: Wed, 11 Oct 2023 09:38:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] wifi: ath12k: add adjust configuration of CCA
 threshold value for WCN7850
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231011050004.423413-1-quic_lingbok@quicinc.com>
 <20231011050004.423413-4-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231011050004.423413-4-quic_lingbok@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Mlu4sWTKgCpIDRQlNkVsmalpCWsEnuwu
X-Proofpoint-GUID: Mlu4sWTKgCpIDRQlNkVsmalpCWsEnuwu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_12,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_093817_799734_EF216EED 
X-CRM114-Status: GOOD (  11.09  )
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
> Currently, ath12k does not have the ability to adjust CCA threshold values
> to meet the regulatory requirements. In order to support this, ath12k gets
> CCA threshold configuration in ath12k_acpi_dsm_get_data() function, then
> sets pdev_id and param_type_id and finally sends these data to firmware to
> implement the adjustment of the CCA threshold value.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
