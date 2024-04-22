Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A424CC4345F
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 17:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ce9ixlufvOniWp6BK9xsrtg8SNp8Ht860qQ/XEhJ5Z0=; b=WW0o/uwh80E4yjIxAV8xBj9dop
	jXSldHzMvcm6rWDyi2BQdHiTHZzi8CZJ1ibBKMmaLDAsyTTLI4CkjawP5NBhuk7y61N5xtY8mq65M
	KNsoEX0CqQgLbgvZY1+R7tsGly35bqly+xNcuWGOIzcJyyVY4fdsRRzjySdtYDiqLEeB0umYEz+zf
	vhQ3HpKwOBsKYEsxfd1/x4OQym8Yy+JmjAG0xvaagBkVNUZCvp/psNZYk6HuGjp7t/Zko1pyMAWmG
	H32/eUgQPdsN2naQGEzBLbPvQyDfFU09xRtQ1TJIxXnl6IvCwP/CzlUCmyXmnjcO+8rItRTpEW+RQ
	5s6Ln1ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxpW-0000000EWHI-1Iau
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 17:51:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxpT-0000000EWF5-2jMQ
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 17:51:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43MEKeWQ025428;
	Mon, 22 Apr 2024 17:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Ce9ixlufvOniWp6BK9xsrtg8SNp8Ht860qQ/XEhJ5Z0=; b=kr
	8Lpnaa+W7otCf+uFF+7cYt1ydbf3vgyG/DBojulVS6gj6G5MqqynrIurm2Z0M0k3
	CxHJcezaoekrp671IkwLHEBeEllsRq1GXdA8yj+M7jXwkMiAmDfPMl1L6hFZE+d2
	1ovfQ+X6839ApAcHLHah79aaddA2UIM9HGuWhFQ0ppcwkt3GO9oR063FP/RJLbjl
	k5FATA/qdP3lgKlFxft+hs3q4Uu6ReXToiIQFDoP4hr5Cm4fGVJlXQYsrwJQ0Nny
	N2vT408wd3tmQ64XVHGB5bJh4z+xcdDOgY7mhwSUXSTfvWuPHS/biqUrfmA227NR
	uGdzen8QP9sueoNWsOsw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnsjggk84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 17:51:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43MHpiBf009030
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 17:51:44 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 10:51:44 -0700
Message-ID: <d71312e3-0500-4959-a348-75c16c4e5bc9@quicinc.com>
Date: Mon, 22 Apr 2024 10:51:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] wifi: ath12k: rearrange IRQ enable/disable in reset
 path
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
 <20240412060620.27519-2-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240412060620.27519-2-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: k0J4c4Eh3gyfaPFZ6cKffVC0OMxAbRCe
X-Proofpoint-ORIG-GUID: k0J4c4Eh3gyfaPFZ6cKffVC0OMxAbRCe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 mlxlogscore=526 lowpriorityscore=0 adultscore=0 mlxscore=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404220075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_105147_845398_12639F96 
X-CRM114-Status: UNSURE (   7.51  )
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

On 4/11/2024 11:06 PM, Baochen Qiang wrote:
> For non-WoW suspend/resume, ath12k host powers down whole hardware
> when suspend and powers up it when resume, the code path it goes
> through is very like the ath12k reset logic.
> 
> In order to reuse that logic, rearrange IRQ handling in the reset
> path.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


