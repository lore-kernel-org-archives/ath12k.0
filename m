Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB72C25B78
	for <ath12k@archiver.kernel.org>; Tue, 28 May 2024 16:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioWE+gCmPaeniIEWWwHT9GMhHpQSa3vrXzI9uT0XGG8=; b=OSzBk2oglQCEFZBQXOkmipGtRV
	pF9Bjl7v4X1yT5ipNcYiaBQlAMp9EzS3jPo5MY15V63S2VqEkdt6ypaYDxgTfi2NnvBEjWAXM9+pA
	nq4i4A/GhpGeFr4r8Es+Aw6UA1Eh2UjdgaRaMsSkv1sv/8wRateCVoPNo3uOCxnOrU2fUTqm/j9NH
	RNG+yE0hAhlwp8CLV8s0WIBrCxqcGbt8GagAuwomPSaWIgkIIn2x3+jwd5YiFoCAzmuRI2uJJrwNR
	1CLvR9uuH5R4h8oVzFOs0qHK+4H7QYku67Vt8W8eUiQTz160ZCa9n78AmWNgRgYu+J8zlerylGQf/
	JiZQdruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBzRc-00000001NsE-3DYq
	for ath12k@archiver.kernel.org;
	Tue, 28 May 2024 16:13:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBzRZ-00000001NqC-3xtl
	for ath12k@lists.infradead.org;
	Tue, 28 May 2024 16:12:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SBk9mh020271;
	Tue, 28 May 2024 16:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ioWE+gCmPaeniIEWWwHT9GMhHpQSa3vrXzI9uT0XGG8=; b=RpqnIhvJake9D5MO
	mEoaYGElhBXD4hIhOYPg6d+K2Drre7l+/OroCIUkqqPJI2zugiHtXjlenWEjVjIB
	H72R+GnzmE3UQzIvLr+gq0+PwouUnaSNPTfkWd11lDQ9AOsu9HLSimTgNDsCzlRB
	+TQm/kWVdymv8bljruWtF8MmMvjd7XMjB9uL2FAvadhOp2TwHb68PyR5NPHyOoqZ
	8aP0unwYDdQdrLD7R5qabCopyeUwuRQPh0MPsJdoTUhQ+jj82ymk+mbGTibTT8Ft
	6tGAFBCEM2rhPO8ax0nAv8imGmPLwtMhcdzDaHuepA9nUGhBntf2sq5WHnkoDmrv
	PGGiog==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2h6kbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 16:12:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SGCm6G017150
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 16:12:48 GMT
Received: from [10.110.122.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 May
 2024 09:12:47 -0700
Message-ID: <8aebb28f-a4f0-43e8-8b55-a55d7cb1bdc4@quicinc.com>
Date: Tue, 28 May 2024 09:12:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix memory leak in
 ath12k_dp_rx_peer_frag_setup()
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240526124226.24661-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240526124226.24661-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rzJGbeBv73G30Q_d1g2xv7v2ZjToo4PH
X-Proofpoint-ORIG-GUID: rzJGbeBv73G30Q_d1g2xv7v2ZjToo4PH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_12,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=763 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_091258_124444_4FED668A 
X-CRM114-Status: UNSURE (   7.13  )
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

On 5/26/2024 5:42 AM, Baochen Qiang wrote:
> Currently the resource allocated by crypto_alloc_shash() is not
> freed in case ath12k_peer_find() fails, resulting in memory leak.
> 
> Add crypto_free_shash() to fix it.
> 
> This is found during code review, compile tested only.
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


