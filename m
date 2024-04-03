Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407C8CD128A
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 19:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4vGYDISrYqzlDnedyCCvSufWJp9roVtvbuNg1HGabQ=; b=LeO/KJTtBD2cRpLHwiv1ZMbkzO
	1k40Yt/99GisJMnIreu/lkN0mBZz7GqHZkDprpT9gvyIh4MNcRZswV4qq4+JEdqvXKrnjMI3nO2BW
	UAEMxhj224B2HKAVw7TKbvBDibOjUUmy5yLzOiPLuFiRGWOuMKs4loDHIKrSSW9aoTZMqSwsbnluR
	VVEpcKJnplCkdyulIRpN0pzV/RK6VfVbVNr1wKfki92OnkE9klS8GseDC0j0ZDgwrhjMG3zGjmC9/
	Il52CLQZqCRRca8PocZC/5BnQJsM4L3FX80i3NsgHbWgxvYjUWkEyk1QGg1TmRODSGa2GP1gIK8W5
	h6yPeofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs6IP-0000000HYso-3uAs
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 19:29:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs6IL-0000000HYqM-1f2m
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 19:29:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 433JRUw7020510;
	Wed, 3 Apr 2024 19:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=k4vGYDISrYqzlDnedyCCvSufWJp9roVtvbuNg1HGabQ=; b=gU
	7A918XpBPm1RPUtAf2luHYVMNiySS7an/vMjZyToDL68Hb9TwJrMUneyPe5mgfUh
	BijGKDNPe9T5lOIf6gL2RsPAPLjw+AtCSTfMU2/A+Hki1F724b2bNA2ybCXcg9H8
	ZYwvl8oUj6OcglkUBeUlZvwEnTfqc8zY5Rizp2FNVjmeOK0f170jk/iDe3Gtmzrh
	zCppMSKAmw8Q6uBA8RtPnsPiQbS0YtAvgWmcOEitVtxvUqlkARidXhtCudaO2150
	ZeqBTbq7hCAs/jbWL+dnzvBxJimal526TzsJZPxghdNQYAbXfaeiQMH3PhoCwVNu
	x8zU1KV3p7Afj5eVjpJA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8xnxt7r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 19:29:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 433JTAeI015729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 19:29:10 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 3 Apr 2024
 12:29:10 -0700
Message-ID: <259cb770-373c-4549-ab3c-45cfcb00caa6@quicinc.com>
Date: Wed, 3 Apr 2024 12:29:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] [RESEND] wifi: ath12k: fix link capable flags
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240403042056.1504209-1-quic_periyasa@quicinc.com>
 <20240403042056.1504209-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240403042056.1504209-3-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fHYm2f3U9dtxprnWZN9waJvSZ-ZlTXl4
X-Proofpoint-GUID: fHYm2f3U9dtxprnWZN9waJvSZ-ZlTXl4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_20,2024-04-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=994 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404030131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_122913_590041_E1305858 
X-CRM114-Status: UNSURE (   8.76  )
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

On 4/2/2024 9:20 PM, Karthikeyan Periyasamy wrote:
> By default driver supports intra-device SLO/MLO, the link capability flags
> reflect this. When the QMI PHY capability learning fails driver not enable
> the MLO parameter in the host capability QMI request message. In this case,
> reset the device link capability flags to zero (SLO/MLO not support) to
> accurately represent the capabilities.
> 
> Found in code review.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



