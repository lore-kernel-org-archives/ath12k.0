Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D38DC4167B
	for <ath12k@archiver.kernel.org>; Mon, 13 Nov 2023 15:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6SSWlm5MggJ99JSqPYzQPhL/R+qrUcGN/A4f1a9Y2UY=; b=qjcwtKMOGJgMuR
	loxqwrg+qMDkmSo7iaGrtk60/4WLsjsO69EKPvyRMf7VKSduZ5wRVwwJBikyYgtrGRfgYy2Mqz/PM
	U/M2BxhR3Qzew2sm9JD23d4JhUbE+3WkhDpEmFl1wbsLErxSLSyB9nsT/Bvpo8Ek3jENN5fGOfpLk
	jW2RBi0sYyocJzve9o3woBzpec0V/458Ih1wniD3RE8PR1IVNsr/Qj4UQKKL1t8TzODWC+rrabh8r
	gh26WVzCO39HBfXvBcCwuotr/a6sO0r1xT5w7VheL11lu7TS3J2Oz/rA7dGc7MB+DtJztilNeb9WP
	2E0xRPN7y6Agfq24Hwmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Yki-00EE3B-3D
	for ath12k@archiver.kernel.org;
	Mon, 13 Nov 2023 15:21:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Ykg-00EE2k-1W
	for ath12k@lists.infradead.org;
	Mon, 13 Nov 2023 15:21:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADEj05g031905;
	Mon, 13 Nov 2023 15:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Ak1ZX8NRXysrd0syBJWm9Q579ECQbY/GalDDGgeIczA=;
 b=Ten9PcRu7joYj3+wdZVq17QSGRbQ7+XbX4XFpGNXXGGw+pl4iqKq9d5W3P69uGNz9k9D
 l7tQr84IfD8eYM0qTzcQrtTPJ+5GoxlZ5DBqy+E/4emPRaCGkp2n8lHulom/tEcBdEAB
 Wx0YojYDJABewJb1aWZ8XgEYl6KBC7iAr5UQBpscjupUHTwTpC5IFZDWnKTJD1vmyXDS
 GTyb50o8sLzVGeBPzMQm+bahjkE7n3Pi0M7UzyJVssRLbr2cDA6TUqLmiOQfpe+kUgge
 iuirKQ2mM5o4DWUK/VHAbs+Baa9hpqsKEnKfD1bsVCpSwhv433O4ho/cgIejBXCgCX8p PQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ubmtv88c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 15:21:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ADFLOte027273
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 15:21:24 GMT
Received: from [10.110.49.55] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 13 Nov
 2023 07:21:23 -0800
Message-ID: <87c908cd-ee56-4dd5-9acd-cb58f0e650b2@quicinc.com>
Date: Mon, 13 Nov 2023 07:21:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix the error handler of rfkill config
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231111040107.18708-1-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231111040107.18708-1-quic_periyasa@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LzLgpzufM-WbIwfUcimdh-Q1egUFbAeK
X-Proofpoint-GUID: LzLgpzufM-WbIwfUcimdh-Q1egUFbAeK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-13_06,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015
 spamscore=0 mlxlogscore=610 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311130125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_072126_540423_F82881C3 
X-CRM114-Status: GOOD (  12.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/10/2023 8:01 PM, Karthikeyan Periyasamy wrote:
> When the core rfkill config throws error, it should free the
> allocated resources. Currently it is not freeing the core pdev
> create resources. Avoid this issue by calling the core pdev
> destroy in the error handler of core rfkill config.
> 
> Found this issue in the code review and it is compile tested only.
> 
> Fixes: 004ccbc0dd49 ("wifi: ath12k: add support for hardware rfkill for WCN7850")
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
