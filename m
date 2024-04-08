Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8EFC67861
	for <ath12k@archiver.kernel.org>; Mon,  8 Apr 2024 22:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koDuQfpxUFo1k/ekgS+CUpvO88C5zUgz/+EPOBCXrTs=; b=V0iDlW5GZK81FbGX7MQdxVITSy
	4l/8KG6HKWBOau1YWTSOS4OGEviNdkAC0XQWYoaJsNGGBel9j3Dn2vRHCkvZ3Z3BlOZkKhTuh8lIQ
	6WYh6g95zYZXlz62/gIS1OFZ39KEnPkIjN7ouh7dh9YxSFCDg+O2SIwHR/62on8ga+PUB4TVVg8cK
	ZPEGKSrZfGtgZYcdv3LoJysY0pIN1R6BoibXqG9N8I+W30JKSidcj9AXDvkB2m2iEMOju8VUPi0YH
	+dfIW1aQxuAizhY84/1sIXoFbePnRk8N0wWRL1U9xsCEkvneZNK4kKbwR80BIc3V26SEWQK9zTRrI
	KF4raChQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtxJ2-0000000H0JK-1GtO
	for ath12k@archiver.kernel.org;
	Mon, 08 Apr 2024 22:17:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtxIv-0000000H0G7-3oGL
	for ath12k@lists.infradead.org;
	Mon, 08 Apr 2024 22:17:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 438LjMtB019930;
	Mon, 8 Apr 2024 22:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=koDuQfpxUFo1k/ekgS+CUpvO88C5zUgz/+EPOBCXrTs=; b=I/
	B3AeWX6C+DC5WH3FhMOBAqu5cnWn0GDB8HuZKRr9jNy1k6PuyCTL3iE/xNnnT0zq
	6ktWCqqdxohD2PnOMYvefhjXqhVVM4J86PorEdAaP7Nu2zgMIgqa33cW78W8haQ1
	v7mjyUxVZwj5cdGoCaqMycyY7S5MNsRyIDvKoJiYqRzbqs/qMIV0Beo81ueJryz3
	5yirMgPMC9YPsNpqfSiAsbkDxN6OjzIGcjmQwXKQh0A6KTdOdsWhiPGueMAhFSfp
	qqu3yhTC89+aalrTa3a7uwjmkATj1st6ktOO1nPz+SiRVD5BQJ0SX5M2TExSDiiJ
	YTZoMdXhicAU/9HaKuzg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xcr4hr3b5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 22:17:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 438MHSw3027125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Apr 2024 22:17:28 GMT
Received: from [10.110.80.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Apr 2024
 15:17:28 -0700
Message-ID: <0935a9ff-34b1-45f5-ae24-ab05386d03d4@quicinc.com>
Date: Mon, 8 Apr 2024 15:17:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] wifi: ath12k: displace the Tx and Rx descriptor in
 cookie conversion table
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240408040547.837639-1-quic_periyasa@quicinc.com>
 <20240408040547.837639-4-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240408040547.837639-4-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XWpvWPya0WKDsszGlRsoDf23GIepc0oH
X-Proofpoint-ORIG-GUID: XWpvWPya0WKDsszGlRsoDf23GIepc0oH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_17,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 bulkscore=0 phishscore=0
 mlxlogscore=408 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_151730_044513_BD7B4169 
X-CRM114-Status: UNSURE (   6.65  )
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

On 4/7/2024 9:05 PM, Karthikeyan Periyasamy wrote:
> In the hardware cookie conversion table configuration, place the Rx
> descriptor at the end. This will allow for easier addition of partner
> device Rx descriptors in the future to support multi-device MLO.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


