Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B798C4332F
	for <ath12k@archiver.kernel.org>; Fri, 10 Nov 2023 18:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zBWvdDOQaxaL4DYoci+Ij1fkrn8MvpDD7FebMS8Hb9w=; b=dRBsLvGaTBLWm2
	QDpIRhVRMBUDwn0YfQT8XJ7BaKJ2HAEgpaSYvXUubAw/w87g3lf9E9Yf1iWgoEGeZigkw+Qe5/4ih
	9InRjeqfVSgCgzpqEXjOW79Bzhs3Fyb2l0o7YQco8dgY28dnhhgUID+ykUC0rwbPGfMw4q8d4MbfC
	JacyYEXIBRXH5HCIE2ao7bPDle9AQPgSDqTalqxZsYGhKGH0pQTe0D7cspcH0jRu8KjBtYpTEwOvx
	ecSKS3nwn19tkV+onjb77tFA+mZP/XVz67YMgbrTGlqW2pxC2CF9okeuZvcLkkc6jHghrwoGIPJ9L
	UvkMM1P4u2aieoUOWNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Wcn-009GOZ-0Z
	for ath12k@archiver.kernel.org;
	Fri, 10 Nov 2023 18:53:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Wcj-009GO7-21
	for ath12k@lists.infradead.org;
	Fri, 10 Nov 2023 18:52:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AAIH8rC009213;
	Fri, 10 Nov 2023 18:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1qHzSL8CRgdBvAJREYiAGy62kE9bvGbR0xvKvctF7zY=;
 b=gYqC9qvy4AB58ec/i95qp102Uh9t522pZlgVVYeYC2JWYSwJWOk74xzrVd5zqvaStdXK
 uEzDUPdYxlJS355IC87GVYxye28/FIppn1xMRN/4zoRm5pb48vfFaMonzE7pKlrQ9Yz9
 LIxZ2+XfsjjSZ2UY7xrhdERtrhvk1fVkRjXtDoA/pKEAoEsXIOSHYLDHyqxz87WzUhTM
 s8mtHGmPcXQps72xh2qXCoWUxpncNc29QeXMcTWZEk25ChPV412Qd+paT9ze8MeFFqcK
 6pEBiP6mpKHQ8vCyo+QKyEaYqaViFvZQ5iLzxAPmR2+ugwP+ktDaBvnzjlNDlb3Q8053 uA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u9q0w0fdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 18:52:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AAIqpve027127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 18:52:51 GMT
Received: from [10.110.6.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 10 Nov
 2023 10:52:50 -0800
Message-ID: <e03b6f06-c746-47d9-b2f2-b4916084cf5b@quicinc.com>
Date: Fri, 10 Nov 2023 10:52:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix the error handler of rfkill config
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231110072802.25290-1-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231110072802.25290-1-quic_periyasa@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0KKDTsNd0-ZHl1OE5W8ogFfDXXcNeqJ_
X-Proofpoint-ORIG-GUID: 0KKDTsNd0-ZHl1OE5W8ogFfDXXcNeqJ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_16,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 spamscore=0 mlxlogscore=578 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_105257_672394_0261D4E2 
X-CRM114-Status: GOOD (  13.76  )
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

On 11/9/2023 11:28 PM, Karthikeyan Periyasamy wrote:
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

>   drivers/net/wireless/ath/ath12k/core.c | 4 +++-
Can you respin and update the QuIC copyright to 2023?


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
