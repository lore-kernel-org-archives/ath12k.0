Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E2AC4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 23:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrKswKgr++bTBkMQ+U/VW7lYSiqCN4HDH3FHzaR1vlY=; b=KIoljnPlByfEsO8Bhs1qLUOBlM
	h++37EPfVy0BCJ89xyKGGYbWH2ujIZ6o6Z766oPxj6Nk3lANbLBcdEqYUdBNZHFnQtNxzDgGHgI+m
	6zchO+pcSljHWHy9hJYGvRfs+mEbZBUX2vEc6DcPx/hpu5zU0Vcj5RLtnSqI1TwMKmaQmhh75dY/e
	/Givhl1+OdzCmG8ro7gYzKcGkLuJlBiNYhG8Nie/feGeICwiiLrFLL3RJSQkiFj9sjFKpsvATnQsf
	JhDY6/4HheXmay3PnAXlSywx8QNTI647/+wgWLzX+c1L8lOJZ/EYq4CW58sEA6FeNzOau45abAWRz
	HeWfxEtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s08hL-0000000AcvL-24hj
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 23:40:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s08hI-0000000ActF-17Ay
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 23:40:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PMrCWc021675;
	Thu, 25 Apr 2024 23:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=BrKswKgr++bTBkMQ+U/VW7lYSiqCN4HDH3FHzaR1vlY=; b=jF
	YV4rNEJZvRDS7M2ym0zhSvhSzGq+Trl8JDWeg+9nacQR0rA6++0umGCRkrPFoJwc
	ltLo8LixsxviJ+jy9cnEGnGxFmW5TOk5bYvDAUus73JI9jhM8pRb9QUil1KF/ajB
	RT1CoQYvWIFkvJjpWju562e0G5gnSV0t4oNCqlaJJo6MqWFlJPHUAhIF3674pNBR
	rFSOQrE7Sz+mBkFvHoVl2gRoOjQaTbpQJ17wJOPE4J83ZnZD8sr6wx3FDkZPrwEd
	fFE3Yx+i9vgOIRLDxql4sdwdBn7/dB739j5lu5uPHdc8ym1siLajZyl63y66N/Cn
	AnlBX49e9s6Ck9I01cfg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqx038a7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 23:40:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PNe9wP007065
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 23:40:09 GMT
Received: from [10.110.19.58] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 16:40:09 -0700
Message-ID: <d7b57775-711d-4180-b3de-5ab59aad0ec6@quicinc.com>
Date: Thu, 25 Apr 2024 16:40:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 5/6] wifi: ath12k: refactor SMPS configuration
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240425221902.11553-1-quic_pradeepc@quicinc.com>
 <20240425221902.11553-6-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240425221902.11553-6-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ItivR5cf0pbE4u_neWpGvVhzcvoScmiV
X-Proofpoint-ORIG-GUID: ItivR5cf0pbE4u_neWpGvVhzcvoScmiV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_22,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=828 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_164012_458996_0E6C532F 
X-CRM114-Status: UNSURE (   6.81  )
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

On 4/25/2024 3:19 PM, Pradeep Kumar Chitrapu wrote:
> Move fetching SMPS value to a new function and use u16_get_bits
> to extract smps value from capabilities. This will help in

s/smps/SMPS/

> extending the functionality when SMPS support in 6 GHz band gets
> added in subsequent patches.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>


